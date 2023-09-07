//
//  DataPass.m
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

#import "DataPass.h"

@implementation DataPass
@synthesize SwitchNum;
@synthesize PicNum;


+(DataPass*)shareInstance{
    static DataPass* _shareInstance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        _shareInstance = [[DataPass alloc] init];
    } );
    
    return  _shareInstance;
    
}


-(NSNumber*) SwitchNum{
    if (!SwitchNum) {
        SwitchNum = @1;
    }
    return SwitchNum;
}
    
-(NSNumber*) PicNum{
    if (!PicNum){
        PicNum =@1;
    }
    return PicNum;
}


@end
