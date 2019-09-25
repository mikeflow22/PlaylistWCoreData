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
    
    static let shared = PlaylistController()
    
    //local source of truth - do you need this if you are using nsfetchRequstController?
    var playlists: [Playlist] {
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try? CoreDataStack.mainContext.fetch(fetchRequest)) ?? []
    }
    
    func createPlaylist(withName name: String){
         _ = Playlist(playlistName: name)
        saveToPersistentStore()
    }
    
    func deletePlaylist(playlist: Playlist){
        CoreDataStack.mainContext.delete(playlist)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore(){
        do {
            try CoreDataStack.mainContext.save()
        } catch  {
            print("Error saving to mainContext: \(error) in \(#function)")
        }
    }

}
