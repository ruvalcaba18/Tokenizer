//
//  ViewController.swift
//  TokenizedSwiftApp
//  Created by Jael on 04/01/2024.

import UIKit

class ViewController: UIViewController {

    private var tokenModel = TokenizenModel()
    private var storedText = ""
    
    @IBOutlet weak var answerLabel: UILabel!{
        didSet{
            answerLabel.text = ""
        }
    }
    @IBOutlet weak var inputText: UITextView!{
        didSet{
            inputText.delegate = self
            inputText.text = "pleace enter some text"
            inputText.textColor = UIColor.lightGray
            inputText.layer.borderWidth = 2.0
            inputText.layer.borderColor = UIColor.black.cgColor
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }

    @IBAction func tokenizeText(_ sender: UIButton) {
        let language = Locale.preferredLanguages[0]
        let tokens = tokenModel.tokenizeText(inputText.text, forLanguage: language)
        let resultText = tokens.joined(separator: ", \n")
        answerLabel.text = "Tokens: \(resultText)"
        self.inputText.resignFirstResponder()
    }
    
}

extension ViewController: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        inputText.textColor = UIColor.darkGray
        inputText.text = ""
        return true
    }
    
   
}
