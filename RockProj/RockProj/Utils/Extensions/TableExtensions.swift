//
//  TableExtensions.swift
//  RockProj
//
//  Created by Felipe Izepe on 11/10/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation
import UIKit


// MARK: - Extensions for the UITableView
extension UITableView {
	
	
	/// Causes table view to scroll to the bottom
	func scrollToBottom(){
		
		let rows = self.numberOfRows(inSection: self.numberOfSections - 1) - 1
		let sections = self.numberOfSections - 1
		
		DispatchQueue.main.async {
			let indexPath = IndexPath(row: rows, section: sections)
			self.scrollToRow(at: indexPath, at: .bottom, animated: false)
		}
	}
	
	/// Causes table view to scroll to the top
	func scrollToTop() {
		
		DispatchQueue.main.async {
			let indexPath = IndexPath(row: 0, section: 0)
			self.scrollToRow(at: indexPath, at: .top, animated: false)
		}
	}
}
