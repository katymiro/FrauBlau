//
//  ItemViewController.h
//  FrauBlau
//
//  Created by Katy on 10/08/14.
//  Copyright (c) 2014 Katy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import <FacebookSDK/FacebookSDK.h>


@interface ItemViewController : UIViewController <FBLoginViewDelegate>
{
    SLComposeViewController *mySLComposeSheet;

}
@property (weak, nonatomic) IBOutlet FBLoginView *loginView;


@property (weak, nonatomic) IBOutlet UIButton *PostToFacebbok;
- (IBAction)PostToFacebookPressed:(id)sender;







@property (weak, nonatomic) IBOutlet UIButton *shareButton;
- (IBAction)shareButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
- (IBAction)favoriteButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *tagButton;
- (IBAction)tagbuttonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *infoButton;
- (IBAction)infoButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *galleryButton;
- (IBAction)galleryButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
- (IBAction)homeButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *shareView;






@end
