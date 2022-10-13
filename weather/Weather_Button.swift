//
//  File.swift
//  weather
//
//  Created by Brandon Johns on 10/11/22.
//

import Foundation
import SwiftUI
struct Weather_Button: View
{
    var title: String
    var text_Color: Color
    var background_Color: Color
    var body: some View
    {
        Text(title)
            .frame(width: 280, height: 50)
            .background(background_Color)
            .foregroundColor(text_Color)
            .font(.system(size:20, weight: .bold, design: .default))
            .cornerRadius(10.0)
    }
}
