//
// ContentView.swift
// LengthConverter
//
// Created by Tensai Solutions on 10/10/23
// Copyright © 2023 Tensai Solutions. All rights reserved.


import SwiftUI

struct ContentView: View {
    @State private var inputUnits = 0.0
    @State private var userInputUnit = "Meters"
    @State private var userOutputUnit = "Meters"
    @FocusState private var unitIsFocused: Bool
    let units = ["Meters", "KM", "Feet", "Yards", "Miles"]
    var computedDistance: Double {
        return convertUnits(input: inputUnits, from: userInputUnit, to: userOutputUnit)
    }

    func convertUnits(input:Double, from unitFrom: String, to unitTo: String ) -> Double {
        var baseInput = 0.0 //Base Unit amount to base calculations on
        switch unitFrom {
        case "Meters":
            baseInput = input * 1_000
        case "KM":
            baseInput = input * 1_000_000
        case "Feet":
            baseInput = input * 304.8
        case "Yards":
            baseInput = input * 914.4
        case "Miles":
            baseInput = input * 1_609_000
        default:
            break
        }

        switch unitTo {
        case "Meters":
            return baseInput / 1_000
        case "KM":
            return baseInput / 1_000_000
        case "Feet":
            return baseInput / 304.8
        case "Yards":
            return baseInput / 914.4
        case "Miles":
            return baseInput / 1_609_000
        default:
            return 0.0
        }
    }
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter a Unit Amount") {
                    TextField("Units", value: $inputUnits, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($unitIsFocused)
                }
                Section("Select Unit of Measure to Convert From") {
                    Picker("Units From", selection: $userInputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Select Unit of Measure to Convert To") {
                    Picker("Units From", selection: $userOutputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Result of Converting \(userInputUnit) to \(userOutputUnit)") {
                    Text("\(computedDistance.formatted())")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
