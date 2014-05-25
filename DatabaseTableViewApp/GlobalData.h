//
//  GlobalData.h
//  DatabaseTableViewApp
//
//  Created by Pranay Rungta on 5/24/14.
//  Copyright (c) 2014 hackuci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalData : NSObject
{
    NSString *username;
}

@property(nonatomic,retain)NSString *username;
+(GlobalData*)getInstance;

@end
