//
//  ViewController.m
//  TigerMechineDemo
//
//  Created by jctmac on 17/2/16.
//  Copyright © 2017年 jctmac. All rights reserved.
//

#import "ViewController.h"
#import "Toast.h"
#import "MBProgressHUD.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()<AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *lightView;
@property (weak, nonatomic) IBOutlet UILabel *archiveLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
- (IBAction)topUpAction:(UIButton *)sender;
- (IBAction)converAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *img0;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UIImageView *img4;
@property (weak, nonatomic) IBOutlet UIImageView *img5;
@property (weak, nonatomic) IBOutlet UIImageView *img6;
@property (weak, nonatomic) IBOutlet UIImageView *img7;
@property (weak, nonatomic) IBOutlet UIImageView *img8;
@property (weak, nonatomic) IBOutlet UIImageView *img9;
@property (weak, nonatomic) IBOutlet UIImageView *img10;
@property (weak, nonatomic) IBOutlet UIImageView *img11;
@property (weak, nonatomic) IBOutlet UIImageView *img12;
@property (weak, nonatomic) IBOutlet UIImageView *img13;
@property (weak, nonatomic) IBOutlet UIImageView *img14;
@property (weak, nonatomic) IBOutlet UIImageView *img15;
@property (weak, nonatomic) IBOutlet UIImageView *img16;
@property (weak, nonatomic) IBOutlet UIImageView *img17;
@property (weak, nonatomic) IBOutlet UIImageView *img18;
@property (weak, nonatomic) IBOutlet UIImageView *img19;
@property (weak, nonatomic) IBOutlet UIImageView *img20;
@property (weak, nonatomic) IBOutlet UIImageView *img21;
@property (weak, nonatomic) IBOutlet UIImageView *img22;
@property (weak, nonatomic) IBOutlet UIImageView *img23;
@property (weak, nonatomic) IBOutlet UIImageView *img24;
@property (weak, nonatomic) IBOutlet UIImageView *img25;
@property (weak, nonatomic) IBOutlet UIImageView *img26;
@property (weak, nonatomic) IBOutlet UIImageView *img27;
@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UILabel *label0;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (nonatomic, assign)NSInteger currentNum0;
@property (nonatomic, assign)NSInteger currentNum1;
@property (nonatomic, assign)NSInteger currentNum2;
@property (nonatomic, assign)NSInteger currentNum3;
@property (nonatomic, assign)NSInteger currentNum4;
@property (nonatomic, assign)NSInteger currentNum5;
@property (nonatomic, assign)NSInteger currentNum6;
@property (nonatomic, assign)NSInteger currentNum7;
@property (nonatomic, assign)NSInteger currentNum8;
@property (nonatomic, assign)NSInteger currentIndex;
@property (nonatomic, assign)NSInteger currentArchive;
@property (nonatomic, assign)NSInteger currentLeft;
@property (nonatomic, strong)CADisplayLink *displayLink;
@property (nonatomic, strong)CADisplayLink *LightLink;
@property (nonatomic, assign)double delayInSeconds;
@property (nonatomic, assign)double currentTimes;
@property (nonatomic, strong)NSMutableArray *timeArr;
- (IBAction)beginAction:(UIButton *)sender;
@property (nonatomic, assign)NSInteger lastIndex;
@property (nonatomic, assign)NSInteger firstIndex;
@property (nonatomic, assign)BOOL isHightLight;
@property (nonatomic, assign)BOOL isFirstTime;
@property (nonatomic, assign)BOOL isFirstTimeCycle;
@property (nonatomic, assign)BOOL isCycleMusic;
@property (nonatomic, assign)BOOL isDrive;
@property (nonatomic, assign)BOOL isTrainHead;
@property (nonatomic, assign)BOOL isCannon;
@property (nonatomic, strong)NSMutableArray *currentIndexArr;
@property (nonatomic, strong)NSMutableArray *currentArchiveArr;
@property (nonatomic, strong)AVAudioPlayer *myPlayer;
@property (nonatomic, assign)BOOL isWager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isFirstTime =YES;
    [_btn0 addTarget:self action:@selector(wagerAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn1 addTarget:self action:@selector(wagerAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn2 addTarget:self action:@selector(wagerAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn3 addTarget:self action:@selector(wagerAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn4 addTarget:self action:@selector(wagerAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn5 addTarget:self action:@selector(wagerAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn6 addTarget:self action:@selector(wagerAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn7 addTarget:self action:@selector(wagerAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btn8 addTarget:self action:@selector(wagerAction:) forControlEvents:UIControlEventTouchUpInside];
    _currentLeft =100;
    _currentArchive =0;
    _currentIndex =0;
    _archiveLabel.attributedText =[self testZero];
    _leftLabel.attributedText =[self testAchiveScore:_currentLeft type:@"yes"];
    NSLog(@"%06ld\n",_currentArchive);
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeUI)];
    self.LightLink =[CADisplayLink displayLinkWithTarget:self selector:@selector(changeLight)];
    self.LightLink.frameInterval =30;
    self.LightLink.paused =NO;
    self.displayLink.paused = YES;
    self.displayLink.frameInterval =1;
    [self.LightLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)changeLight
{
    if (!_isCycleMusic) {
        [self lianxuPlayWithNamePath:@"background" isFirst:YES isCycle:@"mp3"];
        _isCycleMusic =YES;
    }
    _lightView.image =_isHightLight?[UIImage imageNamed:@"light1"]:[UIImage imageNamed:@"light2"];
    _isHightLight =!_isHightLight;
}

- (void)startAnimation{
//    self.beginTime = CACurrentMediaTime();
    self.LightLink.paused =YES;
    self.displayLink.paused = NO;
}

- (void)stopAnimation{
    self.displayLink.paused = YES;
    _isWager =NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(isNeedChangeStatus) object:nil];
    [self performSelector:@selector(isNeedChangeStatus) withObject:nil afterDelay:30];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        if (!_isCannon) {
//            if (!_isWager) {
//                _LightLink.paused =NO;
//                _isCycleMusic =NO;
//            }
//        }
//    });
}

-(void)isNeedChangeStatus
{
    if (!_isCannon) {
        if (!_isWager) {
            _LightLink.paused =NO;
            _isCycleMusic =NO;
        }
    }
}

-(NSMutableAttributedString*)testZero{
    float space =1.5;
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:@"000000" attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attStr length]-1)];
    //    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, attStr.length-1)];
    //将“测试”两字字体颜色设置为蓝色
    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.659 green:0.027 blue:0.000 alpha:1.000] range:NSMakeRange(0, 5)];
    //将“富文本”三个字字体颜色设置为红色
    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:1.000 green:0.863 blue:0.349 alpha:1.000] range:NSMakeRange(5, 1)];
    return attStr;
}

