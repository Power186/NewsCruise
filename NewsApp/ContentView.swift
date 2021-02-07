//
//  ContentView.swift
//  NewsApp
//
//  Created by Scott on 2/7/21.
//

import SwiftUI

struct NewsView: View {
    @State private var articles = [Article]()
    @State private var image: Image?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articles) { article in
                    ArticleView(article: article)
                }
            }
            .listStyle(SidebarListStyle())
            .navigationBarTitle("News")
            .navigationBarItems(trailing: Button(action: {
                fetchArticles()
            }) {
                Text("Get News")
            })

        }
    }
    
    private func fetchArticles() {
        NewsController.shared.fetchArticles { (result) in
            switch result {
            case .success(let newsArticles):
                DispatchQueue.main.async {
                    articles = newsArticles
                }
            case .failure(let error):
                displayError(error, title: "Failed to fetch news")
            }
        }
    }
    
    private func displayError(_ error: Error, title: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
