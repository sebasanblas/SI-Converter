//
//  TimeViewController.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 31/05/2021.
//

import Cocoa

class TimeViewController: NSViewController {

    // MARK: - User

    @IBOutlet var inputField: NSTextField!
    @IBOutlet var unitSelectedField: NSPopUpButton!

    // MARK: - Output
    @IBOutlet var yearsField: NSTextField!
    @IBOutlet var monthsField: NSTextField!
    @IBOutlet var weeksField: NSTextField!
    @IBOutlet var dField: NSTextField!
    @IBOutlet var hField: NSTextField!
    @IBOutlet var mField: NSTextField!
    @IBOutlet var sField: NSTextField!
    @IBOutlet var msField: NSTextField!
    @IBOutlet var µsField: NSTextField!
    @IBOutlet var nsField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        yearsField.stringValue = "0"
        monthsField.stringValue = "0"
        weeksField.stringValue = "0"
        dField.stringValue = "0"
        hField.stringValue = "0"
        mField.stringValue = "0"
        sField.stringValue = "0"
        msField.stringValue = "0"
        µsField.stringValue = "0"
        nsField.stringValue = "0"
    }

    @IBAction func textFieldChange(_ sender: NSTextField) {
        var value = Double(inputField.stringValue as String)
        switch unitSelectedField.titleOfSelectedItem {
        case "years":
            value = convertAnyToBasic(unit: .year)
        case "months":
            value = convertAnyToBasic(unit: .month)
        case "weeks":
            value = convertAnyToBasic(unit: .week)
        case "days":
            value = convertAnyToBasic(unit: .day)
        case "hours":
            value = convertAnyToBasic(unit: .hour)
        case "minutes":
            value = convertAnyToBasic(unit: .minute)
        case "s":
            value = convertAnyToBasic(unit: .second)
        case "ms":
            value = convertAnyToBasic(unit: .milisecond)
        case "µs":
            value = convertAnyToBasic(unit: .microsecond)
        case "ns":
            value = convertAnyToBasic(unit: .nanosecond)
        default:
            print("Error")
        }
        convertAll(input: value ?? 0.0)
    }

    @IBAction func unitChanged(_ sender: NSPopUpButton) {
        var value = Double(inputField.stringValue as String)
        switch sender.titleOfSelectedItem {
        case "years":
            value = convertAnyToBasic(unit: .year)
        case "months":
            value = convertAnyToBasic(unit: .month)
        case "weeks":
            value = convertAnyToBasic(unit: .week)
        case "days":
            value = convertAnyToBasic(unit: .day)
        case "hours":
            value = convertAnyToBasic(unit: .hour)
        case "minutes":
            value = convertAnyToBasic(unit: .minute)
        case "s":
            value = convertAnyToBasic(unit: .second)
        case "ms":
            value = convertAnyToBasic(unit: .milisecond)
        case "µs":
            value = convertAnyToBasic(unit: .microsecond)
        case "ns":
            value = convertAnyToBasic(unit: .nanosecond)
        default:
            print("Error")
        }
        convertAll(input: value ?? 0.0)
    }

    func convertAnyToBasic(unit: TimeUnit) -> Double {
        let input = Double(inputField.doubleValue)
        var output: Double
        let value = Time(value: input)
        output = value.convert(unit: unit, true)
        return output
    }

    func convertAll(input: Double) {
        let value = Time(value: input)
        yearsField.stringValue = String(format: "%.6f", value.convert(unit: .year))
        monthsField.stringValue = String(format: "%.6f", value.convert(unit: .month))
        weeksField.stringValue = String(format: "%.6f", value.convert(unit: .week))
        dField.stringValue = String(format: "%.6f", value.convert(unit: .day))
        hField.stringValue = String(format: "%.6f", value.convert(unit: .hour))
        mField.stringValue = String(format: "%.6f", value.convert(unit: .minute))
        sField.stringValue = String(format: "%.6f", value.convert(unit: .second))
        msField.stringValue = String(format: "%.6f", value.convert(unit: .milisecond))
        µsField.stringValue = String(format: "%.6f", value.convert(unit: .microsecond))
        nsField.stringValue = String(format: "%.6f", value.convert(unit: .nanosecond))
    }
}
