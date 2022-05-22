//
//  ContentView.swift
//  PrevisaoDoTempoSwiftUI
//
//  Created by Leandro Alves da Silva on 18/05/22.
//

import SwiftUI
 
struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BrackgroundView(isNight: $isNight)
            VStack {
                CityView(cityName: "Goiânia, GO")
                MainView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 34)
                
                HStack(spacing: 20) {
                    ParcialNubladoView(diaView: "Seg",
                                       imageName: "cloud.sun.fill",
                                       temperatura: 35)
                    
                    ParcialNubladoView(diaView: "Ter",
                                       imageName: "sun.max.fill",
                                       temperatura: 40)
                    
                    ParcialNubladoView(diaView: "Qua",
                                       imageName: "wind.snow",
                                       temperatura: -2)
                    
                    ParcialNubladoView(diaView: "Qui",
                                       imageName: "sunset.fill",
                                       temperatura: 10)
                    
                    ParcialNubladoView(diaView: "Sex",
                                       imageName: "snow",
                                       temperatura: -10)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    ButtonView(title: "Alterar Localizacão", textColor: .blue, brackgroundColor: .white)
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

struct ParcialNubladoView: View {
    var diaView, imageName: String
    var temperatura: Int
    
    var body: some View {
        VStack {
            Text(diaView)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperatura)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BrackgroundView: View {
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(gradient:
                        Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


