//
//  ViewController.swift
//  CompositionalLayoutChallenge
//
//  Created by Григорий Душин on 25.10.2022.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let sections = MockData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = createLayout()
        
    }
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout {[weak self] sectionIndex, layoutEnvironment in
            guard let self = self else {
                return nil
            }
            let section = self.sections[sectionIndex]
            switch section {
            
            case .one:
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(425), heightDimension: .absolute(425)), subitems: [item])
                //section
                
                return NSCollectionLayoutSection(group: group)
            case .two:
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)), subitems: [item])
                //section
                
                return NSCollectionLayoutSection(group: group)
            case .three:
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(150), heightDimension: .absolute(150)), subitems: [item])
                //section
                 
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 5
                section.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
               
                return section
            case .four:
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)))
                //group
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(130)), subitems: [item])
                //section
                
                return NSCollectionLayoutSection(group: group)

            case .five:
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)))
                //group
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(130)), subitems: [item])
                //section
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                
                return section
                
            case .six:
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)))
                //group
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(130)), subitems: [item])
                //section
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                
                return section
            case .seven:
                //item
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                //group
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(90)), subitems: [item])
                //section
                
                return NSCollectionLayoutSection(group: group)
                
            }
        }
    }
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}
    extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return sections.count
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return sections[section].count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            switch sections[indexPath.section] {
            case .one(let items):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RocketImageCell", for: indexPath) as! RocketImageCell
                cell.setup(title: items[0].image)
                return cell
            case .two(let items):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RocketNameCell", for: indexPath) as! RocketNameCell
                cell.setup(title: items[0].title1)
                return cell
            case .three(let items):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RocketDescriptionCell", for: indexPath) as! RocketDescriptionCell
                cell.setup(title1: items[indexPath.row].title1, title2: items[indexPath.row].title2)
                cell.layer.masksToBounds = true
                cell.layer.cornerRadius = 12
                return cell
            case .four(let items):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RocketAnotherInfoCell", for: indexPath) as! RocketAnotherInfoCell
                cell.setup(title1: items[indexPath.row].title1, title2: items[indexPath.row].title2)
                return cell
            case .five(let items):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RocketAnotherInfoCell", for: indexPath) as! RocketAnotherInfoCell
                cell.setup(title1: items[indexPath.row].title1, title2: items[indexPath.row].title2)
                return cell
            case .six(let items):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RocketAnotherInfoCell", for: indexPath) as! RocketAnotherInfoCell
                cell.setup(title1: items[indexPath.row].title1, title2: items[indexPath.row].title2)
                return cell
            case .seven(let items):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RocketLaunchButton", for: indexPath) as! RocketLaunchButton
                return cell
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "RocketHeaderCell", for: indexPath) as! RocketHeaderCell
                header.setup(title: sections[indexPath.section].title)
                return header
            default:
                return UICollectionReusableView()
            }
        }
    }
    


