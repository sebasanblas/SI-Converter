//
//  AmountOfSubstanceViewController.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 31/05/2021.
//

import Cocoa

class AmountOfSubstanceViewController: NSViewController {

    // MARK: - User

    @IBOutlet var inputField: NSTextField!
    @IBOutlet var unitSelectedField: NSPopUpButton!
    // MARK: - Output

    @IBOutlet var kmolField: NSTextField!
    @IBOutlet var molField: NSTextField!
    @IBOutlet var mmolField: NSTextField!
    @IBOutlet var lbmolField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        kmolField.stringValue = "0.0"
        molField.stringValue = "0.0"
        mmolField.stringValue = "0.0"
        lbmolField.stringValue = "0.0"
    }

    @IBAction func textFieldChange(_ sender: NSTextField) {
        var value = Double(inputField.stringValue as String)
        switch unitSelectedField.titleOfSelectedItem {
        case "kmol":
            value = convertAnyToBasic(unit: .kmol)
        case "mol":
            value = convertAnyToBasic(unit: .mol)
        case "mmol":
            value = convertAnyToBasic(unit: .mmol)
        case "lb-mol":
            value = convertAnyToBasic(unit: .lbmol)
        default:
            print("Error")
        }
        convertAll(input: value ?? 0.0)
    }

    @IBAction func unitChanged(_ sender: NSPopUpButton) {
        var value = Double(inputField.stringValue as String)
        switch unitSelectedField.titleOfSelectedItem {
        case "kmol":
            value = convertAnyToBasic(unit: .kmol)
        case "mol":
            value = convertAnyToBasic(unit: .mol)
        case "mmol":
            value = convertAnyToBasic(unit: .mmol)
        case "lb-mol":
            value = convertAnyToBasic(unit: .lbmol)
        default:
            print("Error")
        }
        convertAll(input: value ?? 0.0)
    }

    func convertAnyToBasic(unit: AmountUnit) -> Double {
        let input = Double(inputField.doubleValue)
        var output: Double
        let value = Amount(value: input)
        output = value.convert(unit: unit, true)
        return output
    }

    func convertAll(input: Double) {
        let value = Amount(value: input)
        kmolField.stringValue = String(format: "%.6f", value.convert(unit: .kmol))
        molField.stringValue = String(format: "%.6f", value.convert(unit: .mol))
        mmolField.stringValue = String(format: "%.6f", value.convert(unit: .mmol))
        lbmolField.stringValue = String(format: "%.6f", value.convert(unit: .lbmol))
    }
}
