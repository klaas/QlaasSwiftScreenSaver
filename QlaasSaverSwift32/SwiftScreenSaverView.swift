//

import Foundation
import ScreenSaver

@objc(QlaasSaverSwift32View)
class SwiftScreenSaverView: ScreenSaverView {
	
	override init?(frame: NSRect, isPreview: Bool) {
		super.init(frame: frame, isPreview: isPreview)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
	
	deinit {
	}
	
	// MARK: - 🔴🔴🔴🔴🔴 setup methods 🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴
	
	override func draw(_ rect: NSRect) {
		super.draw(rect)
		
		let attributes:[String:AnyObject] = [
			NSFontAttributeName:NSFont.monospacedDigitSystemFont(ofSize: 30, weight: NSFontWeightRegular),
			NSForegroundColorAttributeName:NSColor.orange,
			]
		
		let comps = "\(CFAbsoluteTimeGetCurrent())".components(separatedBy: ".")
		let my = "Swift32 \(comps[1]) \(NSDate())"
		//		let rect = string.size(withAttributes: attributes).rectWithZeroOrigin
		my.draw(at: NSPoint(x:50, y:50), withAttributes: attributes)
	}
	
	// MARK: - 🔴🔴🔴🔴🔴 ScreenSaverView 🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴
	
	override class func performGammaFade() -> Bool {
		return false
	}
	
	private var flag_drawInitialInNextCycle = false
	override func startAnimation() {
		super.startAnimation()
	}
	
	override func stopAnimation() {
		super.stopAnimation()
	}
	
	override func animateOneFrame() {
		needsDisplay = true
	}
}

