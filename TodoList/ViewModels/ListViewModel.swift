//
//  ListViewModel.swift
//  TodoList
//
//  Created by VinhHoang on 28/02/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    private let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [ItemModel(title: "This is the first title!", isCompleted: false),
//                        ItemModel(title: "This is the second!", isCompleted: true),
//                        ItemModel(title: "Third", isCompleted: false),]
//        items.append(contentsOf: newItems)
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
        let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        items = decodedData
    }
    
    
    func deleItem(indexSet: IndexSet)  {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
