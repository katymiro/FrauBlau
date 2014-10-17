//
//  Collections.m
//  FrauBlau
//
//  Created by Katy on 14/09/14.
//  Copyright (c) 2014 Katy. All rights reserved.
//

#import "Collection.h"

@implementation Collection

-(void)parseResponse:(NSDictionary *)JSONString
{
    self.collectionTitle = [JSONString objectForKey:@"collectionTitle"];
    self.collectionSubtitle = [JSONString objectForKey:@"collectionSubtitle"];
//    self.collectionImage = [JSONString objectForKey:@"collectionImage"];
}

-(NSString *)description{
        return [NSString stringWithFormat:@"Collection %@, %@ ",self.collectionTitle,self.collectionSubtitle];
}

@end
