//
//  ViewController.swift
//  Benchmark
//
//  Created by phoenix on 2025/8/29.
//

import UIKit
import ReerJSONBenchmark

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Benchmark.run()
    }

}

