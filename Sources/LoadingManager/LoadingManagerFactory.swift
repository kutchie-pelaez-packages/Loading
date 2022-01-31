import LoadingOverlay

public struct LoadingManagerFactory {
    public init() { }

    public func produce(loadingOverlay: LoadingOverlay) -> LoadingManager {
        LoadingManagerImpl(loadingOverlay: loadingOverlay)
    }
}
