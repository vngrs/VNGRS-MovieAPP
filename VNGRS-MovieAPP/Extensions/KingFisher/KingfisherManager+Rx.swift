//
//  KingfisherManager+Rx.swift
//  VNGRS-MovieAPP
//
//  Created by Burak Kelleroğlu on 17.03.2020.
//  Copyright © 2020 Burak Kelleroğlu. All rights reserved.
//
import RxSwift
import Kingfisher

extension Reactive where Base == KingfisherManager {
    public func retrieveImage(with resource: Resource,
                              options: KingfisherOptionsInfo? = nil) -> Single<Image> {
        return Single<Image>.create { [base] single in
            let task = base.retrieveImage(with: resource,
                                          options: options,
                                          progressBlock: nil) { image, error, _, _ in
                                            if let error = error {
                                                single(.error(RxKingfisherError.kingfisherError(error)))
                                                return
                                            }

                                            guard let image = image else {
                                                single(.error(RxKingfisherError.missingImage))
                                                return
                                            }

                                            single(.success(image))
            }

            return Disposables.create { task!.cancel() }
        }
    }
}

extension KingfisherManager: ReactiveCompatible {
    public var rx: Reactive<KingfisherManager> {
        get { return Reactive(self) }
        set { }
    }
}
