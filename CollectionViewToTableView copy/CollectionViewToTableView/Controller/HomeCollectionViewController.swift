//
//  HomeCollectionViewController.swift
//  CollectionViewToTableView
//
//  Created by Ngoc on 7/25/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit



class HomeCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var numberofitem: CGFloat = 3
    var minimumitemSpacing: CGFloat = 5
    var minimuminterLinespacing: CGFloat = 5
    
    var totalUSer: [User]?
    
    var displayUserID = [Int]()
    
    var tempUser = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemsize = (view.bounds.width - (numberofitem - 1) * minimumitemSpacing) / numberofitem
        flowLayout.itemSize = CGSize(width: itemsize, height: itemsize)
        flowLayout.minimumLineSpacing = minimuminterLinespacing
        flowLayout.minimumInteritemSpacing = minimumitemSpacing
        setDataFromAPI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tempUser.removeAll()
    }
    
    func setDataFromAPI() {
        DataService.sharedIntance.getdataApi { data in
            self.totalUSer = data
            for i in 0..<self.totalUSer!.count {
                if self.displayUserID.contains(self.totalUSer![i].userId) == false {
                    self.displayUserID.append(self.totalUSer![i].userId)
                }
            }
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if totalUSer?.count == nil {
            return 0
        } else {
            return displayUserID.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell
        Cell?.labelID.text = String(displayUserID[indexPath.row])
        return Cell!
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let cell = sender as? UICollectionViewCell
//        let indexPath = collectionView.indexPath(for: cell!)
//        if let detailVC = segue.destination as? DetailTableViewController {
//            for i in 0..<totalUSer!.count {
//                if displayUserID[indexPath!.row] == totalUSer![i].userId {
//                    tempUser.append(totalUSer![i])
//                }
//            }
//            detailVC.receivedUserData = tempUser
//        }
        
        if let tableVC = segue.destination as? DetailTableViewController {
            if let indexPaths = collectionView.indexPathsForSelectedItems {
                for index in indexPaths {
                    for i in 0..<totalUSer!.count {
                        if totalUSer![i].userId == displayUserID[index.row] {
                            tempUser.append(totalUSer![i])
                        }
                    }
                }
                tableVC.receivedUserData = tempUser
            }
        }
    }
}
