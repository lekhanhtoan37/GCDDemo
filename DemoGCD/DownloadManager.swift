//
//  DownloadManager.swift
//  DemoGCD
//
//  Created by Le Toan on 8/7/20.
//  Copyright © 2020 Le Toan. All rights reserved.
//

import Foundation
import Alamofire

class DownloadManager {
    public static let shared = DownloadManager()
    private let dispatchQueue = DispatchQueue(label: "DownloadQueue", attributes: .concurrent)
    
    private var musics: [Music] = []
    
    private var downloadQueue: PriorityQueue<Music>!
    
    private var downloadMusicItem: DispatchWorkItem?
    
    private init () {}
    
    func downloadData(completion: @escaping DispatchBlock) {
        DispatchWorkItem.run(on: dispatchQueue, waitfor: nil) {
            self.getApi { [weak self] (musics) in
                self?.downloadMusic(with: musics)
            }
        }.notify(queue: .main) {
            // Excute another task
            DispatchQueue.main.async {
                completion()
            }
        }
        
    }
    
    private func getApi(completion: @escaping ([Music]) -> Void) {
        let url = "https://api.jamendo.com/v3.0/tracks?client_id=6cc9fb1a&format=json&include=lyrics&type=single+albumtrack&order=downloads_total&limit=25&offset=0"
        AF.request(url).responseDecodable(of: MusicResponse.self, queue: dispatchQueue) { (res) in
            guard let listMusic = res.value?.results, !listMusic.isEmpty else {return}
            completion(listMusic)
        }
    }
    
    private func downloadMusic(with listMusics: [Music]) {
        if downloadQueue.isEmpty || downloadQueue == nil {
            
        }
    }
}
