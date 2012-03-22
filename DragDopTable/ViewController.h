//
//  ViewController.h
//  DragDopTable
//
//  Created by Anton Golub on 20.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *_list;
}

@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
