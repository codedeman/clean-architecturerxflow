//
//  Application.swift
//  InsiderApp
//
//  Created by Kevin on 3/23/23.
//

import Foundation
import RxFlow
import UIKit
import Home
import Onboarding
import RxSwift
enum ApplicationRoute: String {
    case home = "Home Flow"
    case onboarding = "OnBoarding Flow"
}
final class Application {
    static let shared = Application()
    var coordinator = FlowCoordinator()
    let disposeBag = DisposeBag()

    func configureMainInterface(in window: UIWindow) {
        let homeDicontainer = HomeDiContainer.Dependencies(
            configureApp: "Insider app",
            service: MockHomeUseCase())
        let homeFlow = HomeFlow(homeDicontainer: .init(dependencies: homeDicontainer))

        coordinator.rx.didNavigate.subscribe { (flow, step) in
            print("Did navigate to flow=\(flow) and step=\(step)")

        }.disposed(by: disposeBag)

        self.coordinator.coordinate(flow: homeFlow,with: OneStepper.init(withSingleStep: HomeStep.onboardingIsRequired))
        Flows.use(homeFlow, when: .created) { root in
            window.rootViewController = root
        }

    }

    func configureHomeFlow(viewController: UIViewController) {
        let homeDiContainer = HomeDiContainer.Dependencies(configureApp: "", service: MockHomeUseCase())
        let homeFlow = HomeFlow(homeDicontainer: .init(dependencies: homeDiContainer))

        coordinator.rx.didNavigate.subscribe { (flow, step) in
            print("Did navigate to flow=\(flow) and step=\(step)")
        }.disposed(by: disposeBag)

        self.coordinator.coordinate(flow: homeFlow,
                                    with: OneStepper.init(withSingleStep: OnBoardingStep.start))

        Flows.use(homeFlow, when: .created) { root in
            viewController.navigationController?.pushViewController(root, animated: false)
        }
    }


    func configureOnboardingVC(viewController: UIViewController) {
        let onboardingDiContainer = OnboardingDIContainer.Dependencies(onboardingService: MockOnboardingUseCase())
        let onboardingFlow = OnboardingFlow(dependencies: .init(dependencies: onboardingDiContainer))
        coordinator.rx.didNavigate.subscribe { (flow, step) in
            print("Did navigate to flow=\(flow) and step=\(step)")
        }.disposed(by: disposeBag)

        self.coordinator.coordinate(flow: onboardingFlow,
                                    with: OneStepper.init(withSingleStep: OnBoardingStep.start))

        Flows.use(onboardingFlow, when: .created) { root in
            viewController.navigationController?.pushViewController(root, animated: false)
        }
    }

    func routerScreen(router: ApplicationRoute, viewController: UIViewController) {

        switch router {
        case .home:
            self.configureHomeFlow(viewController: viewController)
        case .onboarding:
            self.configureOnboardingVC(viewController: viewController)
        }

    }

}

class MockHomeUseCase: HomeUserCase {

}

class MockOnboardingUseCase: OnboardingUseCase {

}
