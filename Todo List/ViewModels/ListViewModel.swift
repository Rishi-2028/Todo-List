//
//  ListViewModel.swift
//  Todo List
//
//  Created by Rishi on 02/03/2023.
//

import Foundation


/*
 CRUD FUNCTIONS
 
 Create - add items
 Read - get items
 Update - update items
 Delete - delete items
 
 */

class ListViewModel: ObservableObject {
    
    
    
    @Published var items: [ItemModel] = []
    
    
    init() {
        getItems()
    }
    
    
    func getItems() {
        let newItems = [
            ItemModel.init(title: "This is first title", isCompleted: false),
            ItemModel.init(title: "This Second ", isCompleted: true),
            ItemModel.init(title: " Third", isCompleted: true)
            
        ]
        items.append(contentsOf: newItems)
    }
    
    
    func deleteItem(indexSet: IndexSet) {
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
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
}
