//
//  carbrandDB.swift
//  Editable TableView
//
//  Created by Student Account on 5/21/22.
//

import Foundation

class carbrandDB{
    var carBrandList = [brand]()

        func addBrand(name: String) {
            let newBrand = brand(name: name)
            carBrandList.append(newBrand)
        }
        func remove(atIndex: Int) {
            carBrandList.remove(at:atIndex)
               }

        init() {
            let brand1 = brand(name: "vw")
            let brand2 = brand(name: "ford")
            let brand3 = brand(name: "chevy")

            carBrandList.append(brand1)
            carBrandList.append(brand2)
            carBrandList.append(brand3)
        }
}
