//
//  AddView.swift
//  ToDo_List
//
//  Created by MacBookPro on 01.05.2021.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var textFieldEmpty = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type task name...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonTapped, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                
                if textFieldEmpty {
                    Text("Task name is missing!")
                        .padding()
                        .foregroundColor(.red)
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an item 🖊")
    }
    
    func saveButtonTapped() {
        
        if textFieldText == "" {
            textFieldEmpty = true
        } else {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
