//
//  FinalScenario.swift
//  Singleton-S1
//
//  Created by Ashish Rai on 13/08/21.
//

import Foundation

//API Client Model
class FinalAPIClient {
    static let instance = FinalAPIClient()
    
    private init() {}
    
    func execute(completion : (Data?) -> Void) {
        let userInfo: LoggedInuser = .init(name: "TestUser")
        completion(userInfo.getNameData())
    }
}

//Main Module

protocol LoginProtocol {
    func loginUser(completion: (LoggedInuser) -> Void)
}

struct LoginAdapter : LoginProtocol {
    let client: FinalAPIClient = .instance
    
    func loginUser(completion: (LoggedInuser) -> Void) {
        client.execute { responseData in
            guard let name = responseData else {
                print("user Not found")
                return
            }
            let userName = String(decoding: name, as: UTF8.self)
            print(userName)
        }
    }
}

//LoginModule
struct Login2ViewModel {
    var loginUser: (((LoggedInuser) -> Void) -> Void)?
    
    func onLogginPress() {
        loginUser? { LoggedInuser in
            print(LoggedInuser)
        }
    }
}

struct LoginComposer {
    private var loginServiceHelper : LoginProtocol
    
    init(service : LoginProtocol) {
        self.loginServiceHelper = service
    }
    
    func composeLoginModule() {
        var loginVM = Login2ViewModel()
        loginVM.loginUser = loginServiceHelper.loginUser(completion:)
        loginVM.onLogginPress()
    }
}

//FeedModule
protocol FeedProtocol {
    func loadFeed(completion: ([Feeditems]) -> Void)
}

struct Feed2ViewModel {
    var loadFeeds: ((([Feeditems]) -> Void) -> Void)?
    
    func loadFeed() {
        loadFeeds? { feeditems in
            //reload UI
        }
    }
}

