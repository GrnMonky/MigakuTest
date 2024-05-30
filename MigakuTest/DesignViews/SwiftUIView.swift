//
//  SwiftUIView.swift
//  MigakuTest
//
//  Created by Landon Mann on 5/29/24.
//

import SwiftUI

struct StudyView: View {
    var body: some View {
        Text("Study View")
    }
}

struct DictionaryView: View {
    var body: some View {
        Text("Dictionary View")
    }
}

struct FeedbackView: View {
    var body: some View {
        Text("Feedback View")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
    }
}


struct MainMenuView: View {
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "flag.fill") // Placeholder for the flag icon
                    .resizable()
                    .frame(width: 60, height: 40)
                Text("9264 words")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 5)
            }
            .padding()
            .background(Color.orange)
            .cornerRadius(20)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 20) {
                NavigationLink(destination: StudyView()) {
                    Text("Study")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                NavigationLink(destination: DictionaryView()) {
                    Text("Dictionary")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                NavigationLink(destination: FeedbackView()) {
                    Text("Give feedback")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.pink]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

//struct MainMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainMenuView()
//    }
//}

import SwiftUI

struct StudyDeckView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "star.fill") // Placeholder for the icon
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding()
                Spacer()
                Text("5483 words")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.orange)
            
            VStack {
                Text("Study all decks")
                    .font(.title)
                    .bold()
                HStack {
                    Text("134 reviews")
                        .foregroundColor(.green)
                    Text("18 new")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
            
            ScrollView {
                VStack(spacing: 20) {
                    DeckItemView(deckName: "Kanji deck", reviews: 23, newCards: 8)
                    DeckItemView(deckName: "Japanese Native Flower Species", reviews: 6, newCards: 5)
                    DeckItemView(deckName: "Sushi types", reviews: 6, overdueCards: 2)
                    DeckItemView(deckName: "Japanese geography", reviews: 6, newCards: 0)
                }
            }
            .padding()
            
            Spacer()
        }
        .background(Color.purple.opacity(0.1))
        .edgesIgnoringSafeArea(.all)
    }
}

struct DeckItemView: View {
    var deckName: String
    var reviews: Int
    var newCards: Int = 0
    var overdueCards: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(deckName)
                .font(.title3)
                .bold()
            HStack {
                if reviews > 0 {
                    Text("\(reviews) reviews")
                        .foregroundColor(.green)
                }
                if newCards > 0 {
                    Text("\(newCards) new cards")
                        .foregroundColor(.blue)
                }
                if overdueCards > 0 {
                    Text("\(overdueCards) overdue")
                        .foregroundColor(.red)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


//#Preview {
//        MainMenuView()
//}
#Preview {
    ZStack{
        StudyDeckView()
        ImageView()
    }
}
