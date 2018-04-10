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
    var askedQuestions = [Question]()
    var colors = [#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.719715476, green: 1, blue: 0.6779413223, alpha: 1)]
    
    var score = 0
    
    var disPlayedQuestion: Question?
   
    
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
        var questionAnswers =  questions.answer
        for i in 0...3 {
            var randomAnswer = Int(arc4random_uniform(UInt32(questionAnswers.count)))
            let randomColor = Int(arc4random_uniform(UInt32(colorArray.count)))
            
            
            switch i {
            case 0 :
                button1.setTitle(questionAnswers[randomAnswer], for: .normal)
                button1.backgroundColor = colorArray[randomColor]
            case 1:
                button2.setTitle(questionAnswers[randomAnswer], for: .normal)
                button2.backgroundColor = colorArray[randomColor]
            case 2:
                button3.setTitle(questionAnswers[randomAnswer], for: .normal)
                button3.backgroundColor = colorArray[randomColor]
            case 3:
                button4.setTitle(questionAnswers[randomAnswer], for: .normal)
                button4.backgroundColor = colorArray[randomColor]
            default:
                return
            }
            questionAnswers.remove(at: randomAnswer)
            colorArray.remove(at: randomColor)
            
        }
    }
    
    func generateQuestionText() {
          scoreLabel.text = "score:\(score)"
        let randomQuestionIndex = Int(arc4random_uniform(UInt32(questionArray.count)))
        var currentQuestion = questionArray[randomQuestionIndex]
        askedQuestions.append(currentQuestion)
        questionLabel.text = currentQuestion.questionText
        questionArray.remove(at:randomQuestionIndex)
        disPlayedQuestion = currentQuestion
        generateAnswerButtons(questions: currentQuestion, colorselection: colors)
    
    }
    
    func gameOver() {
        
        let alertView = UIAlertController(title: "Correct!", message: "You got the answer right, good job" , preferredStyle: .alert)
        
        let okAction = UIAlertAction( title: "Okey!", style: .default, handler: {action in
            self.questionArray = self.askedQuestions
            self.askedQuestions = []
            self.generateQuestionText()
        })
        alertView.addAction(okAction)
        
        self.present(alertView, animated: true, completion: nil)
        score = 0 
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
       let alertView = UIAlertController(title: "Resat!", message: "Are you sure ypu want resat the game?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes!", style: .default, handler: {action in
            
            self.questionArray = self.askedQuestions
            self.score = 0
            self.askedQuestions = []
            self.generateQuestionText()
            
        })
    let noAction = UIAlertAction(title: "No", style: .default, handler: {action in
        self.dismiss(animated: true, completion: nil)
    })
     alertView.addAction(yesAction)
        alertView.addAction(noAction)
    
    }
    
    
    @IBAction func answerButoonTapped(_ sender: Any) {
        
        let button = sender as! UIButton
        print(button.tag)
        if button.titleLabel?.text == disPlayedQuestion!.answer[(disPlayedQuestion!.correctanswer)] {
    let alertView = UIAlertController(title: "Correct!", message: "You got the answer right, good job" , preferredStyle: .alert)
           score += 1
            alertView.addAction(UIAlertAction(title:"okey!",style:.default))
            let okAction = UIAlertAction( title: "Okey!", style: .default, handler: {action in
            if self .questionArray.count != 0 {
                self.generateQuestionText()
            }else{
                self.gameOver()
            }
          })
                self.present(alertView,animated: true, completion: nil)
        } else {
            let alertView2 = UIAlertController(title: "wrong!", message: "you miss it!", preferredStyle: .alert)
        
            let okAction = UIAlertAction( title: "Okey!", style: .default, handler: {action in
                if self .questionArray.count != 0 {
                    self.generateQuestionText()
                }else{
                    self.gameOver()
                }
            })
            alertView2.addAction(okAction)
        self.present(alertView2,animated: true, completion: nil)
  
        }
 

}



}



