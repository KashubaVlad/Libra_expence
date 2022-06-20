//
//  ViewController.swift
//  Libra расходы
//
//  Created by Vlad on 18.05.2022.
//

import UIKit

protocol AddItemDelegate {
    func addItemToArrey(_ addExpences: AddExpences, didAddItem item : Item )
}


class ViewControllerApp: UIViewController, AddItemDelegate {
    
    func addItemToArrey(_ addExpences: AddExpences, didAddItem item: Item) {
        items.append(item)
        tableViewApp.reloadData()
        print("------ \(items)")
        totalMinus -= item.price
        print(totalMinus)
    }
    
    var items = [Item]()
    func printItems() {
    }
    
    let cellId = "My cell"
    @IBOutlet weak var tableViewApp: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewApp.dataSource = self
        tableViewApp.delegate = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        tableViewApp.register(UINib(nibName: "ExpenceTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        ///        search.dismiss(animated: true, completion: nil)
        self.navigationItem.searchController = search
    }
    
    
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddingExpenceVC") as? AddExpences
        self.present(vc!, animated: true, completion: nil)
        vc?.delegate = self
    }
}

extension ViewControllerApp: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! ExpenceTableViewCell
        let item = items [indexPath.row]
        
        cell.ExpenceLabelName.text = item.name
        
        let price = String(item.price)
        cell.ExpenceLabeQuantity.text = "Price: \(price)"
        
        /*
         cell.ExpenceImage.layer.frame.size.height = 85
         cell.ExpenceImage.layer.frame.size.width = 85
         
         */
        
        
        
        
        ///        cell.ExpenceImage.image = item.image
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Raw \(indexPath.row)")
    }
}

/*    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
 return "Section"
 */

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100.0
}
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("++++++++++++++++\(indexPath.row)+++++++++++++++++++")
}
extension ViewControllerApp: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
    }
    
}


