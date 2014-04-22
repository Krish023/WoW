//
//  ViewController.m
//  WOW.
//
//  Created by krishna on 4/21/14.
//  Copyright (c) 2014 krishna. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()<UIGestureRecognizerDelegate,UIAlertViewDelegate>
{
    UIImageView *imageView;
    UIImage *image;
}


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //scroll view and image view....
    CGRect scrollFrame = CGRectMake(0, 40, 320, 568);
	image = [UIImage imageNamed:@"direction_board1.jpg"];
	imageView = [[UIImageView alloc] initWithImage:image];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollFrame];
	[scrollView addSubview:imageView];
    scrollView.contentSize = imageView.frame.size;
    [self.view addSubview:scrollView];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
 
    //Gesture
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getAlertView:)];
    [gestureRecognizer setNumberOfTapsRequired:1];
    gestureRecognizer.delegate=self;
    [self.view addGestureRecognizer:gestureRecognizer];
      [imageView setAlpha:0.1];
    //Board area..
    CGRect boardFrame=CGRectMake(306, 323, 79, 165);
    UIView *boardview=[[UIView alloc]initWithFrame:boardFrame];
    [boardview.layer setOpaque:NO];
   // boardview.layer.mask
   [scrollView addSubview:boardview];
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage],boardFrame);
    // or use the UIImage wherever you like
    boardview.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageWithCGImage:imageRef]];
    [boardview setAlpha:1.0];
    boardview.userInteractionEnabled=YES;
    CGImageRelease(imageRef);

    //"Food court" section
    CGRect rect=CGRectMake(313, 375, 70, 8);
    UIView *myview=[[UIView alloc]initWithFrame:rect];
    myview.tag=2;
    myview.backgroundColor=[UIColor clearColor];
    [scrollView addSubview:myview];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    //CGPoint point= [touch locationInView:touch.view];
//    NSLog(@"point=%f",point.x);
//    NSLog(@"point=%@",touch.view );
    if([touch.view isKindOfClass:[UIView class]])
    {
      
        
        if(touch.view.tag==2)
            return YES;
    }
    
    
    return NO;
}
-(void)getAlertView:(UIGestureRecognizer*)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:@"WOW"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

@end
