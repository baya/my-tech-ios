//
//  GrdToDoItem.m
//  ToDoList4
//
//  Created by jiangguimin on 14-1-12.
//  Copyright (c) 2014年 jiangguimin. All rights reserved.
//

#import "GrdToDoItem.h"

@implementation GrdToDoItem

- (id)init
{
    self = [super init];
    
    if(self){
        self.completed = NO;
    }
    
    return self;
}

@end
