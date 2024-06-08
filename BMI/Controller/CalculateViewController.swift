//
//  CalculateViewController.swift
//  BMI
//
//  Created by Sergey Zakurakin on 07/06/2024.
//

import UIKit

class CalculateViewController: UIViewController {
    
    //MARK: - Properties
    
    var calculatorBrain = CalculatorBrain()
    
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
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        
        element.font = .systemFont(ofSize: 40, weight: .bold)
        element.textColor = .darkGray
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let calculateButton = UIButton(isBackgroundWhite: false)
    
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
        weightNumberLabel.text = "150 kg"
        
        calculateButton.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
        
        heightSlider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)
        weightSlider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
        
        
    }
    
    @objc private func calculateButtonPressed(_ sender: UIButton){
        
        let weight = weightSlider.value
        let height = heightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        let resultVC = ResultViewController()
        resultVC.bmiValue = calculatorBrain.getBMIValue()
        resultVC.bmiAdvice = calculatorBrain.getAdvice()
        resultVC.bmiColor = calculatorBrain.getColor()
        
        resultVC.modalTransitionStyle = .flipHorizontal
        resultVC.modalPresentationStyle = .fullScreen
        present(resultVC, animated: true)
        
    }
    
    @objc private func heightSliderChanged(_ sender: UISlider) {
        let value = "\(String(format: "%.2f", sender.value)) m"
        
        heightNumberLabel.text = value
    }
    
    @objc private func weightSliderChanged(_ sender: UISlider) {
        let value = "\(String(format: "%.0f", sender.value)) kg"
        
        weightNumberLabel.text = value

        
    }
}
// MARK: - Setup Constrains
extension CalculateViewController {
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
