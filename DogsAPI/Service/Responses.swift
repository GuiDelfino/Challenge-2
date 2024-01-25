//
//  Responses.swift
//  Dogs
//
//  Created by André Rodrigues on 22/01/24.
//

import Foundation

public struct ListBreedsResponse: Decodable {
    public let message: [String: [String]]
}

public struct BreedImagesResponse: Decodable {
    public let message: [URL]
}

public struct BreedRandomImageResponse: Decodable {
    public let message: URL
}
