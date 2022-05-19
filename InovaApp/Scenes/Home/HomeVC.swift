//
//  ViewController.swift
//  InovaApp
//
//  Created by kareem chetoos on 19/05/2022.
//

import UIKit
import RxCocoa
import RxSwift

class HomeVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var seriesNameLabel: UILabel!
    @IBOutlet weak var coachNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var videoView: UIView!
    
    // MARK: - Instance Properties
    var viewModel: HomeViewModel = {
        let viewModel = HomeViewModel()
        return viewModel
    }()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.loadJson(filename: "SeriesJson")
        
        viewModel.series
            .subscribe(onNext: {[weak self] series in
                guard let self = self else { return }
                self.coverImageView.downloadImageWith(urlString: series!.coverImage)
                self.seriesNameLabel.text = series?.seriesName
                self.coachNameLabel.text = series?.coachName
                self.descriptionLabel.text = series?.description
            }).disposed(by: disposeBag)

    }
}
