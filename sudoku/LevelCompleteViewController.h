//
//  LevelCompleteViewController.h
//  sudoku
//
//  Created by Andrew Boryk on 7/2/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface LevelCompleteViewController : UIViewController

//Passed Variables


//Properties
@property (strong, nonatomic) IBOutlet UILabel *completeTitle;
@property (strong, nonatomic) IBOutlet UIButton *levelBackground;
@property (strong, nonatomic) IBOutlet UILabel *levelLabel;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;

//Actions
- (IBAction)nextAction:(id)sender;

@end
