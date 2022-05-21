//
//  TableData.swift
//  Editable TableView
//
//  Created by Student Account on 5/17/22.
//

import Foundation
import UIKit

class TableData : NSObject, UITableViewDataSource{
    
    var Data = ["VW, Ford, Subaru"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RID", for: indexPath) as! MyUITableViewCell
        
        cell.CarBrand.text = Data[indexPath.row]
        
        return cell
    }
    
    
}
