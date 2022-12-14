//
//  HomeView.swift
//  WisataKita
//
//  Created by rzamau on 29/08/22.
//

import SwiftUI


struct HomeViewScreen: View {
    
    @State var results = [Place]()
    
    @State var trendingPlace = [Place]()
    
    @State private var scrollViewContentSize: CGSize = .zero
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State var isVertical: Bool = true
    
    
    init(){
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor(named: "MainColor")
        appearance.shadowColor = UIColor.systemGray
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment:.leading,spacing: 0) {
                    if(results.isEmpty){
                        Spacer()
                            .padding(.vertical, 16.0)
                        HStack(alignment: VerticalAlignment.center){
                            Text("Sedang Memuat Data ...")
                                .font(.system(size: 12))
                                .foregroundColor(Color.init(UIColor(named: "GrayTextColor")!))
                            ProgressView()
                        }
                        
                    }else {
                        Text("Tempat wisata trending")
                            .padding(.leading,8)
                            .padding(.top,16)
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing:8) {
                                ForEach(trendingPlace, id: \.id) { place in
                                    NavigationLink(destination: DetailViewScreen(place:place)) {
                                        CardTrendingView(place: place)
                                    }
                                }
                            }.frame(minHeight: 250, maxHeight: .greatestFiniteMagnitude)
                        }.frame(height: 250) // 115 and below not works
                        
                        Text("Rekomendasi tempat wisata")
                            .padding(.leading,8)
                            .padding(.top,16)
                            .padding(.bottom,8)
                        
                        
                        
                        ScrollView{
                            LazyVGrid(columns: gridItemLayout, spacing: 20){
                                ForEach(results, id: \.id){ place in
                                    NavigationLink(destination: DetailViewScreen(place:place)) {
                                        CardPlaceView(place: place)
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                }
                
            }.onAppear{
                loadData()
            }.navigationTitle("WisataKita")
                .navigationBarItems(
                    trailing: NavigationLink(destination: ProfileViewScreen()){
                        Image(systemName: "person.circle")
                            .foregroundColor(Color.white)
                    }
                )
        }
    }
    
    
    func loadData() {
        
        guard let url = URL(string: "https://tourism-api.dicoding.dev/list") else {
            print("Invalid URL")
            return
        }
        
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(Response.self, from: data){
                    DispatchQueue.main.async {
                        self.results = response.places
                        self.trendingPlace =  Array(response.places
                            .sorted { $0.like > $1.like}
                            .prefix(3)
                        )
                    }
                    return
                }
                
            }
        }.resume()
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewScreen()
    }
}



