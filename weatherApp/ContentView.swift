//
//  ContentView.swift
//  weatherApp
//
//  Created by Miguel Angel Bohorquez on 24/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isDarkModeActive = false
    @State var cities: Array = ["Bogota", "Medellin", "Cartagena", "Cali", "Barranquilla"]
    
    
    var body: some View {
        ZStack{
            backgroundGrad(isDarkModeActive: isDarkModeActive)
            VStack{
                ScrollView(.horizontal, showsIndicators: true){
                    HStack (spacing: 100){
                        VStack{
                            ExtractedView(texto: cities[0])
                            actualWeatherView(imageName: isDarkModeActive ? "moon.fill" : "sun.dust.fill", degrees: 40)
                        }
                        VStack{
                            ExtractedView(texto: cities[1])
                            actualWeatherView(imageName: "sun.max.fill", degrees: 40)
                        }
                        VStack{
                            ExtractedView(texto: cities[2])
                            actualWeatherView(imageName: "cloud.heavyrain.fill", degrees: 12)
                        }
                        
                    }.padding()
                       
                }
                
               
        
                HStack(spacing: 30){
                        daysView(dayWeek: "TUE",
                                 imageName: isDarkModeActive ? "cloud.moon.bolt.fill" : "sun.dust.fill",
                                 degrees: 33)
                        daysView(dayWeek: "WED",
                                 imageName: "sun.max.fill",
                                 degrees: 40)
                        daysView(dayWeek: "THU",
                                 imageName: "cloud.heavyrain.fill",
                                 degrees: 12)
                        daysView(dayWeek: "FRI",
                                 imageName: "cloud.sun.rain.fill",
                                 degrees: 18)
                        daysView(dayWeek: "SAT",
                                 imageName: "cloud.moon.rain.fill",
                                 degrees: -4)
                            
                    
                }
                Spacer()
                Button{
                    isDarkModeActive.toggle()
                }label: {
                    weatherButton(text: "Change Day Time",
                                  bkgColor: isDarkModeActive ? .gray : .blue,
                                  colorText: .white)
                        
                }
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct daysView: View {
    var dayWeek: String
    var imageName: String
    var degrees: Int
    
    var body: some View {
        VStack{
            Text(dayWeek)
                .font(.system(size: 20))
                .foregroundStyle(.white)
                .fontWeight(.bold)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(degrees)°")
                .foregroundStyle(.white)
                .fontWeight(.bold)
        }
    }
}

struct backgroundGrad: View {
    var isDarkModeActive: Bool
    
    var body: some View {
//        LinearGradient(colors: [isDarkModeActive ? .black : .blue, isDarkModeActive ? .gray : .white], startPoint: .topLeading, endPoint: .bottomTrailing)
//            .ignoresSafeArea(edges: .all)
        ContainerRelativeShape()
            .fill(isDarkModeActive ? Color.gray.gradient : Color.blue.gradient)
            .ignoresSafeArea(edges: .all)
    }
}

struct actualWeatherView: View {
    var imageName: String
    var degrees: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(degrees)°")
                .font(.system(size: 70, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .padding(.bottom, 50)
        }
    }
}


struct ExtractedView: View {
    var texto: String
    
    var body: some View {
        Text(texto).font(.system(size: 32, weight: .bold, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}
