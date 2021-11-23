//
//  GridSize.swift
//  GoL
//
//  Created by Bryan D'Haeseleer on 23/11/2021.
//

import Foundation

struct GridSize {
   var size: Int
   var maxSize: Int

    /// If the size is lesser than 10 the minimum size of 10 will be applied
    init(_ size: Int) {
        if size >= Constants.Base.minimumSize {
            self.size = size
        } else {
            self.size = Constants.Base.minimumSize
        }
        self.maxSize = self.size*self.size
    }
}
