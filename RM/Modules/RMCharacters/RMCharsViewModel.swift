//
//  RMCharsViewModel.swift
//  RM
//
//  Created by Jeffrey Tabios on 11/2/21.
//

import Foundation
import Combine

final class CharsViewModel: ObservableObject{
    
    let service: CharsServiceProtocol
    var getCancellable: Cancellable?
    
    @Published var chars: RMCharacters?
    
    init(service: CharsServiceProtocol) {
        self.service = service
    }
    
    func getCharacters(completionHandler: (()-> Void)? = nil) {
        
        getCancellable?.cancel()
        getCancellable = service.getCharacters()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    break
                case .finished:
                    break
                }
                completionHandler?()
            }, receiveValue: { [weak self] value in
                self?.chars = value
            })
        
    }
}
