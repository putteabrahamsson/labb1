//
//  ImageViewController.m
//  labb1
//
//  Created by Putte on 2020-01-12.
//  Copyright © 2020 Putte. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self retrieveBackgroundState];
}

//Retrieving background state and changing the background.
- (void) retrieveBackgroundState{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    Boolean background = [defaults integerForKey:@"background"];
    
    if(background == YES){
        NSLog(@"%d", background);
        [self setBlueBackground];
    }
    else{
        NSLog(@"%d", background);
        [self setWhiteBackground];
    }
}

- (void) setBlueBackground{
    self.view.backgroundColor = UIColor.blueColor;
}

- (void) setWhiteBackground{
    self.view.backgroundColor = UIColor.whiteColor;
}

@end
