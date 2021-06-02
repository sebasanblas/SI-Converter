//
//  TemperatureViewController.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 02/06/2021.
//

import Cocoa

class TemperatureViewController: NSViewController {

    // MARK: - User

    @IBOutlet var inputField: NSTextField!
    @IBOutlet var unitSelectedField: NSPopUpButton!

    // MARK: - Output
    @IBOutlet var kelvinField: NSTextField!
    @IBOutlet var celsiusField: NSTextField!
    @IBOutlet var fahrenheitField: NSTextField!
    @IBOutlet var rankineField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        kelvinField.stringValue = "0.0"
        celsiusField.stringValue = "0.0"
        fahrenheitField.stringValue = "0.0"
        rankineField.stringValue = "0.0"
    }

    @IBAction func textFieldChange(_ sender: NSTextField) {
        var value = Double(inputField.stringValue as String)
        switch unitSelectedField.titleOfSelectedItem {
        case "K":
            value = convertAnyToBasic(unit: .kelvin)
        case "C":
            value = convertAnyToBasic(unit: .celsius)
        case "F":
            value = convertAnyToBasic(unit: .fahrenheit)
        case "R":
            value = convertAnyToBasic(unit: .rankine)
        default:
            print("error")
        }
        convertAll(input: value ?? 0.0)
    }

    @IBAction func unitChanged(_ sender: NSPopUpButton) {
        var value = Double(inputField.stringValue as String)
        switch unitSelectedField.titleOfSelectedItem {
        case "K":
            value = convertAnyToBasic(unit: .kelvin)
        case "C":
            value = convertAnyToBasic(unit: .celsius)
        case "F":
            value = convertAnyToBasic(unit: .fahrenheit)
        case "R":
            value = convertAnyToBasic(unit: .rankine)
        default:
            print("error")
        }
        convertAll(input: value ?? 0.0)
    }

    func convertAnyToBasic(unit: TemperatureUnit) -> Double {
        let input = Double(inputField.doubleValue)
        var output: Double
        let value = Temperature(value: input)
        output = value.convert(unit: unit, true)
        return output
    }

    func convertAll(input: Double) {
        let value = Temperature(value: input)
        kelvinField.stringValue = String(format: "%.6f", value.convert(unit: .kelvin))
        celsiusField.stringValue = String(format: "%.6f", value.convert(unit: .celsius))
        fahrenheitField.stringValue = String(format: "%.6f", value.convert(unit: .fahrenheit))
        rankineField.stringValue = String(format: "%.6f", value.convert(unit: .rankine))
    }
}
