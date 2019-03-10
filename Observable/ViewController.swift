//
//  ViewController.swift
//  Observable
//
//  Created by Piervincenzo Parisi on 10/03/2019.
//  Copyright © 2019 Piervincenzo Parisi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var observeButton: UIButton!
    
    // the observable property
    var batteryPercentage: Observable<Int> = Observable(0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startObserving()
        
        // to simulate charging
        updatePercentage()
    }
    
    private func updatePercentage() {
        guard batteryPercentage.value < 100 else { return }
        
        batteryPercentage.value += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.updatePercentage()
        }
    }
    
    @IBAction func stopObservingTapped(_ sender: UIButton) {
        batteryPercentage.removeObserver(self)
        observeButton.isEnabled = true
    }
    
    @IBAction func startObservingTapped(_ sender: UIButton) {
        startObserving()
        observeButton.isEnabled = false
    }
    
    func startObserving() {
        batteryPercentage.addObserver(self, options: [.initial, .new]) { [weak self] (percentage, _) in
            self?.label.text = "\(percentage)%"
        }
    }
}

