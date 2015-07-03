//
//  GameOverViewController.m
//  sudoku
//
//  Created by Andrew Boryk on 7/2/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import "GameOverViewController.h"

@interface GameOverViewController ()

@end

@implementation GameOverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", [self.scoreNum intValue]];
    self.goalLabel.text = [NSString stringWithFormat:@"%i", [self.goalNum intValue]];
    [self backgroundSetters:self.scoreBackground];
    [self backgroundSetters:self.goalBackground];
    [self backgroundSetters:self.restartButton];
}
- (IBAction)restartAction:(id)sender {
}

-(void)backgroundSetters: (UIButton *)button{
    button.layer.cornerRadius = 5.0f;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowRadius = 2;
    button.layer.shadowOpacity = 1;
    button.layer.shadowOffset = CGSizeMake(0, 0);
}
@end
