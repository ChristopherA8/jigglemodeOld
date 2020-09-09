#import <Cephei/HBPreferences.h>

@interface SBSApplicationShortcutItem : NSObject
@property (nonatomic, retain) NSString *type;
@property (nonatomic, copy) NSString * localizedTitle;
@end

//Preferences Variables
BOOL enableSwitch;

%hook SBIconView

- (void)setApplicationShortcutItems:(NSArray *)itemsArray {
    
    for (SBSApplicationShortcutItem *item in itemsArray) {
        
        if (enableSwitch && [item.type isEqual:@"com.apple.springboardhome.application-shotcut-item.rearrange-icons"]) {
            
            item.localizedTitle = @"Jiggle Mode";
            
        }
        
    }
    
    %orig(itemsArray);
    
}

%end


%ctor {

  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.chr1s.jigglemodeprefs"];
  [preferences registerBool:&enableSwitch default:YES forKey:@"enableSwitch"];

}
