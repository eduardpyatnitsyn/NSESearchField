#import "NSESearchField.h"

@interface NSESearchField (){
    BOOL isTextPrepared;
}

@end

@implementation NSESearchField

- (instancetype)init
{
    if (self = [super init]){
        isTextPrepared = YES;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    isTextPrepared=NO;
}

- (BOOL)becomeFirstResponder
{
    BOOL status = [super becomeFirstResponder];

    if (status){
        isTextPrepared = YES;
        [self.delegate searchFieldGetFocus:self];
    }
    return status;
}

- (BOOL)resignFirstResponder
{
    BOOL status = [super resignFirstResponder];
    if (isTextPrepared && ![self currentEditor]){
        [self.delegate searchFieldLostFocus:self];
    }
    isTextPrepared = NO;
    return status;
}

-(void)textDidEndEditing:(NSNotification *)notification
{
    [super textDidEndEditing:notification];
    
    if (![self currentEditor])
        [_delegate searchFieldLostFocus:self];
    

}

-(void) setDelegate:(id<FlexibleSearchFieldDelegate>) delegate
{
    _delegate = delegate;
}

- (id) delegate
{
    return _delegate;
}

@end

