//
//  Mass.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 02/06/2021.
//

import Foundation

enum MassUnit {
    case ton
    case kilogram
    case gram
    case milligram
    case microgram
    case longton
    case shortton
    case stone
    case pound
    case ounce
}

struct Mass {

    let value: Double

    init(value: Double) {
        self.value = value
    }

    func convert (unit: MassUnit,
                  _ inverter: Bool = false) -> Double {
        var output = 0.0

        switch unit {
        case .ton:
            output = value / 1000.0
            if inverter == true {
                output = value * 1000.0
            }
        case .kilogram:
            output = value
        case .gram:
            output = value * 1000.0
            if inverter == true {
                output = value / 1000.0
            }
        case .milligram:
            output = value * 1000000.0
            if inverter == true {
                output = value / 1000000.0
            }
        case .microgram:
            output = value * 1000000000.0
            if inverter == true {
                output = value / 1000000000.0
            }
        case .longton:
            output = value * 0.000984207
            if inverter == true {
                output = value / 0.000984207
            }
        case .shortton:
            output = value * 0.00110231
            if inverter == true {
                output = value / 0.00110231
            }
        case .stone:
            output = value * 0.157473
            if inverter == true {
                output = value / 0.157473
            }
        case .pound:
            output = value * 2.20462
            if inverter == true {
                output = value / 2.20462
            }
        case .ounce:
            output = value * 35.274
            if inverter == true {
                output = value / 35.274
            }
        }
        return output
    }
}
