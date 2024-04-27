//
//  ToDo_ListApp.swift
//  ToDo_List
//
//  Created by MacBookPro on 01.05.2021.
//

import SwiftUI

/*
 
 MVVM Architecture
 
 Model - data
 View - UI
 ModelView - manages Models for Views
 
 */


@main
struct ToDo_ListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
