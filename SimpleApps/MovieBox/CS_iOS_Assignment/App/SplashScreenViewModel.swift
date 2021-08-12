//
//  SplashScreenViewModel.swift
//  CS_iOS_Assignment
//
//  Created by Duy Nguyen on 1/8/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import Foundation
import Alamofire

final class SplashScreenViewModel {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    func fetchMoviesAndPosters(completion: @escaping ((Swift.Result<(movies: [Movie], posters: [Movie]),
                                                                    AFError>) -> Void)) {
        var movies = [Movie]()
        var posters = [Movie]()
        var error: AFError?
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        dispatchGroup.enter()
        networkManager.getMovies(page: 1) { result in
            switch result {
            case .success(let data):
                movies = data.results
            case .failure(let err):
                error = err
            }
            dispatchGroup.leave()
        }
        networkManager.getPosters { result in
            switch result {
            case .success(let data):
                posters = data.results
            case .failure(let err):
                error = err
            }
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success((movies, posters)))
            }
        }
    }
}
