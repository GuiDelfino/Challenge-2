//
//  DogsService.swift
//  Dogs
//
//  Created by André Rodrigues on 22/01/24.
//

import Foundation

protocol DogsService {
    func getBreeds(completion: @escaping (Result<[Breed], Error>) -> Void)
    func getImageURLs(breed: Breed, completion: @escaping (Result<[URL], Error>) -> Void)
}

extension [Breed] {
    init(response: ListBreedsResponse) {
        self = response.message
            .filter { _, value in
                value.isEmpty
            }
            .map(\.key)
            .map(Breed.init(name:))
    }
}
