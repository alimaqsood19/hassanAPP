//
//  MainVC.swift
//  hassanAPP
//
//  Created by Ambar Maqsood on 2016-09-23.
//  Copyright © 2016 Ambar Maqsood. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var youtubeVideos = [YoutubeVideo]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    //Adding subscription button for "youtube": 
   // www.youtube.com/realhassanmusic?sub_confirmation=1

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        let p1 = YoutubeVideo(imageURL: "https://i.ytimg.com/vi/zdy4Z4UJNzo/hqdefault.jpg?custom=true&w=196&h=110&stc=true&jpg444=true&jpgq=90&sp=68&sigh=uGY_i_wQW5dtpv6jeD4jWrMf2uc", videoURL: "<iframe width=\"960\" height=\"470\" src=\"https://www.youtube.com/embed/zdy4Z4UJNzo\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Love Me (Aahista)")
        youtubeVideos.append(p1)
        
        let p2 = YoutubeVideo(imageURL: "https://i.ytimg.com/vi/pi0WBbcckKo/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=YvWGREFfC2P3Aj5DWhqk4poBZSI", videoURL: "<iframe width=\"960\" height=\"470\" src=\"https://www.youtube.com/embed/pi0WBbcckKo?list=PLh3qDdLif-sUQzn3m7xAlggvhy4AiuP7w\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Akhan Vich Akhan")
        youtubeVideos.append(p2)
        
        let p3 = YoutubeVideo(imageURL: "https://i.ytimg.com/vi/4oaXQ7UhS2I/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=IQLoYFnXZ6fkpsSUhxiNprePleM", videoURL: "<iframe width=\"960\" height=\"470\" src=\"https://www.youtube.com/embed/4oaXQ7UhS2I?list=PLh3qDdLif-sUQzn3m7xAlggvhy4AiuP7w\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Need by Hassan")
        youtubeVideos.append(p3)
        
        let p4 = YoutubeVideo(imageURL: "https://i.ytimg.com/vi/CMOLbZvoE8U/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=0G6H1g8-cIWrmxIj8_iH13LMy5c", videoURL: "<iframe width=\"960\" height=\"470\" src=\"https://www.youtube.com/embed/CMOLbZvoE8U?list=PLh3qDdLif-sUQzn3m7xAlggvhy4AiuP7w\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Inside of Her Heart")
        youtubeVideos.append(p4)
        
        let p5 = YoutubeVideo(imageURL: "https://i.ytimg.com/vi/ulnzwtH2VTY/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=Gr2j6IX-0WeJzv8IAHq5kT8OqOI", videoURL: "<iframe width=\"960\" height=\"470\" src=\"https://www.youtube.com/embed/ulnzwtH2VTY?list=PLh3qDdLif-sUQzn3m7xAlggvhy4AiuP7w\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Cold Water (Remix)")
        youtubeVideos.append(p5)

        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as? VideoCell {
            
            let youtubeVid = youtubeVideos[indexPath.row]
            
            cell.updateUI(videos: youtubeVid)
            
            return cell
            
        }else {
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return youtubeVideos.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let youtubeVid = youtubeVideos[indexPath.row]
        
        performSegue(withIdentifier: "Youtube", sender: youtubeVid)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? webViewVideos {
            
            if let video = sender as? YoutubeVideo {
                destination.ytvideo = video
            }
            
        }
    }



}

