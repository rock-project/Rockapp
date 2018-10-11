//
//  TextCell.swift
//  RockProj
//
//  Created by Felipe Izepe on 08/10/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation
import UIKit


/// Delegate that is triggered whenever a textview has somethong typed inside of it
protocol TextViewUpdateDelegate {
	
	/// Sends a signal to update the info in the main view
	///
	/// - Parameters:
	///   - index: index of the information in the main view array
	///   - text: new text of the table view
	func update(index: Int, text: String)
}




class ParentCell: UITableViewCell {
	var index: Int!
}

/// Cell that deals with text class
class TextCell: ParentCell {
	@IBOutlet var textField: UITextView!
	var previousRect: CGRect = CGRect.zero
	var delegate:TextViewUpdateDelegate?
	
	func setup(text: String, index: Int) {
		self.textField.text = text
		self.textField.delegate = self
		self.index = index
	}

}

/// Cell that deals with images class
class ImageCell: ParentCell {
	@IBOutlet var imageV: UIImageView!
	
	func setup(image: UIImage, index: Int) {
		self.imageV.image = image
		self.index = index
		
	}
}


// MARK: - Delegate for the textview in the TextCell
extension TextCell: UITextViewDelegate {
	func textViewDidChange(_ textView: UITextView) {
		if let delegate = self.delegate {
			delegate.update(index: self.index, text: textView.text)
			
		}
	}
}
