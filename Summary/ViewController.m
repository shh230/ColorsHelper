//
//  ViewController.m
//  Summary
//
//  Created by Si on 2018/7/27.
//  Copyright © 2018年 Si. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+ColorWithString.h"
#import "UIImage+Resize.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;
@property (weak, nonatomic) IBOutlet UITextField *alphaTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"IMG_1085.JPG"];
    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    NSLog(@"图片的大小%ldkb",imageData.length/1024);
    image = [image scaleImageToKb:500];
    
}

- (IBAction)click:(UIButton *)sender {
    if (self.colorTextField.text.length > 0 && [self.colorTextField.text containsString:@"#"]) {
        sender.backgroundColor = [UIColor colorWithHexString:self.colorTextField.text];
    }
    if (self.colorTextField.text.length > 0 && [self.colorTextField.text containsString:@"#"] && self.alphaTextField.text.length > 0) {
        sender.backgroundColor = [UIColor colorWithHexString:self.colorTextField.text alpha:[self.alphaTextField.text floatValue]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
