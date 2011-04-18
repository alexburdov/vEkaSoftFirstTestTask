//
//  DetailedInfoController.h
//  vEkaSoftFirstTestTask
//
//  Created by Alexander Burdovitzin on 4/16/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"


@interface DetailedInfoController : UIViewController {
    
    UIImageView *itemImage;
    UITextView *itemTitle;
    UITextView *itemDescription;
    ItemModel *item;
}
@property (nonatomic, retain) IBOutlet UIImageView *itemImage;

@property (nonatomic, retain) IBOutlet UITextView *itemTitle;

@property (nonatomic, retain) IBOutlet UITextView *itemDescription;

@property (nonatomic, retain) ItemModel *item;

@end
