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
    func actionCircleXButton()
    func actionRestartButton()
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
    
    lazy var circleButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "x-circle"), for: .normal)
        btn.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(tappedActionCircleX), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    
    @objc func tappedActionCircleX() {
        delegate?.actionCircleXButton()
    }
    
    public lazy var backgroundView1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 7.5
        view.isHidden = true
        return view
    }()
    
    public lazy var backgroundView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 7.5
        view.isHidden = true
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
    
    public lazy var titleBackgroungLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ponto B"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    public lazy var subTitleBackgroungLabel2: UILabel = {
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
    
    
    public lazy var latLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "lat: "
        label.textColor = UIColor(red: 171/255, green: 177/255, blue: 172/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 22)
        label.isHidden = true
        return label
    }()
    
    public lazy var longLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "long: "
        label.textColor = UIColor(red: 171/255, green: 177/255, blue: 172/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 22)
        label.isHidden = true
        return label
    }()
    
    public lazy var latitudeLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "-12.12391231"
        label.textColor = UIColor(red: 171/255, green: 177/255, blue: 172/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.isHidden = true
        return label
    }()
    
    public lazy var longitudeLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "-12.12391231"
        label.textColor = UIColor(red: 171/255, green: 177/255, blue: 172/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.isHidden = true
        return label
    }()
    
    public lazy var distanceTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Distância"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.isHidden = true
        return label
    }()
    
    public lazy var distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10 Km"
        label.textColor = UIColor(red: 97/255, green: 168/255, blue: 45/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 22)
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
    
    lazy var locationStackView: UIStackView = {
        let stackV = UIStackView()
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.axis = .vertical
        stackV.alignment = .fill
        stackV.spacing = 8
        return stackV
    }()

    public lazy var locationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    public lazy var saveButton: UIButton = {
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
    
    public lazy var restartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("REINICIAR", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(UIColor(red: 97/255, green: 168/255, blue: 45/255, alpha: 1.0), for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.layer.borderColor = UIColor(red: 215/255, green: 245/255, blue: 193/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1.5
        button.addTarget(self, action: #selector(tappedRestartButton), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    @objc func tappedRestartButton(){
        delegate?.actionRestartButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(titleLabel)
        addSubview(locationStackView)

        backgroundView.addSubview(titleBackgroungLabel)
        backgroundView.addSubview(subTitleBackgroungLabel)
        backgroundView.addSubview(latLabel)
        backgroundView.addSubview(longLabel)
        backgroundView.addSubview(latitudeLabel)
        backgroundView.addSubview(longitudeLabel)
        backgroundView.addSubview(circleButton)
        
        backgroundView1.addSubview(titleBackgroungLabel2)
        backgroundView1.addSubview(subTitleBackgroungLabel2)
        backgroundView1.addSubview(latLabel2)
        backgroundView1.addSubview(longLabel2)
        backgroundView1.addSubview(latitudeLabel2)
        backgroundView1.addSubview(longitudeLabel2)
        
        backgroundView2.addSubview(distanceTitleLabel)
        backgroundView2.addSubview(distanceLabel)
        
        addSubview(saveButton)
        addSubview(restartButton)
        backgroungColor()
        setUpConstraints()
    }
    
    private func configureStackView() {
        locationStackView.addArrangedSubview(backgroundView)
        locationStackView.addArrangedSubview(backgroundView1)
        locationStackView.addArrangedSubview(backgroundView2)
    }
    
    private func backgroungColor() {
        backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 26),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            locationStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 81),
            locationStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22),
            locationStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22),
            locationStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 88),
            
            backgroundView.heightAnchor.constraint(equalToConstant: 122),
            backgroundView1.heightAnchor.constraint(equalToConstant: 122),
            backgroundView2.heightAnchor.constraint(equalToConstant: 88),
            
            titleBackgroungLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 16),
            titleBackgroungLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            
            subTitleBackgroungLabel.topAnchor.constraint(equalTo: titleBackgroungLabel.bottomAnchor, constant: 8),
            subTitleBackgroungLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),

            latLabel.topAnchor.constraint(equalTo: titleBackgroungLabel.bottomAnchor, constant: 8),
            latLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 92),
            
            longLabel.topAnchor.constraint(equalTo: latLabel.bottomAnchor, constant: 2),
            longLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 75),
            
            latitudeLabel.topAnchor.constraint(equalTo: titleBackgroungLabel.bottomAnchor, constant: 8),
            latitudeLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -80),
            
            longitudeLabel.topAnchor.constraint(equalTo: titleBackgroungLabel.bottomAnchor, constant: 38),
            longitudeLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -80),
            
            titleBackgroungLabel2.topAnchor.constraint(equalTo: backgroundView1.topAnchor, constant: 16),
            titleBackgroungLabel2.centerXAnchor.constraint(equalTo: backgroundView1.centerXAnchor),
            
            subTitleBackgroungLabel2.topAnchor.constraint(equalTo: titleBackgroungLabel2.bottomAnchor, constant: 8),
            subTitleBackgroungLabel2.centerXAnchor.constraint(equalTo: backgroundView1.centerXAnchor),
            
            latLabel2.topAnchor.constraint(equalTo: titleBackgroungLabel2.bottomAnchor, constant: 8),
            latLabel2.leadingAnchor.constraint(equalTo: backgroundView1.leadingAnchor, constant: 92),
            
            longLabel2.topAnchor.constraint(equalTo: latLabel2.bottomAnchor, constant: 2),
            longLabel2.leadingAnchor.constraint(equalTo: backgroundView1.leadingAnchor, constant: 75),
            
            latitudeLabel2.topAnchor.constraint(equalTo: titleBackgroungLabel2.bottomAnchor, constant: 8),
            latitudeLabel2.trailingAnchor.constraint(equalTo: backgroundView1.trailingAnchor, constant: -80),
            
            longitudeLabel2.topAnchor.constraint(equalTo: titleBackgroungLabel2.bottomAnchor, constant: 38),
            longitudeLabel2.trailingAnchor.constraint(equalTo: backgroundView1.trailingAnchor, constant: -80),
            
            circleButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 16),
            circleButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16),
            
            distanceTitleLabel.topAnchor.constraint(equalTo: backgroundView2.topAnchor, constant: 16),
            distanceTitleLabel.centerXAnchor.constraint(equalTo: backgroundView2.centerXAnchor),
            
            distanceLabel.topAnchor.constraint(equalTo: distanceTitleLabel.bottomAnchor, constant: 8),
            distanceLabel.centerXAnchor.constraint(equalTo: backgroundView2.centerXAnchor),
            
            saveButton.topAnchor.constraint(equalTo: locationStackView.bottomAnchor, constant: 98),
            saveButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 48),
            saveButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -48),
            saveButton.heightAnchor.constraint(equalToConstant: 53),
            
            restartButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            restartButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 48),
            restartButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -48),
            restartButton.heightAnchor.constraint(equalToConstant: 53),
        ])
    }
}
