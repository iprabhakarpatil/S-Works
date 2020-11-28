//
//  ClientsViewModel.swift
//  S-Works
//
//  Created by Prabhakar Patil on 28/11/20.
//

import Foundation

class ClientsViewModel {
    
    var orders: [OrderModel]?
    private var completion: ()-> Void = {  }
    
    init(completion: @escaping () -> Void) {
        self.completion = completion
        fetchClients()
    }
    
    init(order: OrderModel) {
        self.orders?.append(order)
    }
    
    private func fetchClients(onCompletion: (() -> ())? = nil) {
        
        NetworkManager.shared.fetchData(url: Endpoint.clients.url) { [weak self] (result: Result<ResponseModel, NetworkError>) in
            switch result {
            
            case .success(let response):
                guard let self = self else {
                    assert(false, "Failed to retain self")
                    return
                }
                
                print("Response", response)
                self.orders = response.orders.compactMap{$0}
                self.completion()
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                guard let self = self else {
                    assert(false, "Failed to retain self")
                    return
                }
                self.completion()
            }
        }
        
    }
    
}
