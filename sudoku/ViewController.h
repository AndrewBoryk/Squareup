//
//  ViewController.h
//  sudoku
//
//  Created by Andrew Boryk on 5/10/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GameOverViewController.h"
#import "LevelCompleteViewController.h"

@interface ViewController : UIViewController

//CompyColor
@property (strong, nonatomic) UIColor *compColor;

//GAME PROPERTIES
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
@property (strong, nonatomic) IBOutlet UIProgressView *gameTimeBar;


//GAME ACTIONS
- (IBAction)stopAction:(id)sender;

//GAME LABELS
@property (strong, nonatomic) IBOutlet UILabel *squareCounterLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

//SQUARE PROPERTIES
@property (strong, nonatomic) IBOutlet UIButton *square1;
@property (strong, nonatomic) IBOutlet UIButton *square2;
@property (strong, nonatomic) IBOutlet UIButton *square3;
@property (strong, nonatomic) IBOutlet UIButton *square4;
@property (strong, nonatomic) IBOutlet UIButton *square5;
@property (strong, nonatomic) IBOutlet UIButton *square6;
@property (strong, nonatomic) IBOutlet UIButton *square7;
@property (strong, nonatomic) IBOutlet UIButton *square8;
@property (strong, nonatomic) IBOutlet UIButton *square9;
@property (strong, nonatomic) IBOutlet UIButton *square10;
@property (strong, nonatomic) IBOutlet UIButton *square11;
@property (strong, nonatomic) IBOutlet UIButton *square12;
@property (strong, nonatomic) IBOutlet UIButton *square13;
@property (strong, nonatomic) IBOutlet UIButton *square14;
@property (strong, nonatomic) IBOutlet UIButton *square15;
@property (strong, nonatomic) IBOutlet UIButton *square16;
@property (strong, nonatomic) IBOutlet UIButton *square17;
@property (strong, nonatomic) IBOutlet UIButton *square18;
@property (strong, nonatomic) IBOutlet UIButton *square19;
@property (strong, nonatomic) IBOutlet UIButton *square20;
@property (strong, nonatomic) IBOutlet UIButton *square21;
@property (strong, nonatomic) IBOutlet UIButton *square22;
@property (strong, nonatomic) IBOutlet UIButton *square23;
@property (strong, nonatomic) IBOutlet UIButton *square24;
@property (strong, nonatomic) IBOutlet UIButton *square25;


//SQUARE ACTIONS
- (IBAction)action1:(id)sender;
- (IBAction)action2:(id)sender;
- (IBAction)action3:(id)sender;
- (IBAction)action4:(id)sender;
- (IBAction)action5:(id)sender;
- (IBAction)action6:(id)sender;
- (IBAction)action7:(id)sender;
- (IBAction)action8:(id)sender;
- (IBAction)action9:(id)sender;
- (IBAction)action10:(id)sender;
- (IBAction)action11:(id)sender;
- (IBAction)action12:(id)sender;
- (IBAction)action13:(id)sender;
- (IBAction)action14:(id)sender;
- (IBAction)action15:(id)sender;
- (IBAction)action16:(id)sender;
- (IBAction)action17:(id)sender;
- (IBAction)action18:(id)sender;
- (IBAction)action19:(id)sender;
- (IBAction)action20:(id)sender;
- (IBAction)action21:(id)sender;
- (IBAction)action22:(id)sender;
- (IBAction)action23:(id)sender;
- (IBAction)action24:(id)sender;
- (IBAction)action25:(id)sender;


@end

