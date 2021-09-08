//
//  ViewController.swift
//  TinyNetworkManager
//
//  Created by Vinayak.Hejib on 07/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countriesTableView: UITableView!
    private var countries: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadCountries()
    }
    
    private func loadCountries() {
        ViewModel().getListOfCountries { [weak self] (countries, error) in
            if let countries = countries,
               !countries.isEmpty {
                self?.countries = countries
                self?.setUpTableView()
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    private func setUpTableView() {
        countriesTableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if( !(cell != nil))
        {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        }
        cell?.textLabel?.text = countries[indexPath.row]
        return cell ?? UITableViewCell()
    }
}

