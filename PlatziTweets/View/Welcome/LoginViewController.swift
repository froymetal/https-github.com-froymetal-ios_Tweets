//
//  LoginViewController.swift
//  PlatziTweets
//
//  Created by Field Employee on 6/30/21.
//

import UIKit
import NotificationBannerSwift
//Para hacer conexiones
import Simple_Networking
//para mostrar indicadores de carga al usuario
import SVProgressHUD


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
        //Imokantar el request
        let request = LoginRequest(email: email, password: password)
        //Icono de carga
        SVProgressHUD.show()
        // Llamar a  libreria de Red
        SN.post(endpoint: Endpoints.login,
                model: request) { (response: SNResultWithEntity<LoginResponse, ErrorResponse>) in
            //Apagar la barra de carga
            SVProgressHUD.dismiss()
            //Casos del enum SNResultWithEntity
            switch response {
            case .success(let user):
                //lo bueno
                //NotificationBanner(subtitle: "Bienvenido \(user.user.names)", style: .success).show()
                //Para seguir el segue
                self.performSegue(withIdentifier: "showHome", sender: nil)
                //dar la autorizacion al usuario
                SimpleNetworking.setAuthenticationHeader(prefix: "", token: user.token)
            case .error(let error):
                //lo malo
                NotificationBanner(title: "Error" ,subtitle: error.localizedDescription, style: .danger).show()
                return
            case .errorResult(let entity):
                //error controlado
                NotificationBanner(title: "Error" ,subtitle: entity.error, style: .warning).show()
                return
            }
        }
        
        // Iniciar sesion aqui
        
        
    }
}
