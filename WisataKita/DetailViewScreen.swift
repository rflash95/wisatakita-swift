//
//  DetailView.swift
//  WisataKita
//
//  Created by rzamau on 29/08/22.
//

import SwiftUI

struct DetailViewScreen: View {
    var place: Place
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading,spacing: 0) {
                
                AsyncImage(
                    url: URL(string: place.image),
                    content: { phase in
                        if let image = phase.image {
                            image.resizable()
                                .frame(height: 200)
                                .clipped()
                            
                            
                            
                        } else if phase.error != nil {
                            Color.init(UIColor.lightGray)
                                .frame( height: 200)
                        } else {
                            Color.init(UIColor.lightGray)
                                .frame(height: 200)
                        }
                        
                    }).frame(maxWidth:.infinity, maxHeight: 200)
                
                VStack(alignment:.leading) {
                    Group {
                        Text("Deskripsi").font(.system(size: 14))
                        Spacer()
                        Text(place.description)
                            .font(.system(size: 13)) .foregroundColor(Color.init(UIColor(named: "GrayTextColor")!))
                        Spacer()
                    }
                    
                }.padding(.all,12)
                
            }
            
            
        }.navigationTitle(place.name)
        
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyData = dummyPlaceData[0]
        DetailViewScreen(place: dummyData)
    }
}
