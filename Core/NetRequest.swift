//
//  NetRequest.swift
//  Net
//
//  Created by Alex Rupérez on 23/3/17.
//
//

import Foundation

public struct NetRequest {

    public enum NetCachePolicy: UInt {
        case useProtocolCachePolicy = 0, reloadIgnoringLocalCacheData = 1, returnCacheDataElseLoad = 2, returnCacheDataDontLoad = 3
    }

    public enum NetServiceType: UInt {
        case `default`, voip, video, background, voice, callSignaling = 11
    }

    public enum NetMethod: String {
        case GET, POST, PUT, DELETE, PATCH, UPDATE, HEAD, TRACE, OPTIONS, CONNECT, SEARCH, COPY, MERGE, LABEL, LOCK, UNLOCK, MOVE, MKCOL, PROPFIND, PROPPATCH
    }

    public let url: URL

    public let cache: NetCachePolicy

    public let timeout: TimeInterval

    public let mainDocumentURL: URL?

    public let serviceType: NetServiceType

    public let contentType: NetContentType?

    public let accept: NetContentType?

    public let allowsCellularAccess: Bool

    public let method: NetMethod

    public let headers: [String : String]?

    public let body: Data?

    public let bodyStream: InputStream?

    public let handleCookies: Bool

    public let usePipelining: Bool

}

public extension NetRequest {

    public init(_ url: URL, cache: NetCachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 30, mainDocumentURL: URL? = nil, serviceType: NetServiceType = .default, contentType: NetContentType? = nil, accept: NetContentType? = nil, allowsCellularAccess: Bool = true, method: NetMethod = .GET, headers: [String : String]? = nil, body: Data? = nil, bodyStream: InputStream? = nil, handleCookies: Bool = true, usePipelining: Bool = true) {
        self.url = url
        self.cache = cache
        self.timeout = timeout
        self.mainDocumentURL = mainDocumentURL
        self.serviceType = serviceType
        self.contentType = contentType
        self.accept = accept
        self.allowsCellularAccess = allowsCellularAccess
        self.method = method
        self.headers = headers
        self.body = body
        self.bodyStream = bodyStream
        self.handleCookies = handleCookies
        self.usePipelining = usePipelining
    }
    
}

public extension NetRequest {

    public init?(_ urlString: String, cache: NetCachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 30, mainDocumentURL: URL? = nil, serviceType: NetServiceType = .default, contentType: NetContentType? = nil, accept: NetContentType? = nil, allowsCellularAccess: Bool = true, method: NetMethod = .GET, headers: [String : String]? = nil, body: Data? = nil, bodyStream: InputStream? = nil, handleCookies: Bool = true, usePipelining: Bool = true) {
        guard let url = URL(string: urlString) else {
            return nil
        }
        self.init(url, cache: cache, timeout: timeout, mainDocumentURL: mainDocumentURL, serviceType: serviceType, contentType: contentType, accept: accept, allowsCellularAccess: allowsCellularAccess, method: method, headers: headers, body: body, bodyStream: bodyStream, handleCookies: handleCookies, usePipelining: usePipelining)
    }

}

extension NetRequest: CustomStringConvertible {

    public var description: String {
        return url.absoluteString
    }

}

extension NetRequest: CustomDebugStringConvertible {

    public var debugDescription: String {
        return url.absoluteString
    }

}

extension NetRequest: Hashable {

    public var hashValue: Int {
        return url.hashValue
    }

}

extension NetRequest: Equatable {

    public static func ==(lhs: NetRequest, rhs: NetRequest) -> Bool {
        return lhs.url == rhs.url
    }

}
