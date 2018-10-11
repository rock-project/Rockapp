//
//  ViewController.swift
//  RockProj
//
//  Created by Felipe Izepe on 08/10/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

	// MARK: Outlets
	@IBOutlet weak var tableView: UITableView!
	
	
	// MARK: Properties
	var cells: [CellType] = [CellType]()
	var selectedView: UITextView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view, typically from a nib.
			self.tableView.rowHeight = UITableView.automaticDimension
			tableView.estimatedRowHeight = 30
		self.tableView.delegate = self
		self.cells.append(.text(text: ""))
		
	}

	@IBAction func addAction(_ sender: Any) {
		let alert = UIAlertController(title: "Adicionar", message: "", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Adicionar imagem", style: .default, handler: { (_) in
			self.cells.append(.image(image: TestConstants.TestNotes.imagem))
			self.cells.append(.text(text: ""))
			self.tableView.reloadData()
		}))
		alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
		self.present(alert, animated: true)
	}
	
}

// MARK: UITableViewDataSource Extension
extension NoteViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cells.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let item = cells[indexPath.row]
		switch item {
		case .text:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "textCell") as? TextCell else { return ParentCell ()}
			cell.setup(asset: item)
			cell.textField.delegate = self
			cell.delegate = self
			return cell
		case .image:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as? ImageCell else { return ParentCell ()}
			cell.setup(asset: item)
			return cell
			
		}
	}

	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		if let view = selectedView {
			view.becomeFirstResponder()
		}
	}
	
}

extension NoteViewController: UITableViewDelegate {}

extension NoteViewController: NewLineDelegate {
	func hasNewLine(view: UITextView) {
		self.tableView.reloadData()
		self.selectedView = view
	}
	
	
}


extension NoteViewController: UITextViewDelegate {

	func textViewDidChange(_ textView: UITextView) {
		tableView.beginUpdates()
		tableView.endUpdates()
	}

}
