//
//  RMCharsView.swift
//  RM
//
//  Created by Jeffrey Tabios on 11/2/21.
//

import SwiftUI
import Kingfisher

struct RMCharsView: View {
    @ObservedObject var vm = CharsViewModel(service: CharsService())
    var body: some View {
        
        List {
            if let chars = vm.chars?.results {
                ForEach(chars, id: \.id, content: { item in
                    HStack {
                        ThumbView(imageUrl: item.image)
                        Text(item.name)
                    }
                    .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
            }
            
        }
        .onAppear {
            vm.getCharacters()
        }
    }
}

struct RMCharsView_Previews: PreviewProvider {
    static var previews: some View {
        RMCharsView()
    }
}
