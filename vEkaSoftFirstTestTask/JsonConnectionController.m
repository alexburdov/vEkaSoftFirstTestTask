//
//  JsonConnectionController.m
//  vEkaSoftFirstTestTask
//
//  Created by Alexander Burdovitzin on 4/17/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "JsonConnectionController.h"
#import "JSON.h"

@interface JsonConnectionController(private)
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
@end

@implementation JsonConnectionController

@synthesize items;

NSMutableData *responseData;

+ (id)initWithURLString:(NSString *)urlString
{
    responseData = [[NSMutableData data] retain];
    NSLog(@"%@",urlString);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];
//    
//    // Setup and start async download
//	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//	[[NSURLConnection alloc] initWithRequest:request delegate:self];
    return self;  
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"%@",@"DidReceiveResponse");
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"%@",@"DidReceiveData");
	[responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	NSLog(@"===== %@", [NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"%@",@"FINISH");
	[connection release];
}

- (void)dealloc {
    [super dealloc];
}

@end


//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
//    [responseData setLength:0];
//  
//    NSLog(@"%@",@"RECEIVED");
//    	items = [[NSMutableArray alloc] init];
//}
//
//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
//	items = nil;
//    NSLog(@"%@",@"CONNECTION ERROR");
//}
//
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
//	[connection release];
//    
//    // Store incoming data into a string
//    NSString *jsonString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
//    
//    NSLog(@"JSON STRING = %@",jsonString);
//    
//    // Create a dictionary from the JSON string
//	NSDictionary *results = [jsonString JSONValue];
//	
//    // Build an array from the dictionary for easy access to each entry
//	NSArray *entities = [results objectForKey:@"entity"];
//    
//    items = [[NSMutableArray alloc] init]; 
//    
//    // Loop through each entry in the dictionary...
//	for (NSDictionary *entity in entities)
//    {
//        ItemModel *item = [[ItemModel alloc] init];
//        
//        //        item.itemId = [[entity objectForKey:@"entity_id"] integerValue];
//        item.itemImage = nil;
//        item.itemImageURL = [entity objectForKey:@"icon"];
//        item.itemTitle = [entity objectForKey:@"title"];
//        item.itemDescription = [entity objectForKey:@"text"];
//        
//        [items addObject:item];
//        [item release];
//	}
//	[jsonString release];  
//}
//
//- (void)dealloc {
//    [super dealloc];
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
//{
//    [responseData appendData:data];
//}

//@end
