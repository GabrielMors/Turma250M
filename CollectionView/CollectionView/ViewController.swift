//
//  ViewController.swift
//  CollectionView
//
//  Created by Gabriel Mors  on 11/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var listNames: [Person] = [Person(name: "Gabriel"),
                               Person(name: "Nathália"),
                               Person(name: "Otávio"),
                               Person(name: "Gabriel"),
                               Person(name: "Nathália"),
                               Person(name: "Otávio"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }

    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isAccessibilityElement = true
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        collectionView.register(PersonCollectionViewCell.nib(), forCellWithReuseIdentifier: PersonCollectionViewCell.identifier)
        collectionView.horizontalScrollIndicatorInsets = .zero
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.identifier, for: indexPath) as? PersonCollectionViewCell
        
        let indexName = listNames[indexPath.row]
        cell?.setupCell(person: indexName)
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    
}
