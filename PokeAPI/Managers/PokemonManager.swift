import SwiftUI

class PokemonService {
    
    public let shared = PokemonService()
    
    func makeRequestWith<T: Decodable>(url: String, model: T.Type, completion: @escaping(T) -> (), failure: @escaping (Error) -> ()) {
        guard let url = URL(string: url) else { return }
            
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let serverData = try decoder.decode(T.self, from: data)
                completion(serverData)
            } catch {
                failure(error)
            }
        }.resume()
    }
    
    func getDetailPokemon(id: Int, _ completiom: @escaping (PokemonDetail) -> ()) {
        makeRequestWith(url: .pokeAPIDetailsUrl(id: id), model: PokemonDetail.self) { data in
            completiom(data)
        } failure: { error in
            print("A wild error appears: \(error.localizedDescription)")
        }
    }
    
    func teste() async throws -> PokemonPage {
        guard let url = URL(string: .pokeAPIListUrl(limit: 10, offset: 0)) else {
            throw PokeAPIErrors.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PokeAPIErrors.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode(PokemonPage.self, from: data)
        } catch {
            throw PokeAPIErrors.invalidData
        }
    }
    
//        .task {
//            do {
//                response = try await teste()
//            } catch PokeAPIErrors.invalidUrl {
//                print("Invalid Url")
//            } catch PokeAPIErrors.invalidData {
//                print("Invalid Data")
//            } catch PokeAPIErrors.invalidResponse {
//                print("Invalid Response")
//            } catch {
//                print("Unespected Error")
//            }
//        }
}
