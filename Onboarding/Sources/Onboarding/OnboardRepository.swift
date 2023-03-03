//
//  OnboardRepository.swift
//  
//
//  Created by Kevin on 4/9/23.
//

import UIKit

protocol LocalCVPConfiguration: AnyObject {
    func getConfig()
}

public protocol OnboardRepository: AnyObject {
//    func getPageContents(completion: (Result<CVPPageContent, Error>) -> Void)
}

public final class LocalOnboardingRespository: OnboardRepository {

    private var localCVPConfiguration: LocalCVPConfiguration

    init(localCVPConfiguration: LocalCVPConfiguration) {
        self.localCVPConfiguration = localCVPConfiguration
    }

//    public func getPageContents(completion: (Result<CVPPageContent, Error>) -> Void) {
//
//    }

//    private func fetchCVPContent()-> CVPContentConfiguration {
//
//
//    }


}
