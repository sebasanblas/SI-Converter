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
//    let unit: LengthUnit

    init(value: Double) {
        self.value = value
//        self.unit = unit
    }

    func convert( unit: LengthUnit,
                  _ inverter: Bool = false) -> Double {
        var output = 0.0
        // entra m salen otros
        switch unit {
        case .kilometer:
            // 1 m -> 0.001 km
//            output = value / 1000
//            switch inverter {
//            case false:
                output = value / 1000
//            case true:
            if inverter == true {
                output = value * 1000
            }
        case .meter:
            output = value
        case .centimeter:
            // 1 m -> 100 cm
//            output = value * 100
            switch inverter {
            case false:
                output = value * 100
            case true:
                output = value / 100
            }
        case .milimeter:
            // 1 m -> 1000 mm
//            output = value * 1000
            switch inverter {
            case false:
                output = value * 1000
            case true:
                output = value / 1000
            }
        case .micrometer:
            // 1 m -> 1000000 m
//            output = value * 1000000
            switch inverter {
            case false:
                output = value * 1000000
            case true:
                output = value / 1000000
            }
        case .nanometer:
            // 1 m -> 1000000000
//            output = value * 1000000000
            switch inverter {
            case false:
                output = value * 1000000000
            case true:
                output = value / 1000000000
            }
        case .mile:
            // 1 m -> 0.000621371
//            output = value * 0.000621371
            switch inverter {
            case false:
                output = value * 0.000621371
            case true:
                output = value / 0.000621371
            }
        case .yard:
            // 1 m -> 1.09361
//            output = value * 1.09361
            switch inverter {
            case false:
                output = value * 1.09361
            case true:
                output = value / 1.09361
            }
        case .feed:
            // 1 m -> 3.28084
//            output = value * 3.28084
            switch inverter {
            case false:
                output = value * 3.28084
            case true:
                output = value / 3.28084
            }
        case .inch:
            // 1 m -> 39.37008
//            output = value * 39.37008
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
