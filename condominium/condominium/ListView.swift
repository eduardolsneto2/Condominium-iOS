//
//  MatchListView.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var viewModel = ListViewModel()
    @State private var singleSelection: UUID?
    
    var body: some View {
        NavigationStack {
            VStack {
                if !self.viewModel.posts.isEmpty {
                    List(selection: $singleSelection) {
                        sectionView
                    }
                    .padding(0)
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                } else {
                    VStack(alignment: .center) {
                        Spacer()
                        ProgressView()
                            .foregroundColor(.white)
                            .controlSize(.large)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .padding(0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Constants.ListConstants.backgroundColor)
            .navigationTitle(Constants.ListConstants.navigationTitle)
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Constants.ListConstants.backgroundColor,
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear {
                self.viewModel.getLogin()
            }
        }
        .tint(.white)
    }
    
    var sectionView: some View {
        Section(header: Text("Comunicados").foregroundColor(.white)) {
            ForEach(self.viewModel.posts) { post in
                GeometryReader { proxy in
                    CardView(post: post, cardWidth: proxy.size.width)
                    .padding(0)
                }
                .frame(height: 176)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
        }
    }
}
