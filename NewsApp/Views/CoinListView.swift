//
//  CoinListView.swift
//  NewsApp
//
//  Created by Scott on 2/8/21.
//

import SwiftUI

struct CoinListView: View {
    @ObservedObject private var viewModel = CoinListViewModel()
    @State private var getCryptoPressed = false
    
    var body: some View {
        NavigationView {
            VStack {
                configureCryptoView
            }
            .navigationBarTitle("Crypto")
            .navigationBarItems(trailing: Button(action: {
                getCryptoPressed.toggle()
                viewModel.fetchCoins()
            }) {
                configureCryptoButtonText
            })
            
        }
    }
    
    var configureCryptoView: some View {
        VStack {
            if getCryptoPressed == false {
                EmitterView(images: ["dollar"], particleCount: 50, creationPoint: .init(x: 0.5, y: -0.1), creationRange: CGSize(width: 1, height: 0), colors: [.green], angle: Angle(degrees: 180), angleRange: Angle(radians: .pi / 4), rotationRange: Angle(radians: .pi * 2), rotationSpeed: Angle(radians: .pi), scale: 0.6, speed: 1200, speedRange: 800, animation: Animation.linear(duration: 5).repeatForever(autoreverses: false), animationDelayThreshold: 5)
            } else {
                List {
                    ForEach(viewModel.coinViewModels, id: \.self) { coinViewModel in
                        VStack(alignment: .leading) {
                            HStack(spacing: 8) {
                                Text(coinViewModel.symbol)
                                    .foregroundColor(.red)
                                Text(coinViewModel.name)
                                Spacer()
                                Text(coinViewModel.price)
                                    .foregroundColor(.green)
                                    .bold()
                            }
                            .font(.headline)

                            HStack(spacing: 8) {
                                Image(systemName: "arrow.up.arrow.down")
                                    .imageScale(.small)
                                Text("\(coinViewModel.change)%")
                                    .font(.subheadline)
                                Spacer()
                                if coinViewModel.websiteUrl != nil {
                                    Link(destination: URL(string: "\(coinViewModel.websiteUrl ?? "")")!) {
                                        Image(systemName: "link.circle.fill")
                                            .foregroundColor(.secondary)
                                            .imageScale(.medium)
                                    }
                                } else {
                                    Text("")
                                }
                            }
                            
                        }
                    }
                }
                .animation(.easeIn)
            }
            
        }
    }
    
    var configureCryptoButtonText: some View {
        Group {
            if getCryptoPressed == false {
                Text("Get Crypto")
            } else {
                Text("Refresh Crypto")
            }
        }
    }
    
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}


