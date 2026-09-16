#import <Foundation/Foundation.h>

@interface Foo : NSObject
@property (nonatomic) NSInteger x;
@end

@implementation Foo {
    NSInteger _x;
}
@synthesize x = _x;
@end

int main(void) {
    @autoreleasepool {
        Foo *f = [[Foo alloc] init];
        f.x = 42;
        NSLog(@"%ld", (long)f.x); // <- breakpoint here
    }
    return 0;
}
