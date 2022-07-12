//
//  BemVindoView.swift
//  MeuClima
//
//  Created by Jhonatan Bruno Santos Silva on 14/06/22.
//

import SwiftUI
import CoreLocationUI // framework do botao de localizacao

struct BemVindoView: View {
    //Iniciar o GerenciadorLocalizacao
    @EnvironmentObject var gerenciadorLocalizacao: GerenciadorLocalizacao
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text ("Bem Vindo ao Meu Clima")
                    .bold()
                    .font(.title)
                
                Text ("Por favor compartilhe sua localizaçao para receber o clima local")
                    .padding()
                
            }
            .multilineTextAlignment(.center) //colocar texto no centro
            .padding()
            
                // Botao para buscar localizacao:
            LocationButton(.shareCurrentLocation){
                //açao ao apertar o botao:
                gerenciadorLocalizacao.requestLocation()
            }
            .cornerRadius(30) //arredondar botao
            .symbolVariant(.fill) //simbolo preenchido
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) //toda a tela o VStack
    }
}

struct BemVindoView_Previews: PreviewProvider {
    static var previews: some View {
        BemVindoView()
    }
}
