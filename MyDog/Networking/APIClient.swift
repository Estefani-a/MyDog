//
//  APIClient.swift
//  MyDog
//
//  Created by Estefania Sassone on 06/08/2022.
//

import Foundation
import Alamofire
import PromiseKit

class APIClient{
    
    static func loadDogs() -> Promise<[Dog]>{
        return Promise { seal in
            AF.request("http://api.jsonbin.io/b/625418b7d20ace068f9692b2").responseDecodable(of: [Dog].self){
                response in
                if let dogs = response.value{
                    seal.fulfill(dogs)
                    return
                }
                seal.reject(APIError.ServerError)
            }
        }
    }
}
