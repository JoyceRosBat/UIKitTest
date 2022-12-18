//
//  MyCustomView.swift
//  TestUIKit
//
//  Created by Joyce Rosario Batista on 11/12/22.
//

import UIKit

//protocol MyCustomViewDelegate: AnyObject {
//    func clickOnMyButton()
//}

final class MyCustomView: UIView {
    // MARK: - Model
    struct Model {
        let labelText: String
        let buttonText: String
        let action: () -> Void
    }
    
    // MARK: - Views
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hola, soy un label"
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "highlighter")
        return imageView
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Soy un botón", for: .normal)
        button.setTitleColor(.cyan, for: .normal)
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            label,
            imageView,
            button
        ])
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: - Variables
    
//    weak var delegate: MyCustomViewDelegate?
    var model: Model?
    
    // MARK: - Initializers
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    // MARK: - Functions
    
    func initView() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(model: Model) {
        self.model = model
        label.text = model.labelText
        button.setTitle(model.buttonText, for: .normal)
    }
    
    @objc func onTap() {
        model?.action()
//        delegate?.clickOnMyButton()
    }
}
