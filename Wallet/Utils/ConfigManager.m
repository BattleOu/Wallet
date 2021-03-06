//
//  ConfigManager.m
//  Wallet
//
//  Created by 王成浩 on 2018/9/19.
//  Copyright © 2018年 evan. All rights reserved.
//

#import "ConfigManager.h"

static NSString *const kAssetsID = @"assetsID";
static NSString *const kSymbol = @"symbol";

@implementation ConfigManager

+ (NSNumber *)getAssetsId {
    NSNumber *n = [[NSUserDefaults standardUserDefaults] objectForKey:kAssetsID];
    if (n == nil) {
        n = [NSNumber numberWithInt:-1];
    }
    return n;
}

+ (void)setAssetsId:(NSNumber *)ID {
    [[NSUserDefaults standardUserDefaults] setInteger:[ID integerValue] forKey:kAssetsID];
}

+ (NSString *)getCurrentSymbol {
    NSString *symbol = [[NSUserDefaults standardUserDefaults] stringForKey:kSymbol];
    if (symbol.length == 0) {
        symbol = [self getSimpleSymbol][8];
        [self setCurrentSymbol:symbol];
    }
    return symbol;
}

+ (void)setCurrentSymbol:(NSString *)symbol {
    [[NSUserDefaults standardUserDefaults] setObject:symbol forKey:kSymbol];
}

+ (NSArray<NSString *> *)getSymbol {
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++) {
        NSString *name = [NSString stringWithFormat:@"symbol%ld", i];
        [arr addObject:NSLocalizedString(name, nil)];
    }
    return arr;
}

+ (NSArray<NSString *> *)getSimpleSymbol {
    return @[
             @"¥",
             @"HK$",
             @"MOP$",
             @"NT$",
             @"$",
             @"€",
             @"£",
             @"¤",
             @""];
}

+ (NSInteger)getBudget {
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"budget"];
}

+ (void)setBudget:(NSInteger)budget {
    [[NSUserDefaults standardUserDefaults] setInteger:budget forKey:@"budget"];
}

+ (BOOL)isFast {
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"fast"];
}

+ (void)setFast:(BOOL)fast {
    [[NSUserDefaults standardUserDefaults] setBool:fast forKey:@"fast"];
}

@end

