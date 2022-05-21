//
//  ViewController.swift
//  Editable TableView
//
//  Created by Student Account on 5/17/22.
//

import UIKit

class EditableViewController: UITableViewController {

    var data : carbrandDB!
        var brands = ["vw", "tesla", "bmw", "ford", "honda", "jeep"]

        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                     section: Int) -> String? {

            return "Brands"
         }
         // Create a standard footer that includes the returned text.
         override func tableView(_ tableView: UITableView, titleForFooterInSection
                                     section: Int) -> String? {
            return "End of brands list"
         }


        @IBAction func addBrand() {
            if (brands.count > 0) {
                // add random country
                let randomIndex = Int(arc4random_uniform(UInt32(brands.count)))
                data.addBrand(name: brands[randomIndex])
                //update tableview row
                let indexPath = IndexPath(row: data.brands.count-1, section: 0)
                tableView.insertRows(at:[indexPath], with: .automatic)

                //remove random country from country array
                brands.remove(at: randomIndex)


            }
        }
        @IBAction func EditToggle(_ sender: UIButton) {
            if isEditing {
                setEditing(false, animated: true)
                sender.setTitle("Edit", for: .normal)
            }
            else {
                setEditing(true, animated: true)
                sender.setTitle("Done", for: .normal)
            }
        }
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                    if( editingStyle == .delete) {
                        brands.append(data.brands[indexPath.row].name)
                        data.remove(atIndex: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .automatic)
                    }
                }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.brands.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

            cell.textLabel?.text = data.brands[indexPath.row].name
            cell.detailTextLabel?.text = ""

            return cell
        }


}

