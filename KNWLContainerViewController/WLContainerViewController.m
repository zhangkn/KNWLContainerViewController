
//

//

#import "WLContainerViewController.h"


@interface WLContainerViewController ()



/**
  记录当前显示的控制器的类型
 
 
 */
@property (assign,nonatomic) WLContainerViewControllerType vctype;
@property (nonatomic,assign) BOOL hasLiked;



@end

@implementation WLContainerViewController


- (instancetype)initWithfirstvc:(UIViewController*)first  secondvc :(UIViewController*)second{
    self = [super init];
    if (self) {////既然nil解析成NO，所以没有必要在条件语句比较。不要拿某样东西直接与YES比较，因为YES被定义为1
        // ...
        
        if (first) {
            _first = first;
        }
        
        if (second) {
            _second = second;
        }
        
        
    }
    return self;
}


- (void)setVctype:(WLContainerViewControllerType )vctype{
    _vctype = vctype;
    

    switch (vctype) {
        case WLContainerViewControllerTypeFirst:
        {
            self.navigationItem.rightBarButtonItem.title = _second.title;
            
            self.title = _first.title;
            
            //,告知parentViewController切换
            
            [self cycleFromViewController:_second toViewController:_first];


        }
            break;
            
        case WLContainerViewControllerTypeSecond:
        {
            self.navigationItem.rightBarButtonItem.title = _first.title;
            self.title = _second.title;
            
            [self cycleFromViewController:_first toViewController:_second];

            
        }
            break;
    }
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)reg{
    
    if (self.hasLiked  == NO) {
        return;
    }
    
    self.hasLiked = NO;
    self.vctype = !self.vctype;
    
  
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    [self displayContentController:_first];
    self.title = _first.title;
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:_second.title style:UIBarButtonItemStylePlain target:self action:@selector(reg)];
    self.hasLiked = YES;
    
    
}


- (void) displayContentController: (UIViewController*) content {
    //the addChildViewController: method calls the child’s willMoveToParentViewController:
    [self addChildViewController:content];
    content.view.frame = self.view.bounds;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (void) hideContentController: (UIViewController*) content {
    [content willMoveToParentViewController:nil];
    [content.view removeFromSuperview];
    //The removeFromParentViewController method also calls the child’s didMoveToParentViewController: method, passing that method a value of nil.
    [content removeFromParentViewController];
}
#pragma mark --      [self transitionFromViewController:oldVC toViewController:newVC duration:0.1 options:UIViewAnimationOptionLayoutSubviews animations:^{//报错原因  用户点击的时间间隔《 动画持续时间， 因此动画持续时间可以设置小一点，例如0.1


- (void)cycleFromViewController: (UIViewController*) oldVC
               toViewController: (UIViewController*) newVC {
    // Prepare the two view controllers for the change.
    [oldVC willMoveToParentViewController:nil];
    [self addChildViewController:newVC];
    // Get the start frame of the new view controller and the end frame
    // for the old view controller. Both rectangles are offscreen.
    //设置newVC的frame
    CGRect rect = self.view.bounds;
    rect.origin.x += CGRectGetWidth(self.view.bounds);
    newVC.view.frame = rect;
    //获取oldVC的frame
    CGRect endFrame = oldVC.view.bounds;
    endFrame.origin.x -= CGRectGetWidth(self.view.bounds);
    //动画转场
    __weak WLContainerViewController *weakSelf = self;

    [self transitionFromViewController:oldVC toViewController:newVC duration:0.7 options:UIViewAnimationOptionLayoutSubviews animations:^{
        // Animate the views to their final positions.
        newVC.view.frame = oldVC.view.frame;
        oldVC.view.frame = endFrame;
    } completion:^(BOOL finished) {
        // Remove the old view controller and send the final
        // notification to the new view controller.
        [oldVC removeFromParentViewController];
        [newVC didMoveToParentViewController:self];
        weakSelf.hasLiked = YES;
    }];
}



@end
