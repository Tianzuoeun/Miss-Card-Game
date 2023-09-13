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
@synthesize PlayerNum = _PlayerNum;
@synthesize Explaination = _Explaination;
@synthesize History =_History;
@synthesize NewBestPlayer =_NewBestPlayer;

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

-(NSNumber*) PlayerNum{
    if (!_PlayerNum){
        _PlayerNum =@3;
    }
    return _PlayerNum;
}

//ImageName
-(NSArray*) ImageName{
    if(!_ImageName){
        _ImageName = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13"];
    }
    return _ImageName;
}


//Explaination
-(NSArray*) Explaination{
    if(!_Explaination){
        _Explaination = Nil;
    }
    return _Explaination;
}

//NumQuantity
-(NSArray*) NumQuantity{
    if(!_NumQuantity){
        _NumQuantity = Nil;
    } return _NumQuantity;
}



//NewBestPlayer
- (NSString *)NewBestPlayer{
    if(!_NewBestPlayer){
        _NewBestPlayer = Nil;
    } return _NewBestPlayer;
}


//History
-(NSMutableArray*) History{
    if(!_History){
        _History = [[NSMutableArray alloc] initWithObjects:  nil];
    }return _History;
}





@end
