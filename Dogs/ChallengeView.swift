//
//  ChallengeView.swift
//  Dogs
//
//  Created by Guilherme Delfino on 07/02/24.
//

import Foundation
import UIKit
import DogsApi

class ChallengeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViewsAndConstraints()
        let service = HttpDogsService()
                service.getBreeds { result in
                    switch result {
                    case .success(let breeds):
                        self.dogsGuard = breeds
                    case .failure(let error):
                        break
                    }
                }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dogsGuard: [Breed] = [] { didSet{
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
            }
    }
    
    
    
    //Criando minha tableView
    
    lazy var tableView: UITableView = {
        let tabView = UITableView()
        tabView.dataSource = self
        tabView.translatesAutoresizingMaskIntoConstraints = false
        return tabView
    }()
    
    //Add minha tableview criada nesta função junto com as constraints para lançar tudo junto na view
    
    func addViewsAndConstraints() {
        
        addSubview(tableView)
        
        // setando minhas constraints
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        ])
        
        
        
    }
}

extension ChallengeView: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dogsGuard.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cells")
        cell.textLabel?.text = dogsGuard[indexPath.row].name
        return cell
    }
    
    
    
    
}




