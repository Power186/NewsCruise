//
//  ContentView.swift
//  NewsApp
//
//  Created by Scott on 2/7/21.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject var newsVM = NewsViewModel()
//    @State private var articles = [Article]()
    @State private var image: Image?
    @State private var getNewsPressed = false
    
    var body: some View {
        NavigationView {
            VStack {
                configureNewsView
            }
            .listStyle(SidebarListStyle())
            .navigationBarTitle("News")
            .navigationBarItems(trailing: Button(action: {
                getNewsPressed = true
                newsVM.fetchArticles()
            }) {
                Text("Get News")
        })
            Text("\(newsVM.articles.count) articles")
                .font(.headline)
                .foregroundColor(.secondary)
        }
    }
    
    var configureNewsView: some View {
        VStack {
            if getNewsPressed == false {
                EmitterView(images: ["confetti"], particleCount: 50, creationPoint: .init(x: 0.5, y: -0.1), creationRange: CGSize(width: 1, height: 0), colors: [.red, .yellow, .blue, .green, .white, .orange, .purple], angle: Angle(degrees: 180), angleRange: Angle(radians: .pi / 4), rotationRange: Angle(radians: .pi * 2), rotationSpeed: Angle(radians: .pi), scale: 0.6, speed: 1200, speedRange: 800, animation: Animation.linear(duration: 5).repeatForever(autoreverses: false), animationDelayThreshold: 5)
            } else {
                List {
                    ForEach(newsVM.articles) { article in
                        ArticleView(article: article)
                    }
                }
                .animation(.easeIn)
            }
        }
    }
    
//    private func fetchArticles() {
//        NewsController.shared.fetchArticles { (result) in
//            switch result {
//            case .success(let newsArticles):
//                DispatchQueue.main.async {
//                    articles = newsArticles
//                }
//            case .failure(let error):
//                displayError(error, title: "Failed to fetch news")
//            }
//        }
//    }
//
//    private func displayError(_ error: Error, title: String) {
//        DispatchQueue.main.async {
//            let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
//
//            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
//        }
//    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
