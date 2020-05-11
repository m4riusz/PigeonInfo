//
//  AboutViewModel.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 18/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import Foundation

final class AboutViewModel: ViewModelType {
    struct Input {
        
    }
    struct Output {
        
    }
    var coordinator: AboutCoordinatorProtocol!
    
    func transform(input: Input) -> Output {
        return .init()
    }
}
