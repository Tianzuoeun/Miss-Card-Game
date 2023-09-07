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
@property (strong,nonatomic) NSArray* imageNames;


@end

NS_ASSUME_NONNULL_END
