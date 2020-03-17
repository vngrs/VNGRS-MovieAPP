//
//  MovieAPI.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 18.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import Foundation
import Moya

let PUBLIC_KEY = "759395c0d6b7a28a3d5488c073ed4c27"

enum MovieAPI {
    case searchMovies(query: String, page: Int)
    case MovieDetail(movieID : Int)
}

// MARK: - TargetType
extension MovieAPI: TargetType {
    // 1
    public var baseURL: URL {
        return URL(string: "https://api.themoviedb.org?")!
    }

    // 2
    public var path: String {

        switch self {
        case .searchMovies(_, _):
            return "/3/search/movie"

        case .MovieDetail(let movieID):
            return "/3/movie/\(movieID)"
        }
    }

    // 3
    public var method: Moya.Method {
        switch self {
        case .searchMovies(_, _) , .MovieDetail: return .get

        }
    }

    // 4
    public var sampleData: Data {
        return Data()
    }

    // 5
    public var task: Task {
        switch self {
        case let .searchMovies(query,  page):
            return .requestParameters(parameters: ["api_key" : PUBLIC_KEY , "language" : "en-US" , "page" : page, "query": query], encoding: URLEncoding.queryString) // TODO

        case .MovieDetail:
            return .requestParameters(parameters: ["api_key" : PUBLIC_KEY , "language" : "en-US"], encoding: URLEncoding.queryString) // TODO

        }

    }

    // 6
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    // 7
    public var validationType: ValidationType {
        return .successCodes
    }
}
