//
//  Coordinator.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/22/23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
