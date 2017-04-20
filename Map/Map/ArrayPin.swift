//
//  ArrayPin.swift
//  Map
//
//  Created by Guilherme Gatto on 19/04/17.
//  Copyright © 2017 mackmobile. All rights reserved.
//

import Foundation
import MapKit

class ArrayPin{
    
    
    private static var array: [Pin]?
    
    private  init(){
        ArrayPin.array = [Pin(), Pin(), Pin()]
        
        ArrayPin.array?[0].title = "Museu"
        ArrayPin.array?[0].coordinate = CLLocation(latitude: -23.561492, longitude: -46.656049).coordinate
        
        ArrayPin.array?[1].title = "Bar"
        ArrayPin.array?[1].coordinate = CLLocation(latitude: -23.565691, longitude: -46.655614).coordinate
        
        ArrayPin.array?[2].title = "Hotel"
        ArrayPin.array?[2].coordinate = CLLocation(latitude: -23.565386, longitude: -46.654326).coordinate
        
        
        ArrayPin.array?[0].imageName = "museu.png"
        ArrayPin.array?[1].imageName = "bar.png"
        ArrayPin.array?[2].imageName = "hotel.png"
    }
    
    static func getArray() -> [Pin] {
        if array == nil {
           _ = ArrayPin.init()
        }
        return array!
    }
    
    static func addPin(_ title : String, _ coordinate: CLLocationCoordinate2D){
        let p = Pin()
        p.title = title
        p.coordinate = coordinate
        p.imageName = title
        array?.append(p)
    }
    
    
}

