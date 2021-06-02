//
//  ElectricCurrentViewController.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 01/06/2021.
//

import Cocoa

class ElectricCurrentViewController: NSViewController {

    // MARK: - User

    @IBOutlet var inputFiled: NSTextField!
    @IBOutlet var unitSelectedField: NSPopUpButton!
    // MARK: - Output

    @IBOutlet var gaField: NSTextField!
    @IBOutlet var megaField: NSTextField!
    @IBOutlet var kafield: NSTextField!
    @IBOutlet var aField: NSTextField!
    @IBOutlet var maField: NSTextField!
    @IBOutlet var microField: NSTextField!
    @IBOutlet var nanoField: NSTextField!
    @IBOutlet var abampereField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        gaField.stringValue = "0.0"
        megaField.stringValue = "0.0"
        kafield.stringValue = "0.0"
        aField.stringValue = "0.0"
        maField.stringValue = "0.0"
        microField.stringValue = "0.0"
        nanoField.stringValue = "0.0"
        abampereField.stringValue = "0.0"
    }

    @IBAction func textFieldChange(_ sender: NSTextField) {
        var value = Double(inputFiled.stringValue as String)
        switch unitSelectedField.titleOfSelectedItem {
        case "GA":
            value = converAnyToBasic(unit: .giga)
        case "MA":
            value = converAnyToBasic(unit: .mega)
        case "kA":
            value = converAnyToBasic(unit: .kilo)
        case "A":
            value = converAnyToBasic(unit: .ampere)
        case "mA":
            value = converAnyToBasic(unit: .milli)
        case "µA":
            value = converAnyToBasic(unit: .micro)
        case "nA":
            value = converAnyToBasic(unit: .nano)
        case "aA":
            value = converAnyToBasic(unit: .abampere)
        default:
            print("error")
        }
        convertAll(input: value ?? 0.0)
    }

    @IBAction func unitChanged(_ sender: NSPopUpButton) {
        var value = Double(inputFiled.stringValue as String)
        switch unitSelectedField.titleOfSelectedItem {
        case "GA":
            value = converAnyToBasic(unit: .giga)
        case "MA":
            value = converAnyToBasic(unit: .mega)
        case "kA":
            value = converAnyToBasic(unit: .kilo)
        case "A":
            value = converAnyToBasic(unit: .ampere)
        case "mA":
            value = converAnyToBasic(unit: .milli)
        case "µA":
            value = converAnyToBasic(unit: .micro)
        case "nA":
            value = converAnyToBasic(unit: .nano)
        case "aA":
            value = converAnyToBasic(unit: .abampere)
        default:
            print("error")
        }
        convertAll(input: value ?? 0.0)
    }

    func converAnyToBasic(unit: ElectricUnit) -> Double {
        let input = Double(inputFiled.doubleValue)
        var output: Double
        let value = Electric(value: input)
        output = value.convert(unit: unit, true)
        return output
    }

    func convertAll(input: Double) {
        let value = Electric(value: input)
        gaField.stringValue = String(format: "%.6f", value.convert(unit: .giga))
        megaField.stringValue = String(format: "%.6f", value.convert(unit: .mega))
        kafield.stringValue = String(format: "%.6f", value.convert(unit: .kilo))
        aField.stringValue = String(format: "%.6f", value.convert(unit: .ampere))
        maField.stringValue = String(format: "%.6f", value.convert(unit: .milli))
        microField.stringValue = String(format: "%.6f", value.convert(unit: .micro))
        nanoField.stringValue = String(format: "%.6f", value.convert(unit: .nano))
        abampereField.stringValue = String(format: "%.6f", value.convert(unit: .abampere))
    }
}
