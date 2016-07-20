//
//  LZMomentsListtViewModel.m
//  LZEasemob
//
//  Created by nacker on 16/3/14.
//  Copyright © 2016年 帶頭二哥 QQ:648959. All rights reserved.
//

#import "LZMomentsListViewModel.h"
#import "LZMomentsViewModel.h"
#import "LZMoments.h"

@implementation LZMomentsListViewModel

#pragma mark - 懒加载属性
- (NSMutableArray *)statusList {
    if (_statusList == nil) {
        _statusList = [[NSMutableArray alloc] init];
    }
    return _statusList;
}

- (void)loadStatusWithCount:(NSInteger)count Completed:(void (^)(BOOL isSuccessed))completed
{
    NSArray *iconImageNamesArray = @[@"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg",
                                     @"icon4.jpg",
                                     ];
    
    NSArray *namesArray = @[@"马云",
                            @"马化腾",
                            @"乔布斯",
                            @"雷军",
                            @"柳传志",
                            @"王江民",
                            @"丁磊",
                            @"鲍岳桥",
                            @"李彦宏",
                            @"张朝阳",
                            ];
    
    NSArray *textArray = @[@"1.此版本是有史以来Github上最牛逼的高仿微信项目没有之一,采用MVVM和MVC两种开发架构思想,纯代码开发,这是你们在培训机构学不到的.仅供大家学习使用,不得用于商业用途.最终解释权归作者二哥所有.",
                           @"https://github.com/nacker",
                           @"2.如果各位下客能帮我点STAR,半个月STAR500+,我会陆陆续续发布待实现功能其实已经做完,一个月STAR1000+我会把微信主要功能全部实现发布出来,两个月STAR2000+我会发布纯Swift版,纯Swift版采用纯代码开发已经做的差不多了.就看大伙的手能不能点STAR了.希望大家不要下完就跑了.作为作者的二哥会很心痛的.",
                           @"2.如果各位下客能帮我点STAR,半个月STAR500+,我会陆陆续续发布待实现功能其实已经做完,一个月STAR1000+我会把微信主要功能全部实现发布出来,两个月STAR2000+我会发布纯Swift版,纯Swift版采用纯代码开发已经做的差不多了.就看大伙的手能不能点STAR了.希望大家不要下完就跑了.作为作者的二哥会很心痛的.",
                           @"3.我之前接触过很多项目,就有一个项目中的朋友圈整个控制器4千行,尼玛4千行了这项目怎么迭代,二哥现在300行解决了朋友圈的问题,还在优化中..."
                           ];
    
    NSArray *commentsArray = @[@"社会主义好！👌👌👌👌",
                               @"帮二哥点STAR。。。",
                               @"你好，我好，大家好才是真的好",
                               @"有意思",
                               @"你瞅啥？",
                               @"瞅你咋地？？？！！！",
                               @"hello，看我",
                               @"曾经在幽幽暗暗反反复复中追问，才知道平平淡淡从从容容才是真，再回首恍然如梦，再回首我心依旧，只有那不变的长路伴着我",
                               @"帮二哥点STAR",
                               @"咯咯哒",
                               @"呵呵~~~~~~~~",
                               @"我勒个去，啥世道啊",
                               @"真有意思啊你"];
    
    NSArray *picImageNamesArray = @[ @"http://7xjtvh.com1.z0.glb.clouddn.com/browse01.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse02.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse03.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse04.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse05.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse06.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse07.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse08.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse09.jpg"
                                     ];
    
    NSMutableArray *arrayM = [NSMutableArray array];
                              
    for (int i = 0; i < count; i++) {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
        
        LZMoments *model = [[LZMoments alloc] init];
        model.iconName = iconImageNamesArray[iconRandomIndex];
        model.name = namesArray[nameRandomIndex];
        model.msgContent = textArray[contentRandomIndex];
//        model.msgContent = @"";
        
        
        // 模拟“随机图片”
        int random = arc4random_uniform(10);
        
        NSMutableArray *temp = [NSMutableArray new];
        for (int i = 0; i < random; i++) {
            int randomIndex = arc4random_uniform(9);
            [temp addObject:picImageNamesArray[randomIndex]];
        }
        if (temp.count) {
            model.picNamesArray = [temp copy];
        }
        
        
        // 点赞
        int likeItemsRandom = arc4random_uniform(10);
        NSMutableArray *tempLikeItems = [NSMutableArray new];
        for (int i = 0; i < likeItemsRandom; i++) {
            LZMomentsCellLikeItemModel *likeModel = [[LZMomentsCellLikeItemModel alloc] init];
            likeModel.userId = @"666";
            likeModel.userName = namesArray[i];
            [tempLikeItems addObject:likeModel];
        }
        model.likeItemsArray = [tempLikeItems copy];
        
        // 回复
        int commentRandom = arc4random_uniform(6);
        NSMutableArray *tempComments = [NSMutableArray new];
        for (int i = 0; i < commentRandom; i++) {
            LZMomentsCellCommentItemModel *commentItemModel = [LZMomentsCellCommentItemModel new];
            int index = arc4random_uniform((int)namesArray.count);
            commentItemModel.firstUserName = namesArray[index];
            commentItemModel.firstUserId = @"666";
            if (arc4random_uniform(10) < 5) {
                commentItemModel.secondUserName = namesArray[arc4random_uniform((int)namesArray.count)];
                commentItemModel.secondUserId = @"888";
            }
            commentItemModel.commentString = commentsArray[arc4random_uniform((int)commentsArray.count)];
            [tempComments addObject:commentItemModel];
        }
        model.commentItemsArray = [tempComments copy];
        
        LZMomentsViewModel *momentsViewModel = [LZMomentsViewModel viewModelWithStatus:model];
        [arrayM addObject:momentsViewModel];
        
//        KLog(@"%@",arrayM);
    }
    
    [self.statusList addObjectsFromArray:arrayM];
    
//    KLog(@"%@",self.statusList);
    
    completed(YES);
}

