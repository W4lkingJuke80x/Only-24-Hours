//
//  AddGoalViewController.swift
//  Only 24 Hours
//
//  Created by Dauren Omarov on 10.12.2021.
//

import UIKit

class AddGoalViewController: UIViewController {
    
    @IBOutlet var titleTF: UITextField!
    @IBOutlet var detailTF: UITextField!
    @IBOutlet var fieldsCardView: UIView!
    @IBOutlet var notesCardView: UIView!
    @IBOutlet var fromTime: UIDatePicker!
    @IBOutlet var toTime: UIDatePicker!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cancelInput(sender:)))
        view.addGestureRecognizer(tap)
        
        fieldsCardView.layer.cornerRadius = 15
        notesCardView.layer.cornerRadius = 15
        
        print("\(fromTime.date)")
    }
    
    @IBAction func saveGoalPressed(_ sender: UIBarButtonItem) {
        
        formatter.timeStyle = .short
        formatter.dateFormat = "HH:mm"
        
        // Checking if all fields are not nil
        if let title = titleTF.text, let detail = detailTF.text {
            
            // Checking if textfields are not empty
            if title.isEmpty != true && detail.isEmpty != true {
                let newGoal = Goal(context: context)
                newGoal.title = title
                newGoal.detail = detail
                newGoal.from = formatter.string(from: fromTime.date)
                newGoal.to = formatter.string(from: toTime.date)
                
                do {
                    try self.context.save()
                } catch {
                    print("Saving error")
                }
                
            } else {
                print("Either title or details field is empty")
            }
        } else {
            print("TextFields found nil")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelNewGoal(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelInput(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}
