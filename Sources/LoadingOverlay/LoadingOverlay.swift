import Core
import CoreUI
import LoadingView
import UIKit

public protocol LoadingOverlay: UIView {
    func setLoadingView(_ loadingView: LoadingView)
    func removeLoadingView()
    func show(animated: Bool) -> Animatable
    func hide(animated: Bool) -> Animatable
}
