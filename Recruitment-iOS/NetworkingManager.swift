//
//  NetworkingManagerGreat.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambulyak on 19/03/2020.
//  Copyright © 2020 Untitled Kingdom. All rights reserved.
//

import Foundation

import UIKit

class NetworkingManager: NSObject {

    static var sharedManager = NetworkingManager()
    
    func downloadItems(completion: @escaping(ItemsListApiResponseModel?, NSError?) -> Void) {
        request(filename: "Items") { data, error in
            
            let jsonDecoder = JSONDecoder()
            
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "Error with data", code: 401, userInfo: nil)
                completion(nil, error)
                return
            }
            
            do {
                let jsonModels = try jsonDecoder.decode(ItemsListApiResponseModel.self, from: data)
                completion(jsonModels, nil)
            } catch {
                let error = NSError(domain: "Error with parsing", code: 0, userInfo: nil)
                completion(nil, error)
            }
        }
    }
    
    func downloadItemWithID(_ id:String, completion: @escaping(ItemApiResponseModel?, NSError?) -> Void) {
        let filename = "Item\(id)"
        request(filename: filename) { data, error in
           let jsonDecoder = JSONDecoder()
               
           if let error = error {
               completion(nil, error)
               return
           }
           
           guard let data = data else {
               let error = NSError(domain: "Error with data", code: 401, userInfo: nil)
               completion(nil, error)
               return
           }
           
           do {
               let jsonModel = try jsonDecoder.decode(ItemApiResponseModel.self, from: data)
               completion(jsonModel, nil)
           } catch {
               let error = NSError(domain: "Error with paring", code: 0, userInfo: nil)
               completion(nil, error)
           }
        }
    }
    
    private func request(filename: String, completion: @escaping (Data?, NSError?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            do {
                let testBundle = Bundle(for: type(of: self))
                let path = testBundle.path(forResource: filename, ofType: "json")
                let data = try Data(contentsOf: URL(fileURLWithPath: path ?? ""))
                completion(data, nil)
            } catch {
                let error = NSError(domain: "Error with loading", code: 404, userInfo: nil)
                completion(nil, error)
            }
        }
    }
    
}
