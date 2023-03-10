//
//  AddView.swift
//  Todo List
//
//  Created by Rishi on 01/03/2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            
            VStack {
                TextField("Type Something here!!", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                    
                } label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.tint)
                        .cornerRadius(10)
                    
                }
                
            }
            .padding(14)
            
            
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
        
        
    }
    
    
    func saveButtonPressed() {
        
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be atleast 3 character long!!! 😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
        
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
