//
//  PostRequest.swift
//  PlatziTweets
//
//  Created by Froy on 7/2/21.
//

import Foundation

struct PostRequest {
    let text: String
    let imageUrl: String?
    let videoUrl: String?
    let location: PostRequestLocation?
}
