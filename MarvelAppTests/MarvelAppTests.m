//
//  MarvelAppTests.m
//  MarvelAppTests
//
//  Created by optimusmac-12 on 05/10/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TableViewController.h"

@interface MarvelAppTests : XCTestCase

@property (nonatomic,strong) TableViewController *controller;
@end

@implementation MarvelAppTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.controller = [storyboard instantiateViewControllerWithIdentifier:@"tableController"];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.controller=nil;
    [super tearDown];
}

-(void)testTableViewLoads
{
    XCTAssertNotNil(self.controller.tableView, @"TableView not initiated properly");
}

-(void)testGetCharacterNotNill
{
    XCTAssertEqual([self.controller getCharacter],0, @"No Data fetched");
}


- (void)testViewConformsToUITableViewDataSource
{
    XCTAssertTrue([self.controller conformsToProtocol:@protocol(UITableViewDataSource) ], @"View does not conform to UITableView datasource protocol");
    
}

- (void)testTableViewDataSource
{
    XCTAssertNotNil(self.controller.tableView.dataSource, @"Table datasource cannot be nil");
}

- (void)testToCheckConformWithDelegates
{
    XCTAssertTrue([self.controller conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

- (void)testPerformanceGetCharacter {
    // This is an example of a performance test case.
    [self measureBlock:^{
        [self.controller getCharacter];
    }];
}

@end
