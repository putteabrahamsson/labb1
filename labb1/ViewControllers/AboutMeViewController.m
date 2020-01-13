//
//  AboutMeViewController.m
//  labb1
//
//  Created by Putte on 2020-01-12.
//  Copyright © 2020 Putte. All rights reserved.
//

#import "AboutMeViewController.h"

@interface AboutMeViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textBox;

@end

@implementation AboutMeViewController

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
    self.textBox.backgroundColor = UIColor.blueColor;
    self.view.backgroundColor = UIColor.blueColor;
}

- (void) setWhiteBackground{
    self.textBox.backgroundColor = UIColor.whiteColor;
    self.view.backgroundColor = UIColor.whiteColor;
}

@end
