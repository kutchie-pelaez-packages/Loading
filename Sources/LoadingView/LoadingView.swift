import UIKit
import CoreUI

public protocol LoadingView: UIView {
    func startLoading() -> Animatable
    func stopLoading() -> Animatable
}
