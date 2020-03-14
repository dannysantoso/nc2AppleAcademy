//
//  ViewController.swift
//  NanoChallange1
//
//  Created by danny santoso on 04/03/20.
//  Copyright © 2020 danny santoso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var a: UITextView!
    @IBOutlet weak var b: UITextView!
    @IBOutlet weak var c: UITextView!
    @IBOutlet weak var d: UITextView!
    
    var aBtn = ""
    var bBtn = ""
    var cBtn = ""
    var dBtn = ""
    
    var question = ""
    var correct_answer = ""

    
    
    let placeholder = "type answer here..."
    
    
    @IBOutlet weak var titlePage: UILabel!
    @IBOutlet weak var tfQuestion: UITextField!
    @IBOutlet weak var tfCorrect: UITextField!
    
    @IBOutlet weak var questionPage: UIView!
    @IBOutlet weak var answerPage: UIView!
    
    //answer page
    
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    
    @IBOutlet weak var buttonC: UIButton!
    
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var questionTextView: UITextView!
    
    
    
    
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array = [a,b,c,d,buttonA,buttonB,buttonC,buttonD,btnDone,btnSend, tfQuestion, tfCorrect]
        
        for a in array {
            a?.layer.cornerRadius = 10
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
            

            a.delegate = self

            b.delegate = self

            c.delegate = self

            d.delegate = self
        
        
            a.text = placeholder
            b.text = placeholder
            c.text = placeholder
            d.text = placeholder
        
            a.textColor = UIColor.black
            b.textColor = UIColor.black
            c.textColor = UIColor.black
            d.textColor = UIColor.black
        
//        if traitCollection.userInterfaceStyle == .light {
//            tfCorrect.layer.borderColor = UIColor.black.cgColor;
//            tfQuestion.layer.borderColor = UIColor.black.cgColor;
//            tfCorrect.attributedPlaceholder = NSAttributedString(string: " input correct answer",
//                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]);
//            tfQuestion.attributedPlaceholder = NSAttributedString(string: " input question here",
//                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]);
//
//            tfQuestion.layer.borderWidth = 1.0
//            tfCorrect.layer.borderWidth = 1.0
//        } else {
//            tfCorrect.layer.borderColor = UIColor.white.cgColor;
//            tfQuestion.layer.borderColor = UIColor.white.cgColor;
//            tfCorrect.attributedPlaceholder = NSAttributedString(string: " input correct answer",
//                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]);
//            tfQuestion.attributedPlaceholder = NSAttributedString(string: " input question here",
//                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]);
//
//
//            tfQuestion.layer.borderWidth = 1.0
//            tfCorrect.layer.borderWidth = 1.0
//        }
        
        answerPage.isHidden = true
        questionPage.isHidden = false

    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if traitCollection.userInterfaceStyle == .light {
//            tfCorrect.layer.borderColor = UIColor.black.cgColor;
//            tfQuestion.layer.borderColor = UIColor.black.cgColor;
//            tfCorrect.attributedPlaceholder = NSAttributedString(string: " input correct answer",
//                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]);
//            tfQuestion.attributedPlaceholder = NSAttributedString(string: " input question here",
//                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]);
//            
//            tfQuestion.layer.borderWidth = 1.0
//            tfCorrect.layer.borderWidth = 1.0
//        } else {
//            tfCorrect.layer.borderColor = UIColor.white.cgColor;
//            tfQuestion.layer.borderColor = UIColor.white.cgColor;
//            tfCorrect.attributedPlaceholder = NSAttributedString(string: " input correct answer",
//                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]);
//            tfQuestion.attributedPlaceholder = NSAttributedString(string: " input question here",
//                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]);
//            
//            
//            tfQuestion.layer.borderWidth = 1.0
//            tfCorrect.layer.borderWidth = 1.0
//        }
//    }
    
  func textViewDidBeginEditing(_ a: UITextView) {
        if a.textColor == UIColor.black {
            a.text = ""
            a.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ a: UITextView) {
        if a.text.isEmpty {
            a.text = placeholder
            a.textColor = UIColor.black
        }
    }
    
    func alertValidation(){
        let alert = UIAlertController(title: "Message Alert", message: "please fill all the form !!!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertValidation2(){
        let alert = UIAlertController(title: "Message Alert", message: "your correct answer must same with answer choice", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    

    @IBAction func showAnswerPage(_ sender: Any) {
        
        if tfQuestion.text!.isEmpty {
            alertValidation()
            
        }else if tfCorrect.text!.isEmpty{
            alertValidation()
            
        }else if a.text == placeholder{
            alertValidation()
            
        }else if b.text == placeholder{
            alertValidation()
        
        }else if c.text == placeholder{
            alertValidation()
            
        }else if d.text == placeholder{
            alertValidation()
        
        }else{
            
            
                
            if a.text!.caseInsensitiveCompare(tfCorrect.text!) == .orderedSame || b.text!.caseInsensitiveCompare(tfCorrect.text!) == .orderedSame || c.text!.caseInsensitiveCompare(tfCorrect.text!) == .orderedSame || d.text!.caseInsensitiveCompare(tfCorrect.text!) == .orderedSame{
                    
            
            
            titlePage.text = "Answer Page"
                
            aBtn = String(a.text)
            bBtn = String(b.text)
            cBtn = String(c.text)
            dBtn = String(d.text)
            
            question = tfQuestion.text!
            correct_answer = tfCorrect.text!
            

            
            print(aBtn)
            print(bBtn)
            print(cBtn)
            print(dBtn)
            print(question)
            print(correct_answer)
            
            
            
            questionTextView.text = question
            
            
            buttonA.setTitle(aBtn, for: .normal)
            buttonB.setTitle(bBtn, for: .normal)
            buttonC.setTitle(cBtn, for: .normal)
            buttonD.setTitle(dBtn, for: .normal)
            
            questionPage.isHidden = true
            btnDone.isHidden = true
            answerPage.isHidden = false
                
            }else{
                alertValidation2()
            }
            
        }
        
        
        
    }
    
    func resetField(){
        
        titlePage.text = "Question Page"
        
        a.text = placeholder
        b.text = placeholder
        c.text = placeholder
        d.text = placeholder
        
        tfCorrect.text = ""
        tfQuestion.text = ""
        
        answerPage.isHidden = true
        questionPage.isHidden = false
        btnDone.isHidden = true
    }
    
    func correctAnswer(){
        let alert = UIAlertController(title: "Correct Answer", message: "Your answer is correct", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func falseAnswer(){
        let alert = UIAlertController(title: "False Answer", message: "Your answer is false, the answer is "+correct_answer, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    //answer page
    
    @IBAction func buttonA(_ sender: Any) {
        if aBtn.caseInsensitiveCompare(correct_answer) == .orderedSame {
            correctAnswer()
        }else{
            falseAnswer()
        }
  
        btnDone.isHidden = false
        
        
        
    }
    
    
    @IBAction func buttonB(_ sender: Any) {
        if bBtn.caseInsensitiveCompare(correct_answer) == .orderedSame {
            correctAnswer()
        }else{
            falseAnswer()
        }
        btnDone.isHidden = false
      
    }
    
    @IBAction func buttonC(_ sender: Any) {
        if cBtn.caseInsensitiveCompare(correct_answer) == .orderedSame {
            correctAnswer()
        }else{
            falseAnswer()
        }
        btnDone.isHidden = false
        
    }
    
    @IBAction func buttonD(_ sender: Any) {
        if dBtn.caseInsensitiveCompare(correct_answer) == .orderedSame {
            correctAnswer()
        }else{
            falseAnswer()
        }
        btnDone.isHidden = false
        
    }
    @IBAction func done(_ sender: Any) {
        resetField()
    }
    
}

