//
//  SwInject.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 17.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    static let shared: Container = {
        let container = Container()
        registerMockServices(into: container)
        return container

    }()
    //TODO: register real services.
    private static func registerMockServices(into container: Container) {
        container.autoregister(MovieMock.self, initializer: MovieMock.init)
        container.autoregister(MovieService.self, initializer: MovieMockService.init)
    }
}
