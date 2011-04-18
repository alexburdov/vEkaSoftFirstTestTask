//
//  ImageDownloader.h
//  vEkaSoftFirstTestTask
//
//  Created by Alexander Burdovitzin on 4/18/11.
//  Copyright 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemModel.h"

@protocol IconDownloaderDelegate;

@interface ImageDownloader : NSObject {
    ItemModel *item;
    NSMutableData *activeDownload;
    NSURLConnection *imageConnection;
    }

@property (nonatomic, retain) ItemModel *item;
@property (nonatomic, retain) NSMutableData *activeDownload;
@property (nonatomic, retain) NSURLConnection *imageConnection;

- (void) setItem:(ItemModel *)item;
- (void)startDownload;
- (void)cancelDownload;

@end