//
//  datas.swift
//  DatacoreTraining
//
//  Created by Guillaume Donzeau on 04/08/2021.
//

import Foundation

class Data { // Ici Data mais ça pourrait être Recipe ;)
    var name:String = "" {
        didSet {
            configureTextView()
        }
    }
    
    private func configureTextView() {
        
    }
}
