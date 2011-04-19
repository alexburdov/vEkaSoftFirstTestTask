//
//  JsonConnectionController.m
//  vEkaSoftFirstTestTask
//
//  Created by Alexander Burdovitzin on 4/17/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "JsonConnectionController.h"

@interface JsonConnectionController (private)
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
@end

@implementation JsonConnectionController

@synthesize items;

NSMutableData *responseData;

- (id)initWithURLString:(NSString *)urlString {
    responseData = [[NSMutableData data] retain];
    NSLog(@"%@", urlString);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"%@", @"DidReceiveResponse");
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"%@", @"DidReceiveData");
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"===== %@", [NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"%@", @"FINISH");
    [connection release];
}

- (void)dealloc {
    [responseData release];
    [super dealloc];
}

@end
