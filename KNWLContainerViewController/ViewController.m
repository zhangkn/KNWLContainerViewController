//
//  ViewController.m
//  KNWLContainerViewController
//
//  Created by devzkn on 18/08/2017.
//  Copyright © 2017 KN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    
    
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    WLContainerViewController *vc = [[WLContainerViewController alloc]initWithfirstvc:[[KNtestViewController1ViewController alloc]init] secondvc:[[KNtestViewController1ViewController2 alloc]init]];
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:nvc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
