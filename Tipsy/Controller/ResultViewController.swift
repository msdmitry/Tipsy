//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Dmitry M. on 7/15/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    var tpp: String?
    var message: String?
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.text = message
        resultLabel.text = tpp
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)

    }
    
    

}
