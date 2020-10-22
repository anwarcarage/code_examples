//
//  ResponseHelper.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/25/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import Foundation

struct ResponseParser {
    static func checkStatusCode(_ urlResponseData: URLResponseData?) throws -> URLResponseData? {
        guard let responseData = urlResponseData, let serviceError = ServiceError(responseData: responseData) else {
            return urlResponseData
        }

        throw serviceError
    }

    static func checkNetworkError(_ error: Error) -> Error {
        let nsError = error as NSError
        if nsError.domain == NSURLErrorDomain {
            return nsError.code == HTTPStatusCode.networkTimeout.rawValue ? NetworkingError.timeoutError : NetworkingError.noConnectionError
        }

        return error
    }

    static func parseResponseObject<T: Decodable>(_ responseData: URLResponseData?) throws -> T? {
        let responseIsNotEmptyType = !(T.self is EmptyResponse.Type)

        guard let data = responseData?.data, responseIsNotEmptyType else {
            return nil
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw ResponseParsingError(responseData: responseData, decoderError: error)
        }
    }
}
