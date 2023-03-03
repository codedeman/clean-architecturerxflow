//
//  PreviewFetureView.swift
//  
//
//  Created by Kevin on 4/6/23.
//

import UIKit
import SnapKit
import ComonFeature

class PreviewFetureView: UIView {

    private lazy var iv: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "FfVV6eYX0AImRwU.jpeg")
        return imageView
    }()

    private lazy var contentView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()

    private lazy var labelTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "What the helll What the helll What the helllWhat the helllWhat the helll What the helll What the helll What the helllWhat the helllWhat the helllWhat the helll What the helll What the helllWhat the helllWhat the helllWhat the helll What the helll What the helllWhat the helllWhat the helllWhat the helll What the helll What the helllWhat the helllWhat the helllWhat the helll What the helll What the helllWhat the helllWhat the helllWhat the helll What the helll What the helllWhat the helllWhat the helllWhat the helll What the helll What the helllWhat the helllWhat the helll "
        lbl.font = .boldSystemFont(ofSize: 18)
        lbl.numberOfLines = 0
        return lbl
    }()

    private lazy var subTitle: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.text = "- She is supposed to finish her homework before watching TV. (Cô ấy phải hoàn thành bài tập trước khi xem TV) - She is supposed to finish her homework before watching TV. (Cô ấy phải hoàn thành bài tập trước khi xem TV)- She is supposed to finish her homework before watching TV. (Cô ấy phải hoàn thành bài tập trước khi xem TV)- She is supposed to finish her homework before watching TV. (Cô ấy phải hoàn thành bài tập trước khi xem TV)- She is supposed to finish her homework before watching TV. (Cô ấy phải hoàn thành bài tập trước khi xem TV)- She is supposed to finish her homework before watching TV. (Cô ấy phải hoàn thành bài tập trước khi xem TV)"
        lbl.font = .italicSystemFont(ofSize: 12)
        lbl.backgroundColor = .yellow
        return lbl
    }()

    private lazy var buttonSubmit: UIButton = {
        let btn = UIButton()
        btn.setTitle("Confirm", for: .normal)
        btn.backgroundColor = .red
        return btn
    }()

    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        return stack
    }()

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.addSubview(contentStack)
        contentView.addSubview(iv)
        iv.backgroundColor = .red
        iv.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(100)
        }

        contentStack.snp.makeConstraints { make in
            make.leading.equalTo(iv.snp.trailing).inset(20)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        self.contentView.addSubview(buttonSubmit)
        buttonSubmit.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).inset(16)
            make.bottom.equalTo(contentView.snp.bottom).inset(16)
            make.top.greaterThanOrEqualTo(contentStack.snp.bottom).offset(16)
            make.height.equalTo(32)
        }

        contentStack.addArrageView(views: [labelTitle, subTitle])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buttonSubmit.layer.cornerRadius = 16
        self.buttonSubmit.clipsToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
