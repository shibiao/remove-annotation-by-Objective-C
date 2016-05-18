//
//  ViewController.m
//  消除OC注释
//
//  Created by Mac on 16/5/17.
//  Copyright © 2016年 shibiao. All rights reserved.
//

#import "ViewController.h"
#define PATH @"/Users/mac/Desktop/常用.m"//指定文件的路径
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSFileHandle *handle=[NSFileHandle fileHandleForUpdatingAtPath:PATH];
    if (handle==nil) {
        NSLog(@"文件没找到") ;
    }
    NSData *data=[handle readDataToEndOfFile];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    //分解每行的字符串保存到数组中
    NSArray *arr=[str componentsSeparatedByString:@"\n"];
    NSMutableArray *subStringArr=[NSMutableArray array];
    for (NSString *tmpStr in arr) {
        //找到每行中包含//的注释然后删除"//"注释后的字符串
        NSRange rangeHeader=[tmpStr rangeOfString:@"//"];
        if ([tmpStr containsString:@"//"]) {
           NSString *trimmingStr=[tmpStr substringToIndex:rangeHeader.location];
            [subStringArr addObject:trimmingStr];
        }else{
            [subStringArr addObject:tmpStr];
        }
    }
    //合并数组中的字符串
    NSString *subString=[subStringArr componentsJoinedByString:@"\n"];
    //删除"/* */"的注释内容
    NSRange range1=[subString rangeOfString:@"/*"];
    NSRange range2=[subString rangeOfString:@"*/"];
    if ([subString containsString:@"/*"]) {
        NSString *sub=[subString substringWithRange:NSMakeRange(range1.location,range2.location-range1.location+range2.length)];
        subString=[subString stringByReplacingOccurrencesOfString:sub withString:@""];
    }
    //将删除注释后的文件内容重新写入文件当中
    [handle truncateFileAtOffset:0];
    NSData *data1=[subString dataUsingEncoding:NSUTF8StringEncoding];
    [handle writeData:data1];
    NSLog(@"%@",subString);
    [handle closeFile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
