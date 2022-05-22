//
//  WeatherButton.swift
//  PrevisaoDoTempoSwiftUI
//
//  Created by Leandro Alves da Silva on 19/05/22.
//

import SwiftUI

struct ButtonView: View {
    var title: String
    var textColor, brackgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(brackgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
