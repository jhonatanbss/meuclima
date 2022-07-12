//
//  ContentView.swift
//  MeuClima
//
//  Created by Jhonatan Bruno Santos Silva on 14/06/22.
//

import SwiftUI

struct ContentView: View {
    //Iniciar o GerenciadorLocalizacao
    @StateObject var gerenciadorLocalizacao = GerenciadorLocalizacao()
    //iniciar instancia do GerenciadorCLima
    var gerenciadorClima = GerenciadorClima()
    
    @State var clima: CorpoResposta? // variavel clima do tipo CorpoResposta
    
    var body: some View {
        VStack {            // pegando a tela do BemVindoView
            
            if let localizacao = gerenciadorLocalizacao.localizacao{
                if let clima = clima {
                    ClimaView(clima: clima)
                } else {
                    CarregamentoView()
                        .task { //trabalho para esta tela
                            do {
                                clima = try await gerenciadorClima.obterClimaAtual(latitude: localizacao.latitude, longitude: localizacao.longitude)
                            } catch {
                                print("Erro ao buscar Clima: \(error)")
                            }
                            
                        }
                }
            } else {
                if gerenciadorLocalizacao.estaCarregando{
                    CarregamentoView()
                } else {
                    BemVindoView()
                        .environmentObject(gerenciadorLocalizacao)
                }
            }
            
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
