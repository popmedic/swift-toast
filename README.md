# swift-toastexample
Class to make "Toast," like in Android, for iOS in Swift 4.x.

## Usage

```
Toast.makeToast(message: "This is a test", duration: 4.0) { (isCompleted) in
    print("complete \(isCompleted)")
}
// or
Toast.makeToast(message: "This is a test", duration: 4.0)
// or just
Toast.makeToast(message: "This is a test")
```

You can set the backgroundColor, textColor, textAlignment, font, alpha, and cornerRadius using the static variables.

```
Toast.backgroundColor = UIColor.blue
Toast.textColor = UIColor.green
Toast.textAlignment = .left
Toast.font = UIFont.systemFont(ofSize: 14.0)
Toast.alpha = 0.8
Toast.cornerRadius = 8.0
```
