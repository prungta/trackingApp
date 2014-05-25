//
//  GlobalData.m
//  DatabaseTableViewApp
//
//  Created by Pranay Rungta on 5/24/14.
//  Copyright (c) 2014 hackuci. All rights reserved.
//

#import "GlobalData.h"

@implementation GlobalData

@synthesize username;

static GlobalData *instance = nil;

-(id) init
{
     self = [super init];
     if(self)
    {
        
        username = nil;

    }
    return self;

    
}

+(GlobalData *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [GlobalData new];
        }
    }
    return instance;
}

@end
