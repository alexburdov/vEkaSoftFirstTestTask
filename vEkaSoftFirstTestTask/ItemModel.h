//
//  ItemModel.h
//  vEkaSoftFirstTestTask
//
//  Created by Alexander Burdovitzin on 4/16/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ItemModel : NSObject {
//   int *itemId;
    UIImage *itemImage;
    NSString *itemImageURL;
    NSString *itemTitle;
    NSString *itemDescriptiom;
}

//@property int *itemId;
@property(nonatomic, retain) UIImage *itemImage;
@property(nonatomic, retain) NSString *itemImageURL;
@property(nonatomic, retain) NSString *itemTitle;
@property(nonatomic, retain) NSString *itemDescription;
@end
