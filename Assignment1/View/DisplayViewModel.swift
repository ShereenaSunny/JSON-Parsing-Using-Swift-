//
//  DisplayViewModel.swift
//  Assignment1
//
//  Created by Shereena Sunny on 24/03/22.
//

import Foundation

class DisplayViewModel: ObservableObject {
    
    @Published var personData = [Person]()
    @Published var companyData = [Company]()
    
    var dataModel: DataModel? = nil
    
    func populateData () {
        self.readDataFromLocalFile(forName: "person")
        self.addFilterToData()
    }
    
    private func readDataFromLocalFile(forName name: String) {
        if let bundlePath = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                if let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    let decodedData = try JSONDecoder().decode(DataModel.self, from: jsonData)
                    dataModel = decodedData
                }
            } catch {
                print(error)
            }
        }
    }
    
    private func addFilterToData() {
        let filteredPerson = dataModel?.person.filter({return Int($0.age) ?? 0 < 20}) ?? []
        self.personData = filteredPerson
        
        let companyNames = Set(filteredPerson.compactMap({ $0.companyName }))
        let filteredCompany = dataModel?.company.filter { companyNames.contains($0.name ?? "") } ?? []
        self.companyData = filteredCompany
    }

}
