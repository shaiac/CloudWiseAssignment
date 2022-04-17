//
//  HttpManager.swift
//  CloudWiseAssignment
//
//  Created by user on 14/04/2022.
//

import UIKit

public class HttpManager {
    
    static let shared = HttpManager()
    
    func httpPost(_ userData: UserData, completion: @escaping(String) -> Void) {
        do {
            let url = URL(string: "https://www.cloud-wise.net/CloudApps/Server/api/log")!
            var request = URLRequest(url: url)

            // Change the URLRequest to a POST request
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONEncoder().encode(userData.user)
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    // Handle HTTP request error
                    print("HTTP Request Failed \(error)")
                } else if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    // Handle HTTP request response
                    print("Response data string:\n \(dataString)")
                    completion(dataString)
                } else {
                    // Handle unexpected error
                }
            }
            task.resume()
        } catch {
            completion("Falied")
        }
    }

}
