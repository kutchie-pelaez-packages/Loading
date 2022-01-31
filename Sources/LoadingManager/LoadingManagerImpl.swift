import Core
import CoreUI
import LoadingOverlay
import LoadingView
import UIKit

final class LoadingManagerImpl: LoadingManager {
    init(loadingOverlay: LoadingOverlay) {
        self.loadingOverlay = loadingOverlay
    }

    private let loadingOverlay: LoadingOverlay

    // MARK: - LoadingManager

    func startLoading(with style: LoadingStyle, animated: Bool) -> Animatable {
        let loadingView: LoadingView
        switch style {
        case .activityIndicator:
            loadingView = undefined()

        case let .progress(progressPublisher, cancelBlock):
            loadingView = undefined()
        }
        loadingOverlay.setLoadingView(loadingView)

        return loadingOverlay.show(animated: animated)
    }

    func stopLoading(animated: Bool) -> Animatable {
        AnimationChain(
            .animation(loadingOverlay.hide(animated: animated)),
            .execute {
                self.loadingOverlay.removeLoadingView()
            }
        )
    }
}
