//
//  ResultViewController.swift
//  BMI
//
//  Created by Sergey Zakurakin on 08/06/2024.
//

import UIKit


class ResultViewController: UIViewController {
    
    // MARK: - UI
        private lazy var backgroundImageView: UIImageView = {
            let element = UIImageView()
            
            element.image = UIImage(named: "result_background")
            
            element.translatesAutoresizingMaskIntoConstraints = false
            return element
        }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        
        element.font = .systemFont(ofSize: 35, weight: .bold)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var resultLabel: UILabel = {
        let element = UILabel()
        
        element.font = .systemFont(ofSize: 80, weight: .bold)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let element = UILabel()
        
        element.font = .systemFont(ofSize: 20, weight: .light)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var mainStackView = UIStackView()
    
    private let recalculateButton = UIButton(isBackgroundWhite: true)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
    }
    
    
    // Setup Views
    private func setupViews() {
        
        mainStackView = UIStackView (
            axis: .vertical,
            distribution: .fillProportionally,
            subViews: [
                titleLabel,
                resultLabel,
                descriptionLabel
            ]
        )
        
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        view.addSubview(recalculateButton)
        
        titleLabel.text = "YOUR RESULT"
        resultLabel.text = "19.5"
        descriptionLabel.text = "EAT SOME MORE SNACKS!"
        
        view.backgroundColor = .blue
        
        recalculateButton.addTarget(self, action: #selector(recalculateButtonPressed), for: .touchUpInside)
    }
    
    @objc func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

// MARK: - Setup Views and Constrains
extension ResultViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            recalculateButton.heightAnchor.constraint(equalToConstant: 51),
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            recalculateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
