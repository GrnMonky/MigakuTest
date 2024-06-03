//
//  UsersVM.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/31/24.
//

import Foundation

@Observable
class HomeVM {
    
    enum locations {
        case github
        case local
    }
    
    // MARK: - Properties
    var dataLocation: locations = .local {
        didSet {
            loadInitialUsers()
        }
    }
    
    private var getLocation: String? {
        switch dataLocation {
        case .github:
            return "https://api.github.com/users"
        case .local:
            return Bundle.main.url(forResource: "localDataFigma", withExtension: "json")!.absoluteString
        }
    }
    
    // State variable to hold the list of GitHub users
    var users: [Migaku.CardModel] = []
    
    // State variable to hold the URL for the next page
    private var nextPageLink: URL? = nil
    
    // State variable to control the presentation of the alert
    var showAlert = false
    
    // State variable to hold the error message
    var errorMessage = ""
    
    // State variable to track loading state
    var isLoading = false
    
    // State variable to hold the search query
    var searchText = ""
    
    // MARK: - Helper Functions
    
    // Function to check if more users should be loaded based on the currently displayed user
    func shouldLoadMoreUsers(_ user: Migaku.CardModel) -> Bool {
        guard let lastUser = users.last else {
            return false
        }
        return user.id == lastUser.id
    }
    
    // Function to load more users
    func loadMoreUsers() async {
        guard let nextLink = nextPageLink else {
            return
        }
        
        // Set loading state to true when data fetching starts
        isLoading = true
        
        // Attempt to fetch more GitHub users asynchronously
        do {
            var newUsers: [Migaku.CardModel]?
            var newNextPageLink: URL?
            // Fetch new users, next page link, ToDo: Make use of previous page link
            (newUsers, newNextPageLink, _) = try await Networking.getCards(next: nextLink.absoluteString, location: getLocation).async()
            
            if let newUsers = newUsers {
                users.append(contentsOf: newUsers)
            }
            nextPageLink = newNextPageLink
        } catch {
            // Handle any errors that occur during fetching
            errorMessage = error.localizedDescription
            showAlert = true
        }
        // Set loading state to false when data fetching completes
        isLoading = false
    }
    
    func loadInitialUsers() {
        // Fetch initial users asynchronously when the view appears
        Task {
            do {
                (users, nextPageLink, _) = try await Networking.getCards(location: getLocation).async()
            } catch {
                // Handle any errors that occur during search
                errorMessage = error.localizedDescription
                showAlert = true
            }
        }
    }
}
