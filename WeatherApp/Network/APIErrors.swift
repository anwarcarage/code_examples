//
//  APIErrors.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/25/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import Foundation

enum NetworkingError: LocalizedError {
    case cannotCreateURLComponents
    case cannotCreateURL
    case missingURLResponse
    case noConnectionError
    case timeoutError

    public var errorDescription: String? {
        switch self {
        case .noConnectionError:
            return "No network connection"
        case .timeoutError:
            return "Timeout Error"
        default:
            return "Network Error"
        }
    }
}

struct ServiceError: LocalizedError {
    let responseData: URLResponseData
    let statusCode: HTTPStatusCode
    private var apiError: ApiError?

    init?(responseData: URLResponseData) {
        guard let statusCode = responseData.response.httpStatusCode, statusCode.isError else {
            return nil
        }

        self.responseData = responseData
        self.statusCode = statusCode

        guard let data = responseData.data else {
            apiError = nil
            return
        }
        apiError = try? JSONDecoder().decode(ApiError.self, from: data)
    }

    var errorDescription: String? {
        guard let apiError = apiError else {
            return "Service Error: \(responseData.response.statusCode)"
        }

        return "Service Error: \(responseData.response.statusCode) Message: \(apiError.message)"
    }

    public mutating func setErrorDescription(_ message: String) {
        guard let apiError = apiError else { return }
        self.apiError = ApiError(
            status: apiError.status,
            message: message,
            debugMessage: apiError.debugMessage,
            timestamp: apiError.timestamp
        )
    }
}

struct ResponseParsingError: LocalizedError {
    let responseData: URLResponseData?
    let decoderError: Error

    public var errorDescription: String? {
        return "Network error parsing"
    }
}

private struct ApiError: Decodable {
    let status: String
    let message: String
    let debugMessage: String
    let timestamp: String
}
