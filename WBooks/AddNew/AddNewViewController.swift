//
//  AddNewViewController.swift
//  WBooks
//
//  Created by daniel.f.munoz on 19/08/21.
//

import UIKit

class AddNewViewController: UIViewController {
    
    private lazy var addNewView = AddNewView()
    private let addNewViewModel: AddNewViewModel
    
    init(addNewViewModel: AddNewViewModel) {
        self.addNewViewModel = addNewViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        navigationController?.navigationBar.topItem?.title = NSLocalizedString("TITLE_ADDNEW", comment: "")
    }
    
    override func loadView() {
        view = addNewView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addNewView.submitButton.withGradient()
        setupTextField()
    }
    
    func setupTextField(){
        addNewView.bookNameTextField.config()
        addNewView.authorTextField.config()
        addNewView.yearTextField.config()
        addNewView.topicTextField.config()
        addNewView.descriptionTextField.config()
    }
    
    func setupActions(){
        addNewView.addImageButton.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        addNewView.submitButton.addTarget(self, action: #selector(validateAddBook), for: .touchUpInside)
    }
    
    @objc func selectImage(){
        let alertController = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let chooseAction = UIAlertAction(title: NSLocalizedString("OPTION_GALLERY", comment: ""), style: .default) { _ in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: .none)
        }
        alertController.addAction(chooseAction)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let takeAction = UIAlertAction(title: NSLocalizedString("OPTION_CAMERA", comment: ""), style: .default) { _ in
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: .none)
            }
            alertController.addAction(takeAction)
        }
        let cancelAction = UIAlertAction(title: NSLocalizedString("OPTION_CANCEL", comment: ""), style: .cancel, handler: .none)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func validateAddBook() {
        if isEmpyForm() {
            addNewViewModel.setParametersBook(
                title: addNewView.bookNameTextField.text ?? "",
                author: addNewView.authorTextField.text ?? "",
                genre: addNewView.topicTextField.text ?? "",
                year: addNewView.yearTextField.text ?? "")
            addBook()
        } else {
            self.showAlert(title: NSLocalizedString("TITLE_ERROR", comment: ""),
                           message: NSLocalizedString("ERROR_EMPY_TEXTFLIED", comment: ""),
                           buttonDone: NSLocalizedString("BUTTON_DONE", comment: ""))
        }
    }
    
    func addBook()  {
        addNewViewModel.addNewBook() { error in
            if error == nil {
                self.cleanForm()
                self.showAlert(title: NSLocalizedString("TITLE_INFORMATION", comment: ""),
                               message: NSLocalizedString("ADDBOOK_SUCCESS", comment: ""),
                               buttonDone: NSLocalizedString("BUTTON_DONE", comment: ""))
            } else {
                self.cleanForm()
                self.showAlert(title: NSLocalizedString("TITLE_ERROR", comment: ""),
                               message: NSLocalizedString("ERROR_ADDBOOK", comment: ""),
                               buttonDone: NSLocalizedString("BUTTON_DONE", comment: ""))
            }
        }
    }
    
    func isEmpyForm() -> Bool {
        return addNewView.bookNameTextField.isValidValue() && addNewView.authorTextField.isValidValue() && addNewView.yearTextField.isValidValue() && addNewView.topicTextField.isValidValue() && addNewView.descriptionTextField.isValidValue()
    }
    
    func showAlert(title: String, message: String, buttonDone: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonDone, style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func cleanForm() {
        addNewView.bookNameTextField.text?.removeAll()
        addNewView.authorTextField.text?.removeAll()
        addNewView.yearTextField.text?.removeAll()
        addNewView.topicTextField.text?.removeAll()
        addNewView.descriptionTextField.text?.removeAll()
    }

}

extension AddNewViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        addNewView.addImageButton.setBackgroundImage(image, for: .normal)
        picker.dismiss(animated: true, completion: nil)
    }
    
}
