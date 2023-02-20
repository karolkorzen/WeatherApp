import UIKit
import CommonUIComponents
import CommonResources
import CommonUIUtils

final class SearchLocationsView: UIView {
    //MARK: - Views
    private let activityIndicator = ViewTemplates.activityIndicator()
    private let emptyResultLabel = ViewTemplates.standardLabel(font: .appHeadline)
    
    let tableView = UITableView()
    
    //MARK: - Lifecycle
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setupView() {
        backgroundColor = .appBackground
        tableView.backgroundColor = .appBackground
        tableView.register(
            LocationTableViewCell.self,
            forCellReuseIdentifier: LocationTableViewCell.cellIdentifier
        )
        tableView.separatorStyle = .none
        
        emptyResultLabel.text = L10n.noLocationsHaveBeenFound
    }
    
    private func setupConstraints() {
        addSubview(tableView)
        tableView.addConstraintsToFillView(view)
        
        addSubview(activityIndicator)
        activityIndicator.center(inView: self)
        
        addSubview(emptyResultLabel)
        emptyResultLabel.center(inView: self)
    }
    
    //MARK: - Actions
    func setSceneState(sceneState: LocationsSceneState) {
        switch sceneState {
        case .loading:
            activityIndicator.startAnimating()
            emptyResultLabel.isHidden = true
            tableView.isHidden = true
        case .loaded:
            activityIndicator.stopAnimating()
            emptyResultLabel.isHidden = true
            tableView.isHidden = false
        case .noResults:
            activityIndicator.stopAnimating()
            emptyResultLabel.isHidden = false
            tableView.isHidden = true
        }
    }
}

