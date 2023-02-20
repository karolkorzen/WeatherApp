import UIKit
import CommonResources
import CommonUIUtils
import CommonUIComponents

final class LocationTableViewCell: UITableViewCell {
    //MARK: Properties
    static let cellIdentifier = "location_cell"
    
    //MARK: Views
    private var nameLabel = ViewTemplates.standardLabel(font: .appBodySemibold)
    private var countryLabel = ViewTemplates.standardLabel()
    private let containerView: UIView = ViewTemplates.containerView()
    
    private let mainStackView: UIStackView = .vertical(spacing: 5)
    
    //MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup
    func setupView() {
        backgroundColor = UIColor.clear
        
        nameLabel.textAlignment = .left
        countryLabel.textAlignment = .left
        
        selectionStyle = .none
        
        containerView.mildShadowDecorate()
    }
    
    func setupConstraints() {
        contentView.addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(nameLabel)
        mainStackView.addArrangedSubview(countryLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    //MARK: Actions
    func setViewModel(_ viewModel: LocationCellViewModel) {
        nameLabel.text = viewModel.nameText
        countryLabel.text = viewModel.countryText
    }
}

