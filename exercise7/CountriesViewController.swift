//
// Created by Scores_Main_User on 1/13/21.
//

import UIKit

class CountriesViewController: UIViewController
{

    private let tableView = UITableView()


    private let countriesArray: [CountryData]
    private let sectionTitle: String


    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupTableView()
        tableView.delegate = self
        tableView.dataSource = self

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBackButton))
    }


    init(countriesArray: [CountryData], sectionTitle: String)
    {
        self.countriesArray = countriesArray
        self.sectionTitle = sectionTitle
        super.init(nibName: nil, bundle: nil)
    }


    required init?(coder: NSCoder)
    {
        fatalError("init(coder:)")
    }


    private func setupTableView()
    {
        self.view.addSubview(tableView)
        self.tableView.pin(to: view)

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }



    @objc private func goBackButton()
    {
        self.navigationController?.popViewController(animated: true)

    }


    func getCountryData(CountryName str: String) -> CountryData?
    {
        for country: CountryData in countriesArray
        {
            if country.Country == str
            {
                return country
            }
        }
        return nil
    }
}


extension CountriesViewController: UITableViewDelegate
{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {

        guard let cell: UITableViewCell = tableView.cellForRow(at: indexPath) else
        {
            return
        }

        guard let countryName: String = cell.textLabel?.text else
        {
            return
        }

        guard let countryData: CountryData = getCountryData(CountryName: countryName) else
        {
            return
        }

        let vc: CompetitionsViewController = CompetitionsViewController(data: countryData, sportType: self.sectionTitle)

        self.navigationController?.pushViewController(vc, animated: true)

    }


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {

        let label: UILabel = UILabel()
        label.backgroundColor = .gray
        label.text = self.sectionTitle

        label.textAlignment = .center

        return label
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 40.0
    }

}


extension CountriesViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.countriesArray.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.countriesArray[indexPath.row].Country
        return cell
    }
}