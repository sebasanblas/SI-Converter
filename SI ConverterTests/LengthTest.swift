//
//  LengthTest.swift
//  SI ConverterTests
//
//  Created by Sebastian San Blas on 31/05/2021.
//

@testable import SI_Converter

import XCTest

class LengthTest: XCTestCase {

    var length: Length!
    var lengthInverter: Length!
    var input: Double = 1.0
    var multiplicator = 1.0
    override func setUp() {
        super.setUp()
        length = Length(value: input)
        lengthInverter = Length(value: input)
    }
    override func tearDown() {
        length = nil
        super.tearDown()
    }
    func test_m_to_km() throws {
        let value = length.convert(unit: .kilometer)
        let expectedValue = 0.001 * multiplicator
        XCTAssertEqual(expectedValue, value)
    }
    func test_m_to_m() throws {
        let value = length.convert(unit: .meter)
        let expectedValue = 1.0 * multiplicator
        XCTAssertEqual(expectedValue, value)
    }
    func test_m_to_cm() throws {
        let value = length.convert(unit: .centimeter)
        let expectedValue = 100.0 * multiplicator
        XCTAssertEqual(expectedValue, value)
    }
    func test_m_to_mm() throws {
        let value = length.convert(unit: .milimeter)
        let expectedValue = 1000.0 * multiplicator
        XCTAssertEqual(expectedValue, value)
    }
    func test_m_to_um() throws {
        let value = length.convert(unit: .micrometer)
        let expectedValue = 1000000.0 * multiplicator
        XCTAssertEqual(expectedValue, value)
    }
    func test_m_to_ns() throws {
        let value = length.convert(unit: .nanometer)
        let expectedValue = 1000000000.0 * multiplicator
        XCTAssertEqual(expectedValue, value)
    }
    func test_m_to_mi() throws {
        let value = length.convert(unit: .mile)
        let expectedValue = 0.000621371 * multiplicator
        XCTAssertEqual(expectedValue, value)
    }
    func test_m_to_yd() throws {
        let value = length.convert(unit: .yard)
        let expectedValue = 1.09361 * multiplicator
        XCTAssertEqual(expectedValue, value)
    }
    func test_m_to_fd() throws {
        let value = length.convert(unit: .feed)
        let expectedValue = 3.28084 * multiplicator
        XCTAssertEqual(expectedValue, value)
    }
    func test_m_to_in() throws {
        let value = length.convert(unit: .inch)
        let expectedValue = 39.37008 * multiplicator
        XCTAssertEqual(expectedValue, value)
    }
    // Inverter
    func test_km_to_m() throws {
        let value = lengthInverter.convert(unit: .kilometer, true)
        let expectedValue = 1000.0 * multiplicator
        XCTAssertEqual(expectedValue, value)
    }
}
