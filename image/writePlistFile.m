//
//  writePlistFile.m
//  image
//
//  Created by weifangzou on 17/1/13.
//  Copyright © 2017年 Ttpai. All rights reserved.
//

#import "writePlistFile.h"

@implementation writePlistFile
+ (void)writePlistFilesOfresourceName:(NSString*)resorceName resourceType:(NSString*)type  PlistName:(NSString*)plistName{

    //获取json   文件
    NSString *txtPath = [[NSBundle mainBundle] pathForResource:resorceName ofType:type];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:txtPath options:NSDataReadingMappedIfSafe error:nil];
    
    NSMutableDictionary *nameDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    //获取本地沙盒路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取完整路径
    NSString *documentsPath = [path objectAtIndex:0];
    NSString *resultPath = [documentsPath stringByAppendingPathComponent:[NSString  stringWithFormat:@"%@.plist",plistName]];
    NSLog(@"resultPath:\n%@",resultPath);
    //写入文件
    [nameDict writeToFile:resultPath atomically:YES];
    
}
@end