-(NSMutableAttributedString*)testAchiveScore:(NSInteger)score type:(NSString *)type{
    NSInteger Count =0;//用来计算位数
    NSInteger changeNum=score;
    while(changeNum)
    {
        changeNum = changeNum/10;
        Count++;
    }
    NSLog(@"%ld",Count);
    NSInteger currentRange =type?6-Count:2-Count;
    float space =1.5;
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:type?[NSString stringWithFormat:@"%06ld",score]:[NSString stringWithFormat:@"%02ld",score] attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    NSLog(@"%@ length=%ld",[NSString stringWithFormat:@"%06ld",score],attStr.length);
//     paragraphStyle.alignment = NSTextAlignmentCenter;
    [attStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attStr length]-1)];
//    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, attStr.length-1)];
    //将“测试”两字字体颜色设置为蓝色
    if (currentRange!=0) {
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.659 green:0.027 blue:0.000 alpha:1.000] range:NSMakeRange(0, currentRange)];
    }
    //将“富文本”三个字字体颜色设置为红色
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:1.000 green:0.863 blue:0.349 alpha:1.000] range:NSMakeRange(currentRange, Count)];
    return attStr;
}

- (IBAction)topUpAction:(UIButton *)sender {
    NSLog(@"充值");
}

- (IBAction)converAction:(UIButton *)sender {
    
}

- (IBAction)beginAction:(UIButton *)sender {
    if (_currentArchive>0||_isFirstTime) {
        _currentLeft =_currentLeft+_currentArchive;
        if (_currentLeft ==0) {
            _leftLabel.attributedText =[self testZero];
        }else{
            _leftLabel.attributedText =[self testAchiveScore:_currentLeft type:@"yes"];
        }
        _currentArchive =0;
        _archiveLabel.attributedText =[self testZero];
        if (_isFirstTime) {
            if(_currentNum0==0&&_currentNum1==0&&_currentNum2==0&&_currentNum3==0&&_currentNum4==0&&_currentNum5==0&&_currentNum6==0&&_currentNum7==0&&_currentNum8==0){
                [Toast makeText:self.view Message:@"您还没下注呢！！！" afterHideTime:1];
            }else{
                    _isFirstTime =NO;
                    _currentNum0=0;
                    _currentNum1=0;
                    _currentNum2=0;
                    _currentNum3 =0;
                    _currentNum4 =0;
                    _currentNum5 =0;
                    _currentNum6 =0;
                    _currentNum7 =0;
                    _currentNum8 =0;
                    _label0.text =@"00";
                    _label1.text =@"00";
                    _label2.text =@"00";
                    _label3.text =@"00";
                    _label4.text =@"00";
                    _label5.text =@"00";
                    _label6.text =@"00";
                    _label7.text =@"00";
                    _label8.text =@"00";
            }
        }
    }else{
        if(_currentNum0==0&&_currentNum1==0&&_currentNum2==0&&_currentNum3==0&&_currentNum4==0&&_currentNum5==0&&_currentNum6==0&&_currentNum7==0&&_currentNum8==0){
       [Toast makeText:self.view Message:@"您还没下注呢！！！" afterHideTime:1];
        }else{
            NSInteger adjustNum =28 -_currentIndex;
            [self getResultWithDrive:NO];
    NSArray *speedUpArr =@[@(1.2),@(1.1),@(1),@(0.9),@(0.8),@(0.7),@(0.6),@(0.5),@(0.4),@(0.3),@(0.2),@(0.1)];
    NSArray *slowDownArr =@[@(0.1),@(0.2),@(0.3),@(0.4),@(0.5),@(0.6),@(0.7),@(0.8),@(0.9),@(1),@(1.1),@(1.2),@(1.3),@(1.4)];
    NSMutableArray *sameSpeedArr =[NSMutableArray array];
    for (int y=0; y<_lastIndex+86+adjustNum; y++) {
        [sameSpeedArr addObject:@(0.05)];
    }
    sender.enabled =NO;
    _timeArr =[NSMutableArray array];
    [_timeArr addObjectsFromArray:speedUpArr];
    [_timeArr addObjectsFromArray:[sameSpeedArr mutableCopy]];
    [_timeArr addObjectsFromArray:slowDownArr];
    NSLog(@"lastIndex===%ld countArr ===%ld ",_lastIndex,_timeArr.count);
    _currentTimes=0;
    _btn0.userInteractionEnabled =NO;
    _btn1.userInteractionEnabled =NO;
    _btn2.userInteractionEnabled =NO;
    _btn3.userInteractionEnabled =NO;
    _btn4.userInteractionEnabled =NO;
    _btn5.userInteractionEnabled =NO;
    _btn6.userInteractionEnabled =NO;
    _btn7.userInteractionEnabled =NO;
    _btn8.userInteractionEnabled =NO;
            if (_isCannon) {
                for (NSString *index in _currentIndexArr) {
                    UIImageView *img =(id)[self.view viewWithTag:[index integerValue]+1000];
                    img.backgroundColor =[UIColor colorWithRed:0.961 green:0.655 blue:0.565 alpha:1.000];
                }
                _isCannon =NO;
            }
    [self startAnimation];
    }
    }
}

