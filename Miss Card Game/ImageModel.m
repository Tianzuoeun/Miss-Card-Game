//
//  ImageModel.m
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

#import "ImageModel.h"

@implementation ImageModel
@synthesize imageNames = _imageNames;
+(ImageModel*)shareInstance{
    static ImageModel* _shareInstance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        _shareInstance = [[ImageModel alloc] init];
    } );
    
    return  _shareInstance;
    
}


-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[@"1"];
    
    
    return _imageNames;
}
-(UIImage*)getImageWithName:(NSString*)name{
    UIImage* image = nil;
    image =[UIImage imageNamed:name];
    return image;
}
@end
