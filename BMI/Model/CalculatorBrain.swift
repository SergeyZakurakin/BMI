//
//  CalculatorBrain.swift
//  BMI
//
//  Created by Sergey Zakurakin on 08/06/2024.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .systemCyan)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as fiddle!", color: .systemGreen)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .systemRed)
        }
    }
    
    func getBMIValue() -> String {
        let bmiToOneDecimal = String(format: "%.2f", bmi?.value ?? 0.0)
            return bmiToOneDecimal
            
        }
    
    func getColor() -> UIColor {
        bmi?.color ?? UIColor.white
    }
    
    func getAdvice() -> String {
        bmi?.advice ?? ""
    }
    
    
    
    }
    
    

