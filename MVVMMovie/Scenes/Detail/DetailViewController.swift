//
//  DetailViewController.swift
//  MVVMMovie
//
//  Created by Berkay on 14.11.2022.
//

import Foundation
import UIKit
import TinyConstraints
import Kingfisher

final class DetailViewController: BaseViewController<DetailViewModel> {
    
    private let movieTitleLabel = UILabel()
    private let movieImageView = UIImageView()
    private let imdbPointLabel = UILabel()
    private let movieDescriptionTitle = UILabel()
    private let movieDescription = UILabel()
    private let actorsTitle = UILabel()
    private let actorsLabel = UILabel()
    private let yearTitle = UILabel()
    private let yearLabel = UILabel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        subscribeViewModel()
        viewModel.getMovieDetailRequest()
    }
}

// MARK: - UI Layout
extension DetailViewController {

    private func addSubViews() {
        addMovieTitleLabel()
        addMovieImageView()
        addImdbPointLabel()
        addMovieDescriptionTitle()
        addDescriptionMovie()
        addActorsTitle()
        addActors()
        addYearTitle()
        addYear()
    }
    
    private func addMovieTitleLabel() {
        view.addSubview(movieTitleLabel)
        movieTitleLabel.edgesToSuperview(excluding: .bottom, insets: .top(16) + .horizontal(25), usingSafeArea: true)
    }
    
    private func addMovieImageView() {
        view.addSubview(movieImageView)
        movieImageView.topToBottom(of: movieTitleLabel, offset: 25)
        movieImageView.edgesToSuperview(excluding: [.top, .bottom, .right], insets: .left(25))
    }
    
    private func addImdbPointLabel() {
        view.addSubview(imdbPointLabel)
        imdbPointLabel.leftToRight(of: movieImageView, offset: 10)
        imdbPointLabel.trailingToSuperview().constant = -20
        imdbPointLabel.centerY(to: movieImageView)
    }
    
    private func addMovieDescriptionTitle() {
        view.addSubview(movieDescriptionTitle)
        movieDescriptionTitle.topToBottom(of: movieImageView, offset: 16)
        movieDescriptionTitle.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(25))
    }
    
    private func addDescriptionMovie() {
        view.addSubview(movieDescription)
        movieDescription.topToBottom(of: movieDescriptionTitle, offset: 4)
        movieDescription.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(25))
    }
    
    private func addActorsTitle() {
        view.addSubview(actorsTitle)
        actorsTitle.topToBottom(of: movieDescription, offset: 4)
        actorsTitle.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(25))
    }
    
    private func addActors() {
        view.addSubview(actorsLabel)
        actorsLabel.topToBottom(of: actorsTitle, offset: 4)
        actorsLabel.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(25))
    }
    
    private func addYearTitle() {
        view.addSubview(yearTitle)
        yearTitle.topToBottom(of: actorsLabel, offset: 4)
        yearTitle.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(25))
    }
    
    private func addYear() {
        view.addSubview(yearLabel)
        yearLabel.topToBottom(of: yearTitle, offset: 4)
        yearLabel.edgesToSuperview(excluding: [.top, .bottom], insets: .horizontal(25))
    }
}

// MARK: - ConfigureContents
extension DetailViewController {

    private func configureContents() {
        view.backgroundColor = .appObsidian
        configureMovieTitleLabel()
        configureMovieImageView()
        configureImdbPointLabel()
        configureMovieDescriptionTitle()
        configureMovieDescription()
        configureActorsTitle()
        configureActors()
        configureYearTitle()
        configureYear()
    }
    
    private func configureMovieTitleLabel() {
        movieTitleLabel.font = .interBold20
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.textAlignment = .left
        movieTitleLabel.textColor = .appWhite
    }
    
    private func configureMovieImageView() {
        movieImageView.width(150)
        movieImageView.height(200)
        movieImageView.kf.setImage(with: viewModel.movieImage, placeholder: UIImage.nonePhoto)
        movieImageView.layer.cornerRadius = 14
        movieImageView.clipsToBounds = true
    }
    
    private func configureImdbPointLabel() {
        imdbPointLabel.height(200)
        imdbPointLabel.font = UIFont.systemFont(ofSize: 110.0)
        imdbPointLabel.textAlignment = .center
        imdbPointLabel.textColor = .appWhite
    }
    
    private func configureMovieDescriptionTitle() {
        movieDescriptionTitle.text = L10n.Detail.movieDesTitle
        movieDescriptionTitle.font = .interRegular16
        movieDescriptionTitle.textColor = .appHoney
    }
    
    private func configureMovieDescription() {
        movieDescription.font = .interRegular16
        movieDescription.textColor = .appWhite
        movieDescription.numberOfLines = 0
    }
    
    private func configureActorsTitle() {
        actorsTitle.font = .interRegular16
        actorsTitle.textColor = .appHoney
        actorsTitle.text = L10n.Detail.actorsTitle
    }
    
    private func configureActors() {
        actorsLabel.font = .interRegular16
        actorsLabel.textColor = .appWhite
        actorsLabel.numberOfLines = 0
    }
    
    private func configureYearTitle() {
        yearTitle.font = .interRegular16
        yearTitle.textColor = .appHoney
        yearTitle.text = L10n.Detail.yearTitle
    }
    
    private func configureYear() {
        yearLabel.font = .interRegular16
        yearLabel.textColor = .appWhite
        yearLabel.numberOfLines = 0
    }
    
    private func configureValuesFromApi() {
        guard let movies = viewModel.moviesDetail else { return }
        movieTitleLabel.text = movies.title
        imdbPointLabel.text = movies.imdbRating
        actorsLabel.text = movies.actors
        yearLabel.text = movies.year
        movieDescription.text = movies.plot
    }
}

// MARK: - SubscribeViewModel
extension DetailViewController {
    
    private func subscribeViewModel() {
        viewModel.fetchedDetailValues = { [weak self] in
            guard let self = self else { return }
            self.configureValuesFromApi()
        }
    }
}
