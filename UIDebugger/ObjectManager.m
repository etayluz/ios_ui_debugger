//
//  UIDebugger.m
//  UIDebugger
//
//  Created by Etay Luz on 2/20/14.
//  Copyright (c) 2014 LuzSoft. All rights reserved.
//

#import "ObjectManager.h"

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
    [self.startButton setTitle:@"START" forState:UIControlStateNormal];
    self.startButton.frame = CGRectMake(0, 0, 100.0, 40);
    //[playButton setBackgroundColor:[UIColor colorWithRed:(239/255.0) green:(111/255.0) blue:(13/255.0) alpha:1]];
    [self.startButton setBackgroundColor:[UIColor greenColor]];
    [self.startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.startButton.titleLabel.font = [UIFont systemFontOfSize:25];
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
    //NSError* error = nil;
    //NSString *json = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://localhost/UIManager/Objects.json"] encoding:NSASCIIStringEncoding error:&error];
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://localhost/UIManager/Objects.json"]];
    NSArray *mainArray = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
    
    for (NSDictionary *dictionary in mainArray) {
         //NSLog(@"%@",[dictionary objectForKey:@"Name"]);
        // Now you can store these two strings in that array or whatever populates your tableview ;)
    }
//    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
//    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data
//                                                                 options:kNilOptions
//                                                                   error:&error];
    //NSLog(@"%@",jsonResponse);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end