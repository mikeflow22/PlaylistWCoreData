//
//  SongController.swift
//  PlaylistWCoreData
//
//  Created by Michael Flowers on 9/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    func createSong(songName: String, artistName: String, playlist: Playlist){
        Song(songName: songName, artistName: artistName, playlist: playlist)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    //Delete because in core data we set this to Nullify so we don't have to delete it from the playlist. So for better MVC Song should be responsible for deleting itself
    func delete(song: Song){
        CoreDataStack.mainContext.delete(song)
        PlaylistController.shared.saveToPersistentStore()
    }
    
}
