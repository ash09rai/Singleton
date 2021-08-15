//
//  Scenario1.swift
//  Singleton-S1
//
//  Created by Ashish Rai on 13/08/21.
//

import Foundation


//MARK: Stage1 implementation
class BasicAPIClient {
    static let instance = BasicAPIClient()
    
    private init() {}
    
    func loginUser(completion: (LoggedInuser) -> Void)  {}
    func loadFeed(completion: ([Feeditems]) -> Void) {}
}

class LoginViewModel {
    func onLogginPress() {
        BasicAPIClient.instance.loginUser { LoggedInuser in
            print(LoggedInuser)
        }
    }
}

class FeedViewModel {
    func loadFeed() {
        BasicAPIClient.instance.loadFeed { feeditems in
            //reload UI
        }
    }
}
