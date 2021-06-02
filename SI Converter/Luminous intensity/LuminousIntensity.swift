//
//  LuminousIntensity.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 02/06/2021.
//

import Foundation

enum LumUnit {
    case candela
    case lumen
    case hefnerkerze
}

struct Lum {

    let value: Double

    init(value: Double) {
        self.value = value
    }

    func convert (unit: LumUnit,
                  _ inverter: Bool = false) -> Double {
        var output = 0.0

        switch unit {
        case .candela:
            output = value
        case .lumen:
            output = value
        case .hefnerkerze:
            output = value * 1.1069676153
            if inverter == true {
                output = value / 1.1069676153
            }
        }
        return output
    }
}
