//
//  Endpoints.swift
//  PlatziTweets
//
//  Created by Froy 7/2/21.
//

import Foundation

struct Endpoints{
    //principal
    //static let domain = "https://platzi-tweets-backend.herokuapp.com/api/v1"
    //inicio de sesion
    //static let login = Endpoints.domain + "/auth"
    // registro
    //static let register = Endpoints.domain + "/register"
    // Obtener tweets
    //static let getPosts = Endpoints.domain + "/post"
    //publicar tweets
    //static let post = Endpoints.domain + "/post"
    //delete tweets
    //static let delete = Endpoints.domain + "/post/"
    
    static let domain = "https://platzi-tweets-backend.herokuapp.com/api/v1"
    static let login = Endpoints.domain + "/auth"
    static let register = Endpoints.domain + "/register"
    static let getPosts = Endpoints.domain + "/posts"
    static let post = Endpoints.domain + "/posts"
    static let delete = Endpoints.domain + "/posts/"
    
    
}
