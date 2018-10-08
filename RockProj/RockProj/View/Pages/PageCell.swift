//
//  TextCell.swift
//  RockProj
//
//  Created by Felipe Izepe on 08/10/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation
import UIKit


enum CellType {
	case text(text: String)
	case image(image: UIImage)
}

class ParentCell: UITableViewCell {
	var type:CellType!
	
	func setup(asset: CellType) {
		self.type = asset
	}
	
}

class textCell: ParentCell {
	@IBOutlet var textField: UITextView!
	
}

class imageCell: ParentCell {
	@IBOutlet var imageV: UIImageView!
	
	override func setup(asset: CellType) {
		super.setup(asset: asset)
		switch asset {
		case .image(let img):
			self.imageV.image = img
		default:
			return
		}
	}
}
