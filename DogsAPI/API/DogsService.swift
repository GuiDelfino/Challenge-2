//
//  DogsService.swift
//  Dogs
//
//  Created by André Rodrigues on 22/01/24.
//

import Foundation

public protocol DogsService {
    func getBreeds(completion: @escaping (Result<[Breed], Error>) -> Void)
    func getImageURLs(breed: Breed, completion: @escaping (Result<[URL], Error>) -> Void)
}

public final class DogsServiceFactory {
    static func make() -> DogsService {
        HttpDogsService()
    }
}