-(void)driveTrainAction
{
        //开火车
        [self lianxuPlayWithNamePath:@"drive" isFirst:YES isCycle:@"mp3"];
        [self getResultWithDrive:YES];
        _isDrive =YES;
        NSMutableArray *sameSpeedArr =[NSMutableArray array];
        for (int y=0; y<_lastIndex+84+18; y++) {
            [sameSpeedArr addObject:@(0.1)];
        }
        _timeArr =[NSMutableArray array];
        [_timeArr addObjectsFromArray:[sameSpeedArr mutableCopy]];
        NSLog(@"lastIndex===%ld countArr ===%ld ",_lastIndex,_timeArr.count);
        _currentTimes=0;
        [self startAnimation];
}

-(void)launchAction
{
    //打炮
    _currentIndexArr =[NSMutableArray array];
    _currentArchiveArr =[NSMutableArray array];
    NSInteger cannonNum =arc4random()%5+1;
    NSLog(@"cannonNum====%ld",cannonNum);
    for (int i=1; i<=cannonNum; i++) {
        NSInteger cannonIndex;
        if (i>1) {
        while ([_currentIndexArr containsObject:[NSString stringWithFormat:@"%ld",cannonIndex]]) {
            cannonIndex =[self getCannonNumIndex];
        }
        }else{
            cannonIndex =[self getCannonNumIndex];
        }
        switch (cannonIndex){
        case 0:
            if (_currentNum8>0) {
                _currentArchive =_currentArchive+_currentNum8*5;
            }
            break;
        case 1:
            if (_currentNum6>0) {
                _currentArchive =_currentArchive+_currentNum6*15;
            }
            break;
        case 2:
            if (_currentNum7) {
                _currentArchive =_currentArchive+_currentNum7*10;
            }
            break;
        case 3:
            if (_currentNum1>0) {
                _currentArchive =_currentArchive+_currentNum1*25;
            }
            break;
        case 4:
            if (_currentNum0>0) {
                _currentArchive =_currentArchive+_currentNum0*50;
            }
            break;
        case 5:
            if (_currentNum5>0) {
                _currentArchive =_currentArchive+_currentNum5*20;
            }
            break;
        case 6:
            if (_currentNum5>0) {
                _currentArchive =_currentArchive+_currentNum5*2;
            }
            break;
        case 7:
            if (_currentNum3>0) {
                _currentArchive =_currentArchive+_currentNum3*20;
            }
            break;
        case 8:
            if (_currentNum4>0) {
                _currentArchive =_currentArchive+_currentNum4*20;
            }
            break;
        case 9:
            if (_currentNum4>0) {
                _currentArchive =_currentArchive+_currentNum4*2;
            }
            break;
        case 11:
            if (_currentNum5>0) {
                _currentArchive =_currentArchive+_currentNum5*20;
            }
            break;
        case 12:
            if (_currentNum6>0) {
                _currentArchive =_currentArchive+_currentNum6*15;
            }
            break;
        case 13:
            if (_currentNum8>0) {
                _currentArchive =_currentArchive+_currentNum8*2;
            }
            break;
        case 14:
            if (_currentNum8>0) {
                _currentArchive =_currentArchive+_currentNum8*5;
            }
            break;
        case 15:
            if (_currentNum7>0) {
                _currentArchive =_currentArchive+_currentNum7*10;
            }
            break;
        case 16:
            if (_currentNum2>0) {
                _currentArchive =_currentArchive+_currentNum2*2;
            }
            break;
        case 17:
            if (_currentNum2>0) {
                _currentArchive =_currentArchive+_currentNum2*30;
            }
            break;
        case 18:
            if (_currentNum6>0) {
                _currentArchive =_currentArchive+_currentNum6*15;
            }
            break;
        case 19:
            if (_currentNum8>0) {
                _currentArchive =_currentArchive+_currentNum8*5;
            }
            break;
        case 20:
            if (_currentNum3>0) {
                _currentArchive =_currentArchive+_currentNum3*2;
            }
            break;
        case 21:
            if (_currentNum3>0) {
                _currentArchive =_currentArchive+_currentNum3*20;
            }
            break;
        case 22:
            if (_currentNum7>0) {
                _currentArchive =_currentArchive+_currentNum7*10;
            }
            break;
        case 23:
            if (_currentNum7>0) {
                _currentArchive =_currentArchive+_currentNum7*2;
            }
            break;
        case 24:
            if (_currentNum6>0) {
                _currentArchive =_currentArchive+_currentNum6*15;
            }
            break;
        case 26:
            if (_currentNum4>0) {
                _currentArchive =_currentArchive+_currentNum4*20;
            }
            break;
        case 27:
            if (_currentNum6>0) {
                _currentArchive =_currentArchive+_currentNum6*2;
            }
            break;
        default:
            break;
        }
        [_currentArchiveArr addObject:[NSString stringWithFormat:@"%ld",_currentArchive]];
        if (i==1) {
            dispatch_async(dispatch_get_main_queue(), ^{
            [self lianxuPlayWithNamePath:@"dapao" isFirst:YES isCycle:nil];
            UIImageView *img =[self.view viewWithTag:cannonIndex+1000];
            img.backgroundColor =[UIColor whiteColor];
            if ([_currentArchiveArr[0] integerValue]==0) {
                _archiveLabel.attributedText =[self testZero];
            }else{
                _archiveLabel.attributedText =[self testAchiveScore:[_currentArchiveArr[0] integerValue] type:@"yes"];
            }
                });
            if (cannonNum==1) {
                _isFirstTime =YES;
                _isFirstTimeCycle =NO;
                UIButton *button =(id)[self.view viewWithTag:100];
                button.enabled =YES;
                _btn0.userInteractionEnabled =YES;
                _btn1.userInteractionEnabled =YES;
                _btn2.userInteractionEnabled =YES;
                _btn3.userInteractionEnabled =YES;
                _btn4.userInteractionEnabled =YES;
                _btn5.userInteractionEnabled =YES;
                _btn6.userInteractionEnabled =YES;
                _btn7.userInteractionEnabled =YES;
                _btn8.userInteractionEnabled =YES;
                _isCannon =YES;
            }
        }else{
        double second =1.5*i;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self lianxuPlayWithNamePath:@"dapao" isFirst:YES isCycle:nil];
            UIImageView *img1 =[self.view viewWithTag:cannonIndex+1000];
            img1.backgroundColor =[UIColor whiteColor];
            if ([_currentArchiveArr[0] integerValue]==0) {
                _archiveLabel.attributedText =[self testZero];
            }else{
                _archiveLabel.attributedText =[self testAchiveScore:[_currentArchiveArr[i-1]integerValue] type:@"yes"];
            }
            if (i==cannonNum) {
                _isFirstTime =YES;
                _isFirstTimeCycle =NO;
                UIButton *button =(id)[self.view viewWithTag:100];
                button.enabled =YES;
                _btn0.userInteractionEnabled =YES;
                _btn1.userInteractionEnabled =YES;
                _btn2.userInteractionEnabled =YES;
                _btn3.userInteractionEnabled =YES;
                _btn4.userInteractionEnabled =YES;
                _btn5.userInteractionEnabled =YES;
                _btn6.userInteractionEnabled =YES;
                _btn7.userInteractionEnabled =YES;
                _btn8.userInteractionEnabled =YES;
                _isCannon =YES;
            }
            });
        }
        [_currentIndexArr addObject:[NSString stringWithFormat:@"%ld",cannonIndex]];
        NSLog(@"%@ Index=====%ld",_currentIndexArr,cannonIndex);
    }
}

