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
    
    @IBOutlet weak var resetButtonTapped: UIButton!
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    
    var questionArray = [Question]()
    var colors = [#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)]
     var score = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        button1.layer.cornerRadius = 5
        button1.clipsToBounds = true
        
        button2.layer.cornerRadius = 5
        button2.clipsToBounds = true
        
        button3.layer.cornerRadius = 5
        button3.clipsToBounds = true
        
        button4.layer.cornerRadius = 5
        button4.clipsToBounds = true
        
        loadQuestions()
        generateQuestionText()
        
        addQuestionButton.layer.cornerRadius = 5
        addQuestionButton.clipsToBounds = true
         resetButtonTapped.layer.cornerRadius = 5
        
        scoreLabel.text = "score:\(score)"
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    func loadQuestions() {
        let question1 = Question(questionText: "what type of movie is The Hunger Game ?", answer: ["Adventure","Comedy", "Family","none"], correctanswer: 1)
      
        let question2 = Question(questionText: "20% of 2 equal to ", answer: [ "20", "4", "0.4", "0.04" ], correctanswer: 3)
        let question3 = Question(questionText: "what is the differnt between pant cell and animal cell?", answer: ["cell wall","Nucleus","Mitochndria","Plasma Membrane"], correctanswer: 1)
        
        questionArray.append(question1)
        questionArray.append(question2)
        questionArray.append(question3)
        
    }
    
   
    func generateAnswerButtons(questions: Question, colorselection:[UIColor]) {
        var colorArray = colorselection
        for i in 0...3 {
            var randomAnswer = Int(arc4random_uniform(UInt32(questions.answer.count)))
            let randomColor = Int(arc4random_uniform(UInt32(colorselection.count)))
            
            
            switch i {
            case 0 :
                button1.setTitle(questions.answer[randomAnswer], for: .normal)
                button1.backgroundColor = colorselection[randomColor]
            case 1:
                button2.setTitle(questions.answer[randomAnswer], for: .normal)
                button2.backgroundColor = colorselection[randomColor]
            case 2:
                button3.setTitle(questions.answer[randomAnswer], for: .normal)
                button3.backgroundColor = colorselection[randomColor]
            case 3:
                button4.setTitle(questions.answer[randomAnswer], for: .normal)
                button4.backgroundColor = colorselection[randomColor]
            default:
                return
            }
            questions.answer.remove(at: randomAnswer)
            colorArray.remove(at: randomColor)
        }
    }
    
    func generateQuestionText() {
        let randomQuestionIndex = Int(arc4random_uniform(UInt32(questionArray.count)))
        var currentQuestion = questionArray[randomQuestionIndex]
        questionLabel.text = currentQuestion.questionText
        generateAnswerButtons(questions: currentQuestion, colorselection: colors)
        
        
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func answerButoonTapped(_ sender: Any) {
        
        let button = sender as! UIButton
        print(button.tag)
        
    }
}







