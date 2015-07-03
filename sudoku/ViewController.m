//
//  ViewController.m
//  sudoku
//
//  Created by Andrew Boryk on 5/10/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

NSArray *allSquaresArray;
NSArray *squareColorValues;
float gameCounter;
float squareCounter;
NSTimer *squareTimer;
NSTimer *gameTimer;
int score;
int currentCounter;
UIColor *tempColor;
int tempScore;
NSUserDefaults *defaulted;

#define RADIANS(degrees) ((degrees * M_PI) / 180.0)

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    defaulted = [NSUserDefaults standardUserDefaults];
    if (![defaulted integerForKey:@"level"]) {
        NSInteger i = 1;
        [defaulted setInteger:i forKey:@"level"];
    }
    allSquaresArray = [[NSArray alloc] initWithObjects:self.square1, self.square2, self.square3, self.square4, self.square5, self.square6, self.square7, self.square8, self.square9, self.square10, self.square11, self.square12, self.square13, self.square14, self.square15, self.square16, self.square17, self.square18, self.square19, self.square20, self.square21, self.square22, self.square23, self.square24, self.square25, nil];
    [UIApplication sharedApplication].statusBarHidden = YES;
    gameCounter = 30.0f;
    squareCounter = 2.5f;
    score = 0;
    currentCounter = 0;
    tempColor = [UIColor colorWithRed:26.0f/255.0f green:188.0f/255.0f blue:156.0f/255.0f alpha:1.0f];
}

-(void)viewWillAppear:(BOOL)animated{
    for (UIButton *square in allSquaresArray) {
        [square setBackgroundColor:[self returnWithColor]];
        square.layer.cornerRadius = 5.0f;
        square.layer.borderColor = [UIColor blackColor].CGColor;
        square.layer.shadowColor = [UIColor blackColor].CGColor;
        square.layer.shadowRadius = 0;
        square.layer.shadowOpacity = 0.6;
        square.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(gameCountDown) userInfo:nil repeats:YES];
}

#pragma mark Square Actions
- (IBAction)action1:(id)sender {
    [self buttonAction:self.square1 squareNum:0];
}

- (IBAction)action2:(id)sender {
    [self buttonAction:self.square2 squareNum:1];
}

- (IBAction)action3:(id)sender {
    [self buttonAction:self.square3 squareNum:2];
}

- (IBAction)action4:(id)sender {
    [self buttonAction:self.square4 squareNum:3];
}

- (IBAction)action5:(id)sender {
    [self buttonAction:self.square5 squareNum:4];
}

- (IBAction)action6:(id)sender {
    [self buttonAction:self.square6 squareNum:5];
}

- (IBAction)action7:(id)sender {
    [self buttonAction:self.square7 squareNum:6];
}

- (IBAction)action8:(id)sender {
    [self buttonAction:self.square8 squareNum:7];
}

- (IBAction)action9:(id)sender {
    [self buttonAction:self.square9 squareNum:8];
}

- (IBAction)action10:(id)sender {
    [self buttonAction:self.square10 squareNum:9];
}

- (IBAction)action11:(id)sender {
    [self buttonAction:self.square11 squareNum:10];
}

- (IBAction)action12:(id)sender {
    [self buttonAction:self.square12 squareNum:11];
}

- (IBAction)action13:(id)sender {
    [self buttonAction:self.square13 squareNum:12];
}

- (IBAction)action14:(id)sender {
    [self buttonAction:self.square14 squareNum:13];
}

- (IBAction)action15:(id)sender {
    [self buttonAction:self.square15 squareNum:14];
}

- (IBAction)action16:(id)sender {
    [self buttonAction:self.square16 squareNum:15];
}

- (IBAction)action17:(id)sender {
    [self buttonAction:self.square17 squareNum:16];
}

- (IBAction)action18:(id)sender {
    [self buttonAction:self.square18 squareNum:17];
}

- (IBAction)action19:(id)sender {
    [self buttonAction:self.square19 squareNum:18];
}

- (IBAction)action20:(id)sender {
    [self buttonAction:self.square20 squareNum:19];
}

- (IBAction)action21:(id)sender {
    [self buttonAction:self.square21 squareNum:20];
}

