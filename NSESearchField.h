#import <Cocoa/Cocoa.h>

@class NSESearchField;

@protocol NSESearchFieldDelegate <NSSearchFieldDelegate>

- (void)searchFieldGetFocus:(NSESearchField *)searchField;
- (void)searchFieldLostFocus:(NSESearchField *)searchField;

@end

@interface NSESearchField : NSSearchField

@property(assign) id<NSESearchFieldDelegate> delegate;

@end
