//
//  DataPass.h
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataPass : NSObject
+(DataPass*)shareInstance;
@property (strong,nonatomic) NSNumber* SwitchNum;
@property (strong,nonatomic) NSNumber* PicNum;

// property for the random num

@property (strong,nonatomic) NSArray* ImageName;
@property (strong,nonatomic) NSArray* Explaination;
@property (strong,nonatomic) NSArray* NumQuantity;
@property (strong,nonatomic) NSArray* History;
@end

NS_ASSUME_NONNULL_END
