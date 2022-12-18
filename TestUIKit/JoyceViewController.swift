//
//  JoyceViewController.swift
//  TestUIKit
//
//  Created by Joyce Rosario Batista on 10/12/22.
//

import Foundation
import UIKit

class JoyceViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var otroLabel: UILabel!
    @IBOutlet weak var searchBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItems?.append(UIBarButtonItem(image: UIImage(systemName: "scribble"), style: .plain, target: self, action: #selector(scribble)))
        
        searchBarButtonItem.action = #selector(search)
        
        let text = "Hola, qué tal, me llamo Joyce"
        let attributed = NSAttributedString(string: text)
        let nsText = NSString(string: text)
        let range = nsText.range(of: "Joyce")
        
        let mutableAttString = NSMutableAttributedString(attributedString: attributed)
//        mutableAttString.addAttribute(.font, value: UIFont.italicSystemFont(ofSize: 10), range: range)
        mutableAttString.addAttributes([.font: UIFont.italicSystemFont(ofSize: 10),
                                        .foregroundColor: UIColor.red,
                                        .underlineStyle: NSUnderlineStyle.single], range: range)
        
        myLabel.attributedText = mutableAttString
        myLabel.numberOfLines = 0
        
        myLabel.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        myLabel.addGestureRecognizer(tap)
        
        mySwitch.onTintColor = .purple
        mySwitch.isOn = false
        
        addStackView()
        navigate()
    }
    
    func navigate() {
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOnImage)))
    }
    
    func addStackView() {
        
//        let label = UILabel()
//        label.textColor = .red
//        label.text = "Test label"
//
//        let button = UIButton()
//        button.setTitle("Touch", for: .normal)
//        button.setTitleColor(.magenta, for: .normal)
//        button.addTarget(self, action: #selector(onTapMyProgramaticallyButton(_:)), for: .touchUpInside)
//
//        let textField = UITextField()
//        textField.placeholder = "Escribe algo..."
//        textField.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
//
//        let stackView = UIStackView(arrangedSubviews: [
//            textField,
//            label,
//            button
//        ])
//        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let myCustomView = MyCustomView()
        myCustomView.configure(model: MyCustomView.Model(
            labelText: "Label desde Viewcontroller",
            buttonText: "Button desde viewController",
            action: {
                print("He pulsado el botón!!")
            })
        )
//        myCustomView.delegate = self
        myCustomView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(myCustomView)
        
        NSLayoutConstraint.activate([
            myCustomView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            myCustomView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            myCustomView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            myCustomView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    @IBAction func onTouchMyButton(_ sender: Any) {
        print("He pulsado el botón")
    }
    
    @objc func onTap() {
        print("He tapeado!")
    }
    
    @objc func onTapMyProgramaticallyButton(_ button: UIButton) {
        button.setTitleColor(.green, for: .normal)
        print("He pulsado mi botón programático")
    }
    
    @objc func textfieldDidChange(_ textfield: UITextField) {
        if textfield == myTextField {
            print("Bu")
        } else {
            print(textfield.text)
        }
    }
    
    @objc func tapOnImage() {
//        performSegue(withIdentifier: "MySecondViewController", sender: nil)
        
        let viewController = SecondViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func search() {
        print("Search")
    }
    
    @objc func scribble() {
        print("scribble")
    }
}

//extension JoyceViewController: MyCustomViewDelegate {
//    func clickOnMyButton() {
//        print("push")
//    }
//}
