//
//  Time.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 31/05/2021.
//

import Foundation

enum TimeUnit {
    case year
    case month
    case week
    case day
    case hour
    case minute
    case second
    case milisecond
    case microsecond
    case nanosecond
}

struct Time {

    let value: Double

    init(value: Double) {
        self.value = value
    }

    func convert (unit: TimeUnit,
                  _ inverter: Bool = false) -> Double {
        var output = 0.0

        switch unit {
        case .year:
            output = value / 31557600
            if inverter == true {
                output = value * 31557600
            }
        case .month:
            output = value / 2629800
            if inverter == true {
                output = value * 2629800
            }
        case .week:
            output = value / 604800.02
            if inverter == true {
                output = value * 604800.02
            }
        case .day:
            output = value / 86400
            if inverter == true {
                output = value * 86400
            }
        case .hour:
            output = value / 3600
            if inverter == true {
                output = value * 3600
            }
        case .minute:
            output = value / 60
            if inverter == true {
                output = value * 60
            }
        case .second:
            output = value
        case .milisecond:
            output = value * 1000
            if inverter == true {
                output = value / 1000
            }
        case .microsecond:
            output = value * 1000000
            if inverter == true {
                output = value / 1000000
            }
        case .nanosecond:
            output = value * 1000000000
            if inverter == true {
                output = value / 1000000000
            }
        }
        return output
    }
}
