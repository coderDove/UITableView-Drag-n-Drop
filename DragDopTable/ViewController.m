//
//  ViewController.m
//  DragDopTable
//
//  Created by Anton Golub on 20.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (Private)
- (IBAction) editButtonAction:(id)sender;
@end

@implementation ViewController
@synthesize tableView = _tableView;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _list = nil;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_list release];
    _list = [[NSMutableArray alloc]initWithObjects:@"1", @"test", @"10", @"eleven", @"dove", @"123", @"note", @"iOS", @"book", @"2", @"button", @"controller", @"temp", @"life", @"sun", nil];
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Tap to edit" style:UIBarButtonItemStyleBordered target:self action:@selector(editButtonAction:)];
    self.navigationItem.rightBarButtonItem = editButton;
    [editButton release];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction) editButtonAction:(id)sender{
    [_tableView setEditing:!_tableView.editing animated:YES];
    
    if (_tableView.editing) {
        [self.navigationItem.rightBarButtonItem setTitle:@"Edit mode"];
    } else {
        [self.navigationItem.rightBarButtonItem setTitle:@"Tap to edit"];
    }
}

#pragma mark - Table view data source
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_list count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"DragCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
        cell.showsReorderControl = YES;
    }
    
    cell.textLabel.text = [_list objectAtIndex:indexPath.row];
    
    return  cell;
}

- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}

- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {

    NSInteger sourceRow = sourceIndexPath.row;
    NSInteger destRow = destinationIndexPath.row;
    id object = [_list objectAtIndex:sourceRow];
    
    [_list removeObjectAtIndex:sourceRow];
    [_list insertObject:object atIndex:destRow];

}

- (void) dealloc {
    [_list release];
    
    [_tableView release];
    [super dealloc];
}

@end
