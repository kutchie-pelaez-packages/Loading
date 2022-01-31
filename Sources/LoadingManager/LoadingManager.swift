import CoreUI

public protocol LoadingManager {
    func startLoading(with style: LoadingStyle, animated: Bool) -> Animatable
    func stopLoading(animated: Bool) -> Animatable
}
