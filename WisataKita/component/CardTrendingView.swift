//
//  CardTrendingView.swift
//  WisataKita
//
//  Created by rzamau on 29/08/22.
//

import SwiftUI

struct CardTrendingView: View {
    var place: Place

    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(
                url: URL(string: place.image),
                content: { phase in
                    if let image = phase.image {
                        image
                            .scaledToFit()
                            .frame(width: 260, height: 150)

                    } else if phase.error != nil {
                        Color.init(UIColor.lightGray)
                            .frame(width: 260, height: 150)
                    } else {
                        Color.init(UIColor.lightGray)
                            .frame(width: 260, height: 150)
                    }
                    
                }
                
            )
            .frame(width: 260, height: 150)
            .background(Color.init(UIColor.lightGray))
            
            VStack(alignment:.leading){
                VStack(alignment:.leading){
                    Text(place.name)
                        .font(.system(size: 12))
                        .foregroundColor(Color.black)

                    
                    Text(place.address)
                        .font(.system(size: 10))
                        .lineLimit(1)
                        .foregroundColor(Color.init(UIColor(named: "GrayTextColor")!))
                    
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.all,6)
                
                
            }.frame(width: 260)
                .background(
                    Color.white
                )
            
            
            
        }.frame(width: 260,alignment: .leading)
            .background(Color.init(UIColor.lightGray))
            .modifier(CardModifier())
            .padding(.leading,5)
        
        
    }
}

struct CardTrendingView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyData = dummyPlaceData[0]
        
        CardTrendingView(place: dummyData)
    }
}
