//
//  Post.swift
//  condominium
//
//  Created by Eduardo Leite on 06/09/24.
//

import Foundation

struct Post: Hashable, Codable, Identifiable {
    let id = UUID()
    let type: String?
    let title: String?
    let text: String?
}
