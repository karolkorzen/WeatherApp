import Foundation
import Combine
import UIKit
import CommonResources

public enum LocationsSceneState {
    case loading
    case loaded
    case noResults
}

final class SearchLocationsViewController: UIViewController {
    //MARK: View
    private let contentView: SearchLocationsView = {
       return SearchLocationsView()
    }()
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: Properties
    private let interactor: SearchLocationsInteractor
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: Lifecycle
    init(interactor: SearchLocationsInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSearchController()
        setupPublishers()
    }
    
    //MARK: - Setup
    private func setupView() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        
        navigationItem.title = L10n.weatherApp
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = L10n.search
        navigationItem.searchController = searchController
    }
    
    private func setupPublishers() {
        interactor.reloadSignalPublisher
            .sink { [contentView] in
                contentView.tableView.reloadData()
            }
            .store(in: &cancellables)

        interactor.sceneStatePublisher
            .removeDuplicates()
            .sink { [contentView] sceneState in
                contentView.setSceneState(sceneState: sceneState)
            }
            .store(in: &cancellables)
    }
}

//MARK: - UITableViewDataSource/Delegate
extension SearchLocationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.cellIdentifier) as! LocationTableViewCell
        cell.setViewModel(interactor.viewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.locationTapped(at: indexPath.row)
    }
}

//MARK: - UISearchResultsUpdating
extension SearchLocationsViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            interactor.inputChanged(searchText)
        }
    }
}
