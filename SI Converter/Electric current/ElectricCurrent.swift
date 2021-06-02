//
//  ElectricCurrent.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 01/06/2021.
//

import Foundation

enum ElectricUnit {
    case giga
    case mega
    case kilo
    case ampere
    case milli
    case micro
    case nano
    case abampere
}

struct Electric {

    let value: Double

    init(value: Double) {
        self.value = value
    }

    func convert (unit: ElectricUnit,
                  _ inverter: Bool = false) -> Double {
        var output = 0.0

        switch unit {
        case .giga:
            output = value / 1000000000.0
            if inverter == true {
                output = value * 1000000000.0
            }
        case .mega:
            output = value / 1000000.0
            if inverter == true {
                output = value * 1000000.0
            }
        case .kilo:
            output = value / 1000.0
            if inverter == true {
                output = value * 1000.0
            }
        case .ampere:
            output = value
        case .milli:
            output = value * 1000.0
            if inverter == true {
                output = value / 1000.0
            }
        case .micro:
            output = value * 1000000.0
            if inverter == true {
                output = value / 1000000.0
            }
        case .nano:
            output = value * 1000000000.0
            if inverter == true {
                output = value / 1000000000.0
            }
        case .abampere:
            output = value / 10
            if inverter == true {
                output = value * 10
            }
        }
        return output
    }
}
