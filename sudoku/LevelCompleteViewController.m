//
//  LevelCompleteViewController.m
//  sudoku
//
//  Created by Andrew Boryk on 7/2/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import "LevelCompleteViewController.h"

@interface LevelCompleteViewController ()

@end

NSUserDefaults *defaults;
@implementation LevelCompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    defaults = [NSUserDefaults standardUserDefaults];
    self.levelLabel.text = [NSString stringWithFormat:@"%li", ((long)[defaults integerForKey:@"level"]-1)];
    [self backgroundSetters:self.levelBackground];
    [self backgroundSetters:self.nextButton];
}

-(void)backgroundSetters: (UIButton *)button{
    button.layer.cornerRadius = 5.0f;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowRadius = 2;
    button.layer.shadowOpacity = 1;
    button.layer.shadowOffset = CGSizeMake(0, 0);
}

- (IBAction)nextAction:(id)sender {
    [self performSegueWithIdentifier:@"nextLevel" sender:self];
}
@end
