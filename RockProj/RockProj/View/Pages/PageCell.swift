//
//  TextCell.swift
//  RockProj
//
//  Created by Felipe Izepe on 08/10/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation
import UIKit


protocol NewLineDelegate {
	func hasNewLine(view: UITextView)
}

/// Enum that defines cell type
///
/// - text: text in case is a text cell
/// - image: iamge in case is a image cell
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

class TextCell: ParentCell {
	@IBOutlet var textField: UITextView!
	var previousRect: CGRect = CGRect.zero
	var delegate:NewLineDelegate?
	
	override func setup(asset: CellType) {
		super.setup(asset: asset)
	}

}

class ImageCell: ParentCell {
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
