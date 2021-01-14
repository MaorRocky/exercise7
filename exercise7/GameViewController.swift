//
// Created by Scores_Main_User on 1/14/21.
//

import UIKit

class GameViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Go Back", style: .plain, target: self, action: #selector(goBackButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButton))

        self.view.backgroundColor = .white

        let label: UILabel = UILabel()
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "27/12\nEnded"
        self.navigationItem.titleView = label

        createDisplay()
    }


    func createDisplay()
    {

        let myView: UIView = UIView() //the entire view
        self.view.addSubview(myView)

        myView.translatesAutoresizingMaskIntoConstraints = false

        myView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        myView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        myView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        myView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        myView.backgroundColor = .white

        let scoreView: UIView = UIView() // the view for the score

        myView.addSubview(scoreView)

        scoreView.translatesAutoresizingMaskIntoConstraints = false
        scoreView.center(to: myView)

        let scoreLabel: UILabel = UILabel()
        scoreLabel.text = "0-0"
        scoreLabel.font = .systemFont(ofSize: 40)

        scoreView.addSubview(scoreLabel)

        scoreLabel.pin(to: scoreView)


        let homeCompetitorLabel: UILabel = UILabel()
        let awayCompetitorLabel: UILabel = UILabel()


        myView.addSubview(homeCompetitorLabel)
        myView.addSubview(awayCompetitorLabel)

        homeCompetitorLabel.translatesAutoresizingMaskIntoConstraints = false
        awayCompetitorLabel.translatesAutoresizingMaskIntoConstraints = false

        homeCompetitorLabel.text = "Competitor 1"
        awayCompetitorLabel.text = "Competitor 2"

        homeCompetitorLabel.font = .systemFont(ofSize: 20)
        awayCompetitorLabel.font = .systemFont(ofSize: 20)

        homeCompetitorLabel.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 10).isActive = true
        homeCompetitorLabel.trailingAnchor.constraint(lessThanOrEqualTo: scoreView.leadingAnchor).isActive = true
        homeCompetitorLabel.centerYAnchor.constraint(equalTo: myView.centerYAnchor).isActive = true

        awayCompetitorLabel.leadingAnchor.constraint(greaterThanOrEqualTo: scoreView.trailingAnchor).isActive = true
        awayCompetitorLabel.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -10).isActive = true
        awayCompetitorLabel.centerYAnchor.constraint(equalTo: myView.centerYAnchor).isActive = true


    }


    @objc private func goBackButton()
    {
        self.navigationController?.popViewController(animated: true)

    }


    @objc private func doneButton()
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
}