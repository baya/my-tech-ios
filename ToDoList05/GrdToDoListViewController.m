//
//  GrdToDoListViewController.m
//  ToDoList05
//
//  Created by jiangguimin on 14-2-20.
//  Copyright (c) 2014年 ground. All rights reserved.
//

#import "GrdToDoListViewController.h"
#import "GrdToDoItemViewController.h"
#import "GrdToDoItem.h"

@interface GrdToDoListViewController ()
@property NSMutableArray *toDoItemList;
@end

@implementation GrdToDoListViewController

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
    GrdToDoItem *item01 = [[GrdToDoItem alloc] init];
    item01.name = @"刷牙";
    
    GrdToDoItem *item02 = [[GrdToDoItem alloc] init];
    item02.name = @"早餐";
    
    self.toDoItemList = [[NSMutableArray alloc] init];
    [self.toDoItemList addObject:item01];
    [self.toDoItemList addObject:item02];
    
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
    
    // Return the number of rows in the section.
    return [self.toDoItemList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"toDoItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    GrdToDoItem *toDoItem = [self.toDoItemList objectAtIndex:indexPath.row];
    
    // Configure the cell...
    cell.textLabel.text = toDoItem.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    GrdToDoItem *toDoItem = [self.toDoItemList objectAtIndex:indexPath.row];
    
    toDoItem.checked = !toDoItem.checked;
    if(toDoItem.checked){
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

- (IBAction)cancelUnwindSegueCbk:(UIStoryboardSegue *)segue
{
}

- (IBAction)doneUnwindSegueCbk:(UIStoryboardSegue *)segue
{
    NSString *itemName = [segue.sourceViewController toDoItemField].text;
    itemName = [itemName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ];
    if ([itemName length] > 0) {
        GrdToDoItem* item = [[GrdToDoItem alloc] init];
        [self.toDoItemList addObject:item];
        item.name = itemName;
    }

    [self.tableView reloadData];
}

@end
