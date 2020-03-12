#import "Parser.h"

@implementation Parser

NSString *openBracket = @"(";
NSString *closeBracket = @")";
NSString *openStaple = @"[";
NSString *closeStaple = @"]";
NSString *openBtk = @"<";
NSString *closeBtk = @">";

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {

    NSArray *arrayBracket = @[openStaple, openBracket, openBtk];
    NSMutableArray *array = [[NSMutableArray alloc] init];

    for (int i = 0; i < string.length; i++ ) {
        for (NSString *obj in arrayBracket) {
            NSRange range = NSMakeRange(i, 1);
            if ([[string substringWithRange:range] isEqualToString:obj]) {
                [array addObject:[Parser makeString:[string substringWithRange:NSMakeRange(i, string.length - i)] simbol:obj]];
            }
        }
    }
    NSLog(@"");
    return array;
}

+ (NSString*)makeString:(NSString*)string simbol:(NSString*)simbol {

    if ([simbol isEqualToString:openBtk]) {
        NSRange rangeCloseBtk = [string rangeOfString:closeBtk];
        if (rangeCloseBtk.location != NSNotFound) {
            NSInteger index = [Parser findNestedInString:string openSimbol:openBtk closeSimbol:closeBtk];
            NSRange range = NSMakeRange(1, index - 2);
            return [string substringWithRange:range];
        }
    }
    if ([simbol isEqualToString:openBracket]) {
        NSRange rangeCloseBracket = [string rangeOfString:closeBracket];
        if (rangeCloseBracket.location != NSNotFound) {
            NSInteger index = [Parser findNestedInString:string openSimbol:openBracket closeSimbol:closeBracket];
            NSRange range = NSMakeRange(1, index - 2);
            NSLog(@"%@", [string substringWithRange:range]);
            return [string substringWithRange:range];
        }
    }
    if ([simbol isEqualToString:openStaple]) {
        NSRange rangeCloseStaple = [string rangeOfString:closeStaple];
        if (rangeCloseStaple.location != NSNotFound) {
            NSInteger index = [Parser findNestedInString:string openSimbol:openStaple closeSimbol:closeStaple];
            NSRange range = NSMakeRange(1, index - 2);
            return [string substringWithRange:range];
        }
    }
    return @"ERROR";
}

+(NSInteger)findNestedInString:(NSString*)string openSimbol:(NSString*)openSimbol closeSimbol:(NSString*)closeSimbol {
    int numberOfBtk = 1;
    NSString *new = [string substringWithRange:NSMakeRange(1, string.length-1)];
    int indexBtk = 1;
        while (numberOfBtk != 0) {
            NSRange rangeCloseBtk = [new rangeOfString:closeSimbol];
            NSRange rangeOpenBtk = [new rangeOfString:openSimbol];
            if (rangeOpenBtk.location < rangeCloseBtk.location) {
                numberOfBtk = numberOfBtk + 1;
                new = [new substringFromIndex:rangeOpenBtk.location + 1];
                indexBtk = indexBtk + (int)rangeOpenBtk.location + 1;
            } else {
                numberOfBtk = numberOfBtk - 1;
                new = [new substringFromIndex:rangeCloseBtk.location + 1];
                indexBtk = indexBtk + (int)rangeCloseBtk.location + 1;
            }
        }
    return indexBtk;
}

@end
