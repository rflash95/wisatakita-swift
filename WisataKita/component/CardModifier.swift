//
//  CardModifier.swift
//  WisataKita
//
//  Created by rzamau on 29/08/22.
//

import Foundation
import SwiftUI


struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}
