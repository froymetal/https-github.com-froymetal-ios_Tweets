//
//  RegisterViewController.swift
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

class RegisterViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var namesTextField: UITextField!

    //MARK: Actions
    @IBAction func registerButtonAction(){
        //funcion para quitar el teclado y quitar los focos de texto
        view.endEditing(true)
        //lamada a la funcion Register
        performRegister()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        //Redondear boton
        registerButton.layer.cornerRadius = 20
    }
    
    private func performRegister(){
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
        
        //validar nombres
        guard let names = namesTextField.text, !names.isEmpty else{
            NotificationBanner(title: "Error", subtitle: "Ingrese su nombre completo", style: .warning).show()
            return
        }
        
        //Crear request
        let request = RegisterRequest(email: email, password: password, names: names)
        
        //Indicar la carga al usuario
        SVProgressHUD.show()
        
        //Llamar al servicio
        
        SN.post(endpoint: Endpoints.register,
                model: request) { (response: SNResultWithEntity<LoginResponse, ErrorResponse>) in
            //Apagar la barra de carga
            SVProgressHUD.dismiss()
            //Casos del enum SNResultWithEntity
            switch response {
            case .success(let user):
                //lo bueno
                NotificationBanner(subtitle: "Bienvenido \(user.user.names)", style: .success).show()
                //Para seguir el segue
                self.performSegue(withIdentifier: "showHome", sender: nil)
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
        
        //Para seguir el segue
        //performSegue(withIdentifier: "showHome", sender: nil)
        
        //Iniciar Registro
        
    }
    
}
