//
//  Stanford_PA3App.swift
//  Stanford-PA3
//
//  Created by Zsuzsa Faskerti on 2022. 01. 16..
//

import SwiftUI

@main
struct Stanford_PA3App: App {
    var body: some Scene {
        WindowGroup {
//            CharacterSetGameView(viewModel: GameSetupCoordinator().viewModel)
            ShapeSetGameView(viewModel: GameSetupCoordinator().viewModel)
        }
    }
}
