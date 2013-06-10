//
//  NKVolumeButtons.h
//
//  Created by Nikita Kolmogorov on 10.06.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

typedef void (^ButtonBlock)();

#import <Foundation/Foundation.h>

@interface NKVolumeButtons : NSObject

@property (nonatomic, copy) ButtonBlock upBlock;
@property (nonatomic, copy) ButtonBlock downBlock;

@end
