//
//  AddPostViewController.swift
//  PlatziTweets
//
//  Created by Luis Carlos Mejia Garcia on 22/01/20.
//  Copyright © 2020 Mejia Garcia. All rights reserved.
//

import UIKit
import Simple_Networking
import SVProgressHUD
import NotificationBannerSwift

class AddPostViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var previewImageView: UIImageView!
    
    // MARK: - IBActions
    @IBAction func addPostAction() {
        savePost()
    }

    //Funcion para abrir camara
    @IBAction func openCameraAction() {
        openCamera()
    }

    
    @IBAction func dismissAction() {
        dismiss(animated: true, completion: nil)
    }

    //MARK: PROPERTIES
    private var imagePicker: UIImagePickerController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func openCamera(){
        imagePicker = UIImagePickerController()
        imagePicker?.sourceType = .camera
        imagePicker?.cameraFlashMode = .off
        imagePicker?.cameraCaptureMode = .photo
        imagePicker?.allowsEditing = true
        imagePicker?.delegate = self

        guard let imagePicker = imagePicker else{return}

        present(imagePicker,animated: true,completion: nil)

    }
    
    private func savePost() {
        // 1. Crear request
        let request = PostRequest(text: postTextView.text, imageUrl: nil, videoUrl: nil, location: nil)
        
        // 2. Indicar carga al usuario
        SVProgressHUD.show()
        
        // 3. Llamar al servicio del post
        SN.post(endpoint: Endpoints.post,
                model: (request as? Codable)) { (response: SNResultWithEntity<Post, ErrorResponse>) in
            
            // 4. Cerrar indicador de carga
            SVProgressHUD.dismiss()
            
            switch response {
            case .success:
                self.dismiss(animated: true, completion: nil)
                
            case .error(let error):
                NotificationBanner(title: "Error",
                                   subtitle: error.localizedDescription,
                                   style: .danger).show()
                
            case .errorResult(let entity):
                NotificationBanner(title: "Error",
                                   subtitle: entity.error,
                                   style: .warning).show()
            }
            
        }
    }
}

// MARK: UIImagePickerControllerDelegate
extension AddPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
//Funcion que se dispara cuando el usuario termine de hacer la accion con la camara
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Cerrar camara
        imagePicker?.dismiss(animated: true, completion: nil)
        if info.keys.contains(.originalImage){
            previewImageView.isHidden = false
            //Obtenemos la imagen tomada
            previewImageView.image = info[.originalImage] as? UIImage
        }
    }
}
