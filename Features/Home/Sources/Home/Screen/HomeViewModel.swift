//
//  File.swift
//
//
//  Created by Kevin on 3/3/23.
//

import Foundation
import RxSwiftSupport
import RxFlow
import RxSwift
import RxFlow
import RxCocoa
import RxRelay
import ComonFeature

class HomeViewModel: Stepper {
    var steps =  RxRelay.PublishRelay<RxFlow.Step>()
    private let homeUseCase: HomeUserCase

    init(homeUseCase: HomeUserCase) {
        self.homeUseCase = homeUseCase
    }

}

extension HomeViewModel: ViewModelType {

    struct Input {
        let loadTrigger: Driver<Void>
    }

    struct Output {
        let description: Driver<String>
    }

    func transform(input: Input) -> Output {

        return .init(description: Driver<String>.just(""))
    }
}
