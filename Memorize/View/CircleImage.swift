//
//  CircleImage.swift
//  Memorize
//
//  Created by Augusto Galindo Alí on 20/02/21.
//

import SwiftUI

struct CircleImage: View {
    var image: String
    
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height) 
            .clipShape(Circle())
    }
}

struct circleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: "faraon", width: 100, height: 100)
    }
}
