//
//  Responses.swift
//  Dogs
//
//  Created by André Rodrigues on 22/01/24.
//

import Foundation

struct ListBreedsResponse: Decodable {
    let message: [String: [String]]
}

struct BreedImagesResponse: Decodable {
    let message: [URL]
}

struct BreedRandomImageResponse: Decodable {
    let message: URL
}
