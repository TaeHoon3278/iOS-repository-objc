//
//  ViewController.h
//  AutoLayout
//
//  Created by MH-Soft on 2022/03/08.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
{
    
    __weak IBOutlet UITextField *mTitle;
    
    __weak IBOutlet UITextView *mContents;
    __weak IBOutlet UITextField *mSelect;
    
    NSMutableArray *m_arrSubject;
    UITextField *mTextField;
    CGFloat mfKeyboardY;
    __weak IBOutlet NSLayoutConstraint *mBottomConstraint;
    
}
@end

