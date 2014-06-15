//
//  FTCMainViewController.m
//  FeelTheColor
//
//  Created by Zhang Honghao on 6/15/14.
//  Copyright (c) 2014 org-honghao. All rights reserved.
//

#import "FTCMainViewController.h"

@interface FTCMainViewController ()

@end

@implementation FTCMainViewController {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    
    UISlider *redSlider;
    UISlider *greenSlider;
    UISlider *blueSlider;
    UISlider *alphaSlider;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGSize mainScreenSize = [UIScreen mainScreen].bounds.size;
    CGFloat sliderWidth = 250;
    CGFloat sliderHeight = 20;
    CGFloat sliderX = (mainScreenSize.width - sliderWidth) / 2;
    
    CGFloat seperateHeight = 20;
    
    UILabel *minLabel = [[UILabel alloc] initWithFrame:CGRectMake(-15, 0, 20, 20)];
    [minLabel setText:@"0"];
    [minLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:15]];
    [minLabel setTextColor:[UIColor blackColor]];
    
    UILabel *maxLabel = [[UILabel alloc] initWithFrame:CGRectMake(sliderWidth + 5, 0, 30, 20)];
    [maxLabel setText:@"255"];
    [maxLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:15]];
    [maxLabel setTextColor:[UIColor blackColor]];
    
    CGFloat alphaSliderY = mainScreenSize.height - sliderHeight - 20;
    CGRect alphaSliderFrame = CGRectMake(sliderX, alphaSliderY, sliderWidth, sliderHeight);
    alphaSlider = [[UISlider alloc] initWithFrame:alphaSliderFrame];
    [alphaSlider setMinimumTrackTintColor:[UIColor blackColor]];
    [alphaSlider setMaximumValue:255];
    [alphaSlider setMinimumValue:0];
    [alphaSlider addTarget:self action:@selector(sliderUpdate:) forControlEvents:UIControlEventValueChanged];
    [alphaSlider setValue:255 animated:NO];
    [alphaSlider addSubview:minLabel];
    [alphaSlider addSubview:maxLabel];
    
    CGFloat blueSliderY = alphaSliderY - sliderHeight - seperateHeight;
    CGRect blueSliderFrame = CGRectMake(sliderX, blueSliderY, sliderWidth, sliderHeight);
    blueSlider = [[UISlider alloc] initWithFrame:blueSliderFrame];
    [blueSlider setMinimumTrackTintColor:[UIColor blueColor]];
    [blueSlider setMaximumValue:255];
    [blueSlider setMinimumValue:0];
    [blueSlider addTarget:self action:@selector(sliderUpdate:) forControlEvents:UIControlEventValueChanged];
//    [blueSlider addSubview:minLabel];
//    [blueSlider addSubview:maxLabel];
    
    CGFloat greenSliderY = blueSliderY - sliderHeight - seperateHeight;
    CGRect greenSliderFrame = CGRectMake(sliderX, greenSliderY, sliderWidth, sliderHeight);
    greenSlider = [[UISlider alloc] initWithFrame:greenSliderFrame];
    [greenSlider setMinimumTrackTintColor:[UIColor greenColor]];
    [greenSlider setMaximumValue:255];
    [greenSlider setMinimumValue:0];
    [greenSlider addTarget:self action:@selector(sliderUpdate:) forControlEvents:UIControlEventValueChanged];
//    [greenSlider addSubview:minLabel];
//    [greenSlider addSubview:maxLabel];
    
    CGFloat redSliderY = greenSliderY - sliderHeight - seperateHeight;
    CGRect redSliderFrame = CGRectMake(sliderX, redSliderY, sliderWidth, sliderHeight);
    redSlider = [[UISlider alloc] initWithFrame:redSliderFrame];
    [redSlider setMinimumTrackTintColor:[UIColor redColor]];
    [redSlider setMaximumValue:255];
    [redSlider setMinimumValue:0];
    [redSlider addTarget:self action:@selector(sliderUpdate:) forControlEvents:UIControlEventValueChanged];
//    [redSlider addSubview:minLabel];
//    [redSlider addSubview:maxLabel];
    
    [self.view addSubview:redSlider];
    [self.view addSubview:greenSlider];
    [self.view addSubview:blueSlider];
    [self.view addSubview:alphaSlider];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sliderUpdate:(id)sender {
    red = redSlider.value;
    green = greenSlider.value;
    blue = blueSlider.value;
    alpha = alphaSlider.value;
    
    UIColor *background = [UIColor colorWithRed:red / 255 green:green / 255 blue:blue / 255 alpha:alpha / 255];
    [self.view setBackgroundColor:background];
    [self.view setNeedsDisplay];
}
@end
