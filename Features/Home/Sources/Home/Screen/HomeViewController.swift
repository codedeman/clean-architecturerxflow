//
//  HomeViewController.swift
//  
//
//  Created by Kevin on 3/19/23.
//

import UIKit
import SnapKit
import ComonFeature

class HomeViewController: BaViewController<HomeViewModel> {


    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        sv.contentInsetAdjustmentBehavior = .never
        return sv
    }()

    private lazy var contentView: UIView = {
        let sv = UIView()
//        sv.backgroundColor = .
        return sv
    }()

    private lazy var contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .equalCentering
        sv.spacing = 20
        return sv
    }()

    private lazy var subView2: UIView = {
        let sv = UIView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .purple
        return sv
    }()

    private lazy var lablelBottom: UILabel = {
        let lbl = UILabel()
        lbl.text = "AHAHAHAHAHAHAHHAHAHAHHAHAHAHHAHAHA"
        lbl.backgroundColor = .purple
        return lbl
    }()


    private lazy var botomLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .red
        self.view.addSubview(scrollView)
        self.scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        self.scrollView.backgroundColor = .red
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(250)
        }

        contentView.addSubview(contentStackView)
        contentStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        contentStackView.backgroundColor = .green

        let feature1 = PreviewFetureView(frame: .zero)
        let feature2 = PreviewFetureView(frame: .zero)
        let feature3 = PreviewFetureView(frame: .zero)
        let feature4 = PreviewFetureView(frame: .zero)
        let feature5 = PreviewFetureView(frame: .zero)

        contentStackView.addArrageView(views: [feature1, feature2, feature3, feature4, feature5])


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


//struct HomeViewController_Previews: PreviewProvider {
//    @available(iOS 13.0, *)
//    @available(iOS 13.0, *)
//    static var previews: some View {
//    Container().edgesIgnoringSafeArea(.all)
//  }
//    struct Container: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> UIViewController {
//      UINavigationController(rootViewController: HomeViewController())
//    }
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//    typealias UIViewControllerType = UIViewController
//  }
//}
