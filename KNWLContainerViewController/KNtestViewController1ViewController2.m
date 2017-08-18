//
//  KNtestViewController1ViewController2.m
//  KNWLContainerViewController
//
//  Created by devzkn on 18/08/2017.
//  Copyright © 2017 KN. All rights reserved.
//

#import "KNtestViewController1ViewController2.h"

@interface KNtestViewController1ViewController2 ()

@end

@implementation KNtestViewController1ViewController2

- (instancetype)init {
    self = [super init];
    if (self) {////既然nil解析成NO，所以没有必要在条件语句比较。不要拿某样东西直接与YES比较，因为YES被定义为1
        // ...
        
        self.title= @"vc2";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