- (IBAction)action22:(id)sender {
    [self buttonAction:self.square22 squareNum:21];
}

- (IBAction)action23:(id)sender {
    [self buttonAction:self.square23 squareNum:22];
}

- (IBAction)action24:(id)sender {
    [self buttonAction:self.square24 squareNum:23];
}

- (IBAction)action25:(id)sender {
    [self buttonAction:self.square25 squareNum:24];
}

-(void)buttonAction: (UIButton *)button squareNum: (int)number{
    NSLog(@"Index: %lu", (unsigned long)[allSquaresArray indexOfObject:button]);
    if (button.backgroundColor == nil) {
        
    }
    else{
        if (!self.compColor) {
            currentCounter = 1;
            self.compColor = button.backgroundColor;
            tempColor = self.compColor;
            self.gameTimeBar.progressTintColor = self.compColor;
            squareCounter = 2.5f;
            self.squareCounterLabel.text = [NSString stringWithFormat:@"%.02f", squareCounter];
            [button setBackgroundColor: nil];
            squareTimer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(squareCountDown) userInfo:nil repeats:YES];
            score += 10;
            self.scoreLabel.text = [NSString stringWithFormat:@"%i", score];
            [self checkForMatch:number];
            [self borderMaker:NO];
            [self borderMaker:YES];
            [self checkForLeft];
            [self checkForWin];
        }
        else if ([squareColorValues containsObject:button]) {
            if ([button.backgroundColor isEqual: self.compColor]) {
                currentCounter++;
                gameCounter += (.2 * currentCounter);
                squareCounter = 2.5f;
                self.squareCounterLabel.text = [NSString stringWithFormat:@"%.02f", squareCounter];
                [button setBackgroundColor: nil];
                score += (10 * currentCounter);
                self.scoreLabel.text = [NSString stringWithFormat:@"%i", score];
                [self checkForMatch:number];
                [self borderMaker:NO];
                [self borderMaker:YES];
                [self checkForLeft];
                [self checkForWin];
            }
        }
    }
    
}

-(void)checkForWin{
    NSInteger i = [defaulted integerForKey:@"level"]*1000;
    if (score >= i) {
        [gameTimer invalidate];
        NSInteger level = [defaulted integerForKey:@"level"];
        level++;
        [defaulted setInteger:level forKey:@"level"];
        [defaulted synchronize];
        [self performSegueWithIdentifier:@"win" sender:self];
    }
//    switch ([defaults integerForKey:@"level"]) {
//        case 1:
//            
//            break;
//        case 2:
//            
//            break;
//        default:
//            break;
//    }
}

-(void)borderMaker: (BOOL)choice{
    if (choice) {
        int tracker = 0;
        for (UIButton *square in squareColorValues) {
            if ([square.backgroundColor isEqual:self.compColor]) {
                square.layer.borderWidth = 0.5f;
                square.layer.masksToBounds = NO;
                square.layer.shadowRadius = 12;
                tracker++;
            }
        }
        if (tracker == 0) {
            [self stopComp];
        }
    }
    else{
        for (UIButton *allSquare in allSquaresArray) {
            allSquare.layer.borderWidth = 0.0f;
            allSquare.layer.masksToBounds = YES;
            allSquare.layer.shadowRadius = 0;
        }
    }
}

-(int)randomizeColor{
    int random = 1 + arc4random() % 7;
    return random;
}

-(UIColor *)returnWithColor{
    int i = [self randomizeColor];
    switch (i) {
        case 1:
            //Turquoise
            return [UIColor colorWithRed:26.0f/255.0f green:188.0f/255.0f blue:156.0f/255.0f alpha:1.0f];
            break;
        case 2:
            //Emerald
            return [UIColor colorWithRed:46.0f/255.0f green:204.0f/255.0f blue:113.0f/255.0f alpha:1.0f];
            break;
        case 3:
            //Peter River
            return [UIColor colorWithRed:52.0f/255.0f green:152.0f/255.0f blue:219.0f/255.0f alpha:1.0f];
            break;
        case 4:
            //Amethyst
            return [UIColor colorWithRed:155.0f/255.0f green:89.0f/255.0f blue:182.0f/255.0f alpha:1.0f];
            break;
        case 5:
            //Sun Flower
            return [UIColor colorWithRed:241.0f/255.0f green:196.0f/255.0f blue:15.0f/255.0f alpha:1.0f];
            break;
        case 6:
            //Carrot
            return [UIColor colorWithRed:230.0f/255.0f green:126.0f/255.0f blue:34.0f/255.0f alpha:1.0f];
            break;
        case 7:
            //Alizarin
            return [UIColor colorWithRed:231.0f/255.0f green:76.0f/255.0f blue:60.0f/255.0f alpha:1.0f];
            break;
            
        default:
            break;
    }
    return nil;
}

