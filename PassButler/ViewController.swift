//
//  ViewController.swift
//  PassButler
//
//  Created by Emanuele Guicciardi on 07/08/2018.
//  Copyright © 2018 Emanuele Guicciardi. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let defaultPasswordNumber = 10; // Default password number
    let defaultPasswordLength = 6;  // Default password length
    
    @IBOutlet weak var textarea: NSTextField!   // Generated password outlet
    @IBOutlet weak var passwordLengthInput: NSTextField!
    @IBOutlet weak var passwordNumberInput: NSTextField! // Number of generated passwords
    @IBOutlet weak var specialCharsInput: NSButton!
    @IBOutlet weak var mixedCaseInput: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func generateButtonClicked(_ sender: Any) {
        
        let passwordNumber = passwordNumberInput.integerValue > 0 ? passwordNumberInput.integerValue : defaultPasswordNumber;
        let passwordLength = passwordLengthInput.integerValue > 0 ? passwordLengthInput.integerValue : defaultPasswordLength;
        
        let passwordCharacters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890");
        let specialCharacters = Array("?@!%=^*");
        
        var generatedPasswordArray = [String]();
        
        for _ in 1...passwordNumber {
            
            var randomPassword = String((0..<passwordLength).map{ _ in passwordCharacters[Int(arc4random_uniform(UInt32(passwordCharacters.count)))]});
            
            if(mixedCaseInput.integerValue == 0) {
                
                randomPassword = randomPassword.lowercased();
                
            }
            
            generatedPasswordArray.append(randomPassword);
            
        }
        
        textarea.stringValue = generatedPasswordArray.joined(separator: "\n");
        
    }
    
}

