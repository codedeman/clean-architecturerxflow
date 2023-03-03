//
//  File.swift
//  
//
//  Created by Kelvin Fok on 20/3/22.
//

import UIKit
import SnapKit
import ComonFeature
import RxSwift
struct Page {
    var title: String
    var image: String
}

let PAGES = [
    Page(title: "Explore", image: "https://i.imgur.com/FGknouw.png"),
    Page(title: "Today Widget", image: "https://i.imgur.com/feuwhEc.png"),
]
class OnboardingViewController: UIViewController {

    var pageViewController: UIPageViewController!
    private var pages: [UIViewController] = [UIViewController]()
    public var viewModel: OnBoardingViewModel!
    let disposeBag = DisposeBag()

     override func viewDidLoad() {
        super.viewDidLoad()
        let page1 = FirstViewController()
        let page2 = FirstViewController()
        let page3 = FirstViewController()
        let page4 = FirstViewController()

        page1.pageIndex = 0
        page2.pageIndex = 1
        page3.pageIndex = 2
         page4.pageIndex = 3
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
         pages.append(page4)
         setUpView()

         let input = OnBoardingViewModel.Input(viewDidloadTrigger: rx.viewDidLoad.asDriver())
         let output = viewModel.transform(input: input)
         output.viewDidloadDriver
             .drive()
             .disposed(by: disposeBag)
         self.viewModel.steps.accept(OnBoardingStep.finish)
         

       }

    init(viewModel: OnBoardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func viewControllerAtIndex(index: Int) -> FirstViewController {
           if (pages.count == 0) || (index >= pages.count) {
               return FirstViewController()
           }
           let vc = FirstViewController()
           return vc
       }


    private func setUpView() {
    self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)

        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        guard let pageFirst = pages.first else {
            debugPrint("wrong index")
            return

        }
        pageViewController.setViewControllers([pageFirst],
                                              direction: .forward,
                                              animated: false,
                                              completion: nil)

    }

}

extension OnboardingViewController {

}
extension OnboardingViewController: UIPageViewControllerDataSource {

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as? FirstViewController
        let index = vc?.pageIndex
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        return self.viewControllerAtIndex(index: index ?? 0)
    }

     func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

         guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }

        let nextIndex = viewControllerIndex + 1

        guard nextIndex < pages.count else { return pages.first }

        guard pages.count > nextIndex else { return nil }

        return pages[nextIndex]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {

        guard let firstVC = pageViewController.viewControllers?.first else {
            return 0
        }
        guard let firstVCIndex = pages.firstIndex(of: firstVC) else {
            return 0
        }

        return firstVCIndex
    }
}
