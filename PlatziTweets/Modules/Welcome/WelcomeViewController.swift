//
//  WelcomeViewController.swift
//  PlatziTweets
//
//  Created by Froy on 6/30/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    private func setupUI() {
        //Redondear boton
        loginButton.layer.cornerRadius = 20
    }
    

}
