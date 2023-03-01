//
//  TodoListApp.swift
//  TodoList
//
//  Created by VinhHoang on 28/02/2023.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
