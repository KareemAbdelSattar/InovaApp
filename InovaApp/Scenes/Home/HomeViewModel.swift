//
//  HomeViewModel.swift
//  InovaApp
//
//  Created by kareem chetoos on 19/05/2022.
//

import Foundation
import RxCocoa
import RxSwift

protocol CategoryViewModelProtocol {
    var series: BehaviorRelay<Series?> { get }

}
class HomeViewModel: CategoryViewModelProtocol {
    var series: BehaviorRelay<Series?> = BehaviorRelay(value: nil)
    

    func loadJson(filename fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Series.self, from: data)
                series.accept(jsonData)
            } catch {
                print("error:\(error)")
            }
        }
    }
}
