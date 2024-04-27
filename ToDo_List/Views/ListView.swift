import SwiftUI

// MARK: - ListView Declaration
struct ListView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var listViewModel: ListViewModel
    @State private var showAddView: Bool = false
    
    // MARK: - Body
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

// MARK: - ListView_Preveiw Declaration
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
