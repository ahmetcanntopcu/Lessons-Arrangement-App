//
//  NotesDao.swift
//  Term Average App
//
//  Created by Ahmet Can Topcu on 22.07.2022.
//

import Foundation

class NotesDao{
    let db:FMDatabase
    var note_id = 0
    var noteList = [Notes]()

    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("notlar.sqlite")
        
        db = FMDatabase(path: databaseURL.path)
    }
    
    func readAllNotes() -> [Notes]{
        var noteList = [Notes]()
        db.open()
        
        do {
            let rs = try db.executeQuery("SELECT * FROM notlar", values: nil)
            while rs.next(){
                let note = Notes(not_id: Int(rs.string(forColumn: "not_id"))!, ders_adi: rs.string(forColumn: "ders_adi")!, not1: Int(rs.string(forColumn: "not1"))!, not2: Int(rs.string(forColumn: "not2"))!)
                noteList.append(note)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        db.close()
        
        return noteList
    }
    
    func addNote(lesson_name:String,note1:Int,note2:Int){
        noteList = NotesDao().readAllNotes()
        db.open()
        
        do {
            try db.executeUpdate("INSERT INTO notlar VALUES(?,?,?,?)", values: [noteList.count,lesson_name,note1,note2])
        } catch {
            print(error.localizedDescription)
        }
        
        db.close()
    }
    
    func updateNote(note_id:Int,lesson_name:String,note1:Int,note2:Int){
        db.open()
        
        do {
            try db.executeUpdate("UPDATE notlar SET ders_adi = ? , not1 = ? , not2 = ? WHERE not_id = ?", values: [lesson_name,note1,note2,note_id])
        } catch {
            print(error.localizedDescription)
        }
        
        db.close()
    }
    
    func deleteNote(note_id:Int){
        db.open()
        
        do {
            try db.executeUpdate("DELETE FROM notlar WHERE not_id = ?", values: [note_id])
        } catch {
            print(error.localizedDescription)
        }
        
        db.close()
    }
    
  
}
