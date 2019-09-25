//
//  SongTableViewController.swift
//  PlaylistWCoreData
//
//  Created by Michael Flowers on 9/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    var playlist: Playlist?
    
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addSongButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = songNameTextField.text, !name.isEmpty, let artist = artistNameTextField.text, !artist.isEmpty, let playlist = playlist else { return }
        SongController.shared.createSong(songName: name, artistName: artist, playlist: playlist)
        
        songNameTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlist?.songs?.count ?? 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        let song = playlist?.songs?[indexPath.row] as! Song
        cell.textLabel?.text = song.songName
        cell.detailTextLabel?.text = song.artistName
        // Configure the cell...

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
             let song = playlist?.songs?[indexPath.row] as! Song
            SongController.shared.delete(song: song)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

}
