//
//  HomwDataVC.swift
//  DemoAppMeriDukan
//
//  Created by IOSDEV1 on 13/08/21.
//

import SwiftUI
import NavigationStack

struct HomeDataVC: View {
    
    var categ: [Categories] = CategoriesList.topTen
    var featureData: [Featured] = FeaturedList.topTen
    @State var searchText = ""
    @State var selection: Int? = nil
    @State private var isActive = false
    @State private var isActive1 = false
    
    var body: some View {
        NavigationStackView{
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0)
                        .foregroundColor(Color.white)
                        .shadow(radius: 3)
                        .padding(6)
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search ..", text: $searchText)
                    }
                    .foregroundColor(.gray)
                    .padding(.leading, 13)
                }
                .frame(height: 50)
                .cornerRadius(20)
                .padding()
                
                    List  {
                        HStack {
                            Text("Categories")
                                .font(.title)
                            Spacer()
                            Button("See all") {
                                print("all")
                            }.foregroundColor(.gray)
                        }.frame(height: 10)
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            VStack(alignment: .leading) {
                                HStack{
                                    ForEach(categ) { index in
                                        CategoriesView(cate: index)
                                    }
                                }
                            }
                        })
                        .frame(height: 80)
                        
                        
                        HStack {
                            Text("Featured")
                                .font(.title)
                            Spacer()
                            
                            PushView(destination: FeaturedVC(), isActive: $isActive) {
                                            Text("")
                                        }
                            Button(action: {
                                            self.isActive.toggle()
                                        }, label: {
                                            Text("See all")
                                                .foregroundColor(.gray)
                                        }).buttonStyle(PlainButtonStyle())
                        }.frame(height: 10)
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            VStack(alignment: .leading) {
                                HStack{
                                    ForEach(featureData) { index in
                                        FeaturedView(feat: index)
                                    }
                                    
                                }
                            }
                        })
                        .frame(height: 240)
                        
                        
                        HStack {
                            Text("Best Sell")
                                .font(.title)
                            Spacer()
                            PushView(destination: ItemDetailVC(), isActive: $isActive1) {
                                            Text("")
                                        }
                            Button(action: {
                                            self.isActive1.toggle()
                                        }, label: {
                                            Text("See all")
                                                .foregroundColor(.gray)
                                        }).buttonStyle(PlainButtonStyle())
                        }.frame(height: 10)
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            VStack(alignment: .leading) {
                                HStack{
                                    ForEach(featureData) { index in
                                        FeaturedView(feat: index)
                                    }
                                }
                            }
                        })
                        .frame(height: 240)
                        
                    }
                    .listStyle(PlainListStyle())
            
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarLeading) {
                            Button(action: {
                                print("Menu")
                            }, label: {
                                Image(systemName: "text.alignleft").imageScale(.large)
                                   
                            })
                        }
                        ToolbarItemGroup (placement: .navigationBarTrailing) {
                            
                            Button(action: {
                                print("Notification")
                            }, label: {
                                Image(systemName: "bell").imageScale(.large)
                                    
                            })
                            
                            Button(action: {
                                print("Filter")
                            }, label: {
                                Image(systemName: "filter").imageScale(.large)
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.black)
                                    .background(Color.blue)
                            })
                        }
                    }
            }
        }.accentColor(.black)
        }
    }
    
}
struct Root: View {
    var body: some View {
        NavigationStackView {
            HomeDataVC()
        }
    }
}
struct CategoriesView: View {
    var cate : Categories
    var body: some View {
        ZStack {
            Image(cate.image)
                .resizable()
                .cornerRadius(10)
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.red)
                .opacity(0.7)
            Text(cate.title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }.frame(width: 120, height: 70)
    }
}

struct FeaturedView: View {
    var feat : Featured
    var body: some View {
        VStack(alignment: .leading){
            Image(feat.image)
                .resizable()
                .cornerRadius(10)
            Text(feat.rate)
                .lineLimit(nil)
                .padding(.leading, 0)
            Spacer()
            Text(feat.title)
                .lineLimit(nil)
                .padding(.leading, 0)
        }.frame(width: 150, height: 230)
    }
}

struct HomwDataVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeDataVC()
    }
}
