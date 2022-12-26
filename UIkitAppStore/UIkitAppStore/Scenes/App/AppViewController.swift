//
//  AppViewController.swift
//  UIkitAppStore
//
//  Created by Shin yongjun on 2022/11/10.
//

import SnapKit
import UIKit

final class AppViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing // .fiilequaly로 하면 각각의 높이가 같아짐
        stackView.spacing = 0.0 // 서브뷰의 높이의 의해서만 높이가 바뀐다.
        
        // 필요한 뷰를 추가
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = UIView()
        let exchangeCodeButtonView = UIView()
        
        rankingFeatureSectionView.backgroundColor = .blue
        exchangeCodeButtonView.backgroundColor = .yellow
        
        [featureSectionView, rankingFeatureSectionView, exchangeCodeButtonView]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupLayout()
    }
}

private extension AppViewController {
    func setupNavigationController() {
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview() // 세로스크롤이 가능하게
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
