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
    
    var dogsGuard: [Breed] = [] { didSet{
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
            }
    }
    
    
    
    
    
    var dogsImageGuard: [URL] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViewsAndConstraints()
       

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
    //Criando minha tableView
    
    lazy var tableView: UITableView = {
        let tabView = UITableView()
        tabView.dataSource = self
        tabView.delegate = self
        tabView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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

extension ChallengeView: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dogsGuard.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            fatalError()
        }
        cell.textLabel?.text = dogsGuard[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let navDoController = UINavigationController(rootViewController: ChallengeViewController())
        let cellInstanciada = dogsGuard[indexPath.row].name
        
        let alert = UIAlertController(title: "Dogs Selecionado", message: cellInstanciada, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        navDoController.present(alert, animated: true, completion: nil)
        

        
        
        
    }
    

    
    
    
}
    

    
    
    
    
    
    





