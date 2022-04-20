//
//  DisplayView.swift
//  Assignment1
//
//  Created by Shereena Sunny on 05/04/22.
//

import SwiftUI

struct DisplayView: View {
    
    @StateObject var viewModel = DisplayViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.personData, id: \.self) { person in
                    personView(person)
                }
                ForEach(viewModel.companyData, id: \.self) { companyInfo in
                    companyView(companyInfo)
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            viewModel.populateData()
        }
    }
    
    func personView(_ person: Person) -> some View {
        HStack {
            Text(person.name ?? "No value to display")
            Text(person.age)
            Spacer()
        }
    }
    
    func companyView(_ company: Company) -> some View {
        HStack {
            Text(company.id ?? "1")
            Text(company.name ?? "No company name to display")
            Spacer()
        }
    }

}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
    }
}
