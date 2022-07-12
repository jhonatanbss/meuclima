//
//  BemVindo.swift
//  MeuClima
//
//  Created by Jhonatan Bruno Santos Silva on 14/06/22.
//

import SwiftUI

struct BemVindo: View {
    @EnvironmentObject var gerenciadorLocalizacao: GerenciadorLocalizacao
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BemVindo_Previews: PreviewProvider {
    static var previews: some View {
        BemVindo()
    }
}
