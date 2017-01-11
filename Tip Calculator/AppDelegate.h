//
//  AppDelegate.h
//  Tip Calculator
//
//  Created by Laura Bingeman on 2017-01-11.
//  Copyright © 2017 Laura Bingeman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

