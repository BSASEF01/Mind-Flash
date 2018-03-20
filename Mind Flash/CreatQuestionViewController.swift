//
//  CreatQuestionViewController.swift
//  Mind Flash
//
//  Created by Bersabeh Asefa on 3/19/18.
//  Copyright © 2018 Bersabeh Asefa. All rights reserved.
//

import UIKit

class CreatQuestionViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    
    
    @IBOutlet weak var cancelButton: UIButton!
    
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerATextField: UITextField!
    
    @IBOutlet weak var answerBTextField: UITextField!
    
    @IBOutlet weak var answerCtextField: UITextField!
    
    @IBOutlet weak var answerDTextField: UITextField!
    
    @IBOutlet weak var correctAnswerController: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @IBAction func cancelBUttonTapped(_ sender: Any) {
    
    self.dismiss(animated: true)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
    }
}
