//
//  OkashiData.swift
//  WebApiSample
//
//  Created by 鳴子智 on 2022/05/05.
//

import Foundation

class OkashiData: ObservableObject {
    
    struct ResultJson: Codable {
        
        struct Item: Codable {
            let name: String?
            let url: URL?
            let imageUrl: URL?
        }
        
        let item: [Item]?
    }
    
    func searchOkashi(keyword: String){
        print(keyword)
        
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let req_url = URL(string: "https://www.sysbird.jp/webapi/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r")
        else {
            return
        }
        print(req_url)
        
        let req = URLRequest(url: req_url)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: req, completionHandler: {
        (data, response, error) in
        session.finishTasksAndInvalidate()
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(ResultJson.self, from: data!)
                
                print(json)
            } catch{
                print("josn decode error.")
            }
        
        })
        
        task.resume()
    }
}
