
//  HomeDiContainer.swift
//
//
//  Created by Kevin on 3/3/23.


import Foundation

public final class HomeDiContainer  {
    let dependencies: Dependencies
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

public extension HomeDiContainer {

    struct Dependencies {
        var configureApp: String
        var service: HomeUserCase
        public init(configureApp: String, service: HomeUserCase) {
            self.configureApp = configureApp
            self.service = service
        }
    }
}


