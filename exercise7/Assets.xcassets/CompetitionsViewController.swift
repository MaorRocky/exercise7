//
// Created by Scores_Main_User on 1/13/21.
//

import UIKit

class CompetitionsViewController: UIViewController
{

    private let tableView = UITableView()

    private let sportType: String
    private let CountryData: CountryData


    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupTableView()
        tableView.delegate = self
        tableView.dataSource = self

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBackButton))

    }


    init(data: CountryData, sportType: String)
    {
        self.CountryData = data
        self.sportType = sportType
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
}


extension CompetitionsViewController: UITableViewDelegate
{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {

        guard let cell: UITableViewCell = tableView.cellForRow(at: indexPath) else
        {
            return
        }

        guard let leagueName: String = cell.textLabel?.text else
        {
            return
        }

        let vc: GamesViewController = GamesViewController(sectionTitle: leagueName)

        self.navigationController?.pushViewController(vc, animated: true)

    }


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {

        let label: UILabel = UILabel()
        label.backgroundColor = .gray
        label.text = self.CountryData.Country

        label.textAlignment = .center

        return label
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 40.0
    }


}


extension CompetitionsViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.CountryData.SportTypeToCountryLeaguesDict[self.sportType]?.count ?? 0
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.CountryData.SportTypeToCountryLeaguesDict[self.sportType]?[indexPath.row]
        return cell
    }
}