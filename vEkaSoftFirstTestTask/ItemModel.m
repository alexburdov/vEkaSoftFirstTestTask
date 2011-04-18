//
//  ItemModel.m
//  vEkaSoftFirstTestTask
//
//  Created by Alexander Burdovitzin on 4/16/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel

//@synthesize itemId;
@synthesize itemImage;
@synthesize itemImageURL;
@synthesize itemTitle;
@synthesize itemDescription;

-(void) dealloc{
    // 
    [itemImage release];
    [itemImageURL release];
    [itemTitle release];
    [itemDescription release];
    
    [super dealloc];
}

@end
