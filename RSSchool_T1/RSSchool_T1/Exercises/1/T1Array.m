#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray * newArray = [[NSMutableArray alloc] init];
    if ([sadArray count] != 0) {
        for (int i = 0; i <= [sadArray count] - 1; i++) {
            if (i > 0 && i != [sadArray count] - 1) {
                NSInteger elementsSum = (long)[sadArray[i-1] integerValue] + (long)[sadArray[i+1] integerValue];
                if (elementsSum > (long)[sadArray[i] integerValue]) {
                    [newArray addObject:sadArray[i]];
                }
            } else {
                [newArray addObject:sadArray[i]];
            }
            if ([newArray count] > 3) {
                if ((long)[newArray[[newArray count] - 2] integerValue] > (long)[newArray[[newArray count] - 1] integerValue] + (long)[newArray[[newArray count] - 3] integerValue]) {
                    [newArray removeObjectAtIndex:[newArray count] - 2];
                }
            }
        }
    }
    return newArray;
}

@end
