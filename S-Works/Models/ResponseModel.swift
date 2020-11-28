//
//  ResponseModel.swift
//  S-Works
//
//  Created by Prabhakar Patil on 28/11/20.
//

import Foundation



/// Response Model for the API request
public struct ResponseModel: Codable {
    let orders: [OrderModel]
}


/// Order Model Received in the response
public struct OrderModel: Codable {
    let name: String
    let location: LocationCoordinateModel
    let phone: String
    let address: String
    
}


/// Location Coordinates Model
public struct LocationCoordinateModel: Codable {
    let lat: String
    let long: String
}
