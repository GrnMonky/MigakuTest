//
//  GitHub.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/31/24.
//

import Foundation
import Combine

fileprivate let token = "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"

// Constants
//fileprivate let GitHubUrl = { return "https://api.github.com/users" }

fileprivate let DefaultURL = {
    if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
        return Bundle.main.url(forResource: "localDataFigma", withExtension: "json")!.absoluteString
    } else {
        return "https://api.github.com/users"
    }
}

struct Networking {
    
    // Enum for Networking errors
    enum NetworkingError: Error {
        case invalidURL
    }
    
    // Function to fetch data from URLSession and decode it into a decodable type
    static func fromURLSession<T: Decodable>(_ urlString: String, type: T.Type) -> AnyPublisher<(data: T, nextPageLink: URL?, prevPageLink: URL?), Error> {
        
        // Convert urlString to URL
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkingError.invalidURL).eraseToAnyPublisher()
        }
        
        // Create URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Add Authorization header if GitHubToken is available
        if let token = ProcessInfo.processInfo.environment["GitHubToken"] {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        // Fetch data from URLSession
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, response) -> (T, URL?, URL?) in
                // Decode data into specified type
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                
                // Check for the next and previous page links in the response headers
                let nextPageLink = getNextPageLink(from: response, rel: "next")
                let prevPageLink = getNextPageLink(from: response, rel: "prev")
                
                return (result, nextPageLink, prevPageLink)
            }
            .eraseToAnyPublisher()
    }
    
    // Helper function to extract the link header from the HTTP response
    static func getNextPageLink(from response: URLResponse?, rel: String) -> URL? {
        guard let httpResponse = response as? HTTPURLResponse,
              let linkHeader = httpResponse.allHeaderFields["Link"] as? String else {
            return nil
        }
        
        // Split the link header into individual links
        let links = linkHeader.components(separatedBy: ",")
        
        // Find the link for the specified relation
        for link in links {
            let components = link.components(separatedBy: ";")
            if components.count < 2 { continue }
            let linkValue = components[0].trimmingCharacters(in: .whitespaces)
            let relAttribute = components[1].trimmingCharacters(in: .whitespaces)
            if relAttribute == "rel=\"\(rel)\"" {
                let urlStartIndex = linkValue.index(after: linkValue.startIndex)
                let urlEndIndex = linkValue.index(before: linkValue.endIndex)
                let urlString = String(linkValue[urlStartIndex..<urlEndIndex])
                return URL(string: urlString)
            }
        }
        
        return nil
    }
}

// Extension for GitHub API related functions
extension Networking {
    
    // Function to get list of users from GitHub API
    static func getCards(next: String? = nil, location: String?) -> AnyPublisher<(data: [Migaku.CardModel], nextPageLink: URL?, prevPageLink: URL?), Error> {
        return Networking.fromURLSession(next ?? location ?? DefaultURL(), type: [Migaku.CardModel].self)
    }
}
