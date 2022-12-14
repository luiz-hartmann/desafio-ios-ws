//
//  ListCell.swift
//  App
//
//  Created by Luiz Hartmann on 18/11/22.
//

import UIKit

class ListCell: UITableViewCell {
    
    // MARK: - Identifier
    static let identifier = "ListCell"
    
    // MARK: - UI Components
    private lazy var brandNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var modelNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "car")
        imageView.tintColor = .secondaryLabel
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImageView,
                                                       stackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 18
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [brandNameLabel,
                                                       modelNameLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        setup()
    }
    
    func configure(car: Car) {
        self.brandNameLabel.text = car.marcaNome.capitalized
        self.modelNameLabel.text = car.nomeModelo.capitalized
    }
    
    // MARK: - Initialization
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListCell: Viewcode {
    func buildViewHierarchy() {
        contentView.addSubview(mainStackView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            logoImageView.widthAnchor.constraint(equalToConstant: 50),
            logoImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func applyExtraConfiguration() { }
}
