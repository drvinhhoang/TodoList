//
//  AddView.swift
//  TodoList
//
//  Created by VinhHoang on 28/02/2023.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    @Environment(\.dismiss) var dismiss: DismissAction
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type some thing hear", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋️")
        .alert("Alert title", isPresented: $showAlert) {
            
        } message: {
            Text(alertTitle)
        }

    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be atleast 3 characters long!!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
        .preferredColorScheme(.light)
        .environmentObject(ListViewModel())
        
        
        NavigationStack {
            AddView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())
    }
}
