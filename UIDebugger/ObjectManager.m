//
//  UIDebugger.m
//  UIDebugger
//
//  Created by Etay Luz on 2/20/14.
//  Copyright (c) 2014 LuzSoft. All rights reserved.
//

#import "ObjectManager.h"
#import "JSONKit.h"

@interface ObjectManager ()

@end

@implementation ObjectManager

static ObjectManager* UIManager = nil;

+(ObjectManager*)UIManager
{
    if (UIManager == nil)
        UIManager = [[self alloc] init];
    
    return UIManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.objectDictionary = [[NSMutableDictionary alloc]initWithCapacity:10];

    /* START BUTTON */
    self.startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.startButton addTarget:self
                         action:@selector(nilSymbol)
               forControlEvents:UIControlEventTouchDown];
    //[self.startButton setTitle:@"START" forState:UIControlStateNormal];
    //self.startButton.frame = CGRectMake(0, 0, 100.0, 40);
    //[playButton setBackgroundColor:[UIColor colorWithRed:(239/255.0) green:(111/255.0) blue:(13/255.0) alpha:1]];
    //[self.startButton setBackgroundColor:[UIColor greenColor]];
    //[self.startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //self.startButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:self.startButton];
    [self registerView:self.startButton withLabel:@"StartButton"];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refreshScreen) userInfo:nil repeats:YES];
}

-(void)registerView:(id)view withLabel:(NSString*)viewLabel
{
    [self.objectDictionary setObject:view forKey:viewLabel];
}

-(void)refreshScreen
{
    NSString *jsonString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource: @"Objects" ofType: @"json"] usedEncoding:nil error:nil];


    NSDictionary *deserializedData = [jsonString objectFromJSONString];
    NSDictionary *startButton = [deserializedData objectForKey:@"StartButton"];
    //NSLog(@"title=%@",[startButton objectForKey:@"title"]);
    
    
    [self.startButton setTitle:[startButton objectForKey:@"title"] forState:UIControlStateNormal];
    self.startButton.titleLabel.font = [UIFont systemFontOfSize:[[startButton objectForKey:@"font"] integerValue]];
    NSLog(@"font=%@",[startButton objectForKey:@"font"]);
    self.startButton.frame = CGRectMake([[startButton objectForKey:@"x"]integerValue], [[startButton objectForKey:@"y"]integerValue], [[startButton objectForKey:@"width"]integerValue], [[startButton objectForKey:@"height"]integerValue]);
    [self.startButton setBackgroundColor:[UIColor colorWithRed:([[startButton objectForKey:@"red"]integerValue]/255.0) green:([[startButton objectForKey:@"green"]integerValue]/255.0) blue:([[startButton objectForKey:@"blue"]integerValue]/255.0) alpha:1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
