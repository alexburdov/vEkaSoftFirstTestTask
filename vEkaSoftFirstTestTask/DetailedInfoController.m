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


- (void)dealloc {
    [itemImage release];
    [itemTitle release];
    [itemDescription release];
    [itemTitle release];
    [super dealloc];
}

-(void)setItem:(ItemModel *)item{
    if (item.itemTitle != nil)
        itemTitle.text = item.itemTitle;
    if (item.itemDescription)
        itemDescription.text = item.itemDescription;
    if (item.itemImage != nil) 
        itemImage.image = item.itemImage; 
    
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
    itemTitle.text = @"";
    
    itemDescription.editable = NO;
    itemDescription.scrollEnabled = YES;
    itemDescription.text = @"";
    
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
