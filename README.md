# swift-toast

## Toast Class 

Class to make "Toast," like in Android, for iOS in Swift 4.x.

### Usage

```swift
Toast.makeToast(message: "This is a test", duration: 4.0) { (isCompleted) in
    print("complete \(isCompleted)")
}
// or
Toast.makeToast(message: "This is a test", duration: 4.0)
// or just
Toast.makeToast(message: "This is a test")
```

You can set the frame, backgroundColor, textColor, textAlignment, font, alpha, and cornerRadius using the static variables.

```swift
Toast.frame = CGRect(
    x: UIScreen.main.bounds.size.width/2 - (UIScreen.main.bounds.size.width/2 - 16),
    y: UIScreen.main.bounds.size.height - 100,
    width: UIScreen.main.bounds.size.width - 32,
    height: 35
)
Toast.backgroundColor = UIColor.blue
Toast.textColor = UIColor.green
Toast.textAlignment = .left
Toast.font = UIFont.systemFont(ofSize: 14.0)
Toast.alpha = 0.8
Toast.cornerRadius = 8.0
```

## UIApplication makeToast extension

UIApplication extension to add a makeToast function

### Usage

```swift
UIApplication.shared.makeToast(message: "This is another test", duration: 4.0) { (isCompleted) in
    print("completed: \(isCompleted)")
}
```

You can set the frame, backgroundColor, textColor, textAlignment, font, alpha, and cornerRadius by passing them in to the function with there tags.

```swift
UIApplication.shared.makeToast(
    message: "This is another test",
    duration: 4.0,
    frame: CGRect(
        x: UIScreen.main.bounds.size.width/2 - (UIScreen.main.bounds.size.width/2 - 16),
        y: UIScreen.main.bounds.size.height - 100,
        width: UIScreen.main.bounds.size.width - 32,
        height: 35
    ),
    backgroundColor: UIColor.blue.withAlphaComponent(0.6),
    textColor: UIColor.red,
    textAlignment: NSTextAlignment.left,
    font: UIFont.systemFont(ofSize: 16.0),
    alpha: 1.0,
    cornerRadius: 10
) { (isCompleted) in
    print("completed: \(isCompleted)")
}
```
