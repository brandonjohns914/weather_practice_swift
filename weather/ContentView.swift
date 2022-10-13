//
//  ContentView.swift
//  weather
//
//  Created by Brandon Johns on 10/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var is_Night = false;
    
    var body: some View {
        ZStack {
            Background_View(topColor: is_Night ? .black: .blue, bottomColor: is_Night ? .blue: .gray)
            VStack
            {
                City_Text_View(city_Name: "Brentwood, CA")
                
                Weather_Status_View(image_Name: is_Night ? "moon.stars.fill": "cloud.sun.fill", tempature: 76)
                
                HStack(spacing:25 ){
                    Weather_Day_View(day_of_week: "Tue", image_name: "cloud.sun.fill", tempature: 76)
                    Weather_Day_View(day_of_week: "Wed", image_name: "sun.max.fill", tempature: 80)
                    Weather_Day_View(day_of_week: "Thur", image_name: "wind", tempature: 65)
                    Weather_Day_View(day_of_week: "Fri", image_name: "sunset.fill", tempature: 55)
                    Weather_Day_View(day_of_week: "Sat", image_name: "sun.haze.fill", tempature: 76)
                }
                
                Spacer()
                
                Button{
                    is_Night.toggle()
                } label:
                {
                    Weather_Button(title: "Change Day Time", text_Color: .blue, background_Color: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Weather_Day_View: View {
    var day_of_week: String
    var image_name: String
    var tempature: Int
    var body: some View {
        VStack{
            Text(day_of_week)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: image_name)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            
            Text("\(tempature)°").font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct Background_View: View {
    
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}


struct City_Text_View: View
{
    var city_Name: String
    var body: some View
    {
        Text(city_Name)
            .font(.system(size:32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct Weather_Status_View: View
{
    var image_Name: String
    var tempature: Int
    var body: some View
    {
        VStack(spacing: 8)
        {
            Image(systemName: image_Name)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            
            Text("\(tempature)°").font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 35)
    }
}

