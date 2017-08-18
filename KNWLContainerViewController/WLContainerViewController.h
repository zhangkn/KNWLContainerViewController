//

#import <UIKit/UIKit.h>



typedef enum
{
    /** login  */
    WLContainerViewControllerTypeFirst   = 0,
    /** reg   */
    WLContainerViewControllerTypeSecond    = 1,
    
} WLContainerViewControllerType;

@interface WLContainerViewController : UIViewController


- (instancetype)initWithfirstvc:(UIViewController*)first  secondvc :(UIViewController*)second;

@property (strong,nonatomic) UIViewController *first;
@property (strong,nonatomic) UIViewController *second;

//展现controller
- (void) displayContentController: (UIViewController*) content;
//隐藏controller
- (void) hideContentController: (UIViewController*) content;
//页面切换
- (void)cycleFromViewController: (UIViewController*) oldVC
               toViewController: (UIViewController*) newVC;
@end
