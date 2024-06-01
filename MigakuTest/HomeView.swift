//
//  ContentView.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showPopup = false
    @State private var isAnimating = false
    var viewModel: HomeVM = HomeVM()
    
    var body: some View {
        ZStack {
            ScrollView([.vertical], showsIndicators: false) {
                ZStack {
                    WavyHeader()
                    
                    NavTop(wordCount: 2483) {
                        withAnimation(.interpolatingSpring(stiffness: 70, damping: 10)) {
                            showPopup.toggle()
                            
                            isAnimating = true
                            
                            // Disable interactions during the animation
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                isAnimating = false
                            }
                        }
                    }
                    .position(x: UIScreen.main.bounds.width / 2, y: 90)
                    
                    //Lazy VStack for infinite scrolling
                    LazyVStack(spacing: 25) {
                        
                        ForEach(viewModel.users) { user in
                            UserCell(user: user)
                                .frame(width: 360)
                                .offset(y:-11)
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
                        VStack(alignment: .center, spacing: 10) {
                            // Display user login name
                            Text("Study all \n decks")
                                .font(.GTMaru(size: 38))
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.center)
                                .offset(y: 3)
                            
                            HStack(spacing: 15) {
                                // Badge for reviews
                                Text("134 reviews")
                                    .font(.GTMaru(size: 12))
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.green)
                                    .cornerRadius(20)
                                
                                // Badge for new cards
                                Text("18 new")
                                    .font(.GTMaru(size: 12))
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.blue)
                                    .cornerRadius(20).offset(x: -2)
                            }
                        }
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
                    
                    Text("Today").font(.GTMaru(size: 20)).position(x: UIScreen.main.bounds.width / 2, y: 350)
                    
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
                    Color.purple.opacity(0.5)
                        .ignoresSafeArea()
                }
                .buttonStyle(PlainButtonStyle())
                .zIndex(1)
                
                PopupView()
                    .frame(width: 450)
                    .transition(.move(edge: .leading))
                    .animation(.interpolatingSpring(stiffness: 70, damping: 10), value: showPopup)
                    .position(x: UIScreen.main.bounds.width / 2, y: 265)
                    .zIndex(2).disabled(isAnimating)
            }
        }
        .background(Color.init(hex: "#EDE3FF"))
        .task() {
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
