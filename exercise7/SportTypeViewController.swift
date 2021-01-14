//
//  ViewController.swift
//  exercise7
//
//  Created by Scores_Main_User on 1/13/21.
//

import UIKit

class SportTypeViewController: UIViewController
{

    let tableView = UITableView()


    var sportTypesArray: [String] = ["Soccer", "Basketball", "Hockey"]

    let IsraelData: CountryData = CountryData(Country: "Israel", SportTypeToCountryLeaguesDict: ["Soccer": ["Premier League", "National League", "Division 3"],
                                                                                                 "Basketball": ["Winner League", "All Star", "National League"]])
    let EnglandData: CountryData = CountryData(Country: "England", SportTypeToCountryLeaguesDict: ["Soccer": ["Premier League", "Championship", "League One"]])
    let SpainData: CountryData = CountryData(Country: "Spain", SportTypeToCountryLeaguesDict: ["Soccer": ["La Liga", "Copa Federation", "Segunda B"]])
    let ItalyData: CountryData = CountryData(Country: "Italy", SportTypeToCountryLeaguesDict: ["Basketball": ["Lega A", "Serie A2"]])
    let USAData: CountryData = CountryData(Country: "USA", SportTypeToCountryLeaguesDict: ["Basketball": ["NBA", "WNBA", "CBI"]])
    let GermanyData = CountryData(Country: "Germany", SportTypeToCountryLeaguesDict: ["Hockey": ["DEL", "DEL2"]])
    let RussiaData = CountryData(Country: "Russia", SportTypeToCountryLeaguesDict: ["Hockey": ["KHL", "VHL"]])
    let CanadaData = CountryData(Country: "Canada", SportTypeToCountryLeaguesDict: ["Hockey": ["OHL"]])


    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
    }


    func setupTableView()
    {
        self.view.addSubview(tableView)
        self.tableView.pin(to: view)

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }


}


extension SportTypeViewController: UITableViewDelegate
{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {

        guard let cell: UITableViewCell = tableView.cellForRow(at: indexPath) else
        {
            return
        }

        guard let sportType: String = cell.textLabel?.text else
        {
            return
        }

        let vc: CountriesViewController

        switch sportType
        {
            case "Soccer":
                vc = CountriesViewController(countriesArray: [IsraelData, EnglandData, SpainData], sectionTitle: "Soccer")
            case "Basketball":
                vc = CountriesViewController(countriesArray: [IsraelData, ItalyData, USAData], sectionTitle: "Basketball")
            default:
                vc = CountriesViewController(countriesArray: [GermanyData, RussiaData, CanadaData], sectionTitle: "Hockey")
        }

        self.navigationController?.pushViewController(vc, animated: true)
    }


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {

        let label: UILabel = UILabel()
        label.backgroundColor = .gray
        label.text = "Sport Types"

        label.textAlignment = .center

        return label
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 40.0
    }
}


extension SportTypeViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.sportTypesArray.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.sportTypesArray[indexPath.row]
        return cell
    }
}

struct CountryData
{
    let Country: String
    let SportTypeToCountryLeaguesDict: [String: [String]]
}

