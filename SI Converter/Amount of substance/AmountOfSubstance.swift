//
//  AmountOfSubstance.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 31/05/2021.
//

import Foundation

enum AmountUnit {
    case kmol
    case mol
    case mmol
    case lbmol
}

struct Amount {

    let value: Double

    init(value: Double) {
        self.value = value
    }

    func convert (unit: AmountUnit,
                  _ inverter: Bool = false) -> Double {
        var output = 0.0

        switch unit {
        case .kmol:
            output = value / 1000
            if inverter == true {
                output = value * 1000
            }
        case .mol:
            output = value
        case .mmol:
            output = value * 1000
            if inverter == true {
                output = value / 1000
            }
        case .lbmol:
            output = value / 453.59
            if inverter == true {
                output = value * 453.59
            }
        }
        return output
    }
}
