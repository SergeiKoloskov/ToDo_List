import SwiftUI

// MARK: - ListRowView Declaration
struct ListRowView: View {
    
    // MARK: - Properties
    let item: ItemModel
    let circlesColor = Color("CirclesColor")
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(circlesColor)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

// MARK: - ListRowVire Preview Deslcaration
private struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First item", isCompleted: false)
    static var item2 = ItemModel(title: "Second item", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item1)
                .preferredColorScheme(.dark)
            ListRowView(item: item2)
            ListRowView(item: item2)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
