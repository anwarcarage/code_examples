//
//  ResultType.swift
//  WeatherApp
//
//  Created by Tim Nanney on 1/25/20.
//  Copyright © 2020 Array North. All rights reserved.
//

import Foundation

public protocol ResultTypeBase {
    associatedtype Value

    init(_ value: Value?)
    init(_ error: Error)

    var value: Value? { get }
    var error: Error? { get }
}

public enum ResultType<T>: ResultTypeBase {
    public typealias Value = T

    case success(Value?)
    case failure(Error)

    public var value: Value? {
        switch self {
        case .success(let v): return v
        default: return nil
        }
    }

    public var error: Error? {
        switch self {
        case .failure(let e): return e
        default: return nil
        }
    }

    public init(_ error: Error) {
        self = .failure(error)
    }

    public init(_ value: Value?) {
        if let v = value as? Error {
            self = .failure(v)
        }
        else if let v = value {
            self = .success(v)
        }
        else {
            self = .success(nil)
        }
    }
}


public extension ResultType {
    var isEmpty: Bool {
        return value == nil
    }
}

// MARK: - Helper Handling -
public extension ResultType {
    func onSuccess(handler: (_ data: Value?) -> Void) {
        switch(self) {
        case .success(let data): handler(data)
        default: break
        }
    }

    func onError(handler: (_ err: Error) -> Void) {
        switch(self) {
        case .failure(let e): handler(e)
        default: break
        }
    }
}

public extension ResultType where T: Equatable {
    static func ==(lhs: ResultType, rhs: ResultType) -> Bool {
        switch (lhs, rhs) {
        case (.success(let lhsVal), .success(let rhsVal)):
            // Two successes are equal if their internal vals are equal
            return lhsVal == rhsVal

        case (.failure(let lhsErr), .failure(let rhsErr)):
            // Two errors are equal if their _domain's and _code's are equal
            return lhsErr._domain == rhsErr._domain && lhsErr._code == rhsErr._code

        default: return false
        }
    }
}

// MARK: - Equatability -
extension ResultType: Equatable {}
@objc public class NoResponseType: NSObject {}

public func ==<T,U>(lhs: ResultType<T>, rhs: ResultType<U>) -> Bool {
    // Results with different types are not equal
    switch (lhs, rhs) {
    case (.failure(let lhsErr), .failure(let rhsErr)):
        // Two errors are equal if their _domain's and _code's are equal
        return lhsErr._domain == rhsErr._domain && lhsErr._code == rhsErr._code

    default: return false
    }
}

public func ==<T>(lhs: ResultType<T>, rhs: ResultType<T>) -> Bool {
    switch (lhs, rhs) {
    case (.success, .success) where T.self == NoResponseType.self:
        return true
    case (.failure(let lhsErr), .failure(let rhsErr)):
        // Two errors are equal if their _domain's and _code's are equal
        return lhsErr._domain == rhsErr._domain && lhsErr._code == rhsErr._code

    default: return false
    }
}

// MARK: - Map
extension ResultType {

    /// Allow us to transform values in the result type
    ///
    /// - Parameter transform: function to transform one value to another
    /// - Returns: a result with the new value type
    public func map<U>(_ transform: (Value?) throws -> U?) -> ResultType<U> {
        switch self {
        case .failure(let error):
            return ResultType<U>(error)
        case .success(let value):
            do {
                return ResultType<U>(try transform(value))
            }
            catch let error {
                return ResultType<U>(error)
            }
        }
    }

    /// Allow us to transform errors in the result type
    ///
    /// - Parameter transform: function to transform one error to another
    /// - Returns: a result with the new error type
    public func map(_ transform: (Error) -> Error) -> ResultType<Value> {
        switch self {
        case .failure(let error):
            return ResultType(transform(error))
        case .success(let value):
            return ResultType(value)
        }
    }
}
