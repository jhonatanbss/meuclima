//
//  GerenciadorClima.swift
//  MeuClima
//
//  Created by Jhonatan Bruno Santos Silva on 14/06/22.
//

import Foundation
import CoreLocation //estrutura(framework) da Apple para obter a localizacao do usuario

class GerenciadorClima {
    //funcao assincrona com dois argumentos
    func obterClimaAtual(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> CorpoResposta {
        //variavel para guardar a chamada da URL
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("66b2c745a030b02c0ec82f643e76d7b7")&units=metric")
        else { fatalError("Flha na URL")}
        
        //solicitacao de URL
        let urlRequest = URLRequest(url: url)
        
        //tentar guardar a sessáo de URL
        let (dados, resposta) = try await URLSession.shared.data(for: urlRequest)
        
        guard (resposta as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Erro ao buscar clima")}
        
        //tratar dados Json para dados SwiftUI
        let dadosDecodificados = try JSONDecoder().decode(CorpoResposta.self, from: dados)
        
        return dadosDecodificados
    }
}

// Modelo do corpo de resposta quando chamamos o OpenWeather API
struct CorpoResposta: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension CorpoResposta.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
