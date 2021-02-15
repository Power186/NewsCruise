//
//  ArticleView.swift
//  NewsApp
//
//  Created by Scott on 2/7/21.
//

import SwiftUI
import SafariServices

struct ArticleView: View {
    @ObservedObject var newsVM = NewsViewModel()
    private let article: Article
//    @State private var image: Image?
    @State private var isSafariShowing = false
    
    init(article: Article) {
        self.article = article
    }
    
    var body: some View {
        Button(action: {
            isSafariShowing.toggle()
            safariButtonTapped()
        }) {
            HStack {
                configureImageView
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(article.author ?? "No author")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    Text(article.title ?? "No title")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.primary)
                        .lineLimit(2)
                }
                .padding(.leading, 8)
                .padding(.trailing, 8)
                .onAppear(perform: {
                    newsVM.fetchImage(with: article)
                })
            }
        }
    }
    
    var configureImageView: some View {
        ZStack {
            newsVM.image
                .resizable()
                .frame(width: 70, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .green, radius: 2)
            
//            if image == nil {
//                Image(systemName: "photo")
//                    .resizable()
//                    .frame(width: 70, height: 60)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//            }
        }
    }
    
    private func safariButtonTapped() {
        if let articleUrl = article.url {
            let safariVC = SFSafariViewController(url: articleUrl)
            
            UIApplication.shared.windows.first?.rootViewController?.present(safariVC, animated: true, completion: nil)
        }
    }
    
//    private func fetchImage() {
//        guard let imageUrl = article.urlToImage else { return }
//        NewsController.shared.fetchImage(from: imageUrl) { (result) in
//            switch result {
//            case .success(let uiImage):
//                DispatchQueue.main.async {
//                    image = Image(uiImage: uiImage)
//                }
//            case .failure(let error):
//                displayError(error, title: "Failed to fetch image")
//            }
//        }
//    }
    
//    private func displayError(_ error: Error, title: String) {
//        DispatchQueue.main.async {
//            let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
//
//            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
//        }
//    }
    
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article(author: "New York Times", title: "A whole bunch of stuff happening in the world today", articleDescription: "no description", url: nil, urlToImage: nil))
    }
}
