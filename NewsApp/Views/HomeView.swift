//
//  HomeView.swift
//  NewsApp
//
//  Created by Scott on 2/8/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView  {
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                        .imageScale(.medium)
                    Text("News")
                        .font(.title)
                }
                .tag(1)
            CoinListView()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                        .imageScale(.medium)
                    Text("Crypto")
                        .font(.title)
                }
                .tag(2)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
