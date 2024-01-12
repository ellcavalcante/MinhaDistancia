//
//  HomeScreen.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 08/01/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import UIKit

protocol HomeScreenProtocol {
    func actionSavePointButton()
}

class HomeScreen: UIView {
    
    var delegate: HomeScreenProtocol?
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Calcule a distância"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    public lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 7.5
        return view
    }()
    
    public lazy var titleBackgroungLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ponto A"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    public lazy var subTitleBackgroungLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "aguardando posição"
        label.textColor = UIColor(red: 97/255, green: 168/255, blue: 45/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    public lazy var latLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "lat: "
        label.textColor = UIColor(red: 171/255, green: 177/255, blue: 172/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 22)
        label.isHidden = true
        return label
    }()
    
    public lazy var longLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "long: "
        label.textColor = UIColor(red: 171/255, green: 177/255, blue: 172/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 22)
        label.isHidden = true
        return label
    }()
    
    public lazy var latitudeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "-12.12391231"
        label.textColor = UIColor(red: 171/255, green: 177/255, blue: 172/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.isHidden = true
        return label
    }()
    
    public lazy var longitudeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "-12.12391231"
        label.textColor = UIColor(red: 171/255, green: 177/255, blue: 172/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.isHidden = true
        return label
    }()
    
    lazy var circleXImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "x-circle")
        img.isHidden = true
        return img
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SALVAR PONTO", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 215/255, green: 245/255, blue: 193/255, alpha: 1.0)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(tappedSavePointButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedSavePointButton(){
        delegate?.actionSavePointButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(titleLabel)
        addSubview(backgroundView)
        backgroundView.addSubview(titleBackgroungLabel)
        backgroundView.addSubview(subTitleBackgroungLabel)
        backgroundView.addSubview(latLabel)
        backgroundView.addSubview(longLabel)
        backgroundView.addSubview(latitudeLabel)
        backgroundView.addSubview(longitudeLabel)
        backgroundView.addSubview(circleXImage)
        addSubview(saveButton)
        backgroungColor()
        setUpConstraints()
    }
    
    private func backgroungColor() {
        backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 26),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            backgroundView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 81),
            backgroundView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22),
            backgroundView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22),
            backgroundView.widthAnchor.constraint(equalToConstant: 346),
            backgroundView.heightAnchor.constraint(equalToConstant: 122),
            
            titleBackgroungLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 16),
            titleBackgroungLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            subTitleBackgroungLabel.topAnchor.constraint(equalTo: titleBackgroungLabel.bottomAnchor, constant: 8),
            subTitleBackgroungLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            latLabel.topAnchor.constraint(equalTo: titleBackgroungLabel.bottomAnchor, constant: 8),
            latLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 92),
            
            longLabel.topAnchor.constraint(equalTo: latLabel.bottomAnchor, constant: 2),
            longLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 75),
            
            latitudeLabel.topAnchor.constraint(equalTo: titleBackgroungLabel.bottomAnchor, constant: 8),
            latitudeLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -80),
            
            longitudeLabel.topAnchor.constraint(equalTo: titleBackgroungLabel.bottomAnchor, constant: 38),
            longitudeLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -80),
            
            circleXImage.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 16),
            circleXImage.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16),
            
            saveButton.topAnchor.constraint(equalTo: subTitleBackgroungLabel.bottomAnchor, constant: 228),
            saveButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 48),
            saveButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -48),
            saveButton.heightAnchor.constraint(equalToConstant: 53),
        ])
    }
}
