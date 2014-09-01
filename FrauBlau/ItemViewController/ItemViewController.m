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
    _shareView.alpha = 0.0;
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];

    //mainImage
    NSLog(@"Before");
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session
      dataTaskWithURL:[NSURL URLWithString: @"http://www.walsonrockabilly.com/images/Polka_Dot_Dresses/Red_Vintage_1950s_Pinup_Polka_Dot_Swing_Dress.jpg"]
      completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                            NSLog(@"Got response %@ with error %@.\n", response, error);
          self.mainImage.image = [UIImage imageWithData:data];
          NSLog(@"After");
      }];
    [task resume];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    NSLog(@"user - %@", user.name);
    
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

- (IBAction)favoriteButtonPressed:(id)sender{
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
        NSLog(@"Present the share dialog");
    } else {

        // Put together the dialog parameters
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       @"Sharing Tutorial", @"name",
                                       @"Build great social apps and get more installs.", @"caption",
                                       @"Allow your users to share stories on Facebook from your app using the iOS SDK.", @"description",
                                       @"https://developers.facebook.com/docs/ios/share/", @"link",
                                       @"http://i.imgur.com/g3Qc1HN.png", @"picture",
                                       nil];
        //NSLog(NSString *format, ...)
        
        // Show the feed dialog
        [FBWebDialogs presentFeedDialogModallyWithSession:nil
                                               parameters:params
                                                  handler:^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
                                                      if (error) {
                                                          // An error occurred, we need to handle the error
                                                          // See: https://developers.facebook.com/docs/ios/errors
                                                          NSLog(@"Error publishing story: %@", error.description);
                                                      } else {
                                                          if (result == FBWebDialogResultDialogNotCompleted) {
                                                              // User cancelled.
                                                              NSLog(@"User cancelled.");
                                                          } else {
                                                              // Handle the publish feed callback
                                                              NSDictionary *urlParams = [self parseURLParams:[resultURL query]];
                                                              
                                                              if (![urlParams valueForKey:@"post_id"]) {
                                                                  // User cancelled.
                                                                  NSLog(@"User cancelled.");
                                                                  
                                                              } else {
                                                                  // User clicked the Share button
                                                                  NSString *result = [NSString stringWithFormat: @"Posted story, id: %@", [urlParams valueForKey:@"post_id"]];
                                                                  NSLog(@"result %@", result);
                                                              }
                                                          }
                                                      }
                                                  }];
    }
    
//    mySLComposeSheet= [[SLComposeViewController alloc]init];
//    mySLComposeSheet= [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
//    [mySLComposeSheet setInitialText:@"I'm in love with this dress!!!"];
//    [self presentViewController:mySLComposeSheet animated:YES completion:NULL];
}
    

// A function for parsing URL parameters returned by the Feed Dialog.
- (NSDictionary*)parseURLParams:(NSString *)query {
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val =
        [kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        params[kv[0]] = val;
    }
    return params;
}

@end
