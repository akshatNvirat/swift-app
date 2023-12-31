//
//  Api.swift
//  abcd
//
//  Created by Mukund Onkar on 12/28/23.
//

import Foundation

class Api : ObservableObject{
    @Published var users = [User]()
    
    func loadData(completion:@escaping ([User]) -> ()) {
        guard let url = URL(string: "http://<IP Address>/~<username>/personal/test/my-php/index.php/user/list?limit=20") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(error)
            let users = try! JSONDecoder().decode([User].self, from: data!)
            print(users)
            DispatchQueue.main.async {
                completion(users)
            }
        }.resume()
        
    }
}
