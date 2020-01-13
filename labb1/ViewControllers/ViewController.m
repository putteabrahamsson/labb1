//
//  ViewController.m
//  labb1
//
//  Created by Putte on 2020-01-10.
//  Copyright © 2020 Putte. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *buttonNames;
    
    __weak IBOutlet UITableView *tableView;
    __weak IBOutlet UIView *extraView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Adding values to array
    buttonNames = @[@"Om mig", @"Bild", @"Gissa numret", @"Inställningar"];
    
    //Assigning delegate and datasource
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

-(void) viewWillAppear:(BOOL)animated{
    [self retrieveBackgroundState];
}

//Number of sections
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//Number of rows in the section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return buttonNames.count;
}

//Properties for tableview cell.
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = buttonNames[indexPath.row];
    
    return cell;
}

//If any row is clicked
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch([indexPath row]){
        case 0 - 0:
            [self performSegueWithIdentifier:@"aboutMe" sender:self];
            break;
        case 1 - 0:
            [self performSegueWithIdentifier:@"image" sender:self];
            break;
        case 2 - 0:
            [self performSegueWithIdentifier:@"game" sender:self];
            break;
        case 3 - 0:
            [self performSegueWithIdentifier:@"settings" sender:self];
            break;
            
            default:
            printf("Invalid press");
            break;
    }
}

//Height for each row.
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
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
    self.tableView.backgroundColor = UIColor.blueColor;
    self->extraView.backgroundColor = UIColor.blueColor;
    self.view.backgroundColor = UIColor.blueColor;
}

- (void) setWhiteBackground{
    self.tableView.backgroundColor = UIColor.whiteColor;
    self->extraView.backgroundColor = UIColor.whiteColor;
    self.view.backgroundColor = UIColor.whiteColor;
}

@end
