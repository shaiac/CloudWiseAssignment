//
//  ViewController.swift
//  CloudWiseAssignment
//
//  Created by user on 16/04/2022.
//

import UIKit

class HomeViewController: UIViewController {
    var responseStr : String = "Shai Acoca"
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Response Data:"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        
        return label
    }()
    
    private let responseLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.backgroundColor = .black
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        label.numberOfLines = 8
        
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTopView()
        setupResponseText()
    }
    
    private func setupTopView() {
        view.addSubview(topView)
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setupResponseText() {
        
        responseLabel.text = responseStr
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, responseLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //add stack view as subview to main view with AutoLayout
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 40).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
    }
    
    
}

