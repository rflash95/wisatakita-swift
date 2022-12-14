//
//  CardPlaceView.swift
//  WisataKita
//
//  Created by rzamau on 30/08/22.
//

import SwiftUI

struct CardPlaceView: View {
    var place: Place
    
    
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(
                url: URL(string: place.image),
                content: { phase in
                    if let image = phase.image {
                        image
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                    } else if phase.error != nil {
                        Color.init(UIColor.lightGray)
                            .frame(width: 150, height: 150)
                    } else {
                        Color.init(UIColor.lightGray)
                            .frame(width: 150, height: 150)
                    }
                    
                }
                
            )
            .frame(maxWidth: 150, maxHeight: 150)
            .background(Color.init(UIColor.lightGray))
            
            VStack(alignment:.leading){
                VStack(alignment:.leading){
                    HStack{
                        Text(place.name)
                            .font(.system(size: 12))
                            .lineLimit(1)
                            .foregroundColor(Color.black)
                        Spacer()
                        HStack(spacing:2) {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 8))
                            .foregroundColor(Color.pink)
                        Text("\(place.like)")
                            .font(.system(size: 8))
                            .foregroundColor(Color.black)
                        }
                       
                        
                    }
                    
                    Text(place.address)
                        .font(.system(size: 10))
                        .foregroundColor(Color.init(UIColor(named: "GrayTextColor")!))
                        .lineLimit(1)
                    
                    
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.all,6)
                
                
            }.frame(maxWidth: 150)
                .background(
                    Color.white
                )
            
            
            
        }.frame(maxWidth: 150,alignment: .leading)
            .background(Color.init(UIColor.lightGray))
            .modifier(CardModifier())
            .padding(.all,8)
        
    }
}

struct CardPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyData = dummyPlaceData[0]
        
        
        CardPlaceView(place: dummyData)
    }
}
