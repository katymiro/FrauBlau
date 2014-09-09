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

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet FBLoginView *loginView;
@property (weak, nonatomic) IBOutlet UIButton *PostToFacebbok;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIButton *tagButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (weak, nonatomic) IBOutlet UIButton *galleryButton;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIView *shareView;

- (IBAction)PostToFacebookPressed:(id)sender;
- (IBAction)shareButtonPressed:(id)sender;
- (IBAction)favoriteButtonPressed:(id)sender;
- (IBAction)tagbuttonPressed:(id)sender;
- (IBAction)infoButtonPressed:(id)sender;
- (IBAction)galleryButtonPressed:(id)sender;
- (IBAction)homeButtonPressed:(id)sender;

@end
