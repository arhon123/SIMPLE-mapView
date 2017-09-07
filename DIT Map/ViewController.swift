//
//  ViewController.swift
//  DIT Map
//
//  Created by D7703_18 on 2017. 8. 31..
//  Copyright © 2017년 D7703_18. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // DIT 위치정보 35.165882, 129.072777
        // (위치를 설정)
        let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(35.165882, 129.072777)
        // 반경(spen)
        let spen = MKCoordinateSpanMake(0.05, 0.05)
        
        // 지도에 보여줄 영역(이미지)
        let region = MKCoordinateRegionMake(center, spen)
        
        // 지도(myMapView)에 추가(Add)
        myMapView.setRegion(region, animated: true)
        
        // pin(annotation) 꼽기
        let anno01 = MKPointAnnotation()
        anno01.coordinate = center
        anno01.title = "DIT 동의과학대학교"
        anno01.subtitle = "나의 꿈이 자라는 곳"
        // 속성을 추가
        
        
        // 시민공원 경도 위도 35.168327, 129.057866
        let location2 = CLLocationCoordinate2DMake(35.168327, 129.057866)
        
        let anno02 = MKPointAnnotation()
        anno02.coordinate = location2
        anno02.title = "시민공원"
        anno02.subtitle = "개마고원"
        
        
        // 지도에 핀을 추가
        myMapView.addAnnotation(anno01)
        myMapView.addAnnotation(anno02)
        
        // delegate 연결
        myMapView.delegate = self
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // pin의 재활용
        let identifier = "MyPin"
        var annotationView = myMapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            if annotation.title! == "시민공원" {
                annotationView?.pinTintColor = UIColor.blue
                annotationView?.animatesDrop = true
                
                // Right calloutAcceary
                let btn = UIButton(type: .detailDisclosure)
                annotationView?.rightCalloutAccessoryView = btn
                
                // Left CalloutAcceary
                let IconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
                IconView.image = UIImage(named: "31.jpg")
                annotationView?.leftCalloutAccessoryView = IconView
            } else if annotation.title! == "DIT 동의과학대학교" {
            
            // annotationView?.animatesDrop = true
            
            // Right calloutAcceary
            annotationView?.canShowCallout = true
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            
            // Left CalloutAcceary
            let IconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
            IconView.image = UIImage(named: "32.gif")
            annotationView?.leftCalloutAccessoryView = IconView
            }
            
        } else {
            // nil이 아닌경우 이미 만들어진 것을 재활용
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        print("callout Accessory Tapped!")
        
        let viewAnno = view.annotation
        let viewTitle: String = ((viewAnno?.title)!)!
        let viewSubTitle: String = ((viewAnno?.subtitle)!)!
        
        print("\(viewTitle) \(viewSubTitle)")
        
        let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

