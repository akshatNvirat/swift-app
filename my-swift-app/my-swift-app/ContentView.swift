//
//  ContentView.swift
//  my-swift-app
//
//  Created by Mukund Onkar on 12/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var users = [User]()
    @State private var selection: User.ID?
    
    var body: some View {
        VStack(spacing: 20){
            
            Button("Refresh") {
                Api().loadData { (x) in
                    self.users = x
                }
            }.padding()
                .foregroundColor(.white)
                .background(.orange)
                .cornerRadius(100)
            
            Grid(alignment: .leading) {
                ForEach(users) { u in
                    
                    GridRow() {
                        Text("\(u.fname)")
                        Text("\(u.lname)")
                        Text("\(u.email)")
                        Text("\(u.username)")
                        Text("\(u.pwd)")
                        //if !("\(u.link)".isEmpty) {
                            //Link("\(u.link)", destination: URL(string: //"\(u.link)")!)
                        //}
                        
                    }
                    Divider()
                }
                
            }
        }
        .onAppear() {
            Api().loadData { (x) in
                self.users = x
            }
        }
        .padding()
        .background(
            Color(.systemTeal)
        )
    }
}

#Preview {
    ContentView()
}
