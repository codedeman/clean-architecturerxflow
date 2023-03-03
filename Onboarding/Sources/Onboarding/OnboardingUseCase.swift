
import RxSwiftSupport
import DBCore

public protocol OnboardingUseCase: AnyObject {

}

final class DBOnboardingUseCase: OnboardingUseCase {
    var onboardingRepository: OnboardRepository

    init(onboardingRepository: OnboardRepository) {
        self.onboardingRepository = onboardingRepository
    }


}

