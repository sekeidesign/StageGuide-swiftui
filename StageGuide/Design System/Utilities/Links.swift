//
//  Links.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-23.
//

import Foundation

func extractDomain(from url: String) -> String {
    let convertedURL = URL(string: url)
    if let host = convertedURL?.host {
        let components = host.components(separatedBy: ".")
        if components.count >= 2 {
            // The second-to-last component is the domain name without the TLD
            return components[components.count - 2].capitalized
        }
    }
    return "Error"
}
