//
//  LoginViewController.swift
//  PlatziTweets
//
//  Created by Field Employee on 6/30/21.
//

import UIKit
import NotificationBannerSwift

class LoginViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: Actions
    @IBAction func loginButtonAction(){
        //funcion para quitar el teclado y quitar los focos de texto
        view.endEditing(true)
        //Llamada a la funcion Login
        performLogin()
    }
    
    //MARK: LOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    //MARK: private functions
    //funcion para aspecto de elementos
    private func setupUI() {
        //Redondear boton
        loginButton.layer.cornerRadius = 20
    }
    
    //función para dar un error si se ha ingresado mal el mail o pass
    private func performLogin(){
        //validar email
        guard let email = emailTextField.text, !email.isEmpty else{
            NotificationBanner(title: "Error", subtitle: "Correo Inválido", style: .warning).show()
            return
        }
        //validar password
        guard let password = passwordTextField.text, !password.isEmpty else{
            NotificationBanner(title: "Error", subtitle: "Ingrese un Password", style: .warning).show()
            return
        }
        //Para seguir el segue
        performSegue(withIdentifier: "showHome", sender: nil)
        // Iniciar sesion aqui
        
        
    }
}
