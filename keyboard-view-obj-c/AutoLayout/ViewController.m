//
//  ViewController.m
//  AutoLayout
//
//  Created by MH-Soft on 2022/03/08.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mTitle.delegate = self;
    mContents.delegate = self;
    mSelect.delegate  = self;
    // Do any additional setup after loading the view.
    m_arrSubject = [NSMutableArray arrayWithCapacity:5];
    
    [m_arrSubject addObject:@"-- 선택 --"];
    [m_arrSubject addObject:@"국어"];
    [m_arrSubject addObject:@"영어"];
    [m_arrSubject addObject:@"수학"];
    [m_arrSubject addObject:@"기타"];
    
    mTextField = nil;
    
}

#pragma mark-  pickerView Delegates And datasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return m_arrSubject.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return m_arrSubject[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *pickedSubject = m_arrSubject[row];
    mSelect.text = pickedSubject;
    NSLog(@"PickerView:%@", pickedSubject);


}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [[event allTouches] anyObject];

    [self.view endEditing:YES];
//    if(mTextField == nil)
//    {
//        NSLog(@"mTextField nil");
//        return;
//    }
//
//    if ([mTextField isFirstResponder] && [touch view] != mTextField)
//    {
//        NSLog(@"touchesBegan in");
//
//        [mTextField resignFirstResponder];
//    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];

}

- (void) viewWillTransitionToSize:(CGSize)size
        withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    
    if (UIDeviceOrientationIsPortrait(deviceOrientation)) {
        NSLog(@"UIDevicePortrait");
    }
}

- (void)keyboardShow:(NSNotification*) noti
{
//
//    CGRect frame = self.view.frame;
//    frame.origin.y = mContents.frame.origin.y * -1.0f;
//    self.view.frame = frame;
//
    CGRect bound = self.view.bounds;
    bound.origin.y = mContents.frame.origin.y * +1.0f;
    self.view.bounds = bound;
}

- (void)keyboardHide:(NSNotification*) noti
{
//    CGRect frame = self.view.frame;
//    frame.origin.y = 0;
//    self.view.frame = frame;
    CGRect frame = self.view.bounds;
    frame.origin.y = 0;
    self.view.bounds = frame;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (bool)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == mTitle)
    {
        [mTitle resignFirstResponder];
        return YES;
    }
    NSLog(@"textField");
    return NO;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
   NSLog(@"textFieldDidBeginEditing");
    
    /*
    if(m_texFocusField != nil)
    {
        if(g_Debug) NSLog(@"textFieldDidBeginEditing out");
        
        return ;
    }
    */
    
    mTextField = textField;
    mfKeyboardY = self.view.frame.origin.y;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
   NSLog(@"textFieldDidEndEditing");
    
    /*
    if(m_texFocusField != nil)
    {
        if(g_Debug) NSLog(@"textFieldDidBeginEditing out");
        
        return ;
    }
    */
    
    mfKeyboardY = self.view.frame.origin.y;
    [self.view setFrame:CGRectMake( self.view.frame.origin.x, 0.0f,
                                   self.view.frame.size.width, self.view.frame.size.height)];
}

@end
