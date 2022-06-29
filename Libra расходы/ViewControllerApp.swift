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


class ViewControllerApp: UIViewController {
    
    
    
    var items = [Item]()
    let cellId = "My cell"
    
    
    
    
    @IBOutlet weak var tableViewApp: UITableView!
    
    @IBOutlet weak var AddExpenceButton: UIButton!
    @IBOutlet weak var AddIncomeeButton: UIButton!
    
    @IBOutlet private var BalanceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationInterface()
        balanceConfig()
        
        tableViewApp.dataSource = self
        tableViewApp.delegate = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        tableViewApp.register(UINib(nibName: "ExpenceTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        /*
         let search = UISearchController(searchResultsController: nil)
         search.searchResultsUpdater = self
         ///        search.dismiss(animated: true, completion: nil)
         self.navigationItem.searchController = search
         */
        
    }
    
    
    
    @IBAction func ExpenceButtonCklicked(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddingExpenceVC") as? AddExpences
        self.present(vc!, animated: true, completion: nil)
        vc?.delegate = self
    }
    
    @IBAction func IncomeButtonClicked(_ sender: UIButton) {
    }
    
    
    private func configurationInterface() {
        AddExpenceButton.layer.cornerRadius = AddExpenceButton.frame.size.height / 2
        AddExpenceButton.setTitle("+", for: .normal)
        AddExpenceButton.backgroundColor = .green
        
        AddIncomeeButton.layer.cornerRadius = AddExpenceButton.frame.size.height / 2
        AddIncomeeButton.setTitle("-", for: .normal)
        AddIncomeeButton.backgroundColor = .red
    }
    
    
    let balance = String(totalBalance)
    private func balanceConfig() {
        
        BalanceLabel.text = ("Balance = \(balance)")
        print(totalBalance)
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = (storyboard?.instantiateViewController(withIdentifier: "ItemCellVC"))! as? ItemCellController
        self.navigationController?.pushViewController(vc!, animated: true)
        let item = items [indexPath.row]
        vc!.name = item.name
        vc!.price = item.price
        vc!.notes = item.notes
        
        print("1-\(item)")
        
        ///        controller.nameLabel!.text = item.name
        print("----------\(item.name)")
        ///        print("++++++++++\(vc!.nameLabel.text)")
        ///        print(vc!.nameLabel?.text)
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






extension ViewControllerApp: AddItemDelegate {
    
    func addItemToArrey(_ addExpences: AddExpences, didAddItem item: Item) {
        items.append(item)
        tableViewApp.reloadData()
        print("------ \(items)")
        totalBalance += Double(item.price)
        
        
        print("eeeeee\(totalBalance)")
        
        
    }
}
