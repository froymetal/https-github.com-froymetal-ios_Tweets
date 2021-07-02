//
//  LoginResponse.swift
//  PlatziTweets
//
//  Created by Field Employee on 7/2/21.
//

import Foundation

// para en loginResponse

struct LoginResponse: Codable {
    let user: User
    let token: String
}
/*
struct User: Codable{
    let email: String
    let names: String
    let nickname: String
}
 */
 


