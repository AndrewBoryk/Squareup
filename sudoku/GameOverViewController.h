//
//  GameOverViewController.h
//  sudoku
//
//  Created by Andrew Boryk on 7/2/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GameOverViewController : UIViewController

//Passed Variables
@property (strong, nonatomic) UIColor *baseColor;
@property (strong, nonatomic) NSNumber *goalNum;
@property (strong, nonatomic) NSNumber *scoreNum;

//Properties
@property (strong, nonatomic) IBOutlet UILabel *gameOverTitle;
@property (strong, nonatomic) IBOutlet UILabel *scoreTitle;
@property (strong, nonatomic) IBOutlet UILabel *goalTitle;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *goalLabel;
@property (strong, nonatomic) IBOutlet UIButton *scoreBackground;
@property (strong, nonatomic) IBOutlet UIButton *goalBackground;
@property (strong, nonatomic) IBOutlet UIButton *restartButton;

- (IBAction)restartAction:(id)sender;


@end
