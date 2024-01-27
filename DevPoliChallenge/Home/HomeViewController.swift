//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    private let manager = CLLocationManager()
    private var latestLocation: CLLocation?
    var backlat1: Double = 0
    var backlong1: Double = 0
    var backlat2: Double = 0
    var backlong2: Double = 0
    var distanciaEmKm: Double = 0
    var toqueNoBotao = 1
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        setupLocationManager()
        requestLocationAuthorization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupLocationManager() {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    private func requestLocationAuthorization() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func getLatestLocation() -> CLLocation? {
        return latestLocation
    }
}

extension HomeViewController: HomeScreenProtocol {
    func actionRestartButton() {
        screen?.restartButton.isHidden = true
        screen?.saveButton.isHidden = false
        screen?.backgroundView1.isHidden = true
        screen?.latLabel.isHidden = true
        screen?.longLabel.isHidden = true
        screen?.latitudeLabel.isHidden = true
        screen?.longitudeLabel.isHidden = true
        screen?.backgroundView2.isHidden = true
        screen?.latLabel2.isHidden = true
        screen?.longLabel2.isHidden = true
        screen?.latitudeLabel2.isHidden = true
        screen?.longitudeLabel2.isHidden = true
        screen?.subTitleBackgroungLabel.isHidden = false
        screen?.subTitleBackgroungLabel.text = "aguardando posição"
        screen?.subTitleBackgroungLabel2.isHidden = false
        screen?.subTitleBackgroungLabel.textColor = UIColor(red: 97/255, green: 168/255, blue: 45/255, alpha: 1.0)
        toqueNoBotao = 1
    }
    
    func actionCircleXButton() {
        screen?.backgroundView.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        screen?.backgroundView1.isHidden = true
        screen?.circleButton.isHidden = true
        screen?.subTitleBackgroungLabel.isHidden = false
        screen?.latLabel.isHidden = true
        screen?.longLabel.isHidden = true
        screen?.latitudeLabel.isHidden = true
        screen?.longitudeLabel.isHidden = true
        screen?.saveButton.isHidden = false
        screen?.restartButton.isHidden = true
        toqueNoBotao = 1
    }
    
    func actionSavePointButton() {
        
        switch toqueNoBotao {
        case 1:
            print("primeiro toque no botão")
            calculateLatLong()
            calculateLatLong2()
            toqueNoBotao = 2
        case 2:
            print("segundo toque no botão")
            calculateLatLong3()
            screen?.subTitleBackgroungLabel2.isHidden = true
            screen?.backgroundView1.backgroundColor = UIColor(red: 241/255, green: 255/255, blue: 231/255, alpha: 1.0)
            screen?.latLabel2.isHidden = false
            screen?.longLabel2.isHidden = false
            screen?.latitudeLabel2.isHidden = false
            screen?.longitudeLabel2.isHidden = false
            screen?.backgroundView2.isHidden = false
            screen?.distanceTitleLabel.isHidden = false
            screen?.distanceLabel.isHidden = false
            screen?.restartButton.isHidden = false
            screen?.saveButton.isHidden = true
            screen?.circleButton.isHidden = true
            screen?.latitudeLabel2.text = "\(latestLocation?.coordinate.latitude ?? 00)"
            screen?.longitudeLabel2.text = "\(latestLocation?.coordinate.longitude ?? 00)"
            backlat2 = latestLocation?.coordinate.latitude ?? 00
            backlong2 = latestLocation?.coordinate.longitude ?? 00
            calculateDistanceKm()
            let formattedDistance = String(format: "%.3f", distanciaEmKm)
            screen?.distanceLabel.text = "\(formattedDistance) Km"
        default:
            print("estou aqui")
        }
    }
}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        latestLocation = locations.last
        print("New location: \(latestLocation?.coordinate.latitude ?? 0), \(latestLocation?.coordinate.longitude ?? 0)")
    }
}

extension HomeViewController {
    
    private func calculateLatLong() {
        screen?.backgroundView.backgroundColor = UIColor(red: 241/255, green: 255/255, blue: 231/255, alpha: 1.0)
        screen?.subTitleBackgroungLabel.isHidden = true
        screen?.latLabel.isHidden = false
        screen?.longLabel.isHidden = false
        screen?.latitudeLabel.isHidden = false
        screen?.latitudeLabel.text = "\(latestLocation?.coordinate.latitude ?? 00)"
        screen?.longitudeLabel.isHidden = false
        screen?.longitudeLabel.text = "\(latestLocation?.coordinate.longitude ?? 00)"
        screen?.circleXImage.isHidden = false
        screen?.circleButton.isHidden = false
        backlat1 = latestLocation?.coordinate.latitude ?? 00
        backlong1 = latestLocation?.coordinate.longitude ?? 00
    }
    
    private func calculateLatLong2() {
        screen?.backgroundView1.isHidden = false
        screen?.backgroundView1.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
    }
    
    private func calculateLatLong3() {
        screen?.backgroundView2.isHidden = true
    }
    
    func calculateDistanceKm() {
        
        // Defina as coordenadas dos pontos A e B
        let coordenadasA = CLLocationCoordinate2D(latitude: backlat1, longitude: backlong1) // Substitua com as coordenadas reais de A
        let coordenadasB = CLLocationCoordinate2D(latitude: backlat2, longitude: backlong2) // Substitua com as coordenadas reais de B
        
        // Função para calcular a distância entre dois pontos em quilômetros
        func calcularDistanciaEntrePontos(coordenadasA: CLLocationCoordinate2D, coordenadasB: CLLocationCoordinate2D) -> CLLocationDistance {
            let localizacaoA = CLLocation(latitude: coordenadasA.latitude, longitude: coordenadasA.longitude)
            let localizacaoB = CLLocation(latitude: coordenadasB.latitude, longitude: coordenadasB.longitude)
            
            return localizacaoA.distance(from: localizacaoB) / 1000 // A distância é convertida para quilômetros
        }
        
        // Chame a função para obter a distância entre os pontos A e B
        distanciaEmKm = calcularDistanciaEntrePontos(coordenadasA: coordenadasA, coordenadasB: coordenadasB)
        
        // Imprima a distância calculada
        print("A distância entre os pontos A e B é de \(distanciaEmKm) quilômetros.")
    }
}




