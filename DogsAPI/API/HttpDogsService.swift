//
//  HttpDogsService.swift
//  Dogs
//
//  Created by André Rodrigues on 22/01/24.
//

import Foundation

enum HttpDogsServiceError: Error {
    case noData
}

class HttpDogsService: DogsService {
    private let baseURL = {
        guard let url = URL(string: "https://dog.ceo/api") else {
            fatalError("invalid base url")
        }
        return url
    }()

    private lazy var breedsURL = baseURL.appendingPathComponent("breeds/list/all")
    private func breedImagesURL(breed: Breed) -> URL {
        baseURL.appendingPathComponent("breed/\(breed.name)/images")
    }
    private func breedRandomImageURL(breed: Breed) -> URL {
        baseURL.appendingPathComponent("breed/\(breed.name)/images/random")
    }

    func getBreeds(completion: @escaping (Result<[Breed], Error>) -> Void) {
        get(url: breedsURL) { (result: Result<ListBreedsResponse, Error>) in
            completion(
                result.map { requestResponse in
                    [Breed](response: requestResponse)
                }
            )
        }
    }

    func getImageURLs(breed: Breed, completion: @escaping (Result<[URL], Error>) -> Void) {
        get(url: breedImagesURL(breed: breed)) { (result: Result<BreedImagesResponse, Error>) in
            completion(
                result.map { requestResponse in
                    requestResponse.message
                }
            )
        }
    }

    func getRandomImageURL(breed: Breed, completion: @escaping (Result<URL, Error>) -> Void) {
        get(url: breedRandomImageURL(breed: breed)) { (result: Result<BreedRandomImageResponse, Error>) in
            completion(
                result.map { requestResponse in
                    requestResponse.message
                }
            )
        }
    }

    private func get<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let urlSession = URLSession.shared
        let request = URLRequest(url: url)
        let jsonDecoder = JSONDecoder()

        let dataTask = urlSession.dataTask(with: request) { [jsonDecoder] data, response, error in
            do {
                let requestResponse = try data.map {
                    try jsonDecoder.decode(T.self, from: $0)
                }

                let result: Result<T, Error> = switch (requestResponse, error) {
                case (let requestResponse?, nil):
                    .success(requestResponse)
                case (nil, let error?):
                    .failure(error)
                default:
                    .failure(HttpDogsServiceError.noData)
                }

                completion(result)

            } catch {
                completion(.failure(error))
            }
        }

        dataTask.resume()
    }
}
