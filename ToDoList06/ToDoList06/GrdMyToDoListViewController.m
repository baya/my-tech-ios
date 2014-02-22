//
//  GrdMyToDoListViewController.m
//  ToDoList06
//
//  Created by jiangguimin on 14-2-22.
//  Copyright (c) 2014年 ground. All rights reserved.
//

#import "GrdMyToDoListViewController.h"
#import "GrdToDoItem.h"
#import "GrdMyToDoItemViewController.h"

@interface GrdMyToDoListViewController ()
@property NSMutableArray *toDoItems;
@end

@implementation GrdMyToDoListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    GrdToDoItem *item = [[GrdToDoItem alloc] init];
    item.itemName = @"早饭";
    
    GrdToDoItem *item2 = [[GrdToDoItem alloc] init];
    item2.itemName = @"中午饭";
    
    NSMutableArray *toDoItems = [[NSMutableArray alloc] init];
    self.toDoItems = toDoItems;
    [self.toDoItems addObject:item];
    [self.toDoItems addObject:item2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"toDoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    GrdToDoItem *item = [self.toDoItems objectAtIndex:indexPath.row];

    cell.textLabel.text = item.itemName;
    if (item.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    GrdToDoItem *item = [self.toDoItems objectAtIndex:indexPath.row];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    item.completed = !item.completed;
    if(item.completed){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
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
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (IBAction)cancelUnwind:(UIStoryboardSegue *)segue
{
}

- (IBAction)doneUnwind:(UIStoryboardSegue *)segue
{
    NSString *itemName = [segue.sourceViewController toDoItemField].text;
    itemName = [itemName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([itemName length] > 0){
        GrdToDoItem *item = [[GrdToDoItem alloc] init];
        item.itemName = itemName;
        [self.toDoItems addObject:item];
    }
    
    [self.tableView reloadData];
}

@end
