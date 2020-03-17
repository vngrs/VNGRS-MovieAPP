//
//  Configurable.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 17.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import Foundation

protocol Configurable {
    associatedtype ConfigurationType

    func configure(for: ConfigurationType)
}
