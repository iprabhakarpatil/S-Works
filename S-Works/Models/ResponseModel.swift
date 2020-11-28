//
//  ResponseModel.swift
//  S-Works
//
//  Created by Prabhakar Patil on 28/11/20.
//

import Foundation

/// Response Model for the API request
struct ResponseModel: Codable {
    
    let orders: [OrderModel]
    
}

/// Order Model Received in the response
struct OrderModel: Codable {
    let name: String
    let location: LocationCoordinateModel
    let phone: Int64
    let address: String
}

/// Location Coordinates Model
struct LocationCoordinateModel: Codable {
    let lat: Double
    let long: Double
}
