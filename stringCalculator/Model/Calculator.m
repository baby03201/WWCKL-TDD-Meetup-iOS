//
//  Calculator.m
//  stringCalculator
//
//  Created by Ng Hui Qin on 3/22/15.
//  Copyright (c) 2015 huiqin.testing. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

- (int)addWithString:(NSString *)string
{
    int result = 0;
    
    // Handling delimiters
    if (string.length > 2) {
        if ([[string substringWithRange: NSMakeRange(0, 2)] isEqualToString:@"//"])
        {
            // Remove @"//"
            string = [string substringFromIndex:2];
            NSLog(@"remove //: %@", string);
            
            // Get delimeter string
            NSArray *tempArray = [string componentsSeparatedByString:@"\n"];
            NSString *delimeterString = [tempArray objectAtIndex:0];
            NSLog(@"delimeterString: %@", delimeterString);
            
            // Remove first \n to get the numbers string
            NSString *newString = [tempArray objectAtIndex:1];
            for (int i = 2; i < tempArray.count; i++) {
                newString = [NSString stringWithFormat:@"%@,%@", newString, [tempArray objectAtIndex:i]];
            }
            NSLog(@"numberString: %@", newString);
            string = newString;
            
            NSArray *delimeters = [delimeterString componentsSeparatedByString:@"["];
            for (NSString *delimeter in delimeters) {
                // Skip first object
                if ([delimeter isEqualToString:@""]) {
                    continue;
                } else {
                    // Remove ] behind delimeter
                    NSString *cleanDelimeter = [delimeter stringByReplacingOccurrencesOfString:@"]" withString:@""];
                    NSLog(@"delimeter: %@", cleanDelimeter);
                    
                    // Replace , instead of the delimeter
                    if (cleanDelimeter.length > 0) {
                        string = [string stringByReplacingOccurrencesOfString:cleanDelimeter withString:@","];
                    }
                }
            }
            
        }
    }
    
    
    
    // Replace @"\n"(newline) with @","(comma)
    string = [string stringByReplacingOccurrencesOfString:@"\n"
                                               withString:@","];
    NSLog(@"final string: %@", string);
    
    // Split the numbers into array
    NSArray *numbers = [string componentsSeparatedByString:@","];
    
    // Sum up the numbers
    for (NSString *number in numbers) {
        result += number.intValue;
    }
    
    return result;
}

@end
