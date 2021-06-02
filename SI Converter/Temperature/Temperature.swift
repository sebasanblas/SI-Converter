//
//  Temperature.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 01/06/2021.
//

import Foundation

enum TemperatureUnit {
    case kelvin
    case celsius
    case fahrenheit
    case rankine
}

struct Temperature {

    let value: Double

    init(value: Double) {
        self.value = value
    }

    func convert(unit: TemperatureUnit,
                 _ inverter: Bool = false) -> Double {
        var output = 0.0

        switch unit {
        case .kelvin:
            output = value
        case .celsius:
            output = value - 273.15
            if inverter == true {
                output = value + 273.15
            }
        case .fahrenheit:
            output = ((value - 273.15) * 9.0/5.0) + 32.0
            if inverter == true {
                output = ((value - 32.0) * 5.0/9.0) + 273.15
            }
        case .rankine:
            output = value / (5.0/9.0)
            if inverter == true {
                output = value * (5.0/9.0)
            }
        }
        return output
    }
}
