@interface SBSApplicationShortcutItem : NSObject
@property (nonatomic, retain) NSString *type;
@property (nonatomic, copy) NSString * localizedTitle;
@end

//Tweak Settings
NSString *domainString = @"com.chr1s.jigglemode";
NSUserDefaults *tweakSettings;

//Boolean to enable or disable tweak, in preferences
static BOOL tweakEnabled;

void TweakSettings() {
    tweakSettings = [[NSUserDefaults alloc] initWithSuiteName:domainString];

    //enable tweak
    tweakEnabled = [[tweakSettings objectForKey:@"tweakEnabled"] boolValue];
}

%hook SBIconView

- (void)setApplicationShortcutItems:(NSArray *)itemsArray {
    
    for (SBSApplicationShortcutItem *item in itemsArray) {
        
        if (tweakEnabled && [item.type isEqual:@"com.apple.springboardhome.application-shotcut-item.rearrange-icons"]) {
            
            item.localizedTitle = @"Jiggle Mode";
            
        }
        
    }
    
    %orig(itemsArray);
    
}

%end

%ctor {
    TweakSettings();
    %init
}
