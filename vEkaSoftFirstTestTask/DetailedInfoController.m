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

- (void)setItem:(ItemModel *)item {
    if (item.itemTitle != nil)
            itemTitle.text = item.itemTitle;
    if (item.itemDescription)
            itemDescription.text = item.itemDescription;
    if (item.itemImage != nil) {
        itemImage.image = item.itemImage;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [self setItemImage:nil];
    [self setItemTitle:nil];
    [self setItemDescription:nil];
    [self setItemTitle:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
