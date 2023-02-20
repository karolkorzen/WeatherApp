import Foundation
import Combine
import CoreModels
import Routes
import XCoordinator
import CoreUseCases

public protocol SearchLocationsInteractor {
    var viewModels: [LocationCellViewModel] { get }
    var sceneStatePublisher: AnyPublisher<LocationsSceneState, Never> { get }
    var reloadSignalPublisher: AnyPublisher<Void, Never> { get }
    
    func locationTapped(at index: Int)
    func inputChanged(_ input: String)
}

public final class DefaultSearchLocationsInteractor: SearchLocationsInteractor {
    //MARK: - Accessible Properties
    public var viewModels: [LocationCellViewModel] = [] {
        didSet {
            reloadSignal.send()
        }
    }
    
    public lazy var sceneStatePublisher: AnyPublisher<LocationsSceneState, Never> = $sceneState.eraseToAnyPublisher()
    public lazy var reloadSignalPublisher: AnyPublisher<Void, Never> = reloadSignal.eraseToAnyPublisher()

    //MARK: Private Properties
    @Published private var locations: [Location] = []
    @Published private var input: String = ""
    @Published private var sceneState: LocationsSceneState = .loaded
    private let reloadSignal = PassthroughSubject<Void, Never>()
    
    private let router: WeakRouter<HomeRoute>
    private let searchLocationsUseCase: SearchLocationsUseCase
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: Lifecycle
    public init(
        searchLocationsUseCase: SearchLocationsUseCase,
        router: WeakRouter<HomeRoute>
    ) {
        self.searchLocationsUseCase = searchLocationsUseCase
        self.router = router
        setupPipes()
    }
    
    //MARK: Setup
    private func setupPipes() {
        $input
            .removeDuplicates()
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main, options: nil)
            .sink { [unowned self] input in
                searchLocations(input)
            }
            .store(in: &cancellables)
        
        $locations
            .map { $0.map(LocationCellViewModel.init) }
            .sink { [unowned self] in viewModels = $0 }
            .store(in: &cancellables)
    }
    
    //MARK: Actions
    public func inputChanged(_ input: String) {
        self.input = input
    }
    
    public func locationTapped(at index: Int) {
        #warning("TODO")
    }
}

//MARK: - API Calls
private extension DefaultSearchLocationsInteractor {
    func searchLocations(_ input: String) {
        guard !input.isEmpty else {
            viewModels = []
            sceneState = .loaded
            return 
        }
        
        sceneState = .loading
        searchLocationsUseCase.execute(input: input)
            .mapResult()
            .sink { [unowned self] result in
                switch result {
                case .success(let locations):
                    guard !locations.isEmpty else {
                        sceneState = .noResults
                        return
                    }
                    self.locations = locations
                    sceneState = .loaded
                case .failure(let error):
                    router.trigger(.app(.showErrorAlert(error)))
                }
            }
            .store(in: &cancellables)
    }
}

