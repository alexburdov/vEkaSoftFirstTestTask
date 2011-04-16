//
//  DetailedInfoController.m
//  vEkaSoftFirstTestTask
//
//  Created by Alexander Burdovitzin on 4/16/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "DetailedInfoController.h"


@implementation DetailedInfoController
@synthesize itemImage;
@synthesize itemTitle;
@synthesize itemDescription;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
// Custom initialization
    }
    return self;
}

- (void)dealloc {
    [itemImage release];
    [itemTitle release];
    [itemDescription release];
    [itemTitle release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    itemTitle.editable = NO;
    itemTitle.scrollEnabled = NO;

    itemDescription.editable = NO;
    itemDescription.scrollEnabled = YES;

}

- (void)viewDidUnload {
    [self setItemImage:nil];
    [self setItemTitle:nil];
    [self setItemDescription:nil];
    [self setItemTitle:nil];
    [super viewDidUnload];
// Release any retained subviews of the main view.
// e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
// Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
