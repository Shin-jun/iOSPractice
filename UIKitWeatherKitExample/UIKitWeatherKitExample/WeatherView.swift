//
//  WeatherView.swift
//  UIKitWeatherKitExample
//
//  Created by Shin yongjun on 2022/10/05.
//

import WeatherKit
import UIKit

final class WeatherView: UIView {
    
    private let iconView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .medium)
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "37"
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 55, weight: .regular)
        return label
    }()
    
    override init(frane: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
        addSubView(iconView)
        addSubView(titleLabel)
    }
    
}
