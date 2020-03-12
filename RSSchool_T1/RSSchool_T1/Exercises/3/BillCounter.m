#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray *fairBill = [[NSMutableArray alloc] initWithArray:bill];
    [fairBill removeObjectAtIndex:index];
    int fullSum = 0;
    for (int i = 0; i < [fairBill count]; i++) {
        fullSum = fullSum + (int)[fairBill[i] integerValue];
    }
    int billActual = fullSum / 2;
    if (billActual == [sum integerValue]) {
        return @"Bon Appetit";
    } else {
        int diff = (int)([sum integerValue] - billActual);
        NSString *diffString = [NSString stringWithFormat:@"%d", diff];
        return diffString;
    }

}

@end
