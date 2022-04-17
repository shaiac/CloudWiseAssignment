//
//  FormViewController.swift
//  CloudWiseAssignment
//
//  Created by user on 16/04/2022.
//

import UIKit

class FormViewController: UIViewController {
    
    private let userData: UserData = UserData()
    private var validations : [Bool] = [false, false, false, true, false, false]
    
    // UI Elements
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please fill the following form"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let fullNameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter Full Name*"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.1)
        tf.font = UIFont.systemFont(ofSize: 16)
        
        //border
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.white.cgColor
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 5
        
        tf.addTarget(self, action: #selector(handleFullNameTextChange), for: .editingChanged)
        return tf
        
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter Email*"
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor(white: 0, alpha: 0.1)
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.keyboardType = .emailAddress
        
        //border
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.white.cgColor
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 5
        
        tf.addTarget(self, action: #selector(handleEmailTextChange), for: .editingChanged)
        return tf
        
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter Password*"
        tf.isSecureTextEntry = true
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor(white: 0, alpha: 0.1)
        tf.font = UIFont.systemFont(ofSize: 16)
        
        //border
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.white.cgColor
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 5
        
        tf.addTarget(self, action: #selector(handlePasswordTextChange), for: .editingChanged)
        return tf
        
    }()
    
    private let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter Phone Number"
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor(white: 0, alpha: 0.1)
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.keyboardType = .phonePad
        
        //border
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.white.cgColor
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 5
        
        tf.addTarget(self, action: #selector(handlePhoneTextChange), for: .editingChanged)
        return tf
        
    }()
    
    private let vehicleNumTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter Vehicle Number*"
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor(white: 0, alpha: 0.1)
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.keyboardType = .decimalPad
        
        //border
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.white.cgColor
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 5
        
        tf.addTarget(self, action: #selector(handleVeichleTextChange), for: .editingChanged)
        return tf
        
    }()
    
    private let fuelTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter Fuel Consupmtion (Liter/KM)*"
        tf.borderStyle = .roundedRect
        tf.backgroundColor = UIColor(white: 0, alpha: 0.1)
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.keyboardType = .decimalPad
        
        //border
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.white.cgColor
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 5
        
        tf.addTarget(self, action: #selector(handleFuelTextChange), for: .editingChanged)
        return tf
        
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.layoutMargins = UIEdgeInsets.init(top:50, left:0, bottom:0, right:0)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.lightGray
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        return button
    }()
    
    private let clearFormButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear All", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(handleClearForm), for: .touchUpInside)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupTopView()
        setupTextFields()
    }
    
    //setting up the view
    
    private func setupTopView() {
        view.addSubview(topView)
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setupTextFields() {
        fullNameTextField.text = userData.user.fullName
        emailTextField.text = userData.user.email
        passwordTextField.text = userData.user.password
        phoneTextField.text = userData.user.phone
        vehicleNumTextField.text = userData.user.vehiclenumber
        if (userData.user.fuelConsumtion == 0.0) {
            fuelTextField.text = ""
        } else {
            fuelTextField.text = String(userData.user.fuelConsumtion)
        }
        
        //Calling the handles for the case the old form data is loaded from local memory
        handleFullNameTextChange(isInit: true)
        handleEmailTextChange(isInit: true)
        handlePasswordTextChange(isInit: true)
        handlePhoneTextChange(isInit: true)
        handleVeichleTextChange(isInit: true)
        handleFuelTextChange(isInit: true)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, fullNameTextField, emailTextField, passwordTextField, phoneTextField, vehicleNumTextField, fuelTextField, signUpButton, clearFormButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.setCustomSpacing(50, after: fuelTextField)
        
        //add stack view as subview to main view with AutoLayout
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 40).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 550).isActive = true
        
    }
    
    //buttons functions
    
    @objc func handleClearForm() {
        //reseting the text
        fullNameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
        phoneTextField.text = ""
        vehicleNumTextField.text = ""
        fuelTextField.text = ""
        
        //reseting the color
        fullNameTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        phoneTextField.layer.borderColor = UIColor.white.cgColor
        vehicleNumTextField.layer.borderColor = UIColor.white.cgColor
        fuelTextField.layer.borderColor = UIColor.white.cgColor
        
        userData.user = User()
        userData.save()
    }
    
    //textfields end typing functions
    
    @objc func handleFullNameTextChange(isInit : Bool = false) {
        //saving the data on change
        let name = fullNameTextField.text!
        if name.count > 3 && name.contains(" ") {
            fullNameTextField.layer.borderColor = UIColor.green.cgColor
            validations[0] = true
        } else if isInit && name.isEmpty {
            fullNameTextField.layer.borderColor = UIColor.white.cgColor
        } else {
            fullNameTextField.layer.borderColor = UIColor.red.cgColor
            validations[0] = false
        }
        userData.user.fullName = name
        userData.save()
        checkIfFormFilled()
    }
    
    @objc func handleEmailTextChange(isInit : Bool = false) {
        //saving the data on change
        let email = emailTextField.text!
        if email.isValidEmail {
            emailTextField.layer.borderColor = UIColor.green.cgColor
            validations[1] = true
        } else if isInit && email.isEmpty {
            emailTextField.layer.borderColor = UIColor.white.cgColor
        } else {
            emailTextField.layer.borderColor = UIColor.red.cgColor
            validations[1] = false
        }
        userData.user.email = email
        userData.save()
        checkIfFormFilled()
    }
    
    @objc func handlePasswordTextChange(isInit : Bool = false) {
        //saving the data on change
        let password = passwordTextField.text!
        if password.count > 5 {
            passwordTextField.layer.borderColor = UIColor.green.cgColor
            validations[2] = true
        } else if isInit && password.isEmpty {
            passwordTextField.layer.borderColor = UIColor.white.cgColor
        } else {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            validations[2] = false
        }
        userData.user.password = password
        userData.save()
        checkIfFormFilled()
    }
    
    @objc func handlePhoneTextChange(isInit : Bool = false) {
        //saving the data on change
        //In real app cheking the phone format according to the country
        let phone = phoneTextField.text!
        userData.user.phone = phone
        userData.save()
        if isInit && phone.isEmpty {
            phoneTextField.layer.borderColor = UIColor.white.cgColor
        } else {
            phoneTextField.layer.borderColor = UIColor.green.cgColor
        }
        
        checkIfFormFilled()
    }
    
    @objc func handleVeichleTextChange(isInit : Bool = false) {
        //saving the data on change
        let vehicleNum = vehicleNumTextField.text!
        //Plate number length in Israel
        if vehicleNum.count == 7 || vehicleNum.count == 8 {
            vehicleNumTextField.layer.borderColor = UIColor.green.cgColor
            validations[4] = true
        } else if isInit && vehicleNum.isEmpty {
            vehicleNumTextField.layer.borderColor = UIColor.white.cgColor
        } else {
            vehicleNumTextField.layer.borderColor = UIColor.red.cgColor
            validations[4] = false
        }
        userData.user.vehiclenumber = vehicleNum
        userData.save()
        checkIfFormFilled()
    }
    
    @objc func handleFuelTextChange(isInit : Bool = false) {
        //saving the data on change
        let fuel = fuelTextField.text!
        if fuel.doubleValue != nil {
            fuelTextField.layer.borderColor = UIColor.green.cgColor
            userData.user.fuelConsumtion = Float(fuel.doubleValue!)
            userData.save()
            validations[5] = true
        } else if isInit && fuel.isEmpty {
            fuelTextField.layer.borderColor = UIColor.white.cgColor
        } else {
            userData.user.fuelConsumtion = 0.0
            userData.save()
            fuelTextField.layer.borderColor = UIColor.red.cgColor
            validations[5] = false
        }
        checkIfFormFilled()
    }
    
    private func checkIfFormFilled() {
        let isFormFilled = !validations.contains(false)
        //enabling the signup button
        if isFormFilled {
            signUpButton.backgroundColor = UIColor.green
            signUpButton.isEnabled = true
        } else {
            signUpButton.backgroundColor = UIColor.lightGray
            signUpButton.isEnabled = false
        }
    }
    
    @objc func handleSignUp() {
        HttpManager.shared.httpPost(userData, completion: {
            response in
            
            DispatchQueue.main.async {
                let homeVC = HomeViewController()
                homeVC.responseStr = response
                homeVC.modalPresentationStyle = .fullScreen
                self.present(homeVC, animated: true)
            }
        })
    }
    
}
