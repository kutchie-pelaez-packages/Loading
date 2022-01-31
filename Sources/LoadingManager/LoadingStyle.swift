import CoreUtils
import LoadingView

public enum LoadingStyle {
    case activityIndicator
    case progress(ValuePublisher<Double>, cancelBlock: Block? = nil)
    case custom(LoadingView)
}
