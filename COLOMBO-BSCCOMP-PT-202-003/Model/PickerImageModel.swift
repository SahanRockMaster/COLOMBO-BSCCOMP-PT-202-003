//
//  PickerImageModel.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-15.
//
//Last Commit
import Foundation
import SwiftUI

struct PickerImageModel{
    var data : [Images]
    var grid : [Int]
    var disbaledPhotos : Bool
}

struct Images{
    var image : UIImage
    var selected : Bool
}
