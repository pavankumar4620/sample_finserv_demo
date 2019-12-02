//
//  Services.swift
//  Fiserv_Demo
//
//  Created by Mac on 30/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

class Services {
    func genericFetchData<T:Decodable>(completion:@escaping (T)->()) {
        if let path = Bundle.main.path(forResource: "Recipes", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let  respone =  try decoder.decode(T.self, from: data)
                completion(respone)
            } catch {
            }
        }
    }
}
