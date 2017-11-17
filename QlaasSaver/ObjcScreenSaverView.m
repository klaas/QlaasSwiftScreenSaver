//

#import "ObjcScreenSaverView.h"

@implementation ObjcScreenSaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/2];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
	[super drawRect:rect];
	
	NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:
							  [NSFont monospacedDigitSystemFontOfSize:30 weight:NSFontWeightRegular], NSFontAttributeName,
							  [NSColor redColor], NSForegroundColorAttributeName,
							  nil];

	NSString *timeString = [NSString stringWithFormat:@"%f", CFAbsoluteTimeGetCurrent()];
	NSArray *comps = [timeString componentsSeparatedByString:@"."];

	NSString *my = [NSString stringWithFormat:@"Objc %@ %@", comps[1], [NSDate new]];
	[my drawAtPoint:NSMakePoint(50,50) withAttributes:attributes];
	
	return;
}

- (void)animateOneFrame
{
	[self setNeedsDisplay: YES];
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
