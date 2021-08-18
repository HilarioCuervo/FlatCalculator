//
//  CalculatorLogic.swift
//  FlatCalculator
//
//  Created by Hilario Cuervo on 17/08/2021.
//

import Foundation


struct CalculatorLogic {
    
    // MARK: - Properties
    
    var isDouble: Bool = false
    var canType: Bool = false
    var isFinishedTyping: Bool = true
    
    private var currentNum: Double?
    private var operationData: (num1: Double, calcMethod: String)?

    
    // MARK: - Public Methods
    
    mutating func setCurrentNum(_ number: Double) {
        self.currentNum = number
    }

    
    mutating func calculate(operation: String) -> Double? {
        
        if let number = currentNum {
            
            var result: Double?
            
            switch operation {
            
            case "AC":
                self.canType = false
                self.currentNum = nil
                self.operationData = nil
                result = 0.0
                
            case "+/-":
                result = number * -1
                
            case "%":
                result = number / 100
                
            case "=":
                result = self.performOperation(num2: number)
                
            default:
                operationData = (num1: number, calcMethod: operation)
            }
            
            self.checkValueType(for: result)
            return result
        }
        
        return nil
    }
    
    
    // MARK: - Private Methods
    
    mutating private func performOperation(num2: Double) -> Double? {
        
        if let num1 = self.operationData?.num1, let operation = self.operationData?.calcMethod {
            
            var result: Double?
            
            switch operation {
            
            case "+":
                result = num1 + num2
                    
            case "-":
                result = num1 - num2
                    
            case "×":
                result = num1 * num2
                    
            case "÷":
                result = num1 / num2
                
            default:
                fatalError()
            }
            
            self.checkValueType(for: result)
            return result
        }
        
        return nil
    }
    
    
    mutating private func checkValueType(for value: Double?) {
        
        if let result = value {
            let isInt: Bool = floor(result) == result
            self.isDouble = isInt ? false : true
        }

    }
}
