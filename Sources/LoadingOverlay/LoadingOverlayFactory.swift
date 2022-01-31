public struct LoadingOverlayFactory {
    public init() { }

    public func produce() -> LoadingOverlay {
        LoadingOverlayImpl()
    }
}
