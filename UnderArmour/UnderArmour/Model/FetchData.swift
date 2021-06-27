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
                    if let responseText = String.init(data: data!, encoding: .ascii){
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
}
