//
//  weatherButton.swift
//  weatherApp
//
//  Created by Miguel Angel Bohorquez on 24/04/25.
//

import SwiftUI

struct weatherButton: View {
    var text: String
    var bkgColor: Color
    var colorText: Color
    
    var body: some View {
        Text(text)
            .frame(width: 280,height: 50)
            .fontWeight(.bold)
            .foregroundStyle(colorText)
            .background(bkgColor)
            .clipShape(.capsule)
    }
}

