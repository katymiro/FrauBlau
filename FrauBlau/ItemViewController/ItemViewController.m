//
//  ItemViewController.m
//  FrauBlau
//
//  Created by Katy on 10/08/14.
//  Copyright (c) 2014 Katy. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _shareView.alpha=0.0;
    
    self.loginView.readPermissions=@[@"public_profile", @"email", @"user_friends"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    NSLog(@"user", user.name);
    
}


-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    NSLog(@"You are logged in");
    
}
-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    NSLog(@"You are logged out");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)shareButtonPressed:(id)sender {
    NSLog(@"katy pressed shareButtonPressed");
    self.shareButton.backgroundColor = [UIColor yellowColor];
    [UIView animateWithDuration:2.0 animations:^{
    _shareView.alpha=0.5;
    }];
    
   
    
}

- (IBAction)FacebookButtonPressed:(id)sender {
}

-(IBAction)PostToFacebook:(id)sender;
    
    {
    
    
    
    mySLComposeSheet= [[SLComposeViewController alloc]init];
    mySLComposeSheet= [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [mySLComposeSheet setInitialText:@"I'm in love with this dress!!!"];
   [self presentViewController:mySLComposeSheet animated:YES completion:NULL];
    
    
    
}


    
    

     - (IBAction)favoriteButtonPressed:(id)sender
{
    NSLog(@"katy pressed favoriteButtonPressed");
    self.favoriteButton.backgroundColor=[UIColor yellowColor];
}
- (IBAction)tagbuttonPressed:(id)sender {
    NSLog(@"katy pressed tagButton");
    self.tagButton.backgroundColor=[UIColor yellowColor];
    
}
- (IBAction)infoButtonPressed:(id)sender {
    NSLog(@"katy pressed infoButton");
    self.infoButton.hidden = YES;//backgroundColor=[UIColor yellowColor];
}
- (IBAction)galleryButtonPressed:(id)sender {
    NSLog(@"katy pressed galleryButton");
    self.galleryButton.backgroundColor=[UIColor yellowColor];
}
- (IBAction)homeButtonPressed:(id)sender {
    NSLog(@"katy pressed homeButton");
    self.homeButton.backgroundColor=[UIColor yellowColor];


}
- (IBAction)PostToFacebookPressed:(id)sender {
    
    // Check if the Facebook app is installed and we can present the share dialog
    FBLinkShareParams *params = [[FBLinkShareParams alloc] init];
    params.link = [NSURL URLWithString:@"https://developers.facebook.com/docs/ios/share/"];
    
    // If the Facebook app is installed and we can present the share dialog
    if ([FBDialogs canPresentShareDialogWithParams:params]) {
        // Present the share dialog
    } else {
        // Present the feed dialog
    }

    
    mySLComposeSheet= [[SLComposeViewController alloc]init];
    mySLComposeSheet= [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [mySLComposeSheet setInitialText:@"I'm in love with this dress!!!"];
    [self presentViewController:mySLComposeSheet animated:YES completion:NULL];
}

     

     
@end

