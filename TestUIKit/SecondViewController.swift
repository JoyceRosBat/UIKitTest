//
//  SecondViewController.swift
//  TestUIKit
//
//  Created by Joyce Rosario Batista on 11/12/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    let data: [CustomCollectionViewCell.Model] = [
        CustomCollectionViewCell.Model(imageName: "square.and.arrow.up", text: "Share", backgroundColor: .red),
        CustomCollectionViewCell.Model(imageName: "pencil", text: "Write", backgroundColor: .yellow),
        CustomCollectionViewCell.Model(imageName: "eraser.fill", text: "Remove", backgroundColor: .blue),
        CustomCollectionViewCell.Model(imageName: "eraser.fill", text: "Remove", backgroundColor: .green),
        CustomCollectionViewCell.Model(imageName: "eraser.fill", text: "Remove", backgroundColor: .gray),
        CustomCollectionViewCell.Model(imageName: "eraser.fill", text: "Remove", backgroundColor: .cyan),
        CustomCollectionViewCell.Model(imageName: "eraser.fill", text: "Remove", backgroundColor: .systemPink),
    ]
    
    let dataString = Array(repeating: "Dato", count: 100)
    
    let data2: [CustomCollectionViewCell.Model] = [
        CustomCollectionViewCell.Model(imageName: "star", text: "Estrellita", backgroundColor: .red),
        CustomCollectionViewCell.Model(imageName: "trash", text: "Borrar", backgroundColor: .blue)
    ]
    
    var sections: [Section] {
        [
            .collection(CollectionModel(cells: data)),
            .collection2(Collection2(cells: data2)),
            .strings(StringModel(cells: dataString))
        ]
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.register(MyCollectionViewCell.self, forCellReuseIdentifier: MyCollectionViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .strings(let model): return model.cells.count
        case .collection, .collection2: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .strings(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else { return UITableViewCell() }
            cell.setup(title: model.cells[indexPath.row])
            return cell
            
        case .collection(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell else { return UITableViewCell() }
            cell.configure(model.cells)
            return cell
            
        case .collection2(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell else { return UITableViewCell() }
            cell.configure(model.cells)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch sections[section] {
        case .collection2: return "Collection number 2"
        case .collection: return "Súper collection"
        case .strings: return "List"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CustomCell {
            print(cell.label.text)
        }
    }
}

extension SecondViewController {
    enum Section {
        case strings(StringModel)
        case collection(CollectionModel)
        case collection2(Collection2)
    }
    
    struct StringModel {
        let cells: [String]
    }
    
    struct CollectionModel {
        let cells: [CustomCollectionViewCell.Model]
    }
    
    struct Collection2 {
        let cells: [CustomCollectionViewCell.Model]
    }
}
