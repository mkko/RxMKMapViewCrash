//
//  ViewController.swift
//  RxMKMapViewCrash
//
//  Created by Mikko Välimäki on 20/06/2018.
//  Copyright © 2018 Mikko Välimäki. All rights reserved.
//

import UIKit
import MapKit
import RxSwift
import RxMKMapView

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.rx.setDelegate(self)
            .disposed(by: disposeBag)

        // Do any additional setup after loading the view, typically from a nib.
        mapView.rx.regionDidChangeAnimated
            .subscribe(onNext: { _ in
                print("regionDidChangeAnimated")
            })
        .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: MKMapViewDelegate {

}
