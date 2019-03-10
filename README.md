# Observable
Simple and lightweight Observable framework in Swift

## Usage
Just add the `Observable.swift` and `ObservableOptions.swift` to your project.

Create your observable property:
```swift
var batteryPercentage: Observable<Int> = Observable(0)
```

Start observing and react to its changes by adding an observer:
```swift
batteryPercentage.addObserver(observerObject, options: [.initial, .new]) { [weak self] (percentage, _) in
            print("Your current battery percentage is: \(percentage)%")
        }
```

If you want, you can stop observing anytime simply by removing the observer:
```swift
batteryPercentage.removeObserver(observerObject)
```

There's no need to explicitly remove it if you don't want to, it will be automatically removed at deallocation.

Have a look at the sample app for more information.
