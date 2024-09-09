//
//  MatchCardView.swift
//  csgoMatch
//
//  Created by Eduardo Leite on 24/08/24.
//

import SwiftUI

struct CardView: View {
    
    var post: Post
    var cardWidth: CGFloat
    
    init(post: Post, cardWidth: CGFloat) {
        self.post = post
        self.cardWidth = cardWidth
    }
    
    var body: some View {
        VStack {
            Text(post.title ?? "")
                .font(Font.custom(Constants.robotoFont, size: 18))
                .foregroundColor(.white)
                .padding(.top, 5)
            Divider()
                .background(.white)
            Spacer()
            Text(post.text ?? "")
                .font(Font.custom(Constants.robotoFont, size: 16))
                .foregroundColor(.white)
                .padding(5)
            Spacer()
        }
        .frame(width: self.cardWidth, height: 176)
        .background(Constants.CardListConstants.messageColor)
        .foregroundColor(.white)
        .cornerRadius(15)
    }
}
