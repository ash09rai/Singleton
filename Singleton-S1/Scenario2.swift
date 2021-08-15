//
//  Scenario2.swift
//  Singleton-S1
//
//  Created by Ashish Rai on 13/08/21.
//

import Foundation

//API Client Model
class MediumAPIClient {
    static let instance = MediumAPIClient()
    
    private init() {}
    
    func execute(completion : (Data) -> Void) {}
}


//LoginModule
extension MediumAPIClient {
    func loginUser(completion: (LoggedInuser) -> Void)  {}
}
class LoginMediumViewModel {
    let apiClient = BasicAPIClient.instance
    
    func onLogginPress() {
        apiClient.loginUser { LoggedInuser in
            print(LoggedInuser)
        }
    }
}

//FeedModule
extension MediumAPIClient {
    func loadFeed(completion: ([Feeditems]) -> Void) {}
}
class FeedMediumViewModel {
    let apiClient = BasicAPIClient.instance
   
    func loadFeed() {
        apiClient.loadFeed { feeditems in
            //reload UI
        }
    }
}