-(NSInteger)getCannonNumIndex
{
    //调整打炮概率
    NSInteger changeNum =arc4random() %100;
    NSInteger lastIndex =0;
    if (changeNum>=0&&changeNum<10) {
        //10% 0到9
        NSArray *arr1 =@[@"3",@"4",@"27",@"6",@"9",@"13",@"16",@"20",@"23",@"0"];
        lastIndex =[arr1[changeNum%10] integerValue];
    }else if (changeNum>=10&&changeNum<30){
        //20% 100到299
        NSArray *arr2 =@[@"17",@"7",@"8",@"5",@"11",@"21",@"26",@"1",@"27",@"6",@"9",@"13",@"16",@"20",@"23",@"0",@"12",@"18",@"19",@"2"];
        lastIndex =[arr2[changeNum%20] integerValue];
    }else if (changeNum>=30&&changeNum<60){
        //30% 300到599
        NSArray *arr3 =@[@"0",@"2",@"15",@"22",@"24",@"27",@"6",@"9",@"13",@"16"];
        lastIndex =[arr3[changeNum%4] integerValue];
    }else if (changeNum>=60&&changeNum<100){
        //40% 600到999
        NSArray *arr4 =@[@"0",@"14",@"19",@"27",@"6",@"9",@"13",@"16",@"20",@"23"];
        lastIndex =[arr4[changeNum%10] integerValue];
    }
    return lastIndex;
}

-(void)getResultWithDrive:(BOOL)isDrive{
    //调整中奖概率
    NSInteger changeNum =arc4random() %1000;
    NSLog(@"changeNum=%ld",changeNum);
    if (changeNum>=0&&changeNum<100) {
        //10% 0到99
        NSArray *arr1 =isDrive?@[@"5",@"4",@"4",@"4",@"3",@"3",@"3",@"6",@"6",@"6",@"9",@"9",@"9",@"0",@"0",@"0",@"1",@"1",@"1",@"2",@"2",@"2",@"7",@"7",@"7",@"8",@"8",@"8",@"12",@"12"]:@[@"4",@"3",@"3",@"3",@"5",@"5",@"5",@"11",@"11",@"11",@"17",@"17",@"17",@"7",@"7",@"7",@"21",@"21",@"21",@"8",@"8",@"8",@"26",@"26",@"26",@"16",@"20",@"23",@"14",@"19"];
        _lastIndex =[arr1[changeNum%30] integerValue];
    }else if (changeNum>=100&&changeNum<300){
        //20% 100到299
        NSArray *arr2 =isDrive?@[@"13",@"13",@"14",@"14",@"15",@"15",@"16",@"16",@"17",@"17",@"18",@"18",@"16",@"19",@"20",@"20",@"21",@"21",@"22",@"23"]:@[@"0",@"1",@"2",@"23",@"12",@"15",@"18",@"22",@"24",@"24",@"14",@"27",@"6",@"9",@"9",@"13",@"19",@"16",@"19",@"23"];
        _lastIndex =[arr2[changeNum%20] integerValue];
    }else if (changeNum>=300&&changeNum<600){
        //30% 300到599
        NSArray *arr3 =isDrive?@[@"23",@"24",@"0",@"1"]:@[@"10",@"12",@"10",@"17"];
        _lastIndex =[arr3[changeNum%4] integerValue];
    }else if (changeNum>=600&&changeNum<1000){
        //40% 600到999
        NSArray *arr4 =isDrive?@[@"0",@"24",@"1",@"2",@"20",@"16",@"7",@"9",@"13",@"14"]:@[@"0",@"1",@"2",@"14",@"19",@"13",@"16",@"16",@"20",@"24"];
        _lastIndex =[arr4[changeNum%10] integerValue];
    }
//    _lastIndex =25;
    NSLog(@"lastIndex=%ld",_lastIndex);
}

