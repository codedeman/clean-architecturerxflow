//
//  File.swift
//  
//
//  Created by Kevin on 4/7/23.
//

import Foundation
import ComonFeature
import RxSwift
import RxFlow
import RxCocoa
import RxRelay

class OnBoardingViewModel: Stepper {
    var steps =  RxRelay.PublishRelay<RxFlow.Step>()
    private var onboardUseCase: OnboardingUseCase

    init(
         onboardUseCase: OnboardingUseCase
    ) {
        self.onboardUseCase = onboardUseCase
    }

}
extension OnBoardingViewModel: ViewModelType {
    struct Input {
        let viewDidloadTrigger: Driver<Void>
    }

    struct Output {
        let viewDidloadDriver: Driver<Void>
    }

    func transform(input: Input) -> Output {
//        let trigger =  input.viewDidloadTrigger.do { [weak self] in
        self.steps.accept(OnBoardingStep.finish)
//        }.asDriver()
        return Output.init(viewDidloadDriver: Observable.empty().asDriver(onErrorDriveWith: .empty()))
    }

}
