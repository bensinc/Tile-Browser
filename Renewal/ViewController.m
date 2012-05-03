//
//  ViewController.m
//  Renewal
//
//  Created by Ben Sinclair on 5/2/12.
//  Copyright (c) 2012 Industrial Parker, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *tiles = [[NSMutableArray alloc] init];
    for (int x = 0; x < 20; x++) {
        for (int y = 0; y < 20; y++) {
//            [tiles addObject:[NSNumber numberWithInt:(arc4random() % 8)+1]];
            [tiles addObject:[NSNumber numberWithInt:0]];

        }
    }
    
    zoomLevel = 1;
    
    
    
    NSMutableArray *imageViews = [[NSMutableArray alloc] init];
    
    int width = 128;
    int height = 64;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 21*width, 21*height)];

    
    view.backgroundColor = [UIColor colorWithRed:76.f/255.f green:112.f/255.f blue:43.f/255.f alpha:1.0f];
    
    for (int x = 0; x < 20; x++) {
        for (int y = 0; y < 20; y++) {
            UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i.png", [[tiles objectAtIndex:x*y] intValue]]]];
            
            int isox = (x-y) * (width/2);
            int isoy = (x+y) * (height/2);
            
            isox += 20*width/2;
//            isoy += 20*height/2;
            
            img.frame = CGRectMake(isox, isoy, width, width);
            [view addSubview:img];
            [imageViews addObject:img];
            
            
         
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(isox + (width/2.5), isoy, width, height)];
            label.text = [NSString stringWithFormat:@"%i, %i", x, y];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor whiteColor];
            label.shadowColor = [UIColor blackColor];
            label.shadowOffset = CGSizeMake(1, 1);
            label.font = [UIFont systemFontOfSize:10.0];
            [view addSubview:label];
        }
    }
    
    
    scrollView.contentSize = view.frame.size;    
    
    [scrollView addSubview:view];
    
//    CGPoint scrollCenter = [scrollView center];
//    [view setCenter:CGPointMake(scrollCenter.x, scrollCenter.y)];      
    
    
  
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
