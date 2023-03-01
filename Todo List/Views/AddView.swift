//
//  AddView.swift
//  Todo List
//
//  Created by Rishi on 01/03/2023.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            
            VStack {
                TextField("Type Something here!!", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: .systemGray6))
                    .cornerRadius(10)
                
                Button {
                    //
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
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
            
        }
    }
}
