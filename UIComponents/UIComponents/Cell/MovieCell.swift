//
//  MovieCell.swift
//  UIComponents
//
//  Created by Berkay on 13.11.2022.
//

import UIKit
import TinyConstraints
import Kingfisher

public class MovieCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: MovieCellProtocol?
    
    private let movieImageView = UIImageView()
    private let movieTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    public func set(viewModel: MovieCellProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
}

// MARK: - UILayout
extension MovieCell {
    
    private func addSubViews() {
        addPosterImageView()
        addTitleLabel()
    }
    
    private func addPosterImageView() {
        contentView.addSubview(movieImageView)
        movieImageView.edgesToSuperview(excluding: .bottom)
    }
    
    private func addTitleLabel() {
        contentView.addSubview(movieTitleLabel)
        movieTitleLabel.edgesToSuperview(excluding: [.top])
        movieTitleLabel.topToBottom(of: movieImageView, offset: 8)
    }
}

// MARK: - Configure
extension MovieCell {
    
    private func configureContents() {
        configureMovieImageView()
        configureMovieTitleLabel()
        guard let viewModel = viewModel else { return }
        movieImageView.kf.setImage(with: viewModel.movieImageView?.convertUrl, placeholder: UIImage.nonePhoto)
        movieTitleLabel.text = viewModel.movieTitle
    }
    
    private func configureMovieImageView() {
        movieImageView.height(200)
        movieImageView.layer.cornerRadius = 10
        movieImageView.clipsToBounds = true
    }
    
    private func configureMovieTitleLabel() {
        movieTitleLabel.font = .interRegular12
        movieTitleLabel.textColor = .appObsidian
        movieTitleLabel.textAlignment = .center
        movieTitleLabel.numberOfLines = 0
    }
}

