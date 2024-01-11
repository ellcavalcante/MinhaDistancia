//
//  StartedViewController.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 09/01/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import UIKit
import CoreLocation

class StartedViewController: UIViewController {
    
    var screen: StartedScreen?

    private let manager = CLLocationManager()
    
    override func loadView() {
        screen = StartedScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        setupLocationManager()
    }

    private func setupLocationManager() {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }

    private func requestLocationAuthorization() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
}

extension StartedViewController: StartedScreenProtocol {
    func actionEnableButton() {
        requestLocationAuthorization()
        print(#function)
    }
}

extension StartedViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        switch status {
        case .notDetermined:
            print("notDetermined")
            manager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        @unknown default:
            print("nothing")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        print("New location: \(location?.coordinate.latitude ?? 0), \(location?.coordinate.longitude ?? 0)")
    }
}


