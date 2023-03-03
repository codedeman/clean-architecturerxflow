//
//  File.swift
//  
//
//  Created by Kevin on 4/2/23.
//

import Foundation
import RxFlow
import UIKit
import Home
import RxSwift

public class OnboardingFlow: Flow {

    public var root: RxFlow.Presentable {
        return self.rootViewController
    }

    private let dependencies: OnboardingDIContainer

    private var rootViewController = UIViewController()

    public init(dependencies: OnboardingDIContainer) {
        self.dependencies = dependencies
    }

    public func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? OnBoardingStep else {return .none}
        switch step {
        case .start:
            return showPageViewController()
        case .finish:
            return showHomeFlow()
        }
    }

    public func adapt(step: Step) -> Single<Step> {
        let step = step as? OnBoardingStep
        switch step {
        case .finish:
            return .just(OnBoardingStep.finish)
        case .start:
            return .just(OnBoardingStep.start)
        case .none:
            return .just(step!)
        }
    }

    private func showPageViewController() -> FlowContributors {
        let onboardingViewModel = OnBoardingViewModel(onboardUseCase: dependencies.dependencies.onboardingService)
        let vc =   OnboardingViewController(viewModel: onboardingViewModel)
        rootViewController = vc
        return .one(flowContributor: .contribute(withNextPresentable: vc,
                                                 withNextStepper: vc.viewModel))
    }

    private func showHomeFlow() -> FlowContributors {
        let homeFlow = HomeFlow(homeDicontainer: dependencies.makeHomeDIContainer())
        Flows.use(homeFlow, when: .ready) { [weak self] root in
            guard self != nil else {return}
//            self?.rootViewController?.navigationController?.pushViewController(root, animated: true)
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: homeFlow,
            withNextStepper: OneStepper.init(withSingleStep: HomeStep.start)))
    }

}
