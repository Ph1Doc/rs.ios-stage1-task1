#import "T1Array.h"

@implementation T1Array

static NSMutableArray *happyArray = nil;

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    happyArray = [[NSMutableArray alloc] init];

    NSInteger changes = 1;
    if ([sadArray count] != 0) {
        happyArray = [[NSMutableArray alloc] initWithArray:sadArray];
        while (changes != 0) {
            changes = [T1Array checkArray:happyArray];
        }
    }
    return happyArray;
}

+ (NSInteger)checkArray:(NSArray*)array {
    NSInteger changeElement = 0;
    happyArray = [[NSMutableArray alloc] init];
    if ([array count] != 0) {
        for (int i = 0; i <= [array count] - 1; i++) {
            if (i == 0 || i == [array count] - 1) {
                [happyArray addObject:array[i]];
            } else {
                NSInteger elementsSum = (long)[array[i-1] integerValue] + (long)[array[i+1] integerValue];
                if (elementsSum > [array[i] intValue]) {
                    [happyArray addObject:array[i]];
                } else {
                    changeElement += 1;
                }
            }
        }
    }
    return changeElement;
}

@end
