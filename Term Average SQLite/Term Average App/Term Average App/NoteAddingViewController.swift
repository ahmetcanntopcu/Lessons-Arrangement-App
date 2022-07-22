//
//  NoteAddingViewController.swift
//  Term Average App
//
//  Created by Ahmet Can Topcu on 21.07.2022.
//

import UIKit

class NoteAddingViewController: UIViewController {
    
    @IBOutlet weak var textFieldLessonName: UITextField!
    @IBOutlet weak var textFieldNote1: UITextField!
    @IBOutlet weak var textFieldNote2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func addNote(_ sender: Any) {
       
        if let lessonName = textFieldLessonName.text , let note1 = textFieldNote1.text , let note2 = textFieldNote2.text{
            
            if let n1 = Int(note1) , let n2 = Int(note2){
                NotesDao().addNote(lesson_name: lessonName, note1: n1, note2: n2)
            }
        }
            
        
        
    }
    
    
}
