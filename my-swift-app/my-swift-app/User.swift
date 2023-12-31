//
//  User.swift
//  abcd
//
//  Created by Mukund Onkar on 12/28/23.
//

import Foundation


struct User: Codable, Identifiable {
    
    let id = UUID()
    
    var fname: String
    var lname: String
    var username: String
    var pwd: String
    var email: String
    //var link: String
    
}
