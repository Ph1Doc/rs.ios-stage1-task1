#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSMutableArray *arrayOfSum = [[NSMutableArray alloc] init];
    for (int i = 0; i < [array count]; i++) {
        NSMutableArray<NSNumber*> *changingArray = [[NSMutableArray alloc] initWithArray:array];
        [changingArray removeObjectAtIndex:i];
        NSInteger sum = (int)[MiniMaxArrayConverter summing:changingArray];
        [arrayOfSum addObject:[NSNumber numberWithInteger:sum]];
    }
    NSNumber *max = [arrayOfSum valueForKeyPath:@"@max.intValue"];
    NSNumber *min = [arrayOfSum valueForKeyPath:@"@min.intValue"];

    return @[min, max];
}

+ (NSInteger)summing:(NSArray<NSNumber*>*)array {
    NSInteger sum = 0;
    for (NSNumber* i in array) {
        sum = sum + i.integerValue;
    }
    return sum;
}

@end
