//
//  APIManager.swift
//  VishalTestTask
//
//  Created by Vishal Chauhan on 05/04/23.
//

import Foundation

enum RequestType: String{
    case GET
    case POST
    case PUT
    case DELETE
}

final class APIManager{
    
    static let shared = APIManager()
    private init(){}
    
    func fetchAPIData<T :Decodable>(url:String? , requestType : RequestType? ,completionHendler: @escaping((_ result : T ) -> Void)){
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.jsonkeeper.com"
        components.path = "/\(url ?? "")"
        
        var urlRequest = URLRequest(url: URL(string: components.string ?? "")!)
        urlRequest.httpMethod = requestType?.rawValue
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do {
                let decoder = JSONDecoder()
                guard let decodeData = try? decoder.decode(T.self, from: data)  else{
                    print("Invalid")
                    return
                }
                completionHendler(decodeData)
            }
        }
        task.resume()
    }
}
