//
//  ImageDownloader.m
//  vEkaSoftFirstTestTask
//
//  Created by Alexander Burdovitzin on 4/18/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "ImageDownloader.h"


@implementation ImageDownloader

@synthesize item;
@synthesize activeDownload;
@synthesize imageConnection;

- (void)dealloc
{
    [activeDownload release];
    
    [imageConnection cancel];
    [imageConnection release];
    
    [super dealloc];
}

- (void)startDownload
{
    self.activeDownload = [NSMutableData data];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:
                             [NSURLRequest requestWithURL:
                              [NSURL URLWithString:[@"http://job.vekasoft.com/tests/" 
                                                    stringByAppendingString: item.itemImageURL]]] delegate:self];
  
    self.imageConnection = conn;
    [conn release];
}

- (void)cancelDownload
{
    [self.imageConnection cancel];
    self.imageConnection = nil;
    self.activeDownload = nil;
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.activeDownload appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	self.activeDownload = nil;
    self.imageConnection = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    UIImage *image = [[UIImage alloc] initWithData:self.activeDownload];
    self.item.itemImage = image;
    self.activeDownload = nil;
    [image release];
    self.imageConnection = nil;
}

@end
