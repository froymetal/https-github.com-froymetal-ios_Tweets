//
//  HomeViewController.swift
//  PlatziTweets
//
//  Created by Froy on 7/3/21.
//

import UIKit
import Simple_Networking
import SVProgressHUD
import NotificationBannerSwift

class HomeViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    //mark: PROPERTIES
    private let cellId = "TweetTableViewCell"
    
    private var dataSource = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        getPost()
    }
    //Funcion para el diseño de la tabla
    private func setupUI(){
        // 1. Asignar Datasource
        // 2. Registrar celda
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    //Funcion para traer datos del JSON
    
    private func getPost(){
        // Indicar carga al usuario
        SVProgressHUD.show()
        
        // Consumir el servicio. Endopoint es el URL que definimos en el otro archivo
        SN.get(endpoint: Endpoints.getPosts) { (response: SNResultWithEntity<[Post],ErrorResponse>) in
            //Cerramos icono de carga
            SVProgressHUD.dismiss()
            //Casos del enum SNResultWithEntity
            switch response {
            case  .success(let posts):
                //lo bueno
                self.dataSource = posts
                //recargar datos de la tabla
                self.tableView.reloadData()
                
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
 
    }
}

// MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource{
    //Numero total de celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        //castear la celda para traer del otro archivo
        if let cell = cell as? TweetTableViewCell {
            //configurar la tabla
            cell.setupCellWith(post: dataSource[indexPath.row])
        }
        return cell
    }
}
   
