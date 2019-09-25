//
//  Playlist+Convenience.swift
//  PlaylistWCoreData
//
//  Created by Michael Flowers on 9/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {
    
    convenience init(playlistName: String, songs:[Song] = [], moc: NSManagedObjectContext = CoreDataStack.mainContext){
        self.init(context: moc)
        self.playlistName = playlistName
    //no need to set songs cuz it has a default value. although in the designated initializer you would have to do it. 
        
    }
}
