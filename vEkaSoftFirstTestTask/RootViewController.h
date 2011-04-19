//
//  RootViewController.h
//  vEkaSoftFirstTestTask
//
//  Created by Alexander Burdovitzin on 4/16/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailedInfoController.h"
#import "JsonConnectionController.h"

@interface RootViewController : UITableViewController {
    NSMutableData *responseData;
    NSMutableArray *items;
    DetailedInfoController *detail;
}
@end
