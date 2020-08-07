//
//  DownloadManager.swift
//  DemoGCD
//
//  Created by Le Toan on 8/7/20.
//  Copyright © 2020 Le Toan. All rights reserved.
//

import Foundation

class DownloadManager {
    public static let shared = DownloadManager()
    private let dispatchQueue = DispatchQueue(label: "DownloadQueue", attributes: .concurrent)
    
    private var items: [Item] = []
    
    private var downloadQueue: PriorityQueue<Item>!
    
    lazy var downloadMusicItem: DispatchWorkItem = {
        return DispatchWorkItem {
            self.downloadMusic()
        }
    }()
    
    private init () {}
    
    func downloadData(completion: @escaping DispatchBlock) {
        DispatchWorkItem.run(on: dispatchQueue, waitfor: nil) {
            
        }.notify(queue: .main) {
            // Excute another task
            DispatchQueue.main.async {
                completion()
            }
        }
        
    }
    
    private func getApi() {
        let url = "https://api.jamendo.com/v3.0/tracks?client_id=6cc9fb1a&format=json&include=lyrics&type=single+albumtrack&order=downloads_total&limit=25&offset=0"
    }
    
    private func downloadMusic() {
        
    }
}
