//
//  HistoryService.swift
//  HistoryTurma250
//
//  Created by Gabriel Mors  on 16/06/24.
//

import Foundation
import Alamofire

class HistoryService {
    
    func getHistoryAlamofire(completion: @escaping (Result<History, Error>) -> Void) -> Void {
        let urlString = "https://run.mocky.io/v3/d572b1bb-16b1-442f-a74d-13f1fbd85bc9"
        AF.request(urlString, method: .get).responseDecodable(of: History.self) { response in
            switch response.result {
            case .success(let history):
                completion(.success(history))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    // Utilizamos o @escaping para que a nossa funcao continue viva ATÉ que obtenha o retorno do completion.
    func getHistoryURLSession(completion: @escaping (Result<History, Error>) -> Void) {
        
        guard let url = URL(string: "https://run.mocky.io/v3/d572b1bb-16b1-442f-a74d-13f1fbd85bc9") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let history: History = try JSONDecoder().decode(History.self, from: dataResult)
                    completion(.success(history))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error ?? NSError(domain: "Deu ruim mesmo!", code: response.statusCode)))
            }
        }
        task.resume()
    }
    
    
    func getHistoryMock(completion: (Result<History, Error>) -> Void) -> Void {
        if let url = Bundle.main.url(forResource: "History", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let history: History = try JSONDecoder().decode(History.self, from: data)
                completion(.success(history))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
}


