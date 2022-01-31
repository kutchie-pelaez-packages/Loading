import Core
import CoreUI
import UIKit

private let showDuration: TimeInterval = .milliseconds(200)
private let hideDuration: TimeInterval = .milliseconds(200)
private let loadingViewInitialTransform = CGAffineTransform(scale: 0.9)

final class LoadingOverlayImpl:
    View,
    LoadingOverlay
{

    // MARK: - UI

    private var loadingView: UIView?

    override func configureViews() {
        backgroundColor = .black.withAlphaComponent(0.6)
        hide(animated: false).run()
    }

    // MARK: - LoadingOverlay

    func setLoadingView(_ loadingView: UIView) {
        if self.loadingView.isNotNil {
            appAssertionFailure("Did attempt to set loading view during loading")
        }

        self.loadingView = loadingView
        loadingView.transform = loadingViewInitialTransform
        addSubviews(loadingView)

        loadingView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    func removeLoadingView() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }

    func show(animated: Bool) -> Animatable {
        Animation(
            duration: showDuration,
            animated: animated,
            animations: {
                self.alpha = 1
                self.loadingView?.transform = .identity
            }
        )
    }

    func hide(animated: Bool) -> Animatable {
        Animation(
            duration: hideDuration,
            animated: animated,
            animations: {
                self.alpha = 0
                self.loadingView?.transform = loadingViewInitialTransform
            }
        )
    }
}
