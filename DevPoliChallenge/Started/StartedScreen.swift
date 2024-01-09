//
//  StartedScreen.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 09/01/24.
//  Copyright © 2024 DevPoli. All rights reserved.
//

import UIKit

protocol StartedScreenProtocol {
    func actionEnableButton()
}

class StartedScreen: UIView {
    
    var delegate: StartedScreenProtocol?
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "map-pin")
        return imageView
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Precisamos saber \nsua localização"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 31)
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Para um melhor aproveitamento do seu aplicativo, é importante compartilhar a sua localização. \n\nDessa forma conseguimos utilizar com maior precisão para calcular a distância do último ponto"
        label.textColor = UIColor(red: 138/255, green: 138/255, blue: 138/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var enableLocationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ATIVAR LOCALIZAÇÃO", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 215/255, green: 245/255, blue: 193/255, alpha: 1.0)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(tappedEnableButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedEnableButton() {
        delegate?.actionEnableButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(backgroundImage)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(enableLocationButton)
        backgroungColor()
        setUpConstraints()
    }
    
    private func backgroungColor() {
        backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 61),
            backgroundImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -7.32),
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 183),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 42),
            subTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22),
            subTitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22),

            enableLocationButton.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 200),
            enableLocationButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 48),
            enableLocationButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -48),
            enableLocationButton.heightAnchor.constraint(equalToConstant: 53),
        ])
    }
}