-(void)changeUI{
    if (_timeArr.count ==0) {
        [self stopAnimation];
//        _currentIndex =_lastIndex;
//        _firstIndex =(_firstIndex+_lastIndex)%28;最后得到的下标数用来做概率运算
        NSLog(@"_currentIndex====%ld,first==%ld",_currentIndex,_firstIndex);
        NSInteger driveNum =0;
        _currentIndex =_currentIndex%28;
        switch (_currentIndex) {
            case 0:
                if (_isDrive) {
                    if (!(_currentNum8==0&&_currentNum6==0&&_currentNum4==0)){
                        _currentArchive =_currentArchive+_currentNum8*5+_currentNum6*2+_currentNum4*20;
                    }
                }else{
                    if (_currentNum8>0) {
                        _currentArchive =_currentArchive+_currentNum8*5;
                    }
                }
                break;
            case 1:
                if (_isDrive) {
                    if (!(_currentNum6==0&&_currentNum8==0)) {
                        _currentArchive =_currentArchive+_currentNum8*5+_currentNum6*17;
                    }
                }else{
                    if (_currentNum6>0) {
                        _currentArchive =_currentArchive+_currentNum6*15;
                    }
                }
                break;
            case 2:
                if (_isDrive) {
                    if (!(_currentNum7==0&&_currentNum6==0&&_currentNum8==0)) {
                        _currentArchive =_currentArchive+_currentNum8*5+_currentNum7*10+_currentNum6*15;
                    }
                }else{
                    if (_currentNum7) {
                        _currentArchive =_currentArchive+_currentNum7*10;
                    }
                }
                break;
            case 3:
                if (_isDrive>0) {
                    if (!(_currentNum1==0&&_currentNum7==0&&_currentNum6==0)) {
                        _currentArchive =_currentArchive+_currentNum1*25+_currentNum7*10+_currentNum6*15;
                    }
                }else{
                    if (_currentNum1>0) {
                        _currentArchive =_currentArchive+_currentNum1*25;
                    }
                }
                break;
            case 4:
                if (_isDrive) {
                    if (!(_currentNum1==0&&_currentNum7==0&&_currentNum0==0)) {
                        _currentArchive =_currentArchive+_currentNum1*25+_currentNum7*10+_currentNum0*50;
                    }
                }else{
                if (_currentNum0>0) {
                    _currentArchive =_currentArchive+_currentNum0*50;
                    }
                }
                break;
            case 5:
                if (_isDrive) {
                    if (!(_currentNum1==0&&_currentNum5==0&&_currentNum0==0)) {
                        _currentArchive =_currentArchive+_currentNum1*25+_currentNum5*20+_currentNum0*50;
                    }
                }else{
                if (_currentNum5>0) {
                    _currentArchive =_currentArchive+_currentNum5*20;
                    }
                }
                break;
            case 6:
                if (_isDrive) {
                    if (!(_currentNum5==0&&_currentNum0==0)) {
                        _currentArchive =_currentArchive+_currentNum5*22+_currentNum0*50;
                    }
                }else{
                if (_currentNum5>0) {
                    _currentArchive =_currentArchive+_currentNum5*2;
                    }
                }
                break;
            case 7:
                if (_isDrive) {
                    if (!(_currentNum5==0&&_currentNum3==0)) {
                        _currentArchive =_currentArchive+_currentNum5*22+_currentNum3*20;
                    }
                }else{
                if (_currentNum3>0) {
                    _currentArchive =_currentArchive+_currentNum3*20;
                    }
                }
                break;
            case 8:
                if (_isDrive) {
                    if (!(_currentNum5==0&&_currentNum3==0&&_currentNum4==0)) {
                        _currentArchive =_currentArchive+_currentNum5*2+_currentNum3*20+_currentNum4*20;
                    }
                }else{
                if (_currentNum4>0) {
                    _currentArchive =_currentArchive+_currentNum4*20;
                    }
                }
                break;
            case 9:
                if (_isDrive) {
                    if (!(_currentNum3==0&&_currentNum4==0)) {
                        _currentArchive =_currentArchive+_currentNum3*20+_currentNum4*22;
                    }
                }else{
                if (_currentNum4>0) {
                    _currentArchive =_currentArchive+_currentNum4*2;
                    }
                }
                break;
            case 10:
                driveNum =arc4random()%10+1;
                NSLog(@"VR9 dirveNum=%ld",driveNum);
                if (driveNum>7) {
                    //30%开火车
                    [self driveTrainAction];
                    return ;
                }else if (driveNum>4&&driveNum<=7){
                    //30%打炮
                    [self launchAction];
                    return ;
                }
                break;
            case 11:
                if (_currentNum5>0) {
                    _currentArchive =_currentArchive+_currentNum5*20;
                }
                break;
            case 12:
                if (_currentNum6>0) {
                    _currentArchive =_currentArchive+_currentNum6*15;
                }
                break;
            case 13:
                if (_isDrive) {
                    if (!(_currentNum5==0&&_currentNum6==0&&_currentNum8==0)) {
                        _currentArchive =_currentArchive+_currentNum5*20+_currentNum6*15+_currentNum8*2;
                    }
                }else{
                if (_currentNum8>0) {
                    _currentArchive =_currentArchive+_currentNum8*2;
                    }
                }
                break;
            case 14:
                if (_isDrive) {
                    if (!(_currentNum6==0&&_currentNum8==0)) {
                        _currentArchive =_currentArchive+_currentNum6*15+_currentNum8*7;
                    }
                }else{
                if (_currentNum8>0) {
                    _currentArchive =_currentArchive+_currentNum8*5;
                    }
                }
                break;
            case 15:
                if (_isDrive) {
                    if (!(_currentNum7==0&&_currentNum8==0)) {
                        _currentArchive =_currentArchive+_currentNum7*10+_currentNum8*7;
                    }
                }else{
                if (_currentNum7>0) {
                    _currentArchive =_currentArchive+_currentNum7*10;
                    }
                }
                break;
            case 16:
                if (_isDrive) {
                    if (!(_currentNum7==0&&_currentNum8==0&&_currentNum2==0)) {
                        _currentArchive =_currentArchive+_currentNum7*10+_currentNum8*5+_currentNum2*2;
                    }
                }else{
                if (_currentNum2>0) {
                    _currentArchive =_currentArchive+_currentNum2*2;
                    }
                }
                break;
            case 17:
                if (_isDrive) {
                    if (!(_currentNum7==0&&_currentNum2==0)) {
                        _currentArchive =_currentArchive+_currentNum7*10+_currentNum2*32;
                    }
                }else{
                if (_currentNum2>0) {
                    _currentArchive =_currentArchive+_currentNum2*30;
                    }
                }
                break;
            case 18:
                if (_isDrive) {
                    if (!(_currentNum6==0&&_currentNum2==0)) {
                        _currentArchive =_currentArchive+_currentNum6*15+_currentNum2*32;
                    }
                }else{
                if (_currentNum6>0) {
                    _currentArchive =_currentArchive+_currentNum6*15;
                    }
                }
                break;
            case 19:
                if (_isDrive) {
                    if (!(_currentNum6==0&&_currentNum2==0&&_currentNum8==0)) {
                        _currentArchive =_currentArchive+_currentNum6*15+_currentNum2*30+_currentNum8*5;
                    }
                }else{
                if (_currentNum8>0) {
                    _currentArchive =_currentArchive+_currentNum8*5;
                    }
                }
                break;
            case 20:
                if (_isDrive) {
                    if (!(_currentNum6==0&&_currentNum3==0&&_currentNum8==0)) {
                        _currentArchive =_currentArchive+_currentNum6*15+_currentNum3*2+_currentNum8*5;
                    }
                }else{
                if (_currentNum3>0) {
                    _currentArchive =_currentArchive+_currentNum3*2;
                    }
                }
                break;
            case 21:
                if (_isDrive) {
                    if (!(_currentNum3==0&&_currentNum8==0)) {
                        _currentArchive =_currentArchive+_currentNum3*22+_currentNum8*5;
                    }
                }else{
                if (_currentNum3>0) {
                    _currentArchive =_currentArchive+_currentNum3*20;
                    }
                }
                break;
            case 22:
                if (_isDrive) {
                    if (!(_currentNum3==0&&_currentNum7==0)) {
                        _currentArchive =_currentArchive+_currentNum3*22+_currentNum7*10;
                    }
                }else{
                if (_currentNum7>0) {
                    _currentArchive =_currentArchive+_currentNum7*10;
                    }
                }
                break;
            case 23:
                if (_isDrive) {
                    if (!(_currentNum3==0&&_currentNum7==0)) {
                        _currentArchive =_currentArchive+_currentNum3*20+_currentNum7*12;
                    }
                }else{
                if (_currentNum7>0) {
                    _currentArchive =_currentArchive+_currentNum7*2;
                    }
                }
                break;
            case 24:
                if (_isDrive) {
                    if (!(_currentNum6==0&&_currentNum7==0)) {
                        _currentArchive =_currentArchive+_currentNum6*15+_currentNum7*12;
                    }
                }else{
                if (_currentNum6>0) {
                    _currentArchive =_currentArchive+_currentNum6*15;
                    }
                }
                break;
            case 25:
                driveNum =arc4random()%10;
                NSLog(@"VR9 dirveNum=%ld",driveNum);
                if (driveNum>7) {
                    //30%开火车
                    [self driveTrainAction];
                    return ;
                }else if (driveNum>4&&driveNum<=7){
                    //30%打炮
                    [self launchAction];
                    return ;
                }
                break;
            case 26:
                if (_currentNum4>0) {
                    _currentArchive =_currentArchive+_currentNum4*20;
                }
                break;
            case 27:
                if (_currentNum6>0) {
                    _currentArchive =_currentArchive+_currentNum6*2;
                }
                break;
            default:
                
                break;
        }
        if (driveNum<8) {
        _isTrainHead =_isDrive?YES:NO;
        _isFirstTime =YES;
        _isFirstTimeCycle =NO;
        _isDrive =NO;
        UIButton *button =(id)[self.view viewWithTag:100];
        button.enabled =YES;
        _btn0.userInteractionEnabled =YES;
        _btn1.userInteractionEnabled =YES;
        _btn2.userInteractionEnabled =YES;
        _btn3.userInteractionEnabled =YES;
        _btn4.userInteractionEnabled =YES;
        _btn5.userInteractionEnabled =YES;
        _btn6.userInteractionEnabled =YES;
        _btn7.userInteractionEnabled =YES;
        _btn8.userInteractionEnabled =YES;
        if (_currentArchive ==0) {
            _archiveLabel.attributedText =[self testZero];
        }else{
            _archiveLabel.attributedText =[self testAchiveScore:_currentArchive type:@"yes"];
        }
            __weak __typeof__(self) weakSelf = self;
            //        _myPlayer.currentTime = 0;  //当前播放时间设置为0
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.12 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (driveNum ==0) {
                 [weakSelf lianxuPlayWithNamePath:@"youxigundong" isFirst:YES isCycle:nil];
                }else{
                    [weakSelf lianxuPlayWithNamePath:@"meiyouzhongjiang" isFirst:YES isCycle:nil];
                }
            });
        [_myPlayer stop];
        _myPlayer =nil;
        return;
        }
    }
    _currentTimes =_currentTimes+0.05;
    _delayInSeconds = [[_timeArr firstObject] doubleValue];
    NSString *currentTime =[self getOneDigitfractionalWithNum:_currentTimes];
    NSString *delaySecond =[self getOneDigitfractionalWithNum:_delayInSeconds];
    if ([currentTime isEqualToString:delaySecond]) {
        if (_isDrive) {
            
        }else{
            if ([currentTime isEqualToString:@"0.05"]) {
                if (!_isFirstTimeCycle) {
                    _isFirstTimeCycle =YES;
                    [self lianxuPlayWithNamePath:@"youxigundong2"  isFirst:YES isCycle:nil];
                }
            }
        else{
            [self lianxuPlayWithNamePath:@"youxigundong0"  isFirst:YES isCycle:nil];
        }
        }
        _lightView.image =_isHightLight?[UIImage imageNamed:@"light1"]:[UIImage imageNamed:@"light2"];
        _isHightLight =!_isHightLight;
        _currentTimes=0;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (_isDrive) {
                _currentIndex=_currentIndex%28;
                UIImageView *img1 =[self.view viewWithTag:(_currentIndex-2+28)%28+1000];
                UIImageView *img2 =[self.view viewWithTag:(_currentIndex-1+28)%28+1000];
                UIImageView *img3 =[self.view viewWithTag:_currentIndex+1000];
                UIImageView *img4 =[self.view viewWithTag:(_currentIndex+1)%28+1000];
                img1.backgroundColor =[UIColor colorWithRed:0.961 green:0.655 blue:0.565 alpha:1.000];
                img2.backgroundColor =[UIColor whiteColor];
                img3.backgroundColor =[UIColor whiteColor];
                img4.backgroundColor =[UIColor whiteColor];
                _currentIndex++;
            }else{
                if (_isTrainHead) {
                    _currentIndex=_currentIndex%28;
                    UIImageView *img1 =[self.view viewWithTag:(_currentIndex-2+28)%28+1000];
                    UIImageView *img2 =[self.view viewWithTag:(_currentIndex-1+28)%28+1000];
                    UIImageView *img3 =[self.view viewWithTag:_currentIndex+1000];
                    UIImageView *img4 =[self.view viewWithTag:(_currentIndex+1)%28+1000];
                    img1.backgroundColor =[UIColor colorWithRed:0.961 green:0.655 blue:0.565 alpha:1.000];
                    img2.backgroundColor =[UIColor colorWithRed:0.961 green:0.655 blue:0.565 alpha:1.000];
                    img3.backgroundColor =[UIColor colorWithRed:0.961 green:0.655 blue:0.565 alpha:1.000];
                    img4.backgroundColor =[UIColor whiteColor];
                    _currentIndex++;
                    _isTrainHead =NO;
                }else{
            _currentIndex=_currentIndex%28;
            UIImageView *currentImg =[self.view viewWithTag:_currentIndex+1000];
            UIImageView *nextImg =[self.view viewWithTag:(_currentIndex+1)%28+1000];
            currentImg.backgroundColor =[UIColor colorWithRed:0.961 green:0.655 blue:0.565 alpha:1.000];
            nextImg.backgroundColor =[UIColor whiteColor];
            _currentIndex++;
                }
            }
        });
         [_timeArr removeObjectAtIndex:0];
    }
}

