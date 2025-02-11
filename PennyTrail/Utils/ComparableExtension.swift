//
//  ComparableExtension.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import Foundation

extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
