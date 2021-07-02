//
//  RegisterResponse.swift
//  PlatziTweets
//
//  Created by Field Employee on 7/2/21.
//

import Foundation

struct RegisterResponse: Codable {
    let user: User
    let token: String
}
/*
struct user: Codable{
    let email: String
    let names: String
    let nickname: String
}
*/
