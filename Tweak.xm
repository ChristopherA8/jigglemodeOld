@interface SBSApplicationShortcutItem : NSObject
@property (nonatomic, retain) NSString *type;
@property (nonatomic, copy) NSString * localizedTitle;
@end

%hook SBIconView

- (void)SBSApplicationShortcutItem:(NSArray *)arg1 {
    
    for (SBSApplicationShortcutItem *item in arg1) {
        
        if ([item.type isEqual:@"com.apple.springboardhome.application-shotcut-item.rearrange-icons"]) {
            
            item.localizedTitle = @"Jiggle Mode";
            
        }
        
    }
    
    %orig(arg1);
    
}

%end
