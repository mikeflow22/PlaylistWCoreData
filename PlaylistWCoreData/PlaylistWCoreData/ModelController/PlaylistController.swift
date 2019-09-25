//
//  PlaylistController.swift
//  PlaylistWCoreData
//
//  Created by Michael Flowers on 9/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    func createPlaylist(withName name: String){

    }
    
    func deletePlaylist(playlist: Playlist){
        
    }
    
    func saveToPersistentStore(){
        do {
            try CoreDataStack.mainContext.save()
        } catch  {
            print("Error saving to mainContext: \(error) in \(#function)")
        }
    }
    
//    func loadFromPersistentStore(){
//
//    }
}
