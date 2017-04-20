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
        ArrayPin.array?[0].id = "m"
        ArrayPin.array?[1].imageName = "bar.png"
        ArrayPin.array?[1].id = "b"
        ArrayPin.array?[2].imageName = "hotel.png"
        ArrayPin.array?[2].id = "h"
    }
    
    static func getArray() -> [Pin] {
        if array == nil {
           _ = ArrayPin.init()
        }
        return array!
    }
    
    static func getArray(byId: String) -> [Pin]? {
        var aux: [Pin]? = []
        
        if array == nil {
            _ = ArrayPin.init()
        }
        
        switch byId {
        case "m":
            for index in 0 ..< (array?.count)! {
                if array?[index].id == "m"{
                    aux?.append((array?[index])!)
                }
            }
        case "b":
            for index in 0 ..< (array?.count)! {
                if array?[index].id == "b"{
                    aux?.append((array?[index])!)
                }
            }
            
        case "h":
            for index in 0 ..< (array?.count )! {
                if array?[index].id == "h"{
                    aux?.append((array?[index])!)
                }
            }
            
        default: break
            
        }
        
        return aux
        
    }
    
    
    static func addPin(_ title : String, _ coordinate: CLLocationCoordinate2D, _ id: String, _ imageName: String){
        let p = Pin()
        p.title = title
        p.coordinate = coordinate
        p.imageName = imageName
        p.id = id
        array?.append(p)
    }
    
    
}

