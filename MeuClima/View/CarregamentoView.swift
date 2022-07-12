//
//  CarregamentoView.swift
//  MeuClima
//
//  Created by Jhonatan Bruno Santos Silva on 14/06/22.
//

import SwiftUI

struct CarregamentoView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CarregamentoView_Previews: PreviewProvider {
    static var previews: some View {
        CarregamentoView()
    }
}
