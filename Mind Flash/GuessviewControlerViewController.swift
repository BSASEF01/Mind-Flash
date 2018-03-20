//
//  GuessviewControlerViewController.swift
//  Mind Flash
//
//  Created by Bersabeh Asefa on 3/19/18.
//  Copyright © 2018 Bersabeh Asefa. All rights reserved.
//

import UIKit

class GuessviewControlerViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var addQuestionButton: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var questionArray = [Question]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    func loadQuestions() {
        let question1 = Question(question: "what type of movie is The Hunger Game ?", answer: ["Adventure","Comedy", "Family","none"], correctanswer: 1)
        let question2 = Question(question: "20% of 2 equal to ", answer: [ "20", "4", "0.4", "0.04" ], correctanswer: 3)
        let question3 = Question(question: "what is the differnt between pant cell and animal cell?", answer: ["cell wall","Nucleus","Mitochndria","Plasma Membrane"], correctanswer: 1)
        
        questionArray.append(question1)
        
        }
    
    
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func answerButoonTapped(_ sender: Any) {
        
        let button = sender as! UIButton
        print(button.tag)
        
    }
}







