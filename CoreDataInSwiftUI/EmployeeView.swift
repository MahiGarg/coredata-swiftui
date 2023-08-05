//
//  EmployeeView.swift
//  CoreDataInSwiftUI
//
//  Created by Suneet  Agrawal on 04/08/23.
//

import SwiftUI

struct EmployeeView: View {
    
    @StateObject var viewModel = EmployeeViewModel()
    
    @FocusState var isFocused: Bool
    @State var name: String = ""
    @State var id: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter name of employee",
                          text: $name) {
                    self.isFocused = true
                }
                          .padding()
                TextField("Enter id of employee", text: $id)
                    .focused($isFocused)
                    .padding(.horizontal)
                Button {
                    if name.count > 3 && id.count > 2,
                       let newid = Int16(id) {
                        viewModel.addData(name: name,
                                          id: newid)
                        name = ""
                        id = ""
                    }
                } label: {
                    Text("ADD Data")
                        .frame(width: 384, height: 36)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(12)
                        .padding(.top)
                }
                List {
                    ForEach(viewModel.employeeEntity, id: \.self) { item in
                        VStack {
                            Text(String(item.id) + ".  " + item.name!)
                        }
                        
                    }
                    .onDelete(perform: viewModel.deleteData)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Employee Data")
        }
    }
}
