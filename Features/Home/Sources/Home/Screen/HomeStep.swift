//
//  HomeStep.swift
//  
//
//  Created by Kevin on 3/19/23.
//

import RxSwiftSupport
import RxFlow
public enum HomeStep: Step {
      case start
       // Onboarding
       case onboardingIsRequired
       case onboardingIsComplete

       // Home
       case dashboardIsRequired

}
