//
//  ViewController.swift
//  GoL
//
//  Created by Bryan D'Haeseleer on 23/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var boardView: BoardView!
    private let timer = DispatchSource.makeTimerSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        boardView.contentMode = .redraw
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        boardView.setNeedsDisplay()
    }

    @IBAction func didPressStart(_ sender: UIButton) {
        sender.isEnabled = false
        var count = 0
        timer.schedule(deadline: .now(), repeating: .seconds(1))
        timer.setEventHandler(handler: { [weak self] in
            guard count < Constants.Base.numberOfGeneration else {
                self?.timer.cancel()
                return
            }
            self?.boardView.grid.nextGeneration()
            DispatchQueue.main.async {
                self?.boardView.setNeedsDisplay()
            }
            count += 1
        })
        timer.activate()
    }
}
