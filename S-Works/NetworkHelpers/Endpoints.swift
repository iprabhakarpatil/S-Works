//
//  Endpoints.swift
//  S-Works
//
//  Created by Prabhakar Patil on 28/11/20.
//

import Foundation

public enum Endpoint: String {
    
    case clients = "http://demo8360259.mockable.io/clients"
    
    var url: URL {
        return URL(string: self.rawValue)!
    }
    
}
