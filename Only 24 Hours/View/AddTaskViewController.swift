//
//  AddTaskViewController.swift
//  Only 24 Hours
//
//  Created by Dauren Omarov on 10.12.2021.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet var titleTF: UITextField!
    @IBOutlet var detailTF: UITextField!
    @IBOutlet var fieldsCardView: UIView!
    @IBOutlet var notesCardView: UIView!
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cancelInput(sender:)))
        view.addGestureRecognizer(tap)
        
        fieldsCardView.layer.cornerRadius = 15
        notesCardView.layer.cornerRadius = 15
    }
    
    @IBAction func saveTaskPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelNewTask(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelInput(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}
