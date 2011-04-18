//
//  RootViewController.m
//  vEkaSoftFirstTestTask
//
//  Created by Alexander Burdovitzin on 4/16/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "RootViewController.h"
#import "ImageDownloader.h"

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    responseData = [[NSMutableData data] retain];
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://job.vekasoft.com/tests/apps.json"]];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];
     detail = [[DetailedInfoController alloc] initWithNibName:@"DetailedInfoController" bundle:nil];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	NSLog(@"%@",[NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[connection release];
    
    // Store incoming data into a string
    NSString *jsonString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"JSON STRING = %@",jsonString);
    
    // Create a dictionary from the JSON string
	NSDictionary *results = [jsonString JSONValue];
	
    items = [[NSMutableArray alloc] init]; 
    
    // Loop through each entry in the dictionary...
	for (NSDictionary *entity in results)
    {
        ItemModel *item = [[[ItemModel alloc] init] autorelease];
        ImageDownloader *imgDownloader = [[[ImageDownloader alloc] init] autorelease];
        
        //        item.itemId = [[entity objectForKey:@"entity_id"] integerValue];
        
        item.itemImageURL = [NSString stringWithFormat:@"%@",[[entity objectForKey:@"entity"] objectForKey:@"icon"]];
        item.itemTitle = [NSString stringWithFormat:@"%@",[[entity objectForKey:@"entity"] objectForKey:@"title"]];
        item.itemDescription = [NSString stringWithFormat:@"%@",[[entity objectForKey:@"entity"] objectForKey:@"text"]];
        [imgDownloader setItem:item];
        [imgDownloader startDownload];
        NSLog(@"%@",item.itemTitle);
        [items addObject:item];
	NSLog(@"%@ ",[[entity objectForKey:@"entity"] objectForKey:@"icon"]);
    }
	[jsonString release];  
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"ITEMS COUNT = %@",[items count]);
    return 23;//[items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 	static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
									   reuseIdentifier:CellIdentifier] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
        ItemModel *item = [items objectAtIndex:indexPath.row];
		cell.textLabel.text = item.itemTitle;
        cell.detailTextLabel.text = item.itemDescription;
        cell.imageView.image = item.itemImage;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [detail setItem:[items objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end
