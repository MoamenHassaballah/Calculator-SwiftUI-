//
//  ContentView.swift
//  Calculator
//
//  Created by Moamen Hassaballah on 29/07/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var calculatorLogic = CalculatorLogic()
    
    
    let lightGreenColor = Color(uiColor: UIColor(resource: ColorResource.lightGreen))
    let darkRedColor = Color(uiColor: UIColor(resource: ColorResource.darkRed))
    let fontColor = Color(uiColor: UIColor(resource: ColorResource.font))
    
    var body: some View {
        ZStack {
            
            Color(uiColor: UIColor(resource: ColorResource.appBackground))
                .ignoresSafeArea()
            
            
            VStack {
                
                //Appearance Picker
                
                Picker("appearance", selection: $calculatorLogic.selectedAppearance) {
                    
                    Image(systemName: "sun.min").tag(0)
                    Image(systemName: "moon").tag(1)
                    
                }
                .pickerStyle(.segmented)
                .frame(width: 120)
                
                
                VStack{
                    
                    VStack(alignment: .trailing) {
                        
                        ScrollView(.horizontal) {
                            Text(
                                calculatorLogic.equationText
                            )
                            .font(
                                .system(
                                    size: calculatorLogic.resultText.isEmpty ? 30 : 20,
                                    weight: calculatorLogic.resultText.isEmpty ? .semibold : .regular
                                )
                            )
                            .rotationEffect(.degrees(180))
                            .onTapGesture {
                                withAnimation(.spring(duration: 0.5, bounce: 0.5, blendDuration: 0.5)) {
                                    if !calculatorLogic.resultText.isEmpty{
                                        calculatorLogic.resultText = ""
                                        calculatorLogic.isFinishedTyping = false
                                    }
                                }
                                
                            }
                        }
                        .defaultScrollAnchor(.leading)
                        .scrollIndicators(.hidden)
                        .frame(alignment: .trailing)
                        .rotationEffect(Angle(degrees: 180))
                        
                        
                        
                        
                        if !calculatorLogic.resultText.isEmpty{
                            Text(
                                calculatorLogic.resultText
                            )
                            .font(.system(size: 30, weight: .semibold))
                        }
                        
                        
                        
                    }
                    .padding()
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .bottomTrailing
                    )
                    
                    
                    VStack (spacing: 20){
                        
                        //First Row
                        HStack{
                            
                            MyCalculatorButton(
                                action: {
                                    withAnimation {
                                        calculatorLogic.resetCalc()
                                    }
                                    
                                },
                                foregroundColor: lightGreenColor,
                                labelView: {
                                    Text("AC")
                                        .font(.system(size: 25, weight: .semibold))
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onPerformOperation(symbol: "+-")
                                },
                                foregroundColor: lightGreenColor,
                                labelView: {
                                    Image(systemName: "plus.forwardslash.minus")
                                        .resizable()
                                        .padding(10)
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onPercentPress()
                                },
                                foregroundColor: lightGreenColor,
                                labelView: {
                                    Image(systemName: "percent")
                                        .resizable()
                                        .padding(10)
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onPerformOperation(symbol: "÷")
                                },
                                foregroundColor: darkRedColor,
                                labelView: {
                                    Image(systemName: "divide")
                                        .resizable()
                                        .padding(10)
                                }
                            )
                            
                            
                        }
                        
                        //Second Row
                        HStack{
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onKeyPress(symbol: "7")
                                },
                                foregroundColor: fontColor,
                                labelView: {
                                    Text("7")
                                        .font(.system(size: 25, weight: .semibold))
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onKeyPress(symbol: "8")
                                },
                                foregroundColor: fontColor,
                                labelView: {
                                    Text("8")
                                        .font(.system(size: 25, weight: .semibold))
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onKeyPress(symbol: "9")
                                },
                                foregroundColor: fontColor,
                                labelView: {
                                    Text("9")
                                        .font(.system(size: 25, weight: .semibold))
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onPerformOperation(symbol: "x")
                                },
                                foregroundColor: darkRedColor,
                                labelView: {
                                    Image(systemName: "multiply")
                                        .resizable()
                                        .padding(10)
                                }
                            )
                            
                            
                        }
                        
                        //Third Row
                        HStack{
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onKeyPress(symbol: "4")
                                },
                                foregroundColor: fontColor,
                                labelView: {
                                    Text("4")
                                        .font(.system(size: 25, weight: .semibold))
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onKeyPress(symbol: "5")
                                },
                                foregroundColor: fontColor,
                                labelView: {
                                    Text("5")
                                        .font(.system(size: 25, weight: .semibold))
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onKeyPress(symbol: "6")
                                },
                                foregroundColor: fontColor,
                                labelView: {
                                    Text("6")
                                        .font(.system(size: 25, weight: .semibold))
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onPerformOperation(symbol: "-")
                                },
                                foregroundColor: darkRedColor,
                                labelView: {
                                    Image(systemName: "minus")
                                        .imageScale(.large)
                                }
                            )
                            
                            
                        }
                        
                        //Fourth Row
                        
                        HStack{
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onKeyPress(symbol: "1")
                                },
                                foregroundColor: fontColor,
                                labelView: {
                                    Text("1")
                                        .font(.system(size: 25, weight: .semibold))
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onKeyPress(symbol: "2")
                                },
                                foregroundColor: fontColor,
                                labelView: {
                                    Text("2")
                                        .font(.system(size: 25, weight: .semibold))
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onKeyPress(symbol: "3")
                                },
                                foregroundColor: fontColor,
                                labelView: {
                                    Text("3")
                                        .font(.system(size: 25, weight: .semibold))
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onPerformOperation(symbol: "+")
                                },
                                foregroundColor: darkRedColor,
                                labelView: {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .padding(10)
                                }
                            )
                            
                            
                        }
                        
                        //Fifth Row
                        
                        HStack{
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.removeLast()
                                },
                                foregroundColor: fontColor,
                                labelView: {
                                    Image(systemName: "delete.backward")
                                        .resizable()
                                        .padding(10)
                                    
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.onKeyPress(symbol: "0")
                                },
                                foregroundColor: fontColor,
                                labelView: {
                                    Text("0")
                                        .font(.system(size: 25, weight: .semibold))
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    
                                    calculatorLogic.onKeyPress(symbol: ".")
                                    
                                },
                                foregroundColor: fontColor,
                                labelView: {
                                    Text(".")
                                        .font(.system(size: 25, weight: .semibold))
                                }
                            )
                            
                            Spacer()
                            
                            MyCalculatorButton(
                                action: {
                                    calculatorLogic.performEquals()
                                },
                                foregroundColor: darkRedColor,
                                labelView: {
                                    Image(systemName: "equal")
                                        .resizable()
                                        .padding(10)
                                }
                            )
                            
                            
                        }
                        
                        
                        
                        
                    }
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
                    .padding(20)
                    .background{
                        UnevenRoundedRectangle(
                            topLeadingRadius: 50,
                            topTrailingRadius: 50
                        )
                        .fill(
                            Color(uiColor: UIColor(resource: ColorResource.numberPadBackground))
                        )
                    }
                    
                    
                    
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                
                
            
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            
            
        }
        .onAppear{
            calculatorLogic.setSelectedAppearance(colorScheme: colorScheme)
        }
        .preferredColorScheme( calculatorLogic.selectedAppearance == 0 ? .light : .dark)
    }
    
}

#Preview {
    ContentView()
}


