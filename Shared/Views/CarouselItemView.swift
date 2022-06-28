//
//  CarouselItemView.swift
//  spender
//
//  Created by sano on 6/28/22.
//

import SwiftUI

struct CarouselItemView: View {
    var data: CarouselItem
    
    var body: some View {
        VStack (spacing: 20) {
            Text(data.title)
                .font(.title3)
                .bold()
                .padding(.bottom, 20)
            
            Image(data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            
            Text(data.caption)
                .font(.caption)
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 40)
    }
}

struct CarouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        let data = CarouselItem(title: "Default title", caption: "Default caption", image: "organize")
        
        CarouselItemView(data: data)
            .previewLayout(.sizeThatFits)
    }
}
