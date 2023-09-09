//
//  DataPass.m
//  Miss Card Game
//
//  Created by howardshan on 9/7/23.
//

#import "DataPass.h"
@interface DataPass ()
@end

@implementation DataPass
@synthesize ImageName = _ImageName;
@synthesize NumQuantity = _NumQuantity;
@synthesize Explaination = _Explaination;
@synthesize History =_History;

+(DataPass*)shareInstance{
    static DataPass* _shareInstance = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        _shareInstance = [[DataPass alloc] init];
    } );
    
    return  _shareInstance;
    
}


-(NSNumber*) SwitchNum{
    if (!_SwitchNum) {
        _SwitchNum = @1;
    }
    return _SwitchNum;
}
    
-(NSNumber*) PicNum{
    if (!_PicNum){
        _PicNum =@1;
    }
    return _PicNum;
}



//ImageName
-(NSArray*) ImageName{
    if(!_ImageName){
        _ImageName = @[@"1",@"2",@"3"];
    }
    return _ImageName;
}


//Explaination
-(NSArray*) Explaination{
    if(!_Explaination){
        _Explaination = @[@"Point one to Drink",@"Drink a cup and then say 'Thanks boos'",@"You have the rights to go to restroom"];
    }
    return _Explaination;
}

//NumQuantity
-(NSArray*) NumQuantity{
    if(!_NumQuantity){
        _NumQuantity = @[@4,@4,@4];
    } return _NumQuantity;
}

//History
-(NSArray*) History{
    if(!_History){
        _History = @[@"Genius"];
    }return _History;
}
@end
