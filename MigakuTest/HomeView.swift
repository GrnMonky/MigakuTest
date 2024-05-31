//
//  ContentView.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showPopup = false
    var viewModel: HomeVM = HomeVM()
    
    var body: some View {
        ZStack {
            ScrollView([.vertical], showsIndicators: false) {
                ZStack {
                    WavyHeader()
                    
                    NavTop(wordCount: 2483) {
                        withAnimation(.interpolatingSpring(stiffness: 70, damping: 10)) {
                            showPopup.toggle()
                        }
                    }
                    .position(x: UIScreen.main.bounds.width / 2, y: 90)
                    
                    //Lazy VStack for infinite scrolling
                    LazyVStack {
                        
                        ForEach(viewModel.users) { user in
                            UserCell(user: user)
                                .task {
                                    // Load more users when reaching the end of the list
                                    if viewModel.shouldLoadMoreUsers(user) {
                                        await viewModel.loadMoreUsers()
                                    }
                                }
    
                        }
                    }.padding(.bottom, 500).offset(y:400)
                    
                    Button(action: {
                        print("Button pressed")
                    }){
                        Text("Hello")
                    }
                    .buttonStyle(BigHomeBtn())
                    .frame(width: 260, height: 175)
                    .position(x: 190, y: 225)
                    
                    Button(action: {
                        print("Button pressed")
                    }) {
                    }
                    .buttonStyle(VectorTransitionButtonStyle())
                    .position(x: 330, y: 227)
                    
                }
            }
            .ignoresSafeArea()
            
            NavView()
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 120)
            
            if showPopup {
                Button(action: {
                    withAnimation {
                        showPopup = false
                    }
                }) {
                    Color.init(hex: "#EDE3FF").opacity(0.5)
                        .ignoresSafeArea()
                }
                .buttonStyle(PlainButtonStyle())
                .zIndex(1)
                
                PopupView()
                    .transition(.move(edge: .leading))
                    .animation(.interpolatingSpring(stiffness: 70, damping: 10), value: showPopup)
                    .position(x: UIScreen.main.bounds.width / 2, y: 265)
                    .zIndex(2)
            }
        }
        .background(Color.init(hex: "#EDE3FF"))
        .onAppear() {
            if viewModel.users.isEmpty {
                viewModel.loadInitialUsers()
            }
        }
    }
}

#Preview {
    ZStack {
        HomeView()
//        HomeDesignView().opacity(0.3)
    }
}
