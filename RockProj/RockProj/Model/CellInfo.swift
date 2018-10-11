//
//  CellInfo.swift
//  RockProj
//
//  Created by Felipe Izepe on 11/10/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation
import UIKit

/// Enum that defines cell type
///
/// - text: text in case is a text cell
/// - image: iamge in case is a image cell
enum CellType {
	case text
	case image
}

/// Info stored in each cell
class CellInfo {
	var type: CellType
	
	
	var text: String?
	var image: UIImage?
	
	
	/// Initializer for the cell info as a text
	///
	/// - Parameter text: text to set the info
	init( text: String) {
		self.type = .text
		self.text = text
	}
	
	
	/// Initializer for the cell info as an iamge
	///
	/// - Parameter image: image to save
	init( image: UIImage) {
		self.type = .image
		self.image = image
	}
	
}
