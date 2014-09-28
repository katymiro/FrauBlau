//
//  Collections.h
//  FrauBlau
//
//  Created by Katy on 14/09/14.
//  Copyright (c) 2014 Katy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Collection : NSObject
@property (nonatomic, strong) NSString *collectionTitle;
@property (nonatomic, strong) NSString *collectionSubtitle;

-(void)parseResponse : (NSDictionary *)JSONString;
@end
