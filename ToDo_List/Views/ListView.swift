//
//  ListView.swift
//  ToDo_List
//
//  Created by MacBookPro on 01.05.2021.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject private var listViewModel: ListViewModel
    @State private var showAddView: Bool = false
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                listViewModel
                                    .updateItem(item: item)
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("To-Do List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:  NavigationLink("Add", destination: AddView())
        )
    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
