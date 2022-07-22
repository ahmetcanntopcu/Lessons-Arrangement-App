//
//  ViewController.swift
//  Term Average App
//
//  Created by Ahmet Can Topcu on 21.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewNote: UITableView!
    
    var noteList = [Notes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        copyDatabase()
        
        tableViewNote.delegate = self
        tableViewNote.dataSource = self
        


    }
    
    override func viewWillAppear(_ animated: Bool) {
        noteList = NotesDao().readAllNotes()
        
        
        var total = 0
        for k in noteList{
            total += ((k.not1!+k.not2!)/2)
        }
        if noteList.count != 0 {
            navigationItem.prompt = "Average:\(total / noteList.count)"
        }else{
            navigationItem.prompt = "NONE"
        }

        tableViewNote.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = sender as? Int
        
        if segue.identifier == "toNoteDetail"{
            let nextViewController = segue.destination as! NoteDetailViewController
            nextViewController.note = noteList[index!]
        }
        
    }
    
    func copyDatabase(){
            let bundlePath = Bundle.main.path(forResource: "notlar", ofType: ".sqlite")
            let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let fileManager = FileManager.default
            let copyArea = URL(fileURLWithPath: targetPath).appendingPathComponent("notlar.sqlite")
            
            if fileManager.fileExists(atPath: copyArea.path){
                print("Database is already exist.")
            }else{
                do {
                    try fileManager.copyItem(atPath: bundlePath!, toPath: copyArea.path)
                } catch {
                    print(error)
                }
            }
        }

}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        noteList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = noteList[indexPath.row]
        let cell = tableViewNote.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCellTableViewCell
        cell.labelLessonName.text = note.ders_adi!
        cell.labelNote1.text = "\(note.not1!)"
        cell.labelNote2.text = "\(note.not2!)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toNoteDetail", sender: indexPath.row)
    }
}

