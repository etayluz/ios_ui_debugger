//
//  UIDebugger.h
//  UIDebugger
//
//  Created by Etay Luz on 2/20/14.
//  Copyright (c) 2014 LuzSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObjectManager : UIViewController
+(ObjectManager*)UIManager;

@property NSMutableDictionary *objectDictionary;
@property UIButton *startButton;
@end
