//
//  ViewController.swift
//  BMI
//
//  Created by Sergey Zakurakin on 07/06/2024.
//

import UIKit

class MainViewController: UIViewController {

// MARK: - UI
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        
        element.image = UIImage(named: "calculate_background")
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var mainStackView = UIStackView()
    
    private var heightStackView = UIStackView()
    private var heightTitleLabel = UILabel(alignment: .left)
    private var heightNumberLabel = UILabel(alignment: .right)
    private let heightSlider = UISlider(maxValue: 3)
    
    private var weightStackView = UIStackView()
    private var weightTitleLabel = UILabel(alignment: .left)
    private var weightNumberLabel = UILabel(alignment: .right)
    private let weightSlider = UISlider(maxValue: 300)
//
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        
        element.font = .systemFont(ofSize: 40, weight: .bold)
        element.textColor = .darkGray
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var calculateButton: UIButton = {
        let element = UIButton(type: .system)
        
        element.tintColor = .white
        element.backgroundColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 1)
        element.layer.cornerRadius = 10
        element.titleLabel?.font = .systemFont(ofSize: 20)
        element.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    
    private func setupViews() {
        
        heightStackView = UIStackView(
            axis: .horizontal,
            distribution: .fillEqually,
            subViews: [heightTitleLabel, heightNumberLabel]
        )
        
        weightStackView = UIStackView(
            axis: .horizontal,
            distribution: .fillEqually,
            subViews: [weightTitleLabel, weightNumberLabel]
        )
        
        mainStackView = UIStackView (
            axis: .vertical,
            distribution: .fillProportionally,
            subViews: [
                titleLabel,
                heightStackView,
                heightSlider,
                weightStackView,
                weightSlider,
                calculateButton
            ]
        )
        
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        
        titleLabel.text = "CALCULATE YOUR BMI"
        
        heightTitleLabel.text = "Height"
        heightNumberLabel.text = "1.5 m"
        
        weightTitleLabel.text = "Weight"
        weightNumberLabel.text = "100 kg"
        
        calculateButton.setTitle("CALCULATE", for: .normal)
    }
    
    @objc private func calculateButtonPressed(_ sender: UIButton){
        print("tap-tap")
    }
}

// MARK: - Setup Views and Constrains
extension MainViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            heightStackView.heightAnchor.constraint(equalToConstant: 21),
            heightSlider.heightAnchor.constraint(equalToConstant: 60),
            
            weightStackView.heightAnchor.constraint(equalToConstant: 21),
            weightSlider.heightAnchor.constraint(equalToConstant: 60),
            
            calculateButton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
}

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, subViews: [UIView]) {
        self.init(arrangedSubviews: subViews)
        
        self.axis = axis
        self.distribution = distribution
        self.spacing = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    convenience init(alignment: NSTextAlignment) {
        self.init()
        
        self.textAlignment = alignment
        self.font = .systemFont(ofSize: 17, weight: .light)
        self.textColor = .darkGray
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

extension UISlider {
    convenience init(maxValue: Float) {
        self.init()
        
        self.maximumValue = maxValue
        self.value = maxValue / 2
        self.thumbTintColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 0.5)
        self.minimumTrackTintColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 0.5)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
