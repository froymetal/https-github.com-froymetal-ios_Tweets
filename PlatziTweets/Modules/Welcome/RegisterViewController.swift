//
//  RegisterViewController.swift
//  PlatziTweets
//
//  Created by Field Employee on 6/30/21.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        //Redondear boton
        registerButton.layer.cornerRadius = 20
    }
}
