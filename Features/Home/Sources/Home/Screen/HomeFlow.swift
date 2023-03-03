////
////  HomeFlow.swift
////  
////
////  Created by Kevin on 3/19/23.
////
//
import UIKit
import RxFlow
public class HomeFlow: Flow {

    public var root: RxFlow.Presentable {
        return self.rootViewController

    }
    private var rootViewController = UIViewController()
    private let homeDicontainer: HomeDiContainer

    public init(homeDicontainer: HomeDiContainer) {
        self.homeDicontainer = homeDicontainer
    }

    public func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? HomeStep else { return .none }
        switch step {
        case .start:
           return showHome()
        case .onboardingIsRequired:
            return showHome()
        case .onboardingIsComplete:
            return showHome()
        case .dashboardIsRequired:
            return showHome()
        }
    }

    private func showHome() -> FlowContributors {
        let homeViewModel = HomeViewModel(homeUseCase: homeDicontainer.dependencies.service)
        let vc = HomeViewController(viewModel: homeViewModel)
        self.rootViewController = vc
        return .one(flowContributor: .contribute(withNextPresentable: vc as Presentable, withNextStepper: OneStepper.init(withSingleStep: HomeStep.onboardingIsRequired)))
    }

    

}
