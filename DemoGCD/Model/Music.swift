/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

enum FileFormat: String, CaseIterable {
    case mp3 = "mp3"
    case mp4 = "mp4"
    case wav = "wav"
}

struct Music : Codable, Hashable, Comparable {
	let id : String?
	let name : String?
	let duration : Int?
	let artist_id : String?
	let artist_name : String?
	let artist_idstr : String?
	let album_name : String?
	let album_id : String?
	let license_ccurl : String?
	let position : Int?
	let releasedate : String?
	let album_image : String?
	let audio : String?
	let audiodownload : String?
	let prourl : String?
	let shorturl : String?
	let shareurl : String?
	let lyrics : String?
	let waveform : String?
	let image : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case duration = "duration"
		case artist_id = "artist_id"
		case artist_name = "artist_name"
		case artist_idstr = "artist_idstr"
		case album_name = "album_name"
		case album_id = "album_id"
		case license_ccurl = "license_ccurl"
		case position = "position"
		case releasedate = "releasedate"
		case album_image = "album_image"
		case audio = "audio"
		case audiodownload = "audiodownload"
		case prourl = "prourl"
		case shorturl = "shorturl"
		case shareurl = "shareurl"
		case lyrics = "lyrics"
		case waveform = "waveform"
		case image = "image"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		duration = try values.decodeIfPresent(Int.self, forKey: .duration)
		artist_id = try values.decodeIfPresent(String.self, forKey: .artist_id)
		artist_name = try values.decodeIfPresent(String.self, forKey: .artist_name)
		artist_idstr = try values.decodeIfPresent(String.self, forKey: .artist_idstr)
		album_name = try values.decodeIfPresent(String.self, forKey: .album_name)
		album_id = try values.decodeIfPresent(String.self, forKey: .album_id)
		license_ccurl = try values.decodeIfPresent(String.self, forKey: .license_ccurl)
		position = try values.decodeIfPresent(Int.self, forKey: .position)
		releasedate = try values.decodeIfPresent(String.self, forKey: .releasedate)
		album_image = try values.decodeIfPresent(String.self, forKey: .album_image)
		audio = try values.decodeIfPresent(String.self, forKey: .audio)
		audiodownload = try values.decodeIfPresent(String.self, forKey: .audiodownload)
		prourl = try values.decodeIfPresent(String.self, forKey: .prourl)
		shorturl = try values.decodeIfPresent(String.self, forKey: .shorturl)
		shareurl = try values.decodeIfPresent(String.self, forKey: .shareurl)
		lyrics = try values.decodeIfPresent(String.self, forKey: .lyrics)
		waveform = try values.decodeIfPresent(String.self, forKey: .waveform)
		image = try values.decodeIfPresent(String.self, forKey: .image)
	}
    
    func getLocalUrlMusic() -> URL? {
        guard let id = id else {return nil}
        return FileManager.musicURL().appendingPathComponent("\(id).\(FileFormat.mp3.rawValue)")
    }
    
    func isDownloaded() -> Bool {
        guard let url = self.getLocalUrlMusic() else {return false}
        return FileManager.default.fileExists(atPath: url.path)
    }

}
