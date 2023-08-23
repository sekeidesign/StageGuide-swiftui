//
//  Transformers.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-23.
//

import Foundation
import CoreData

@objc(LinksArrayTransformer)
class LinksArrayTransformer: ValueTransformer {
    override class func transformedValueClass() -> AnyClass {
        return NSArray.self
    }

    override class func allowsReverseTransformation() -> Bool {
        return true
    }

    override func transformedValue(_ value: Any?) -> Any? {
        guard let array = value as? [String] else { return nil }
        return NSArray(array: array)
    }

    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let nsArray = value as? NSArray else { return nil }
        return nsArray.compactMap { $0 as? String }
    }
}
