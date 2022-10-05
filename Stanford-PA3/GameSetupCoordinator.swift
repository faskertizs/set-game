//
//  GameSetupCoordinator.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 19..
//

import Foundation

#warning("!!! Please clean up this mess after you've learnt how to navigate in views.")

struct GameSetupCoordinator<ViewModel: SetGameViewModel> {

//MARK: - Model Roles
    enum FixOrRandom {
        case fix
        case random
    }
    
    enum AGameChosenByTheUser {
        case classic
        case shape(_ fixOrRandom: FixOrRandom)
        case letter(_ fixOrRandom: FixOrRandom)
        case digit(_ fixOrRandom: FixOrRandom)
        case japanese(_ fixOrRandom: FixOrRandom)
    }
        
    var gameTypeChosenByTheUser = AGameChosenByTheUser.classic
    
//MARK: - View Model Roles
    private(set) var viewModel: ViewModel
    
    init() {
        var vm: ViewModel
        switch gameTypeChosenByTheUser {
            case .classic:
                let contentProvider = ShapeCardContentProvider(cardContentType: .classic)
                vm = ShapeSetGameViewModel(with: contentProvider.cardFeatures) as! ViewModel
            case .shape:
                let contentProvider = ShapeCardContentProvider(cardContentType: .random)
                vm = ShapeSetGameViewModel(with: contentProvider.cardFeatures) as! ViewModel
            case .letter:
                let contentProvider = CharacterCardContentProvider(characterType: .letter)
                vm = CharacterSetGameViewModel(with: contentProvider.cardFeatures) as! ViewModel
            case .digit:
                let contentProvider = CharacterCardContentProvider(characterType: .digit)
                vm = CharacterSetGameViewModel(with: contentProvider.cardFeatures) as! ViewModel
            case .japanese:
                let contentProvider = CharacterCardContentProvider(characterType: .japanese)
                vm = CharacterSetGameViewModel(with: contentProvider.cardFeatures) as! ViewModel
        }
        
        viewModel = vm
    }
}
