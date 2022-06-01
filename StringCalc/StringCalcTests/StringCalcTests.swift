//
//  StringCalcTests.swift
//  StringCalcTests
//
//  Created by Marc Buchser on 26.05.22.
//

import XCTest
@testable import StringCalc

class StringCalcTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
       
    }

    func test_adding_empty_number_input() throws {
        do {
            try XCTAssertEqual(StringCalculator.add(""), 0)
        }
    }
    
    func test_adding_two_numbers_input() throws {
        do {
            try XCTAssertEqual(StringCalculator.add("5,7"), 12)
        }
    }
    
    func test_dding_three_numbers_input() throws {
        do {
            try XCTAssertEqual(StringCalculator.add("1,2,3"), 6)
        }
    }
    
    func test_adding_alot_of_numbers_input() throws {
        do {
            try XCTAssertEqual(StringCalculator.add("1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20"), 210)
        }
    }

    func test_adding_with_wrong_separator() throws {
        do {
            try XCTAssertEqual(StringCalculator.add("1.2.3.4.5"), 0)
        }
    }

    func test_adding_with_new_line_separator() throws{
        do{
            try XCTAssertEqual(StringCalculator.add("1\n2\n3"), 6)
        }
    }
    
    func test_adding_with_newline_and_commas() throws{
        do{
            try XCTAssertEqual(StringCalculator.add("1\n2,3"), 6)
        }
    }
    
    func test_adding_with_commas_and_new_line() throws{
        do{
            try XCTAssertEqual(StringCalculator.add("1,2\n3,4\n5"), 15)
        }
    }
    
    func test_adding_negative_numbers() throws{
        do{
            try XCTAssertThrowsError(StringCalculator.add("1,2,-3"))
        }
    }
    
    func test_adding_more_negative_numbers() throws{
        do{
            try XCTAssertThrowsError(StringCalculator.add("1,-22,-43,5,-154,3,-8"))
        }
    }
    
    func test_double_forward_slash_with_control_sequence() throws{
        do{
            try XCTAssertEqual(StringCalculator.add("//;\n1,2,3"), 0)
        }
    }
    
    func test_adding_alot_of_values_with_control_sequence() throws{
        do{
            try XCTAssertEqual(StringCalculator.add("//[\n1[2[3[4[5[6[7[8[9[10[11[12[13[14[15"), 120)
        }
    }
    
    func test_adding_with_control_sequence() throws {
        do{
            try XCTAssertEqual(StringCalculator.add("//;\n1;2;3"), 6)
        }
    }
    
    func test_add_numbers_from_int_array(){
        do {
            try XCTAssertEqual(StringCalculator.addAllNumbersFromIntegerArray([1,2,3,4,5]), 15)
        }
    }
    
    func test_add_numbers_from_int_array_not_zero(){
        do {
            try XCTAssertTrue((StringCalculator.addAllNumbersFromIntegerArray([1,2,3,4,5]) != 0))
        }
    }
    
    func test_find_first_occurrence(){
        XCTAssertTrue((StringCalculator.findFirstOccurrence(of: "\n", in: "//,\n1,2,3") != nil))
    }
    
    func test_find_first_occurrence_index_position_3(){
        XCTAssertEqual(StringCalculator.findFirstOccurrence(of: "\n", in: "//,\n1,2,3"), String.Index.init(utf16Offset: 3, in: "//,\n1,2,3"))
    }
 
    func test_find_delimiter_char(){
        XCTAssertEqual(StringCalculator.findDelimiterChar(input: "//@\n1,2,3"), "@")
    }

    func test_find_delimiter_char_not_matching(){
        XCTAssertNotEqual(StringCalculator.findDelimiterChar(input: "//@\n1,2,3"), ",")
    }
    
    func test_finding_negative_numbers(){
        do{
            XCTAssertEqual(StringCalculator.findNegativeNumbers(in: [1,-22,-43,5,-154,3,-8]), [-22,-43,-154,-8])
        }
    }
    
    func test_finding_negative_numbers_not_matching(){
        do{
            XCTAssertNotEqual(StringCalculator.findNegativeNumbers(in: [1,-22,-43,5,-154,3,-8]), [-22,-43,-8])
        }
    }
    
    func test_has_a_valid_control_sequence_with_semmicolon(){
        do{
            try XCTAssertTrue(StringCalculator.isValidControlSequence(in: "//;\n1;2;3"))
        }
    }
    
    func test_has_a_valid_control_sequence_with_at_sign(){
        do{
            try XCTAssertTrue(StringCalculator.isValidControlSequence(in: "//@\n1@2@3"))
        }
    }
    
    func test_has_invalid_control_sequence(){
        do{
            try XCTAssertFalse(StringCalculator.isValidControlSequence(in: "//\n1@2@3"))
        }
    }
    
    func test_trim_control_sequence(){
        do{
            XCTAssertEqual(StringArrayConverter.trimControlSequence(of: "//;\n1,2,3,4"), "1,2,3,4")
        }
    }
    
    func test_trim_control_sequence_not_matching(){
        do{
            XCTAssertNotEqual(StringArrayConverter.trimControlSequence(of: "//;\n1,2,3,4"), "1,2,3")
        }
    }
    
    func testPerformanceExample() throws {
        self.measure {
        }
    }

}
