//
//  ViewController.swift
//  Weather
//
//  Created by user on 07.06.2022.
//

import UIKit


final class WeatherViewController: UIViewController {
   
    private let localService = LocalLoaderWeather()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let identifireCell = "CollectionViewcell"
    private let sectionInsert = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
 

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionview()
        setupConstraints()
        setupNavigationBarView()
        
    }
    
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return localService.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifireCell, for: indexPath) as? WeatherCollectionViewCell else {return UICollectionViewCell()}
        cell.nameCity.text = localService.items[indexPath.row].cityName
        cell.temperatureMinMax.text = localService.items[indexPath.row].tempMinMaxLabelText
        cell.temperatureLabel.text = localService.items[indexPath.row].tempLabeltext
        cell.date.text = localService.items[indexPath.row].dateLabelText
        cell.weatherImage.image = SemanticImage.snow.image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = Double(self.view.frame.size.width)
        let screenHeigh = Double(self.view.frame.size.width)
        return CGSize(width: screenWidth / 2.5, height: (screenHeigh / 2) * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsert.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsert.left
    }
}

private extension WeatherViewController {
    
    func setupCollectionview() {
        collectionView.backgroundColor = .white
        collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: identifireCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
                                     collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)])
    }
    
    func setupNavigationBarView() {
        title = "WeatherViewController"
        let addButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(showAddUserAlert))
        navigationItem.setRightBarButton(addButton, animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backButtonTapped))
        
    }
    
    @objc private func showAddUserAlert() {
        let alertController = UIAlertController(title: "Add new city", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
           
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
           
        }
        alertController.addTextField { textField in
            textField.placeholder = "Add city"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func backButtonTapped() {
    }
}
