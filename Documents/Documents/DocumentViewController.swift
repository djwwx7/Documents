//
//  DocumentViewController.swift
//  Documents
//
//  Created by Cody Whitaker on 6/22/18.
//  Copyright © 2018 Cody Whitaker. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {

    var document: Document?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let document = document {
            documentTextView.text = document.content ?? ""
            nameTextField.text = document.name
            
            title = document.name
        } else {
            title = ""
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func nameChanged(_ sender: Any) {
        title = nameTextField.text
    }
    
    @IBAction func save(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        
        Documents.save(name: name, content: documentTextView.text)
        
        navigationController?.popViewController(animated: true)
    }

}
