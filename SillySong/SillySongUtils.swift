//
//  SillySongUtils.swift
//  SillySong
//
//  Created by Umair Khan on 1/15/20.
//  Copyright © 2020 NoorifyTech. All rights reserved.
//

import Foundation

class SillySongUtils {
    private func shortNameForName(name: String) -> String {
        var lowercasedName = name.lowercased()
        let vowelSet = CharacterSet(charactersIn: "aeiou")

        if let range = lowercasedName.rangeOfCharacter(from: vowelSet) {
            return lowercasedName.substring(from: range.lowerBound)
        } else {
            return lowercasedName
        }
    }
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        let shortName = shortNameForName(name: fullName)
        
        let customizedLyrics = lyricsTemplate
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        return customizedLyrics
    }
}