-(void)gameCountDown{
    if (gameCounter >= 30.0f) {
        gameCounter = 30.0f;
        gameCounter -= 0.001;
        self.gameTimeBar.progress = 1;
    }
    else if (gameCounter <= 0)
    {
        self.gameTimeBar.progress = 0;
        [gameTimer invalidate];
        NSLog(@"Score: %i", score);
        tempScore = score;
        [self performSegueWithIdentifier:@"gameOver" sender:self];
    }
    else {
        gameCounter -= 0.001;
        self.gameTimeBar.progress = (gameCounter / 30.0f);
    }
}

-(void)checkForLeft{
    int numLeft = 0;
    for (UIButton *allSquare in allSquaresArray) {
        if ([allSquare.backgroundColor isEqual:self.compColor]) {
            numLeft++;
            break;
        }
    }
    if (numLeft == 0) {
        [self stopComp];
    }
}

-(void)squareCountDown{
    if (squareCounter > 0) {
        squareCounter -= 0.01;
    }
    else{
        [self stopComp];
    }
}

-(void)stopComp{
    if (currentCounter >= 8) {
        gameCounter += 2.0f;
        score += 250;
    }
    else if (currentCounter >= 6){
        gameCounter += 1.5f;
        score += 170;
    }
    else if (currentCounter >= 4){
        gameCounter += 1.0f;
        score += 100;
    }
    else if (currentCounter >= 2){
        gameCounter += 0.5;
        score += 50;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", score];
    squareCounter = 2.5f;
    [squareTimer invalidate];
    self.compColor = nil;
    currentCounter = 0;
    for (UIButton *square in allSquaresArray) {
        if (square.backgroundColor == nil) {
            [square setBackgroundColor:[self returnWithColor]];
        }
        square.layer.borderWidth = 0.0f;
        square.layer.masksToBounds = NO;
        square.layer.shadowRadius = 0;
    }
}

-(void)checkForMatch: (int)i{
    squareColorValues = nil;
    switch (i) {
        case 0:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:1],[allSquaresArray objectAtIndex:2],[allSquaresArray objectAtIndex:3],[allSquaresArray objectAtIndex:4],[allSquaresArray objectAtIndex:5],[allSquaresArray objectAtIndex:10],[allSquaresArray objectAtIndex:15],[allSquaresArray objectAtIndex:20], nil];
            break;
        case 1:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:0],[allSquaresArray objectAtIndex:2],[allSquaresArray objectAtIndex:3],[allSquaresArray objectAtIndex:4],[allSquaresArray objectAtIndex:6],[allSquaresArray objectAtIndex:11],[allSquaresArray objectAtIndex:16],[allSquaresArray objectAtIndex:21], nil];
            break;
        case 2:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:0],[allSquaresArray objectAtIndex:1],[allSquaresArray objectAtIndex:3],[allSquaresArray objectAtIndex:4],[allSquaresArray objectAtIndex:7],[allSquaresArray objectAtIndex:12],[allSquaresArray objectAtIndex:17],[allSquaresArray objectAtIndex:22], nil];
            break;
        case 3:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:0],[allSquaresArray objectAtIndex:1],[allSquaresArray objectAtIndex:2],[allSquaresArray objectAtIndex:4],[allSquaresArray objectAtIndex:8],[allSquaresArray objectAtIndex:13],[allSquaresArray objectAtIndex:18],[allSquaresArray objectAtIndex:23], nil];
            break;
        case 4:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:0],[allSquaresArray objectAtIndex:1],[allSquaresArray objectAtIndex:2],[allSquaresArray objectAtIndex:3],[allSquaresArray objectAtIndex:9],[allSquaresArray objectAtIndex:14],[allSquaresArray objectAtIndex:19],[allSquaresArray objectAtIndex:24], nil];
            break;
        case 5:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:6],[allSquaresArray objectAtIndex:7],[allSquaresArray objectAtIndex:8],[allSquaresArray objectAtIndex:9],[allSquaresArray objectAtIndex:0],[allSquaresArray objectAtIndex:10],[allSquaresArray objectAtIndex:15],[allSquaresArray objectAtIndex:20], nil];
            break;
        case 6:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:5],[allSquaresArray objectAtIndex:7],[allSquaresArray objectAtIndex:8],[allSquaresArray objectAtIndex:9],[allSquaresArray objectAtIndex:1],[allSquaresArray objectAtIndex:11],[allSquaresArray objectAtIndex:16],[allSquaresArray objectAtIndex:21], nil];
            break;
        case 7:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:5],[allSquaresArray objectAtIndex:6],[allSquaresArray objectAtIndex:8],[allSquaresArray objectAtIndex:9],[allSquaresArray objectAtIndex:2],[allSquaresArray objectAtIndex:12],[allSquaresArray objectAtIndex:17],[allSquaresArray objectAtIndex:22], nil];
            break;
        case 8:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:5],[allSquaresArray objectAtIndex:6],[allSquaresArray objectAtIndex:7],[allSquaresArray objectAtIndex:9],[allSquaresArray objectAtIndex:3],[allSquaresArray objectAtIndex:13],[allSquaresArray objectAtIndex:18],[allSquaresArray objectAtIndex:23], nil];
            break;
        case 9:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:5],[allSquaresArray objectAtIndex:6],[allSquaresArray objectAtIndex:7],[allSquaresArray objectAtIndex:8],[allSquaresArray objectAtIndex:4],[allSquaresArray objectAtIndex:14],[allSquaresArray objectAtIndex:19],[allSquaresArray objectAtIndex:24], nil];
            break;
        case 10:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:11],[allSquaresArray objectAtIndex:12],[allSquaresArray objectAtIndex:13],[allSquaresArray objectAtIndex:14],[allSquaresArray objectAtIndex:0],[allSquaresArray objectAtIndex:5],[allSquaresArray objectAtIndex:15],[allSquaresArray objectAtIndex:20], nil];
            break;
        case 11:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:10],[allSquaresArray objectAtIndex:12],[allSquaresArray objectAtIndex:13],[allSquaresArray objectAtIndex:14],[allSquaresArray objectAtIndex:1],[allSquaresArray objectAtIndex:6],[allSquaresArray objectAtIndex:16],[allSquaresArray objectAtIndex:21], nil];
            break;
        case 12:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:10],[allSquaresArray objectAtIndex:11],[allSquaresArray objectAtIndex:13],[allSquaresArray objectAtIndex:14],[allSquaresArray objectAtIndex:2],[allSquaresArray objectAtIndex:7],[allSquaresArray objectAtIndex:17],[allSquaresArray objectAtIndex:22], nil];
            break;
        case 13:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:10],[allSquaresArray objectAtIndex:11],[allSquaresArray objectAtIndex:12],[allSquaresArray objectAtIndex:14],[allSquaresArray objectAtIndex:3],[allSquaresArray objectAtIndex:8],[allSquaresArray objectAtIndex:18],[allSquaresArray objectAtIndex:23], nil];
            break;
        case 14:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:10],[allSquaresArray objectAtIndex:11],[allSquaresArray objectAtIndex:12],[allSquaresArray objectAtIndex:13],[allSquaresArray objectAtIndex:4],[allSquaresArray objectAtIndex:9],[allSquaresArray objectAtIndex:19],[allSquaresArray objectAtIndex:24], nil];
            break;
        case 15:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:16],[allSquaresArray objectAtIndex:17],[allSquaresArray objectAtIndex:18],[allSquaresArray objectAtIndex:19],[allSquaresArray objectAtIndex:0],[allSquaresArray objectAtIndex:5],[allSquaresArray objectAtIndex:10],[allSquaresArray objectAtIndex:20], nil];
            break;
        case 16:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:15],[allSquaresArray objectAtIndex:17],[allSquaresArray objectAtIndex:18],[allSquaresArray objectAtIndex:19],[allSquaresArray objectAtIndex:1],[allSquaresArray objectAtIndex:6],[allSquaresArray objectAtIndex:11],[allSquaresArray objectAtIndex:21], nil];
            break;
        case 17:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:15],[allSquaresArray objectAtIndex:16],[allSquaresArray objectAtIndex:18],[allSquaresArray objectAtIndex:19],[allSquaresArray objectAtIndex:2],[allSquaresArray objectAtIndex:7],[allSquaresArray objectAtIndex:12],[allSquaresArray objectAtIndex:22], nil];
            break;
        case 18:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:15],[allSquaresArray objectAtIndex:16],[allSquaresArray objectAtIndex:17],[allSquaresArray objectAtIndex:19],[allSquaresArray objectAtIndex:3],[allSquaresArray objectAtIndex:8],[allSquaresArray objectAtIndex:13],[allSquaresArray objectAtIndex:23], nil];
            break;
        case 19:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:15],[allSquaresArray objectAtIndex:16],[allSquaresArray objectAtIndex:17],[allSquaresArray objectAtIndex:18],[allSquaresArray objectAtIndex:4],[allSquaresArray objectAtIndex:9],[allSquaresArray objectAtIndex:14],[allSquaresArray objectAtIndex:24], nil];
            break;
        case 20:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:21],[allSquaresArray objectAtIndex:22],[allSquaresArray objectAtIndex:23],[allSquaresArray objectAtIndex:24],[allSquaresArray objectAtIndex:0],[allSquaresArray objectAtIndex:5],[allSquaresArray objectAtIndex:10],[allSquaresArray objectAtIndex:15], nil];
            break;
        case 21:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:20],[allSquaresArray objectAtIndex:22],[allSquaresArray objectAtIndex:23],[allSquaresArray objectAtIndex:24],[allSquaresArray objectAtIndex:1],[allSquaresArray objectAtIndex:6],[allSquaresArray objectAtIndex:11],[allSquaresArray objectAtIndex:16], nil];
            break;
        case 22:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:20],[allSquaresArray objectAtIndex:21],[allSquaresArray objectAtIndex:23],[allSquaresArray objectAtIndex:24],[allSquaresArray objectAtIndex:2],[allSquaresArray objectAtIndex:7],[allSquaresArray objectAtIndex:12],[allSquaresArray objectAtIndex:17], nil];
            break;
        case 23:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:20],[allSquaresArray objectAtIndex:21],[allSquaresArray objectAtIndex:22],[allSquaresArray objectAtIndex:24],[allSquaresArray objectAtIndex:3],[allSquaresArray objectAtIndex:8],[allSquaresArray objectAtIndex:13],[allSquaresArray objectAtIndex:18], nil];
            break;
        case 24:
            squareColorValues = [[NSArray alloc] initWithObjects:[allSquaresArray objectAtIndex:20],[allSquaresArray objectAtIndex:21],[allSquaresArray objectAtIndex:22],[allSquaresArray objectAtIndex:23],[allSquaresArray objectAtIndex:4],[allSquaresArray objectAtIndex:9],[allSquaresArray objectAtIndex:14],[allSquaresArray objectAtIndex:19], nil];
            break;
            
        default:
            squareColorValues = [[NSArray alloc] initWithObjects: nil];
            break;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"gameOver"]) {
        [[segue.destinationViewController view] setBackgroundColor:tempColor];
        NSNumber *scoreNum = [NSNumber numberWithInt: tempScore];
        NSInteger i = [defaulted integerForKey:@"level"]*1000;
        NSNumber *goalNum = [NSNumber numberWithInteger:i];
        NSLog(@"Score num: %@", scoreNum);
        [segue.destinationViewController setScoreNum:scoreNum];
        [segue.destinationViewController setGoalNum:goalNum];
    }
    if ([segue.identifier isEqualToString:@"win"]) {
        [[segue.destinationViewController view] setBackgroundColor:tempColor];
    }
}

- (IBAction)stopAction:(id)sender {
    [self stopComp];
}
@end
