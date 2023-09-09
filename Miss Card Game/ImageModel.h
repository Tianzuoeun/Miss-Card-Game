//
//  ImageModel.h
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ImageModel : NSObject

+(ImageModel*)shareInstance;
-(UIImage*)getImageWithName:(NSString*)name;
-(UIImage*)getImageWithFunName:(NSString*)funName;

@property (strong,nonatomic) NSArray* imageNames;
@property (strong,nonatomic) NSArray* cameraImageNames;

@end

NS_ASSUME_NONNULL_END
