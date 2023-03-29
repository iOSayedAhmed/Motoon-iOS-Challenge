//
//  NetworkingConstants.swift
//  Starter Project
//
//  Created by iOSayed on 29/03/2023.
//

import Foundation

class NetworkConstants {
    
    //singletone
    public static var shared = NetworkConstants()

    
    var baseUrl : String {
        get {
            return "https://api.unsplash.com/photos/?"
        }
    }
    
    var key : String {
        get {
            return "client_id=Ahj-66mbyiRNL-GhTltHoIgGfkznNgv7SALhCOTLMaM"
        }
    }
    
    
    
    
}
