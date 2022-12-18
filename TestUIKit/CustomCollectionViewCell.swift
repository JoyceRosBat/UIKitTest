//
//  CustomCollectionViewCell.swift
//  TestUIKit
//
//  Created by Joyce Rosario Batista on 17/12/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        String(describing: self)
    }
    
    struct Model {
        let imageName: String
        let text: String
        let backgroundColor: UIColor
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIView()
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let stackView = UIStackView(arrangedSubviews: [
            view,
            label
        ])
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    func initView() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setup(model: Model) {
        label.text = model.text
        imageView.image = UIImage(systemName: model.imageName)
        backgroundColor = model.backgroundColor
    }
}
