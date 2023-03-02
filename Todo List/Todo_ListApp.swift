//
//  Todo_ListApp.swift
//  Todo List
//
//  Created by Rishi on 01/03/2023.
//

import SwiftUI


/*
 MVVM Archtitecture
 Model- Data Logic
 View- UI
 ViewModel- Manages Models For View
 
 */

@main
struct Todo_ListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            
        }
    }
}
