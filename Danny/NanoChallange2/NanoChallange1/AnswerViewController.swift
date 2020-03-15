//
//  AnswerViewController.swift
//  NanoChallange1
//
//  Created by danny santoso on 14/03/20.
//  Copyright © 2020 danny santoso. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    
    
    var aBtn = ""
    var bBtn = ""
    var cBtn = ""
    var dBtn = ""
    
    
    var benar = 0
    var salah = 0
    var jumlah = 0
    
    
    var questionArray: [QuestionEntity] = []
    var questionObject: [QuestionEntity] = []{
        didSet{
            questionArray = questionObject
        }
    }
    
    var total = 0
    
    var correct_answer = ""
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    
    @IBOutlet weak var buttonC: UIButton!
    
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var questionTextView: UITextView!

    @IBOutlet weak var btnDone: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        let nav = self.navigationController?.navigationBar
        

        nav?.barTintColor = ViewController().hexStringToUIColor(hex: "5E65FF")
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let array = [buttonA,buttonB,buttonC,buttonD,btnDone]
        
        for a in array {
            a?.layer.cornerRadius = 10
        }
        
        
        
        btnDone.isHidden = true
        
        
        loadData()
        
    }
    
    func jumlahSoal(){
        total = questionArray.count
        totalLbl.text = "\(jumlah+1)/\(total)"
    }
    
    func loadData(){
        jumlahSoal()
        
            questionTextView.text = questionArray[jumlah].question
            buttonA.setTitle(questionArray[jumlah].a, for: .normal)
            buttonB.setTitle(questionArray[jumlah].b, for: .normal)
            buttonC.setTitle(questionArray[jumlah].c, for: .normal)
            buttonD.setTitle(questionArray[jumlah].d, for: .normal)
            correct_answer = questionArray[jumlah].correct
            aBtn = questionArray[jumlah].a
            bBtn = questionArray[jumlah].b
            cBtn = questionArray[jumlah].c
            dBtn = questionArray[jumlah].d
        
    }

    

    func correctAnswer(){
          let alert = UIAlertController(title: "Correct Answer", message: "Your answer is correct", preferredStyle: .alert)
          let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
          alert.addAction(action)
          self.present(alert, animated: true, completion: nil)
        jumlah += 1
        benar += 1
        if jumlah == total {
            btnDone.isHidden = false
            
            let buttonChoice = [buttonA,buttonB,buttonC,buttonD]
            
            for a in buttonChoice {
                a?.isEnabled = false
            }
        }else{
                loadData()
        }
        
      }
      
      func falseAnswer(){
          let alert = UIAlertController(title: "False Answer", message: "Your answer is false, the answer is "+correct_answer, preferredStyle: .alert)
          let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
          alert.addAction(action)
          self.present(alert, animated: true, completion: nil)
        jumlah += 1
        salah += 1
        if jumlah == total {
            btnDone.isHidden = false
            
            let buttonChoice = [buttonA,buttonB,buttonC,buttonD]
            
            for a in buttonChoice {
                a?.isEnabled = false
            }
            
            
        }else{
                loadData()
        }
      }
      
      //answer page
      
      @IBAction func buttonA(_ sender: Any) {
          if aBtn.caseInsensitiveCompare(correct_answer) == .orderedSame {
              correctAnswer()
          }else{
              falseAnswer()
          }
    
          
          
          
          
      }
      
      
      @IBAction func buttonB(_ sender: Any) {
          if bBtn.caseInsensitiveCompare(correct_answer) == .orderedSame {
              correctAnswer()
          }else{
              falseAnswer()
          }
         
        
      }
      
      @IBAction func buttonC(_ sender: Any) {
          if cBtn.caseInsensitiveCompare(correct_answer) == .orderedSame {
              correctAnswer()
          }else{
              falseAnswer()
          }
          
          
      }
      
      @IBAction func buttonD(_ sender: Any) {
          if dBtn.caseInsensitiveCompare(correct_answer) == .orderedSame {
              correctAnswer()
          }else{
              falseAnswer()
          }
          
          
      }
    @IBAction func btnDone(_ sender: Any) {
        
        let alert = UIAlertController(title: "Question Done", message: "Correct Answer : \(benar) \n Wrong Answer : \(salah)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        jumlah = 0
        benar = 0
        salah = 0
        
        questionArray.removeAll()
        
    }
    
    
    
}
