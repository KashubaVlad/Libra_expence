//
//  AddExpences.swift
//  Libra расходы
//
//  Created by Vlad on 23.05.2022.
//

import Foundation
import UIKit

class AddExpences: UIViewController {
    
    @IBOutlet weak var expenceNameLabel: UILabel!
    @IBOutlet weak var expenceNameTextField: UITextField!
    
    @IBOutlet weak var expencePriceLabel: UILabel!
    @IBOutlet weak var expencePriceTextField: UITextField!
    
    @IBOutlet weak var expenceDateLabe: UILabel!
    
    @IBOutlet weak var expenceDateTextField: UITextField!
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var expenceNotesLabel: UILabel!
    @IBOutlet weak var expenceNotesTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
    }
    
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        expenceDateTextField.inputAccessoryView = toolbar
        expenceDateTextField.inputView = datePicker
        toolbar.setItems([flexSpace,doneButton], animated: true)
    }
    
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        ///        formatter.dateFormat = "dd.MMM.yyyy"
        
        expenceDateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func expenceAddPhotoButtonClicked(_ sender: Any) {
        let imgPick = UIImagePickerController()
        imgPick.sourceType = .photoLibrary
        imgPick.delegate = self
        imgPick.allowsEditing = true
        present(imgPick, animated: true)
    }
    
    var delegate: AddItemDelegate?
    var pickture: UIImage?
    
    @IBAction func saveCklicked(_ sender: UIButton) {
        let name = expenceNameTextField.text ?? " "
        let price = Int(expencePriceTextField.text ?? " ") ?? 0
        let notes = expenceNotesTextField.text ?? " "
        ///        let date = expenceDateTextField.text
        
        let defaultImg = UIImage(named: "image-3")
        var image: UIImage{
            if pickture != nil {
                return pickture!
            } else {
                return defaultImg!
            }
        }
        
        let newItem = Item(name: name, price: price, image: image, notes: notes)
        
        delegate?.addItemToArrey(self, didAddItem: newItem)
        dismiss(animated: true, completion: nil)
    }
}

extension AddExpences: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
                               info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            pickture = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


