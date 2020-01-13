//
//  GameViewController.m
//  labb1
//
//  Created by Putte on 2020-01-12.
//  Copyright © 2020 Putte. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *currentNumber;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self retrieveBackgroundState];
}

//If slider value is changed.
- (IBAction)sliderChanged:(id)sender {
    _currentNumber.text = [NSString stringWithFormat:@"%d", (int)_slider.value];
}

//Button to guess number
- (IBAction)guessNumberTapped:(id)sender {
    NSLog(@"%@", _currentNumber.text);
    
    //Generating a random number between 1-100
    int generatedNumber = arc4random_uniform(100) + 1;
    NSLog(@"%d", generatedNumber);
    
    //Check if slider value is equal to gussed number.
    if((int)_slider.value == generatedNumber){
        [self createAlert:@"Du gissade korrekt!" :@"Grattis!"];
    }
    
    //Check if slider value is higher then gussed number.
    else if((int)_slider.value < generatedNumber){
        [self createAlert:@"Du gissade för lågt!" :@"Ops!"];
    }
    
    //Check if slider value is lower then gussed number.
    else if((int)_slider.value > generatedNumber){
        [self createAlert:@"Du gissade för högt!" :@"Ops!"];
    }
    
    else{
        printf("Invalid input");
    }
}

//Create an alert for result
-(void)createAlert:(NSString *)message :(NSString *) title{
    //Creating the alert.
    UIAlertController *alertvc=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    //Creating a button to dismiss the alert.
    UIAlertAction * action = [UIAlertAction actionWithTitle: @ "Fortsätt" style: UIAlertActionStyleDefault handler: ^ (UIAlertAction * _Nonnull action) {
        //Reset values to default
        self->_currentNumber.text = @"1";
        self->_slider.value = 1;
        }];
    
      //Adding the button to the alert
      [alertvc addAction: action];
    
    //Presentating the alert.
      [self presentViewController: alertvc animated: true completion: nil];
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
