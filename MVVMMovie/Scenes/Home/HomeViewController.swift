//
//  HomeViewController.swift
//  MVVMMovie
//
//  Created by Berkay on 13.11.2022.
//

import UIKit
import TinyConstraints

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let searchBar = UISearchBar()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        subscribeViewModel()
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        addSearchBar()
        addCollectionView()
    }
    
    private func addSearchBar() {
        view.addSubview(searchBar)
        searchBar.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.topToBottom(of: searchBar, offset: 16)
        collectionView.edgesToSuperview(excluding: .top, usingSafeArea: true)
    }
}

// MARK: - ConfigureContents
extension HomeViewController {
    
    private func configureContents() {
        configureSearchBar()
        configureCollectionView()
    }
    
    private func configureSearchBar() {
        searchBar.height(50)
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = L10n.Home.seachBar
        searchBar.delegate = self
        searchBar.searchTextField.textColor = .appBlue
        searchBar.searchTextField.leftView?.tintColor = .appBlue
    }
    
    private func configureCollectionView() {
        collectionView.register(MovieCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - SubscribeViewModel
extension HomeViewController {
        
    private func subscribeViewModel() {
        viewModel.reloadData = {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - SearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchMovie(movie: searchText)
    }
}

// MARK: - CollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (collectionView.contentSize.height - 150) - scrollView.frame.size.height {
            viewModel.searchRemainingMovies()
        }
    }
}

// MARK: - CollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.cellForItemAt(indexPath: indexPath))
        return cell
    }
}

// MARK: - CollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 24) / 3
        return .init(width: width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
