//
//  RemoveCache.m
//  Cook
//
//  Created by 0.0 on 15-4-22.
//  Copyright (c) 2015年 dingjun. All rights reserved.
//

#import "RemoveCache.h"

@implementation RemoveCache

- (void)dealloc
{
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
    
    }
    
    return self;
}

// 删除缓存
- (void)removeCache
{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    for (NSString *p in files) {
        NSLog(@"========%@", p);
        if (![p hasPrefix:@"WXOPEN"] && ![p hasPrefix:@"com.apple.nsurlsessiond"]) {
            NSString *path = [NSString stringWithFormat:@"%@/%@", cachePath, p];
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
            }
        }

    }
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
    path = [path stringByAppendingString:@"/LazyRequestCache"];
    NSArray *lazyfiles = [[NSFileManager defaultManager] subpathsAtPath:path];
    for (NSString *p in lazyfiles) {
        NSString *lazypath = [NSString stringWithFormat:@"%@/%@", path, p];
        if ([[NSFileManager defaultManager] fileExistsAtPath:lazypath]) {
            [[NSFileManager defaultManager] removeItemAtPath:lazypath error:nil];
        }
    }
    
}

// 计算清除的缓存大小
- (CGFloat)floatWithPath:(NSString *)path
{
    CGFloat num = 0;
    NSFileManager *man = [NSFileManager defaultManager];
    if ([man fileExistsAtPath:path]) {
        NSEnumerator *childFile = [[man subpathsAtPath:path] objectEnumerator];
        NSString *fileName;
        while ((fileName = [childFile nextObject]) != nil) {
            NSString *fileSub = [path stringByAppendingPathComponent:fileName];
            num += [self fileSizeAtPath:fileSub];
        }
    }
    return num / (1024.0 * 1024.0);
}

//计算单个文件大小
- (long long)fileSizeAtPath:(NSString *)file
{
    NSFileManager *man = [NSFileManager defaultManager];
    if ([man fileExistsAtPath:file]) {
        return [[man attributesOfItemAtPath:file error:nil] fileSize];
    }
    return 0;
}


@end
