//
//  RxKingfisherError.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 17.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//

import Foundation

public enum RxKingfisherError: Swift.Error {
    case kingfisherError(NSError)
    case missingImage
}
