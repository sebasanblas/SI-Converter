//
//  MassViewController.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 02/06/2021.
//

import Cocoa

class MassViewController: NSViewController {

    // MARK: - User

    @IBOutlet var inputField: NSTextField!
    @IBOutlet var unitSelectedField: NSPopUpButton!
    // MARK: - Output

    @IBOutlet var tonField: NSTextField!
    @IBOutlet var kilogramField: NSTextField!
    @IBOutlet var gramField: NSTextField!
    @IBOutlet var milligramField: NSTextField!
    @IBOutlet var microgramField: NSTextField!
    @IBOutlet var longtonField: NSTextField!
    @IBOutlet var shorttonField: NSTextField!
    @IBOutlet var stoneField: NSTextField!
    @IBOutlet var poundField: NSTextField!
    @IBOutlet var ounceField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        tonField.stringValue = "0.0"
        kilogramField.stringValue = "0.0"
        gramField.stringValue = "0.0"
        milligramField.stringValue = "0.0"
        microgramField.stringValue = "0.0"
        longtonField.stringValue = "0.0"
        shorttonField.stringValue = "0.0"
        stoneField.stringValue = "0.0"
        poundField.stringValue = "0.0"
        ounceField.stringValue = "0.0"
    }

    @IBAction func textFieldChange(_ sender: NSTextField) {
        var value = Double(inputField.stringValue as String)
        switch unitSelectedField.titleOfSelectedItem {
        case "t":
            value = converAnyToBasic(unit: .ton)
        case "kg":
            value = converAnyToBasic(unit: .kilogram)
        case "mg":
            value = converAnyToBasic(unit: .milligram)
        case "µg":
            value = converAnyToBasic(unit: .microgram)
        case "long ton":
            value = converAnyToBasic(unit: .longton)
        case "short ton":
            value = converAnyToBasic(unit: .shortton)
        case "stone":
            value = converAnyToBasic(unit: .stone)
        case "lb":
            value = converAnyToBasic(unit: .pound)
        case "ounce":
            value = converAnyToBasic(unit: .ounce)
        default:
            print("Error")
        }
        convertAll(input: value ?? 0.0 )
    }

    @IBAction func unitChanged(_ sender: NSPopUpButton) {
        var value = Double(inputField.stringValue as String)
        switch unitSelectedField.titleOfSelectedItem {
        case "t":
            value = converAnyToBasic(unit: .ton)
        case "kg":
            value = converAnyToBasic(unit: .kilogram)
        case "mg":
            value = converAnyToBasic(unit: .milligram)
        case "µg":
            value = converAnyToBasic(unit: .microgram)
        case "long ton":
            value = converAnyToBasic(unit: .longton)
        case "short ton":
            value = converAnyToBasic(unit: .shortton)
        case "stone":
            value = converAnyToBasic(unit: .stone)
        case "lb":
            value = converAnyToBasic(unit: .pound)
        case "ounce":
            value = converAnyToBasic(unit: .ounce)
        default:
            print("Error")
        }
        convertAll(input: value ?? 0.0 )
    }

    func converAnyToBasic(unit: MassUnit) -> Double {
        let input = Double(inputField.doubleValue)
        var output: Double
        let value = Mass(value: input)
        output = value.convert(unit: unit, true)
        return output
    }

    func convertAll(input: Double) {
        let value = Mass(value: input)
        tonField.stringValue = String(format: "%.6f", value.convert(unit: .ton))
        kilogramField.stringValue = String(format: "%.6f", value.convert(unit: .kilogram))
        gramField.stringValue = String(format: "%.6f", value.convert(unit: .gram))
        milligramField.stringValue = String(format: "%.6f", value.convert(unit: .milligram))
        microgramField.stringValue = String(format: "%.6f", value.convert(unit: .microgram))
        longtonField.stringValue = String(format: "%.6f", value.convert(unit: .longton))
        shorttonField.stringValue = String(format: "%.6f", value.convert(unit: .shortton))
        stoneField.stringValue = String(format: "%.6f", value.convert(unit: .stone))
        poundField.stringValue = String(format: "%.6f", value.convert(unit: .pound))
        ounceField.stringValue = String(format: "%.6f", value.convert(unit: .ounce))
    }
}
