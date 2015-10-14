//
//  TableViewController.h
//  MarvelApp
//
//  Created by optimusmac-12 on 06/10/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate>
- (IBAction)fetch:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *view1;
-(int) getCharacter;
@end
