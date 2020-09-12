#import <Cephei/HBPreferences.h>

@interface SBSApplicationShortcutItem : NSObject
@property (nonatomic, retain) NSString *type;
@property (nonatomic, copy) NSString * localizedTitle;
@end

/*
@interface SBIconImageView : NSObject
@property (nonatomic, assign) BOOL *jittering;
@end
*/

//Preferences Variables
BOOL enableSwitch;
BOOL jitter;

%hook SBIconView

- (void)setApplicationShortcutItems:(NSArray *)itemsArray {
    
    for (SBSApplicationShortcutItem *item in itemsArray) {
        
        if (enableSwitch && [item.type isEqual:@"com.apple.springboardhome.application-shotcut-item.rearrange-icons"]) {
            
            item.localizedTitle = @"Jiggle Mode";
            
        }
        
    }
    
    %orig(itemsArray);
    
}


-(void)setEditing:(BOOL)arg1 animated:(BOOL)arg2 {
    if (jitter && enableSwitch) {
        arg1 = YES;
        arg2 = YES; 
    }
    %orig;
}

%end


%ctor {

  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.chr1s.jigglemodeprefs"];
  [preferences registerBool:&enableSwitch default:YES forKey:@"enableSwitch"];
  [preferences registerBool:&jitter default:FALSE forKey:@"jitter"];

}
