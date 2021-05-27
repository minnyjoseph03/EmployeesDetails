//
//  services.swift
//  Machine_Test
//
//  Created by Nixon on 25/05/21.
//

import Alamofire
import Foundation
import UIKit


class services{
    
    static var instance = services()
    
    func webServices(url:String)->[dataSet]{
            let urlData = URL(string: url)
            var request = URLRequest(url: urlData!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Context-Type")
            let serverData = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }
                do{
                    let response:[String:Any] = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                    print(response)
                   // let dataVa = response["data"] as? [String:String]
                    //print(dataVa)

                    for (key, value) in response {
                        
                        if(key == "data") {
                            let data:[Any] = value as! [Any]
                            print(data)
                            
                            for value1 in data {
                                let obj = dataSet(json: value1 as! [String:Any])
                            dataArray.append(obj)
                            }
                        }
                        /*let obj = dataSet(json: i)
                        dataArray.append(obj)*/

                    }
                }
                catch {
                    print("Error")
                }
        }
        serverData.resume()
        return dataArray
    }
    



    
}
