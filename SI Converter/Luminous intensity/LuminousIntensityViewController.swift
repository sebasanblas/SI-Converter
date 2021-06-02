//
//  LuminousIntensityViewController.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 02/06/2021.
//

import Cocoa

class LuminousIntensityViewController: NSViewController {

    // MARK: - User

    @IBOutlet var inputField: NSTextField!
    @IBOutlet var unitSelectedField: NSPopUpButton!
    // MARK: - Output

    
    @IBOutlet var candelaField: NSTextField!
    @IBOutlet var lumenField: NSTextField!
    @IBOutlet var hefnerkerzeField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        candelaField.stringValue = "0.0"
        lumenField.stringValue = "0.0"
        hefnerkerzeField.stringValue = "0.0"
    }

    @IBAction func textFieldChange(_ sender: NSTextField) {
        var value = Double(inputField.stringValue as String)
        switch unitSelectedField.titleOfSelectedItem {
        case "C":
            value = convertAnyToBasic(unit: .candela)
        case "lm/sr":
            value = convertAnyToBasic(unit: .lumen)
        case "HK":
            value = convertAnyToBasic(unit: .hefnerkerze)
        default:
            print("Error")
        }
        convertAll(input: value ?? 0.0)
    }
    
    @IBAction func unitChanged(_ sender: NSPopUpButton) {
        var value = Double(inputField.stringValue as String)
        switch unitSelectedField.titleOfSelectedItem {
        case "C":
            value = convertAnyToBasic(unit: .candela)
        case "lm/sr":
            value = convertAnyToBasic(unit: .lumen)
        case "HK":
            value = convertAnyToBasic(unit: .hefnerkerze)
        default:
            print("Error")
        }
        convertAll(input: value ?? 0.0)
    }

    func convertAnyToBasic(unit: LumUnit) -> Double {
        let input = Double(inputField.doubleValue)
        var output: Double
        let value = Lum(value: input)
        output = value.convert(unit: unit, true)
        return output
    }

    func convertAll(input: Double) {
        let value = Lum(value: input)
        candelaField.stringValue = String(format: "%.6f", value.convert(unit: .candela))
        lumenField.stringValue = String(format: "%.6f", value.convert(unit: .lumen))
        hefnerkerzeField.stringValue = String(format: "%.6f", value.convert(unit: .hefnerkerze))
    }
}
