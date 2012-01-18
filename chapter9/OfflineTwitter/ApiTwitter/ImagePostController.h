//
//  ImagePostController.h
//  ApiTwitter
//
//  Created by tikitikipoo on 11/11/23.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSTwitPicEngine.h"

@interface ImagePostController : UIViewController 
<
UINavigationControllerDelegate, 
UIImagePickerControllerDelegate, 
GSTwitPicEngineDelegate
> 
{
    UIButton *twitterButton;
    UIImage *savedImage;
    GSTwitPicEngine *twitpicEngine;
}

@end
