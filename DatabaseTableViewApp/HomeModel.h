//
//  HomeModel.h
//  DatabaseTableViewApp
//
//  Created by Pranay Rungta on 5/24/14.
//  Copyright (c) 2014 hackuci. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface HomeModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<HomeModelProtocol> delegate;

- (void)downloadItems;

@end
