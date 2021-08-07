//
//  datas.swift
//  DatacoreTraining
//
//  Created by Guillaume Donzeau on 04/08/2021.
//

import Foundation

class Data {
    var name:String = "" {
        didSet {
            configureTextView()
        }
    }
    
    private func configureTextView() {
        
    }
}
