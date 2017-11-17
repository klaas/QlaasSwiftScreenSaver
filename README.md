## Screen Savers written in Swift (and compiled with Xcode 9.1) do not work within the System Preferences on macOS High Sierra anymore.

This repository contains a Xcode 9.1 project with 3 simple screen saver targets to demonstrate an issue with Swift and the Screen Saver System Preferences. The project was freshly created with Xcode 9.1 (9B55) for an Apple radar submission.

Targets:

* QlaasSaverObjc - Pure Objective-C Screen Saver (Text color red)
* QlaasSaverSwift4 - Swift 4 version (Text color yellow)
* QlaasSaverSwift32 - Swift 3.2 version (Text color orange)

All of these render a simple text with the current time. Just build them and double click the final product to install (e.g. "QSaverSwift4.saver" in the Finder).

## The problem

On macOS Sierra, everything works as expected. On macOS High Sierra though, the loading of the screen saver within the System Preferences fails with:

**‼️ THIS IS A DIFFERENT ERROR than a similar one that could be solved by restarting the System Preferences ‼️**

````
System Preferences	Error loading /Users/klaas/Library/Screen Savers/QSaverSwift4.saver/Contents/MacOS/QSaverSwift4: 
dlopen(/Users/klaas/Library/Screen Savers/QSaverSwift4.saver/Contents/MacOS/QSaverSwift4, 265): can't resolve symbol
_OBJC_CLASS_$_NSError in /Users/klaas/Library/Screen Savers/QSaverSwift4.saver/Contents/MacOS/../Frameworks/libswiftCore.dylib
because dependent dylib #1 could not be loaded in /Users/klaas/Library/Screen Savers/QSaverSwift4.saver/Contents/MacOS/../Frameworks/libswiftCore.dylib
````

The screen saver itself still runs fine. But without the possibility to access the settings it is quite unusable.

## Related 

* There is a (related) long time issue regarding Swift screen savers and the System Preferences panel. The solution used to be to restart the System Preferences and everything was good after that. [Alistair McMillan](https://twitter.com/alistair1975) wrote a good blog post describing the problem: <http://alistairmcmillan.github.io/2016/04/25/OSX-Swift-screensaver-bug.html>
and created a bug report (<rdar://25569037> and <http://openradar.appspot.com/25569037>).

* The Aerial Screen Saver project has a related issue that is tracked here: <https://github.com/JohnCoates/Aerial/issues/4>

* Quinn "The Eskimo!" (from Apple) commented on a similar issue in Oct 2017 on the dev forums: <https://forums.developer.apple.com/message/268934#268934>

* There are similar issues when writing preferences panes: <https://stackoverflow.com/questions/32041677/using-swift-with-an-os-x-preference-pane-plugin>

## Background

I'm the author of [Emoji Saver](https://EmojiSaver.eu), that was initially written in Swift 2 in mid 2016 and then later migrated to Swift 3 and 4. Everything worked fine. The problem first occurred on High Sierra (cannot tell which version, but the latest beta 10.13.2 (17C7ca).

Older, released versions that were compiled with Xcode 8.1 still work fine on High Sierra even within the System Preferences: e.g. <https://emojisaver.eu/downloads/EmojiSaverLite.zip>

