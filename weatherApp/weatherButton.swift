//
//  weatherButton.swift
//  weatherApp
//
//  Created by Miguel Angel Bohorquez on 24/04/25.
//

import SwiftUI

struct weatherButton: View {
    @State private var isDarkModeActive: Bool = false
    var text: String
    var bkgColor: Color
    var colorText: Color
    
    var body: some View {
        Text(text)
            .frame(width: 280,height: 50)
            .fontWeight(.bold)
            .foregroundStyle(colorText)
            .background(bkgColor.gradient)
            .clipShape(.capsule)
    }
}

struct weatherButton_Previews: PreviewProvider {
    static var previews: some View {
        weatherButton(text: "Preview", bkgColor: .blue, colorText: .white)
    }
}
