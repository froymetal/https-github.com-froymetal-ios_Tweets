//
//  RegisterRequest.swift
//  PlatziTweets
//
//  Created by Field Employee on 7/2/21.
//

import Foundation

// para el registro
struct RegisterRequest: Codable{
    let email: String
    let password: String
    let names: String
}
