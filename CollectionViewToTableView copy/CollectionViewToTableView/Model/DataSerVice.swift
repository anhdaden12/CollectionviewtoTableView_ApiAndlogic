//
//  DataSerVice.swift
//  CollectionViewToTableView
//
//  Created by Ngoc on 7/25/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import Foundation

class DataService {
    static let sharedIntance: DataService = DataService()
    
    func getdataApi(completeHandle: @escaping ([User]) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos?fbclid=IwAR36XhmvsfhEXD_BzR2n2T7jVn1n_F0Uf_82V-v-WUlfw2CDQ_lNZT0EagE") else { return }
        
        let urlRequest = URLRequest(url: url)
        
        let dowloadTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
            do {
                let dataResponse = try JSONDecoder().decode([User].self, from: data!)
                DispatchQueue.main.async {
                    completeHandle(dataResponse)
                }
            } catch {
                print(error)
            }
        })
        dowloadTask.resume()
    }
}
