//
//  ViewController.m
//  ColorsHelper
//
//  Created by Si on 2018/6/11.
//  Copyright © 2018年 Si. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+ColorWithString.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *colorView;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)Click:(UIButton *)sender {
    
    if (self.textField.text.length > 0 && [self.textField.text containsString:@"#"]) {
        self.colorView.backgroundColor = [UIColor colorWithHexString:self.textField.text];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
