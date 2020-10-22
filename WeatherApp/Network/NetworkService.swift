//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/25/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import Foundation

struct EmptyResponse: Decodable {}

struct URLResponseData {
    let response: HTTPURLResponse
    let data: Data?
}

extension URLSession {
    static var `default`: URLSession {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = false
        config.timeoutIntervalForRequest = TimeInterval(60)
        return URLSession(configuration: config)
    }
}

extension URLSession {
    /// Performs the dataTask, but returns a ResultType<URLResponseData> instead of
    /// (URLResponse?, Data?, Error?)
    ///
    /// - Parameters:
    ///   - request: The URL Request to load
    ///   - resultCompletion: The completion called when the URL request is
    ///     complete
    /// - Returns: URLSessionDataTask to perform
    func dataTask(with request: URLRequest, resultCompletion: @escaping (ResultType<URLResponseData>) -> Void) -> URLSessionTask {
        return dataTask(with: request, completionHandler: { (data, response, error) in

            // Pass back any standard errors received
            if let error = error {
                resultCompletion(ResultType(error))
                return
            }

            // If we don’t get an error back, we _should_ get a URLResponse back
            // but this isn’t guaranteed by the API so throw an error
            guard let urlResponse = response as? HTTPURLResponse else {
                resultCompletion(ResultType(NetworkingError.missingURLResponse))
                return
            }

            resultCompletion(ResultType(URLResponseData(response: urlResponse, data: data)))
        })
    }
}

struct NetworkService {
    static var `default`: NetworkService {
        return NetworkService(baseUrl: "https://api.openweathermap.org/data/2.5/", session: URLSession.default)
    }

    let baseUrl: String
    let session: URLSession

    func url(withPathComponents components: [String]? = nil) -> URL? {
        guard let components = components, !components.isEmpty else {
            return URL(string: baseUrl)
        }

        let urlString = baseUrl + "/" + components.joined(separator: "/")

        return URL(string: urlString)
    }

    func handleRequest<T: Decodable>(method: HTTPMethod, path: String = "", queryParams: [String: Any]? = nil, body: Data? = nil, headers: [String: String] = [:], responseType: T.Type, completion: @escaping (ResultType<T>) -> ()) {
        do {
            var queryParams = queryParams
            queryParams?["APPID"] = "dd55513d6435de831c921789bc4094d6"
            let req = try self.request(withMethod: method, path: path, queryParams: queryParams, body: body, headers: headers)
            self.makeRequest(req, completion: completion)
        } catch let error {
            DispatchQueue.main.async { completion(.failure(error)) }
        }
    }

    private func makeRequest<T: Decodable>(_ request: URLRequest, completion: (@escaping (ResultType<T>) -> Void)) {
        let dataTask = session.dataTask(with: request) { (dataTaskResult: ResultType<URLResponseData>) in
            let result: ResultType<T> = dataTaskResult
                .map(ResponseParser.checkStatusCode)
                .map(ResponseParser.checkNetworkError)
                .map(ResponseParser.parseResponseObject)

            DispatchQueue.main.async { completion(result) }
        }

        dataTask.resume()
    }

    private func request(withMethod method: HTTPMethod, path: String = "", queryParams: [String: Any]? = nil, body: Data? = nil, headers: [String: String] = [:]) throws -> URLRequest {
        guard var urlComponents = URLComponents(string: baseUrl + path) else {
            throw NetworkingError.cannotCreateURLComponents
        }

        let qp = queryParams?.map({"\($0.key)=\($0.value)"}).joined(separator: "&")
        urlComponents.query = qp

        guard let url = urlComponents.url else {
            throw NetworkingError.cannotCreateURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if let body = body {
            request.httpBody = body
        }

        headers.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }

        return request
    }
}
