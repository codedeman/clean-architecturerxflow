//
//  OnboardingDIContainer.swift
//  
//
//  Created by Kevin on 4/9/23.
//

import UIKit
import Home

public class OnboardingDIContainer {
    let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
}

public extension OnboardingDIContainer {

    struct Dependencies {
        let onboardingService: OnboardingUseCase
        public init(onboardingService: OnboardingUseCase) {
            self.onboardingService = onboardingService
        }
    }

    func makeHomeDIContainer() -> HomeDiContainer {
        return .init(dependencies: .init(configureApp: "", service: MockHomeUseCase()))
    }
}

class MockHomeUseCase: HomeUserCase {

}
