//
//  DetailViewControllerViewController.m
//  StoreSearch
//
//  Created by Stephen Asamoah on 13/05/2012.
//  Copyright (c) 2012 CO-267 Jacobs Consultancy Ltd. All rights reserved.
//

#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SearchResult.h"

@interface DetailViewController ()
@property (nonatomic, weak) IBOutlet UIView *backgroundView;
@property (nonatomic, weak) IBOutlet UIImageView *artworkImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *artistNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *kindLabel;
@property (nonatomic, weak) IBOutlet UILabel *genreLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UIButton *storeButton;
- (IBAction)close:(id)sender;

@end



@implementation DetailViewController
@synthesize backgroundView   = _backgroundView;
@synthesize artworkImageView = _artworkImageView;
@synthesize nameLabel        = _nameLabel;
@synthesize artistNameLabel  = _artistNameLabel;
@synthesize kindLabel        = _kindLabel;
@synthesize genreLabel       = _genreLabel;
@synthesize priceLabel       = _priceLabel;
@synthesize storeButton      = _storeButton;
@synthesize searhResult      = _searhResult;


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
    UIImage *image = [[UIImage imageNamed:@"StoreButton"]
                      stretchableImageWithLeftCapWidth:6 topCapHeight:0];
    [self.storeButton setBackgroundImage:image forState:UIControlStateNormal];
    self.backgroundView.layer.borderColor  = [UIColor whiteColor].CGColor;
    self.backgroundView.layer.borderWidth  = 3.0f;
    self.backgroundView.layer.cornerRadius = 10.0f;
    
    self.nameLabel.text  = self.searhResult.name;
    NSString *artistName = self.searhResult.artistName;
    if (artistName == nil) {
        artistName = @"Unknown";
    }
    self.artistNameLabel.text = artistName;
    self.kindLabel.text  = self.searhResult.kind;
    self.genreLabel.text = self.searhResult.genre;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)close:(id)sender
{
      [self dismissFromParentViewController];
}

- (void)dismissFromParentViewController
{
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)presentInParentViewController:(UIViewController *)parentViewController
{
    [parentViewController.view addSubview:self.view];
    [parentViewController addChildViewController:self];
    
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation
                                            animationWithKeyPath:@"transform.scale"];
    bounceAnimation.duration = 0.4;
    bounceAnimation.delegate = self;
    bounceAnimation.values =  [NSArray  arrayWithObjects:
                              [NSNumber numberWithFloat:0.7f],
                              [NSNumber numberWithFloat:1.2f],
                              [NSNumber numberWithFloat:0.9f],
                              [NSNumber numberWithFloat:1.0f],
                              nil];
    
    bounceAnimation.keyTimes =  [NSArray  arrayWithObjects:
                                [NSNumber numberWithFloat:0.0f],
                                [NSNumber numberWithFloat:0.334f],
                                [NSNumber numberWithFloat:0.666f],
                                [NSNumber numberWithFloat:1.0f],
                                nil];
    
    bounceAnimation.timingFunctions = [NSArray arrayWithObjects:
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                       nil];
    
    [self.view.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
//    [self didMoveToParentViewController:parentViewController];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self didMoveToParentViewController:self.parentViewController];
}

- (void)dealloc
{
    NSLog(@"dealloc %@", self);
}

@end