//保留两位小数
-(NSString *)getOneDigitfractionalWithNum:(double)num{
    return [NSString stringWithFormat:@"%.2f",num];
}

-(void)wagerAction:(UIButton *)sender
{
    if(_currentLeft==0){
        if (_isFirstTime) {
            _label0.text =@"00";
            _label1.text =@"00";
            _label2.text =@"00";
            _label3.text =@"00";
            _label4.text =@"00";
            _label5.text =@"00";
            _label6.text =@"00";
            _label7.text =@"00";
            _label8.text =@"00";
            _currentNum0=0;
            _currentNum1=0;
            _currentNum2=0;
            _currentNum3 =0;
            _currentNum4 =0;
            _currentNum5 =0;
            _currentNum6 =0;
            _currentNum7 =0;
            _currentNum8 =0;
            if (_currentArchive>0) {
                _currentLeft =_currentArchive;
                _leftLabel.attributedText =[self testAchiveScore:_currentLeft type:@"yes"];
                _currentArchive =0;
                _archiveLabel.attributedText =[self testZero];
            }
//            [Toast makeText:self.view Message:@"积分为零" afterHideTime:1];
        }
    }else{
        if (_isFirstTime&&!(_currentNum0==0&&_currentNum1==0&&_currentNum2==0&&_currentNum3==0&&_currentNum4==0&&_currentNum5==0&&_currentNum6==0&&_currentNum7==0&&_currentNum8==0)) {
            _currentNum0=0;
            _currentNum1=0;
            _currentNum2=0;
            _currentNum3 =0;
            _currentNum4 =0;
            _currentNum5 =0;
            _currentNum6 =0;
            _currentNum7 =0;
            _currentNum8 =0;
            _label0.text =@"00";
            _label1.text =@"00";
            _label2.text =@"00";
            _label3.text =@"00";
            _label4.text =@"00";
            _label5.text =@"00";
            _label6.text =@"00";
            _label7.text =@"00";
            _label8.text =@"00";
            _archiveLabel.attributedText =[self testZero];
            _currentLeft =_currentLeft+_currentArchive;
            _currentArchive =0;
            _archiveLabel.attributedText =[self testZero];
            _leftLabel.attributedText =[self testAchiveScore:_currentLeft type:@"yes"];
            _isFirstTime =NO;
        }else{
            if (_currentNum0==0&&_currentNum1==0&&_currentNum2==0&&_currentNum3==0&&_currentNum4==0&&_currentNum5==0&&_currentNum6==0&&_currentNum7==0&&_currentNum8==0) {
                _LightLink.paused =YES;
            }
            if (_isFirstTime) {
                _isFirstTime =NO;
            }
    switch (sender.tag) {
        case 100:
            if (_currentNum0==99) {
                [Toast makeText:self.view Message:@"最高下注99哦！！" afterHideTime:1];
                return ;
            }else{
            _currentNum0++;
            _label0.text =[NSString stringWithFormat:@"%02ld",_currentNum0];
            }
            break;
        case 101:
            if (_currentNum1==99) {
                [Toast makeText:self.view Message:@"最高下注99哦！！" afterHideTime:1];
                return ;
            }else{
            _currentNum1++;
            _label1.text =[NSString stringWithFormat:@"%02ld",_currentNum1];
            }
            break;
        case 102:
            if (_currentNum2==99) {
                [Toast makeText:self.view Message:@"最高下注99哦！！" afterHideTime:1];
                return ;
            }else{
            _currentNum2++;
            _label2.text =[NSString stringWithFormat:@"%02ld",_currentNum2];
            }
            break;
        case 103:
            if (_currentNum3==99) {
                [Toast makeText:self.view Message:@"最高下注99哦！！" afterHideTime:1];
                return ;
            }else{
            _currentNum3++;
            _label3.text =[NSString stringWithFormat:@"%02ld",_currentNum3];
            }
            break;
        case 104:
            if (_currentNum4==99) {
                [Toast makeText:self.view Message:@"最高下注99哦！！" afterHideTime:1];
                return ;
            }else{
            _currentNum4++;
            _label4.text =[NSString stringWithFormat:@"%02ld",_currentNum4];
            }
            break;
        case 105:
            if (_currentNum5==99) {
                [Toast makeText:self.view Message:@"最高下注99哦！！" afterHideTime:1];
                return ;
            }else{
            _currentNum5++;
                _label5.text =[NSString stringWithFormat:@"%02ld",_currentNum5];
            }
            break;
        case 106:
            if (_currentNum6==99) {
                [Toast makeText:self.view Message:@"最高下注99哦！！" afterHideTime:1];
                return ;
            }else{
            _currentNum6++;
                _label6.text =[NSString stringWithFormat:@"%02ld",_currentNum6];
            }
            break;
        case 107:
            if (_currentNum7==99) {
                [Toast makeText:self.view Message:@"最高下注99哦！！" afterHideTime:1];
                return ;
            }else{
            _currentNum7++;
                _label7.text =[NSString stringWithFormat:@"%02ld",_currentNum7];
            }
            break;
        case 108:
            if (_currentNum8==99) {
                [Toast makeText:self.view Message:@"最高下注99哦！！" afterHideTime:1];
                return ;
            }else{
            _currentNum8++;
                _label8.text =[NSString stringWithFormat:@"%02ld",_currentNum8];
            }
            break;
        default:
            break;
    }
            _isWager =YES;
            _currentLeft--;
            if (_currentLeft ==0) {
                _leftLabel.attributedText =[self testZero];
            }else{
                _leftLabel.attributedText =[self testAchiveScore:_currentLeft type:@"yes"];
            }
            [self lianxuPlayWithNamePath:@"xiabi" isFirst:YES isCycle:nil];
        }
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [self.LightLink invalidate];
    self.LightLink =nil;
    [self.displayLink invalidate];
    self.displayLink = nil;
    _myPlayer =nil;
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer*)player successfully:(BOOL)flag{
    //播放结束时执行的动作
    [_myPlayer pause];
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer*)player error:(NSError *)error{
    //解码错误执行的动作
}

- (void)audioPlayerBeginInteruption:(AVAudioPlayer*)player{
    //处理中断的代码
}

- (void)audioPlayerEndInteruption:(AVAudioPlayer*)player{
    //处理中断结束的代码
}

-(void)dealloc
{
    _myPlayer.delegate =nil;
}

-(void)lianxuPlayWithNamePath:(NSString *)path  isFirst:(BOOL)isFirst isCycle:(NSString *)iscycle
{
    if (isFirst) {
    NSError *err=nil;
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [session setActive:YES error:nil];
    _myPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:path ofType:iscycle?iscycle:@"wav"]] error:&err];
    _myPlayer.delegate = self;
    _myPlayer.volume =1.0;
        if (iscycle) {
            _myPlayer.numberOfLoops =-1;
        }else{
            _myPlayer.numberOfLoops =0;
        }
    [_myPlayer prepareToPlay];
    if (err!=nil) {
        NSLog(@"move player init error:%@",err);
    }else {
        _myPlayer.volume =0.8;
        [self.myPlayer play];
    }
        }
            }

@end
