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
    
    var navigationBarAppearace = UINavigationBar.appearance()
    
    var hapus: isRemoved = .belum

    
    
    var aBtn = ""
    var bBtn = ""
    var cBtn = ""
    var dBtn = ""
    var question = ""
    var correct_answer = ""
    
    var questionObject:[QuestionEntity] = []
    
    let placeholder = "type answer here..."
    

    
    @IBOutlet weak var tfQuestion: UITextField!
    @IBOutlet weak var tfCorrect: UITextField!
    @IBOutlet weak var questionPage: UIView!
    
    
    @IBOutlet weak var btnSend: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        let nav = self.navigationController?.navigationBar
        

        nav?.barTintColor = hexStringToUIColor(hex: "5E65FF")
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array = [a,b,c,d,btnSend, tfQuestion, tfCorrect]
        
        for a in array {
            a?.layer.cornerRadius = 10
        }
        
        
        
        
        
        
        //hide keyboard virtual
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

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
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    

    //create textview placeholder
    
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
    
    //alert validation
    
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
                    
            aBtn = String(a.text)
            bBtn = String(b.text)
            cBtn = String(c.text)
            dBtn = String(d.text)
            
            question = tfQuestion.text!
            correct_answer = tfCorrect.text!
            
                
                if hapus == .sudah {
                    hapus = .belum
                    questionObject.append(QuestionEntity(question: question, correct: correct_answer, a: aBtn, b: bBtn, c: cBtn, d: dBtn))
                }else if hapus == .belum{
                    questionObject.removeAll()
                    questionObject.append(QuestionEntity(question: question, correct: correct_answer, a: aBtn, b: bBtn, c: cBtn, d: dBtn))
                }
                
                performSegue(withIdentifier: "toAnswerPage", sender: self)
            }else{
                alertValidation2()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationView = segue.destination as? AnswerViewController{
            destinationView.questionArray = questionObject
            
        }
    }
    

    
    
    func resetField(){
                
        a.text = placeholder
        b.text = placeholder
        c.text = placeholder
        d.text = placeholder
        
        tfCorrect.text = ""
        tfQuestion.text = ""
    }
    
    @IBAction func addQuestion(_ sender: Any) {
        
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
                        
                        aBtn = String(a.text)
                        bBtn = String(b.text)
                        cBtn = String(c.text)
                        dBtn = String(d.text)
                        
                        question = tfQuestion.text!
                        correct_answer = tfCorrect.text!
                        
                        if hapus == .sudah {
                            questionObject.append(QuestionEntity(question: question, correct: correct_answer, a: aBtn, b: bBtn, c: cBtn, d: dBtn))
                        }else if hapus == .belum{
                            questionObject.removeAll()
                            questionObject.append(QuestionEntity(question: question, correct: correct_answer, a: aBtn, b: bBtn, c: cBtn, d: dBtn))
                            hapus = .sudah
                        }
                        
                        
                        
                        
                    }else{
                        alertValidation2()
                    }
                }
        
        resetField()
    }
    
    func done(){
        questionObject.removeAll()
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    enum isRemoved{
        case sudah
        case belum
    }
}
    
    
    
