//
//  PlaylistListTableViewController.swift
//  PlaylistWCoreData
//
//  Created by Michael Flowers on 9/25/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class PlaylistListTableViewController: UITableViewController {

    @IBOutlet weak var playlistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addPlaylistButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = playlistNameTextField.text, !name.isEmpty else { return }
        PlaylistController.shared.createPlaylist(withName: name)
        playlistNameTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.shared.playlists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        cell.textLabel?.text = playlist.playlistName
        let songsCount = playlist.songs?.count ?? 0
        
        cell.detailTextLabel?.text = songsCount > 1 ?  "\(songsCount) songs" : "\(songsCount) song"
        // Configure the cell...

        return cell
    }
 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //delete from local array which will save it in the persitent store
             let playlistToDelete = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.deletePlaylist(playlist: playlistToDelete)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let destinationVC = segue.destination as? SongTableViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            destinationVC.playlist = playlist
        }
    }
}
