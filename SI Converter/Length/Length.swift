//
//  Length.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 30/05/2021.
//

import Foundation

enum LengthUnit {
    case kilometer
    case meter
    case centimeter
    case milimeter
    case micrometer
    case nanometer
    case mile
    case yard
    case feed
    case inch
}

struct Length {

    let value: Double

    init(value: Double) {
        self.value = value
    }

    func convert(unit: LengthUnit,
                 _ inverter: Bool = false) -> Double {
        var output = 0.0

        switch unit {
        case .kilometer:
            // 1 m -> 0.001 km
            output = value / 1000
            if inverter == true {
                output = value * 1000
            }
        case .meter:
            output = value
        case .centimeter:
            // 1 m -> 100 cm
            switch inverter {
            case false:
                output = value * 100
            case true:
                output = value / 100
            }
        case .milimeter:
            // 1 m -> 1000 mm
            switch inverter {
            case false:
                output = value * 1000
            case true:
                output = value / 1000
            }
        case .micrometer:
            // 1 m -> 1000000 m
            switch inverter {
            case false:
                output = value * 1000000
            case true:
                output = value / 1000000
            }
        case .nanometer:
            // 1 m -> 1000000000
            switch inverter {
            case false:
                output = value * 1000000000
            case true:
                output = value / 1000000000
            }
        case .mile:
            // 1 m -> 0.000621371
            switch inverter {
            case false:
                output = value * 0.000621371
            case true:
                output = value / 0.000621371
            }
        case .yard:
            // 1 m -> 1.09361
            switch inverter {
            case false:
                output = value * 1.09361
            case true:
                output = value / 1.09361
            }
        case .feed:
            // 1 m -> 3.28084
            switch inverter {
            case false:
                output = value * 3.28084
            case true:
                output = value / 3.28084
            }
        case .inch:
            // 1 m -> 39.37008
            switch inverter {
            case false:
                output = value * 39.37008
            case true:
                output = value / 39.37008
            }
        }
        return output
    }
}
