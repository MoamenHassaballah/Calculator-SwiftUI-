//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Moamen Hassaballah on 07/08/2024.
//

import Foundation
import SwiftUI


class CalculatorLogic : ObservableObject {
    
    
    @Published var selectedAppearance : Int =  0
    
    @Published var equationText = ""
    @Published var resultText = ""
    
    @Published var operation = ""
    
    @Published var firstNum: Double? = nil
    @Published var secondNum: Double? = nil
    
    @Published var isFinishedTyping = true
    
    
    
    func resetCalc(){
        resultText = ""
        equationText = ""
        firstNum = nil
        secondNum = nil
        operation = ""
    }
    
    func onPercentPress(){
        performEquals()
        let result = Double(resultText) ?? 0
        resultText = "\(result / 100)"
    }
    
    func setSelectedAppearance(colorScheme: ColorScheme){
        selectedAppearance = colorScheme == .dark ? 1 : 0
    }
    
    func onKeyPress(symbol: String){
        
        if symbol == "." && !canAddPeriod(expression: equationText){
            return
        }
        
        withAnimation {
            if isFinishedTyping {
                resultText = ""
                equationText = symbol
                isFinishedTyping = false
            }else{
                equationText.append(symbol)
            }
        }
    }
    
    func removeLast(){
        withAnimation {
            if !equationText.isEmpty && resultText.isEmpty {
                equationText.removeLast()
            }
        }
    }
    
    
    func onPerformOperation(symbol: String){
        
        withAnimation {
            if isFinishedTyping {
                equationText = resultText
                resultText = ""
                isFinishedTyping = false
            }
            
            let lastChar = equationText.last ?? " "
            
            if lastChar == " "{
                
                if symbol == "+-" {
                    equationText.append("-")
                }else if equationText.count > 3{
                    equationText.removeLast(3)
                }
                
            }else if equationText.isEmpty {
                if symbol == "+-" {
                    equationText.append("-")
                }
            }
            
            
            if symbol != "+-" && !equationText.isEmpty{
                equationText.append(" \(symbol) ")
            }
            
        }
        
        
    }
    
    func performEquals(isOperation: Bool = false){
        
        if equationText.isEmpty {
            return
        }
        
        withAnimation(.spring(duration: 0.5, bounce: 0.5, blendDuration: 0.5)) {
            resultText = getResult()
            isFinishedTyping = true
        }
        
        
    }
    
    func getResult() -> String {
        
        let equation = equationText.replacing("x", with: "*").replacing("÷", with: "/")
        
        
        if isValidExpression(expression: equation) {
            let result =  NSExpression(format: equation).expressionValue(with: nil, context: nil) as! Double
            return String(describing: result)
        }else {
            return "Invalid Expression"
        }
        
    }
    
    
    private func isValidExpression(expression: String) -> Bool{
        
        let expressionParts = expression.split(separator: " ")
        
        for index in 0..<expressionParts.count {
            let part = expressionParts[index].description
            
            if ( !isValidDouble(num: part) && !isOperation(num: part )) {
                return false
            }
            
            if ( index == (expressionParts.count - 1)  && isOperation(num: part)){
                return false
            }
        }
        
        
        return true
        
    }
    
    
    private func isValidDouble(num: String) -> Bool {
        return Double(num) != nil
    }
    
    
    private func canAddPeriod(expression: String) -> Bool {
        if !expression.isEmpty {
            let expressionParts = expression.split(separator: " ")
            if let lastPart = expressionParts.last?.description {
                return !lastPart.contains(".")
            } else{
                return false
            }
        }
        
        return true
    }
    
    private func isOperation(num: String) -> Bool{
        return num == "+" || num == "-" || num == "*" || num == "/"
    }
    
    
}
