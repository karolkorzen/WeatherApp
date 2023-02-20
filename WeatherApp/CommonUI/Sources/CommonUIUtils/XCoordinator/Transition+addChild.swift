import XCoordinator

public extension Transition {
    static func addChild(_ child: Presentable) -> Transition {
        Transition(presentables: [child], animationInUse: nil) { _, _, completion in
            completion?()
        }
    }
}
