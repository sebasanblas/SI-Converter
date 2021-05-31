//
//  LengthViewController.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 29/05/2021.
//

import Cocoa

class LengthViewController: NSViewController {

    // MARK: - User
    @IBOutlet var inputField: NSTextField!
    @IBOutlet var unitSelectedField: NSPopUpButton!

    // MARK: - Output
    @IBOutlet var kmField: NSTextField!
    @IBOutlet var mField: NSTextField!
    @IBOutlet var cmField: NSTextField!
    @IBOutlet var mmField: NSTextField!
    @IBOutlet var µmField: NSTextField!
    @IBOutlet var nmField: NSTextField!
    @IBOutlet var miField: NSTextField!
    @IBOutlet var ydField: NSTextField!
    @IBOutlet var ftField: NSTextField!
    @IBOutlet var inField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        kmField.stringValue = "0"
        mField.stringValue = "0"
        cmField.stringValue = "0"
        mmField.stringValue = "0"
        µmField.stringValue = "0"
        nmField.stringValue = "0"
        miField.stringValue = "0"
        ydField.stringValue = "0"
        ftField.stringValue = "0"
        inField.stringValue = "0"
    }

    @IBAction func textFieldChange(_ sender: NSTextField) {
        var value = Double(inputField.stringValue as String)
        switch unitSelectedField.titleOfSelectedItem {
        case "km":
            value = convertAnyToBasic(unit: .kilometer)
        case "m":
            value = convertAnyToBasic(unit: .meter)
        case "cm":
            value = convertAnyToBasic(unit: .centimeter)
        case "mm":
            value = convertAnyToBasic(unit: .milimeter)
        case "µm":
            value = convertAnyToBasic(unit: .micrometer)
        case "nm":
            value = convertAnyToBasic(unit: .nanometer)
        case "mi":
            value = convertAnyToBasic(unit: .mile)
        case "yd":
            value = convertAnyToBasic(unit: .yard)
        case "ft":
            value = convertAnyToBasic(unit: .feed)
        case "in":
            value = convertAnyToBasic(unit: .inch)
        default:
            print("Error")
        }
        convertAll(input: value ?? 0.0)
    }

    @IBAction func unitChanged(_ sender: NSPopUpButton) {
        var value = Double(inputField.stringValue as String)
        switch sender.titleOfSelectedItem {
        case "km":
            value = convertAnyToBasic(unit: .kilometer)
        case "m":
            value = convertAnyToBasic(unit: .meter)
        case "cm":
            value = convertAnyToBasic(unit: .centimeter)
        case "mm":
            value = convertAnyToBasic(unit: .milimeter)
        case "µm":
            value = convertAnyToBasic(unit: .micrometer)
        case "nm":
            value = convertAnyToBasic(unit: .nanometer)
        case "mi":
            value = convertAnyToBasic(unit: .mile)
        case "yd":
            value = convertAnyToBasic(unit: .yard)
        case "ft":
            value = convertAnyToBasic(unit: .feed)
        case "in":
            value = convertAnyToBasic(unit: .inch)
        default:
            print("Error")
        }
        convertAll(input: value ?? 0.0)
    }

    func convertAnyToBasic(unit: LengthUnit) -> Double {
        let input = Double(inputField.doubleValue)
        var output: Double
        let value = Length(value: input)
        output = value.convert(unit: unit, true)
        return output
    }

    func convertAll(input: Double) {
        let value = Length(value: input)
        kmField.stringValue = String(format: "%.6f", value.convert(unit: .kilometer))
        mField.stringValue = String(format: "%.6f", value.convert(unit: .meter))
        cmField.stringValue = String(format: "%.6f", value.convert(unit: .centimeter))
        mmField.stringValue = String(format: "%.6f", value.convert(unit: .milimeter))
        µmField.stringValue = String(format: "%.6f", value.convert(unit: .micrometer))
        nmField.stringValue = String(format: "%.6f", value.convert(unit: .nanometer))
        miField.stringValue = String(format: "%.6f", value.convert(unit: .mile))
        ydField.stringValue = String(format: "%.6f", value.convert(unit: .yard))
        ftField.stringValue = String(format: "%.6f", value.convert(unit: .feed))
        inField.stringValue = String(format: "%.6f", value.convert(unit: .inch))
    }

}
