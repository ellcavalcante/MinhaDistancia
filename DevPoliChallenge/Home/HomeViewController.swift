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
    func actionSavePointButton() {
        print(#function)
        screen?.backgroundView.backgroundColor = UIColor(red: 241/255, green: 255/255, blue: 231/255, alpha: 1.0)
        screen?.subTitleBackgroungLabel.isHidden = true
        screen?.latLabel.isHidden = false
        screen?.longLabel.isHidden = false
        screen?.latitudeLabel.isHidden = false
        screen?.latitudeLabel.text = "\(latestLocation?.coordinate.latitude ?? 00)"
        screen?.longitudeLabel.isHidden = false
        screen?.longitudeLabel.text = "\(latestLocation?.coordinate.longitude ?? 00)"
        screen?.circleXImage.isHidden = false
    }
}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        latestLocation = locations.last
        print("New location: \(latestLocation?.coordinate.latitude ?? 0), \(latestLocation?.coordinate.longitude ?? 0)")
    }
}



