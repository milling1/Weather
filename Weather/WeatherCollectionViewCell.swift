//
//  WeatherCollectionViewCell.swift
//  Weather
//
//  Created by user on 07.06.2022.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalCentering
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor.gray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameCity:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight(rawValue: 17))
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var weatherImage:UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var date:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.highlightedTextColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var temperatureLabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var temperatureMinMax:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStack()
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Private
private extension WeatherCollectionViewCell {
    func setupUI() {
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 5.0
        backgroundColor = .clear
        contentView.layer.cornerRadius = 24
        contentView.backgroundColor = .white
    }
    
    func setupStack() {
        [date, nameCity, weatherImage, temperatureLabel, temperatureMinMax].forEach {
            stackView.addArrangedSubview($0)
        }
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
                                     stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 2),
                                     stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 2),
                                     stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 2)])
    }
}
