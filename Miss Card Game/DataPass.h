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

@end

NS_ASSUME_NONNULL_END
