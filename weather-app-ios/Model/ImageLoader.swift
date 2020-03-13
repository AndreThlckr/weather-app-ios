//
//  DataService.swift
//  weather-app-ios
//
//  Created by Jonathan on 11/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class ImageLoader {
    
    //MARK: Public methods
    
    func loadImage(fromUrl: URL, completion: @escaping (Image) -> ()) {
        Alamofire.request(fromUrl).responseImage { response in
            guard let image = response.result.value else {
                print("Erro ao carregar imagem da URL \(fromUrl)")
                return
            }
            completion(image)
        }
    }
}
