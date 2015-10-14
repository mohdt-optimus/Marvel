//
//  TableViewController.m
//  MarvelApp
//
//  Created by optimusmac-12 on 06/10/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
{
    NSMutableArray *charcName;
}

@end

@implementation TableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;\
    
    charcName=[[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [charcName count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [charcName objectAtIndex:indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)fetch:(id)sender {
    
    //[charcName removeAllObjects];
    self.tableView.hidden=NO;
    _view1.hidden=YES;
    int a=[self getCharacter];
    NSLog(@"%d",a);
    [self.tableView reloadData];
}


-(int) getCharacter
{
    
    NSString *url = [NSString stringWithFormat:@"http://gateway.marvel.com/v1/public/characters?&ts=1&apikey=a92eafe527dc1ec2b6072de72b23906c&hash=7784caef6f216dfcd56422fd42bf8f46"];
    
    //Creating url for fetching character name
    NSURL *marvelRequestUrl=[NSURL URLWithString:url];
    
    // fetching results of the URL.
    NSData *data=[NSData dataWithContentsOfURL:marvelRequestUrl];
    NSError *error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:data
                          
                          options:kNilOptions
                          error:&error];
    
    //data about Characters is obtained in NSDictionary
    NSDictionary *data1 = [json objectForKey:@"data"];
    NSArray *res=[data1 objectForKey:@"results"];
    for(int i=0; i<[res count];i++){
        NSDictionary *comics=[res objectAtIndex:i];
        [charcName addObject:[comics objectForKey:@"name"]];
    }
    NSLog(@"%@",charcName);
    return (int)[charcName count];
}
@end
