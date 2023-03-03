////
////  File.swift
////  
////
////  Created by Kevin on 3/23/23.
////
///Users/kevin/InsiderApp/Cores
import Foundation
import RxSwift
import DBCore

public enum ProductType {
    case admin
    case user
}

public protocol HomeUserCase: AnyObject {


}

final class HomeService {

    private let apiClientService: NetWorkServiceProtocol

    init(apiClientService: NetWorkServiceProtocol) {
        self.apiClientService = apiClientService
    }
}

extension HomeService: HomeUserCase {
    
}
