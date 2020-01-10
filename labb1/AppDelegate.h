//
//  AppDelegate.h
//  labb1
//
//  Created by Putte on 2020-01-10.
//  Copyright © 2020 Putte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

