//
//  SettingsViewController.m
//  labb1
//
//  Created by Putte on 2020-01-12.
//  Copyright © 2020 Putte. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *switchButton;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Retrieve background color
    [self retrieveBackgroundState];
}

//If switch button is changed.
- (IBAction)switchChanged:(id)sender {
    if (_switchButton.isOn == true){
        [self setBlueBackground];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:YES forKey:@"background"];
        [defaults synchronize];
    }
    else{
        [self setWhiteBackground];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:NO forKey:@"background"];
        [defaults synchronize];
    }
}

//Retrieving background state and changing the background.
- (void) retrieveBackgroundState{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    Boolean background = [defaults integerForKey:@"background"];
    
    if(background == YES){
        NSLog(@"%d", background);
        [_switchButton setOn:true animated:true];
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
