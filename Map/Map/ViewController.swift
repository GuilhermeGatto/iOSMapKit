//
//  ViewController.swift
//  Map
//
//  Created by Guilherme Gatto on 19/04/17.
//  Copyright © 2017 mackmobile. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var segmentedAnnotation: UISegmentedControl!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var defaultLocation =  CLLocation(latitude: -23.563864, longitude: -46.653708)
    let radius: CLLocationDistance = 1000 // m
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        centerMap(location: defaultLocation, radius: radius)
        
        
        let longPressGR = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gr:)))
        mapView.addGestureRecognizer(longPressGR)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - My Functions
    
    func longPress(gr: UILongPressGestureRecognizer){
        
        
        let touch = gr.location(in: self.mapView)
        let
        coordinate = mapView.convert(touch, toCoordinateFrom: self.mapView)
        
        
        let alert = UIAlertController(title: "Add Pin", message: "Deseja adicionar que tipo de pin?", preferredStyle: UIAlertControllerStyle.alert)
        
        self.present(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "Hotel", style: .default, handler: { (action) in
            ArrayPin.addPin("Hotel", coordinate, "h", "hotel")
            self.updateMap(indice: self.segmentedAnnotation.selectedSegmentIndex)
        }))
        
        alert.addAction(UIAlertAction(title: "Bar", style: .default, handler: { (action) in
            ArrayPin.addPin("Bar", coordinate, "b",  "bar")
            self.updateMap(indice: self.segmentedAnnotation.selectedSegmentIndex)
        }))
        
        
        alert.addAction(UIAlertAction(title: "Museu", style: .default, handler: { (action) in
            ArrayPin.addPin("Museu", coordinate, "m",  "museu")
            self.updateMap(indice: self.segmentedAnnotation.selectedSegmentIndex)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: { (action) in
        }))
        
    
    }
    
    func centerMap(location : CLLocation, radius : CLLocationDistance){
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, radius, radius)
        mapView.setRegion(region, animated: true)
    }

    func updateMap(indice : Int){
        mapView.removeAnnotations(mapView.annotations)
        
        
        
        switch indice {
        case 0:
            mapView.addAnnotations(ArrayPin.getArray(byId: "h")!)
        case 1:
            mapView.addAnnotations(ArrayPin.getArray(byId: "b")!)
        case 2:
            mapView.addAnnotations(ArrayPin.getArray(byId: "m")!)
        case 3:
            mapView.addAnnotations(ArrayPin.getArray())
        case 4:
            break
        default:
            break
        }
        
    }
    
    // MARK: - Storyboard Actions

    @IBAction func segmentedMapTypeAction(_ sender: Any) {
        let aux = sender as! UISegmentedControl
        
        switch aux.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .standard
        }
    }

    @IBAction func segmentedAnnotationAction(_ sender: Any) {
        let aux = sender as! UISegmentedControl
        updateMap(indice: aux.selectedSegmentIndex)
    }
    
    //MARK: - Delegate Map Kit
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        let customPointAnnotation = annotation as! Pin
        annotationView?.image = UIImage(named: customPointAnnotation.imageName)
        
        return annotationView
    }
}





