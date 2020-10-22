//
//  HTTPMethods.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/25/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case PATCH
    case DELETE
}

extension HTTPURLResponse {
    var httpStatusCode: HTTPStatusCode? {
        return HTTPStatusCode(rawValue: statusCode)
    }
}

enum HTTPStatusCode: Int {
    // 1xx Informational
    case `continue` = 100
    case switchingProtocols = 101

    // 2xx Successful
    case ok = 200
    case created = 201
    case accepted = 202
    case nonAuthoritativeInformation = 203
    case noContent = 204
    case resetContent = 205
    case partialContent = 206

    // 3xx Redirection
    case multipleChoices = 300
    case movedPermanently = 301
    case found = 302
    case seeOther = 303
    case notModified = 304
    case useProxy = 305
    case temporaryRedirect = 307

    // 4xx Client Error
    case badRequest = 400
    case unauthorized = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case proxyAuthenticationRequired = 407
    case requestTimeout = 408
    case conflict = 409
    case gone = 410
    case lengthRequired = 411
    case preconditionFailed = 412
    case requestEntityTooLarge = 413
    case requestURITooLong = 414
    case unsupportedMediaType = 415
    case requestedRangeNotSatisfiable = 416
    case expectationFailed = 417

    // 5xx Server Error
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case httpVersionNotSupported = 505

    case notApplicable = -13

    // 1xxx Network Error
    case networkTimeout = -1001
    case networkNoConnection = -1009

    var isError: Bool {
        return 400...599 ~= self.rawValue
    }

    var isAuthError: Bool {
        return (self == .unauthorized) || (self == .forbidden)
    }

    /// Used for error alerts to display a message for any possible service error
    static var allServiceErrorCases: Int {
        return -999
    }
}
