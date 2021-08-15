//
//  APIClient.swift
//  Singleton-S1
//
//  Created by Ashish Rai on 13/08/21.
//

import Foundation

/*
 Singleton Class
 KeyPoints:
 1. Only once instance and it provide a single point of access to it
 2. Class should be responsible itself for keeping track of its sole instance
 3. insure that no other instance can be created by intercepting request for creating new object and provide a way to access the sole instance
 
 Adding extension to single is permitted : So we can't create the class 'final' else it wouldn't be extended by sub-classing
 */
/* 'SINGLETON' Inplementation as per documentation*/

//APIModule
class APIClient {
    /*
    private static let instance = APIClient()
    
    static func getInstance() -> APIClient {
        return instance
    }
    */
    private init() {} //Only one instance of class  1. Remove private init() to convert SINGLETON -> singleton

    // or Ass per swift we can
    static let instance = APIClient()
    
    
    //for modular approach
    func execute(_ : URLRequest, completion : (Data)-> Void) {}
//    func login(completion: (LoggedInuser)-> Void) {} //Move to login Module
//
//    func loadFeed(completion: ([Feeditems])-> Void) {} //Move to feed Module
}

/*
 'singleton' as per apple predefinedsingleton classes : CONVINENCE SINGLETON IMPLEMENTATION
 let session = URLSession.shared // we can access using shared
 let newSession = URLSession.init(configuration: .default)    //or we can create session with custom setting

 */

/*
 For making the api client testable i.e mock APIClient
 */


class MockAPIClient : APIClient {}


let client = APIClient.instance

/*
 TODO:
 1. make singleton testable
 */
