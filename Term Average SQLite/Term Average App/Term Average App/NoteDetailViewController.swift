//
//  NoteDetailViewController.swift
//  Term Average App
//
//  Created by Ahmet Can Topcu on 21.07.2022.
//

import UIKit

class NoteDetailViewController: UIViewController {

    @IBOutlet weak var textFieldLessonName: UITextField!
    @IBOutlet weak var textFieldNote1: UITextField!
    @IBOutlet weak var textFieldNote2: UITextField!
    
    var note : Notes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let n = note {
            textFieldLessonName.text = n.ders_adi
            textFieldNote1.text = String(n.not1!)
            textFieldNote2.text = String(n.not2!)
        }


    }

    @IBAction func deleteNote(_ sender: Any) {
        
        if let n = note{
            NotesDao().deleteNote(note_id: n.not_id!)
        }
        
    }
    @IBAction func updateNote(_ sender: Any) {
        
       
            if let n = note , let lessonName = textFieldLessonName.text , let note1 = textFieldNote1.text , let note2 = textFieldNote2.text{
                
                if let n1 = Int(note1) , let n2 = Int(note2){
                    
                    NotesDao().updateNote(note_id: n.not_id!, lesson_name: lessonName, note1: n1, note2: n2)

                }
            
            
        }
    }
}
