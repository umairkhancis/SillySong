//
//  ViewController.swift
//  SillySong
//
//  Created by Umair Khan on 1/15/20.
//  Copyright © 2020 NoorifyTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            // join an array of strings into a single template string:
            let bananaFanaTemplate = [
                "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
                "Banana Fana Fo F<SHORT_NAME>",
                "Me My Mo M<SHORT_NAME>",
                "<FULL_NAME>"].joined(separator: "\n")

            // Business logic
            let utils = SillySongUtils()
            let sillySong = utils.lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Talia")
            
            // display to UI
            lyricsView.text = sillySong
        } else {
            nameField.text = ""
            lyricsView.text = ""
        }
    }
    
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
