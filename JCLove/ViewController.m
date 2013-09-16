//
//  ViewController.m
//  JCLove
//
//  Created by Moses on 13-9-16.
//  Copyright (c) 2013年 Moses. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize _label_count_down;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //立刻执行倒数计时
    [self updateInfoTime];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateInfoTime) userInfo:nil repeats:YES];
}
//更新UI
-(void)updateInfoTime{
    _label_count_down.text = [self getDaysBetweenTwoTime];
}

/**计算公历y2年m2月d2日 距y年m月d日的天数*///未用
-(int)calTwoDaysJianGe:(int)y M1:(int)m D1:(int)d Y2:(int)y2 M2:(int)m2 D2:(int)d2{
    int days;
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *string = [[NSString alloc]initWithFormat:@"%04d-%02d-%02d",y,m,d];
    NSDate *date=[dateFormatter dateFromString:string];
    NSTimeInterval time=[date timeIntervalSince1970];
    string=[[NSString alloc]initWithFormat:@"%04d-%02d-%02d",y2,m2,d2];
    date=[dateFormatter dateFromString:string];
    NSTimeInterval time2=[date timeIntervalSince1970];
    int jiange=time2-time;
    days=jiange/86400;
    if((long long)jiange%86400>0){
        days++;
    }
    return days;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString *)getDaysBetweenTwoTime{
    NSDate *nowDate = [NSDate date];
    NSDate *realDate = [self getRealTime];
    NSTimeInterval time=[nowDate timeIntervalSinceDate:realDate];
    int days=((int)time)/(3600*24);
    int hours=((int)time)%(3600*24)/3600;
    int minutes = ((int)time)%(3600*24)%3600/60;
    int seconds = ((int)time)%(3600*24)%3600%60;
    return [NSString stringWithFormat:@"%d天%d小时%d分钟%d秒",days,hours,minutes,seconds];
}

//String  2  date
//输入的日期字符串形如：@"1992-05-21 13:08:08"

- (NSDate *)getRealTime{
    NSString *dateString = [NSString stringWithFormat:@"2013-06-09 13:14:00"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}
@end
