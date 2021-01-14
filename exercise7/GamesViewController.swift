//
// Created by Scores_Main_User on 1/13/21.
//

import UIKit

class GamesViewController: UIViewController
{

    private let tableView = UITableView()


    private let sectionTitle: String


    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBackButton))

    }


    init(sectionTitle: String)
    {
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

        self.tableView.register(GamesCell.self, forCellReuseIdentifier: "cell")
    }


    @objc private func goBackButton()
    {
        dismiss(animated: true)
    }
}


extension GamesViewController: UITableViewDelegate
{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {


        let vc: GameViewController = GameViewController()

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


extension GamesViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: GamesCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesCell


        return cell
    }
}
