//
//  ViewController.swift
//  FlatCalculator
//
//  Created by Hilario Cuervo on 16/08/2021.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var substractionButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    
    // MARK: - Global Variables
    
    private var calculator = CalculatorLogic()
    
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - UI customizations
        
        acButton.curveAndShadow()
        plusMinusButton.curveAndShadow()
        percentButton.curveAndShadow()
        divisionButton.curveAndShadow()
        multiplicationButton.curveAndShadow()
        substractionButton.curveAndShadow()
        additionButton.curveAndShadow()
        resultButton.curveAndShadow()
        decimalButton.curveAndShadow()
        zeroButton.curveAndShadow()
        oneButton.curveAndShadow()
        twoButton.curveAndShadow()
        threeButton.curveAndShadow()
        fourButton.curveAndShadow()
        fiveButton.curveAndShadow()
        sixButton.curveAndShadow()
        sevenButton.curveAndShadow()
        eightButton.curveAndShadow()
        nineButton.curveAndShadow()
        
        self.viewContainer.layer.cornerRadius = 20
        self.viewContainer.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.viewContainer.layer.shadowColor = UIColor.black.cgColor
        self.viewContainer.layer.shadowOpacity = 0.5
        self.viewContainer.layer.shadowRadius = 2
    }
    
    
    // MARK: - IBActions
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        
        if self.calculator.canType {
            
            self.calculator.isFinishedTyping = true
            self.calculator.setCurrentNum(Double(displayLabel.text!.replacingOccurrences(of: ",", with: "."))!)
            
            if let result = self.calculator.calculate(operation: sender.currentTitle!) {
                
                let displayValue = self.calculator.isDouble ? String(result).replacingOccurrences(of: ".", with: ",") : String(Int(result))

                self.displayLabel.text = displayValue
            }
        }
    }
    

    @IBAction func numberButtonPressed(_ sender: UIButton) {
    
        if self.calculator.isFinishedTyping {
            
            self.calculator.canType = true
            self.calculator.isFinishedTyping = false
            self.displayLabel.text = sender.currentTitle!
            
        } else {
            
            self.displayLabel.text! += sender.currentTitle!
        }
    }
    
    
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
        
        if (!self.calculator.isFinishedTyping && !self.displayLabel.text!.contains(",")) {
            
            self.calculator.isDouble = true
            self.displayLabel.text! += ","
        }

    }
}

