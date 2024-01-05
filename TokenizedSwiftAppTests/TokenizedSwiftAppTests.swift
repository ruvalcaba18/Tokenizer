//
//  TokenizedSwiftAppTests.swift
//  TokenizedSwiftAppTests
//
//  Created by Jael on 04/01/2024.
//

import XCTest
@testable import TokenizedSwiftApp

final class TokenizedSwiftAppTests: XCTestCase {
    
    private var tokenizer: TokenizenModel!
    
    override func setUp() {
        super.setUp()
        tokenizer = TokenizenModel()
    }
    
    override func tearDown() {
        tokenizer = nil
        super.tearDown()
    }
    
    func test_EnglishTokenization() {
        let text = "This is a test, and it contains an if statement."
        
        let tokens = tokenizer.tokenizeText(text, forLanguage: "English")
        XCTAssertEqual(tokens, ["this is a test, and", " it contains an if" ," statement."])
    }
    
    func test_SpanishTokenization() {
        let text = "Esto es una prueba y contiene una declaración si."
        
        let tokens = tokenizer.tokenizeText(text, forLanguage: "Spanish")
        
        XCTAssertEqual(tokens, ["esto es una prueba y", " contiene una declaración si", "."])
    }
    
    func test_RussianTokenization() {
        let text = "Это тест, и в нем есть условие если."
        
        let tokens = tokenizer.tokenizeText(text, forLanguage: "Russian")
        
        XCTAssertEqual(tokens,["это тест, и", " в нем есть услови", "е если", "."])
    }
    
    func test_UkrainianTokenization() {
        let text = "Це тест, і в ньому є умова якщо."
        let tokens = tokenizer.tokenizeText(text, forLanguage: "Ukrainian")
        XCTAssertEqual(tokens, ["це тест, і", " в ньому є умова якщо", "."])
    }
    
    
}
