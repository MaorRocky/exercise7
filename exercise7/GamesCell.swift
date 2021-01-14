//
// Created by Scores_Main_User on 1/14/21.
//

import UIKit

class GamesCell: UITableViewCell
{
    let firstLabel: UILabel = UILabel()
    let secondLabel: UILabel = UILabel()

    let firstDetailLabel: UILabel = UILabel()
    let secondDetailLabel: UILabel = UILabel()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(firstLabel)
        addSubview(secondLabel)
        addSubview(firstDetailLabel)
        addSubview(secondDetailLabel)

        configureLabels()
        setLabelsConstraints()

    }


    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }


    func configureLabels()
    {
        firstLabel.text = "Competitor 1"
        secondLabel.text = "Competitor 2"

        firstDetailLabel.text = "0"
        secondDetailLabel.text = "0"


        firstLabel.adjustsFontSizeToFitWidth = true
        secondLabel.adjustsFontSizeToFitWidth = true

        firstDetailLabel.adjustsFontSizeToFitWidth = true
        secondDetailLabel.adjustsFontSizeToFitWidth = true

    }


    func setLabelsConstraints()
    {

        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        firstDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        secondDetailLabel.translatesAutoresizingMaskIntoConstraints = false


        firstLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        firstLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        firstLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true

        firstDetailLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        firstDetailLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true


        secondLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        secondLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        secondLabel.topAnchor.constraint(greaterThanOrEqualTo: firstLabel.bottomAnchor, constant: 10).isActive = true

        secondDetailLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        secondDetailLabel.topAnchor.constraint(greaterThanOrEqualTo: firstLabel.bottomAnchor, constant: 10).isActive = true
    }


}
