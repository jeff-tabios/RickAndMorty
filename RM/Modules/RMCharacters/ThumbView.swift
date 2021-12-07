//
//  ThumbView.swift
//  RM
//
//  Created by Jeffrey Tabios on 11/2/21.
//

import SwiftUI
import Kingfisher

struct ThumbView: View {
    let imageUrl: String
    var body: some View {
        KFImage(URL(string: imageUrl))
            .resizable()
            .frame(width: 50, height: 50, alignment: .center)
    }
}

struct ThumView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbView(imageUrl: "")
    }
}
