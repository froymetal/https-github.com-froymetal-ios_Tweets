//
//  AddPostViewController.swift
//  PlatziTweets
//
//  Created by Field Employee on 7/4/21.
//

import UIKit

class AddPostViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var postTextView: UITextView!
    
    //MARK: Actions
    @IBAction func addPostAction(){
        
    }
    
    @IBAction func dismissAction(){
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
