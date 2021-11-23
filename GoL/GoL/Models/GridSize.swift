//
//  GridSize.swift
//  GoL
//
//  Created by Bryan D'Haeseleer on 23/11/2021.
//

import Foundation

struct GridSize {
    let size: Int
    var maxSize: Int!

    /// If the size is lesser than 10 the minimum size of 10 will be applied
    init(_ size: Int) {
        guard size >= Constants.Base.minimumSize else {
            self.size = Constants.Base.minimumSize
            return
        }
        self.size = size
        defer {
            self.maxSize = 0
        }
    }
}
