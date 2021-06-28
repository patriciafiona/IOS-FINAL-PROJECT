//
//  FetchData.swift
//  UnderArmour
//
//  Created by Patricia Fiona on 27/06/21.
//

import Foundation

class FetchData{
    
    init(){}
    
    func fetchData(urlForFetchingData: String, completionHandler: @escaping ([Products]) -> Void ){
        
        var ProductSpace = [Products]()
        
        //code for calling web API
        if let urlToServer = URL.init(string: urlForFetchingData){
            let task = URLSession.shared.dataTask(with: urlToServer, completionHandler: { (data, response, error) in
                
                if error != nil || data == nil{
                    print("An error occured while fetching data from API")
                }else{
                    if let responseText = String.init(data: data!, encoding: .utf8){
                        let jsonData = responseText.data(using: .utf8)!
                        ProductSpace = try! JSONDecoder().decode([Products].self, from: jsonData)
                        completionHandler(ProductSpace)
                    }
                }
            })
            task.resume()
        }
        
        completionHandler(ProductSpace)
    }
    
    func fetchDataWithParams(urlForFetchingData: URLComponents, completionHandler: @escaping ([Products]) -> Void ){
        
        var ProductSpace = [Products]()
        
        //code for calling web API
        if let urlToServer = urlForFetchingData.url {
            let task = URLSession.shared.dataTask(with: urlToServer, completionHandler: { (data, response, error) in
                
                if error != nil || data == nil{
                    print("An error occured while fetching data from API")
                }else{
                    if let responseText = String.init(data: data!, encoding: .utf8){
                        let jsonData = responseText.data(using: .utf8)!
                        ProductSpace = try! JSONDecoder().decode([Products].self, from: jsonData)
                        completionHandler(ProductSpace)
                    }
                }
            })
            task.resume()
        }
        
        completionHandler(ProductSpace)
    }
    
    func fetchImage(from urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
        let session = URLSession.shared
        let url = URL(string: urlString)
            
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error fetching the image! 😢")
                completionHandler(nil)
            } else {
                completionHandler(data)
            }
        }
            
        dataTask.resume()
    }
    
}
