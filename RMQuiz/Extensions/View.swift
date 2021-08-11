//
//  View.swift
//  RMQuiz
//
//  Created by Tommy Alpert on 7/22/21.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}
