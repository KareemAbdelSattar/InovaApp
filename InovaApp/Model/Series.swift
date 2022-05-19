//
//  Series.swift
//  InovaApp
//
//  Created by kareem chetoos on 19/05/2022.
//

import Foundation

struct Series: Codable {
    let coverImage : String
    let seriesName : String
    let coachName : String
    let description: String
    
    enum CodingKeys: String, CodingKey {

        case coverImage = "cover_image"
        case seriesName = "series_name"
        case coachName = "coach_name"
        case description = "description"
    }
}
