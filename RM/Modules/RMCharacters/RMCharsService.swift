//
//  RMService.swift
//  RM
//
//  Created by Jeffrey Tabios on 11/2/21.
//

import Foundation
import Combine

protocol CharsServiceProtocol {
    func getCharacters() -> Future<RMCharacters, Error>
}

struct CharsService: CharsServiceProtocol, APIService {
    func getCharacters() -> Future<RMCharacters, Error> {
        request(url: "https://rickandmortyapi.com/api/character", params: [:])
    }
}
