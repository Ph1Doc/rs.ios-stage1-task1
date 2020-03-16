#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    NSMutableArray *arrayOfDigital = [[NSMutableArray alloc] init];
    NSMutableString *string = [[NSMutableString alloc] init];
    NSMutableArray *arrayOfChangingPosition = [[NSMutableArray alloc] init];
    int countChanges = 0;

    for(int i = 0; i < [n intValue]; i++) {
        NSRange range = NSMakeRange(i, 1);
        [arrayOfDigital addObject:[s substringWithRange:range]];
    }

    for (int i = 0; i < [arrayOfDigital count]/2; i++) {
        if ([arrayOfDigital count] % 2 == 0) {
            NSInteger secondObjectIndex = [arrayOfDigital count] - 1 - i;
            if (arrayOfDigital[i] != arrayOfDigital[secondObjectIndex]) {
                countChanges += 1;
                if ([arrayOfDigital[i] intValue] > [arrayOfDigital[secondObjectIndex] intValue]) {
                    arrayOfDigital[secondObjectIndex] = arrayOfDigital[i];
                    [arrayOfChangingPosition addObject:[NSNumber numberWithInteger:i]];
                } else {
                    arrayOfDigital[i] = arrayOfDigital[secondObjectIndex];
                    [arrayOfChangingPosition addObject:[NSNumber numberWithInteger:i]];
                }
            }
        } else {
            if (i != [arrayOfDigital count] / 2 + 1) {
                NSInteger secondObjectIndex = [arrayOfDigital count] - 1 - i;
                if (arrayOfDigital[i] != arrayOfDigital[secondObjectIndex]) {
                    countChanges += 1;
                    if ([arrayOfDigital[i] intValue] > [arrayOfDigital[secondObjectIndex] intValue]) {
                        arrayOfDigital[secondObjectIndex] = arrayOfDigital[i];
                        [arrayOfChangingPosition addObject:[NSNumber numberWithInteger:i]];
                    } else {
                        arrayOfDigital[i] = arrayOfDigital[secondObjectIndex];
                        [arrayOfChangingPosition addObject:[NSNumber numberWithInteger:i]];
                    }
                }
            }
        }
    }

    if (countChanges < [k intValue]) {
        arrayOfDigital = [PalindromeSolver increasePalidrom:arrayOfDigital changes:[k intValue] - countChanges arrayOfPosition:arrayOfChangingPosition];
    }

    for (int i = 0; i < arrayOfDigital.count; i++) {
        [string appendFormat:@"%@", arrayOfDigital[i]];
    }


    if (countChanges > [k intValue]) {
        return @"-1";
    } else {
        return string;
    }
}

+ (NSMutableArray<NSString*>*)increasePalidrom:(NSArray*)array changes:(NSInteger)changes arrayOfPosition:(NSArray*)arrayPositions {
    NSInteger countReplace = changes;
    NSMutableArray *changingArray = [[NSMutableArray alloc] initWithArray:array];
    NSMutableArray *replacePosition = [[NSMutableArray alloc] initWithArray:arrayPositions];

    for (int i = 0; i < [array count] - 1; i++) {
            if (countReplace >= 2) {
                if (![changingArray[i] isEqual:@"9"]) {
                    changingArray[i] = @"9";
                    changingArray[[changingArray count] - i - 1] = @"9";
                    if ([replacePosition containsObject:[NSNumber numberWithInt:i]]) {
                        countReplace = countReplace - 1;
                        [replacePosition removeObject:[NSNumber numberWithInt:i]];
                    } else {
                        countReplace = countReplace - 2;
                    }
                }
            } else if (countReplace == 1) {
                for (int j = 0; j < replacePosition.count; j++) {
                    NSInteger index = [arrayPositions[j] intValue];
                    if (![changingArray[index] isEqual:@"9"] && countReplace > 0) {
                        changingArray[index] = @"9";
                        changingArray[[changingArray count] - index - 1] = @"9";
                        countReplace = countReplace - 1;
                    }
                }
            }
    }
    return changingArray;
}


@end
