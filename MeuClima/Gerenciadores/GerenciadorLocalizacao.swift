//
//  GerenciadorLocalizacao.swift
//  MeuClima
//
//  Created by Jhonatan Bruno Santos Silva on 14/06/22.
//

import Foundation
import CoreLocation     //estrutura (framework)da Apple para obter a localizacao do usuario

// Classe:
class GerenciadorLocalizacao: NSObject, ObservableObject, CLLocationManagerDelegate { // protocolos da classe para gerenciar a localizacao
    let gerenciador = CLLocationManager()   // criar gerenciador com a instancia do CLLocationManager(instancia tem que estar em parenteses)
    
    @Published var localizacao: CLLocationCoordinate2D? //variavel localizacao que ser[a opcinal(?) pois o usuasrio pode recusar a solicitacao
    @Published var estaCarregando = false   //estado do carregamento
    
    
    // Funcoes para esta classe:

    override init() {     //funcao de inicializaco da classe
        super.init()
        gerenciador.delegate = self
    }
    
    func requestLocation() {
        estaCarregando = true
        gerenciador.requestLocation()
    }
    
    //funcoes para o CLLocationManagerDelegate funcionar
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        localizacao = locations.first?.coordinate
        estaCarregando = false
    }
    
    //funcao para lidar com os erros
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print ("Erro ao buscar localizacao", error)
        estaCarregando = false
    }

}
