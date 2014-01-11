//
//  GrdToDoItem.h
//  ToDoList03
//
//  Created by jiangguimin on 14-1-11.
//  Copyright (c) 2014年 jiangguimin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GrdToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
