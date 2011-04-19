//
//  JsonConnectionController.h
//  vEkaSoftFirstTestTask
//
//  Created by Alexander Burdovitzin on 4/17/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemModel.h"
#import "JSON.h"


@interface JsonConnectionController : NSObject {
    NSMutableArray *items;
    NSMutableData *responseData;
}
- (id)initWithURLString:(NSString *)urlString;

@property(nonatomic, retain) NSMutableArray *items;

@end
