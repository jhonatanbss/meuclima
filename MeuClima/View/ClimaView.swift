//
//  ClimaView.swift
//  MeuClima
//
//  Created by Jhonatan Bruno Santos Silva on 14/06/22.
//

import SwiftUI

struct ClimaView: View {
    var clima: CorpoResposta

    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                //VStack da Cidade e Data
                VStack(alignment: .leading, spacing: 5){
                    Text(clima.name)
                        .bold().font(.title)
                    Text("Hoje,\(Date().formatted(.dateTime.day().month().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                //VStack para o Graus
                VStack{
                    HStack{
                        
                        VStack(spacing: 20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(clima.weather[0].main)
                    }
                    .frame(width: 150, alignment:.leading)
                        
                    Spacer()
                    
                    Text(clima.main.temp
                        .roundDouble() + "°")
                    .font(.system(size: 100))
                    .fontWeight(.bold)
                    .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url:  URL(string: "https://cdn.pixabay.com/photo/2016/11/20/08/34/buildings-1842205_1280.jpg")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                            .cornerRadius(800, corners: [.allCorners])
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Clima agora")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min", value: (clima.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max", value: (clima.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Vento", value: (clima.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Umidade", value: (clima.main.humidity.roundDouble() + "%"))
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ClimaView_Previews: PreviewProvider {
    static var previews: some View {
        ClimaView(clima: previaClima)
    }
}