- (void)loadMoreStatusWithCount:(NSInteger)count Completed:(void (^)(BOOL isSuccessed))completed
{
    NSArray *iconImageNamesArray = @[@"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg",
                                     @"icon4.jpg",
                                     ];
    
    NSArray *namesArray = @[@"马云",
                            @"马化腾",
                            @"乔布斯",
                            @"雷军",
                            @"柳传志",
                            @"王江民",
                            @"丁磊",
                            @"鲍岳桥",
                            @"李彦宏",
                            @"张朝阳",
                            ];
    
    NSArray *textArray = @[@"1.此版本是有史以来Github上最牛逼的高仿微信项目没有之一,采用MVVM和MVC两种开发架构思想,纯代码开发,这是你们在培训机构学不到的.仅供大家学习使用,不得用于商业用途.最终解释权归作者二哥所有.",
                           @"https://github.com/nacker",
                           @"2.如果各位下客能帮我点STAR,半个月STAR500+,我会陆陆续续发布待实现功能其实已经做完,一个月STAR1000+我会把微信主要功能全部实现发布出来,两个月STAR2000+我会发布纯Swift版,纯Swift版采用纯代码开发已经做的差不多了.就看大伙的手能不能点STAR了.希望大家不要下完就跑了.作为作者的二哥会很心痛的.",
                           @"2.如果各位下客能帮我点STAR,半个月STAR500+,我会陆陆续续发布待实现功能其实已经做完,一个月STAR1000+我会把微信主要功能全部实现发布出来,两个月STAR2000+我会发布纯Swift版,纯Swift版采用纯代码开发已经做的差不多了.就看大伙的手能不能点STAR了.希望大家不要下完就跑了.作为作者的二哥会很心痛的.",
                           @"3.我之前接触过很多项目,就有一个项目中的朋友圈整个控制器4千行,尼玛4千行了这项目怎么迭代,二哥现在300行解决了朋友圈的问题,还在优化中..."
                           ];
    
    NSArray *commentsArray = @[@"社会主义好！👌👌👌👌",
                               @"帮二哥点STAR。。。",
                               @"你好，我好，大家好才是真的好",
                               @"有意思",
                               @"你瞅啥？",
                               @"瞅你咋地？？？！！！",
                               @"hello，看我",
                               @"曾经在幽幽暗暗反反复复中追问，才知道平平淡淡从从容容才是真，再回首恍然如梦，再回首我心依旧，只有那不变的长路伴着我",
                               @"帮二哥点STAR",
                               @"咯咯哒",
                               @"呵呵~~~~~~~~",
                               @"我勒个去，啥世道啊",
                               @"真有意思啊你"];
    
    NSArray *picImageNamesArray = @[ @"http://7xjtvh.com1.z0.glb.clouddn.com/browse01.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse02.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse03.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse04.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse05.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse06.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse07.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse08.jpg",
                                     @"http://7xjtvh.com1.z0.glb.clouddn.com/browse09.jpg"
                                     ];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < count; i++) {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
        
        LZMoments *model = [[LZMoments alloc] init];
        model.iconName = iconImageNamesArray[iconRandomIndex];
        model.name = namesArray[nameRandomIndex];
        model.msgContent = textArray[contentRandomIndex];
        //        model.msgContent = @"";
        
        
        // 模拟“随机图片”
        int random = arc4random_uniform(10);
        
        NSMutableArray *temp = [NSMutableArray new];
        for (int i = 0; i < random; i++) {
            int randomIndex = arc4random_uniform(9);
            [temp addObject:picImageNamesArray[randomIndex]];
        }
        if (temp.count) {
            model.picNamesArray = [temp copy];
        }
        
        // 点赞
        int likeItemsRandom = arc4random_uniform(10);
        NSMutableArray *tempLikeItems = [NSMutableArray new];
        for (int i = 0; i < likeItemsRandom; i++) {
            LZMomentsCellLikeItemModel *likeModel = [[LZMomentsCellLikeItemModel alloc] init];
            likeModel.userId = @"666";
            likeModel.userName = namesArray[i];
            [tempLikeItems addObject:likeModel];
        }
        model.likeItemsArray = [tempLikeItems copy];
        
        // 回复
        int commentRandom = arc4random_uniform(6);
        NSMutableArray *tempComments = [NSMutableArray new];
        for (int i = 0; i < commentRandom; i++) {
            LZMomentsCellCommentItemModel *commentItemModel = [LZMomentsCellCommentItemModel new];
            int index = arc4random_uniform((int)namesArray.count);
            commentItemModel.firstUserName = namesArray[index];
            commentItemModel.firstUserId = @"666";
            if (arc4random_uniform(10) < 5) {
                commentItemModel.secondUserName = namesArray[arc4random_uniform((int)namesArray.count)];
                commentItemModel.secondUserId = @"888";
            }
            commentItemModel.commentString = commentsArray[arc4random_uniform((int)commentsArray.count)];
            [tempComments addObject:commentItemModel];
        }
        model.commentItemsArray = [tempComments copy];

        
        LZMomentsViewModel *momentsViewModel = [LZMomentsViewModel viewModelWithStatus:model];
        [arrayM addObject:momentsViewModel];
        
        //        KLog(@"%@",arrayM);
    }
    
    [self.statusList addObjectsFromArray:arrayM];
    
    //    KLog(@"%@",self.statusList);
    
    completed(YES);
}
@end
