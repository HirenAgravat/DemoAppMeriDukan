//
//  Welcome_Screen.swift
//  DemoAppMeriDukan
//
//  Created by iOS Dev2 on 17/08/21.
//

import SwiftUI
import NavigationStack

struct Welcome_Screen: View {
    var body: some View {
        
        NavigationStackView(transitionType: .custom(.opacity)) {
            
            ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                Text("Welcome to App")
                    .font(.system(size: 30, weight: Font.Weight.medium, design: .default))
                    .padding(.top, 30)
                
                Text("Explore Us")
                    .font(.system(size: 25, weight: Font.Weight.light, design: .default))
                    .foregroundColor(.secondary)
                    .padding(.bottom, 100)
                
                Image("welcome")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
                    .cornerRadius(4)
                
                PushView(destination: Cart_Screen()) {
                    Text("Log in")
                        .font(.system(size: 25, weight: Font.Weight.light, design: .default))
                        .foregroundColor(.white)
                        .frame(width: 300.0, height: 60)
                        .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                        .cornerRadius(10)
                        .padding(.top, 30)
                }
                
                PushView(
                    destination: SignUp_Screen()) {
                    Text("Signup")
                        .font(.system(size: 25, weight: Font.Weight.light, design: .default))
                        .foregroundColor(.black)
                        .frame(width: 300.0, height: 60)
                        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .cornerRadius(10)
                        .padding(.top, 20)
                        
                }
            }
        }.navigationBarHidden(true)
    }
}
    
    struct Welcome_Screen_Previews: PreviewProvider {
        static var previews: some View {
            Welcome_Screen()
        }
    }
}
