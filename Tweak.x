@interface SBSApplicationShortcutItem : NSObject
@property (nonatomic, retain) NSString *type;
@property (nonatomic, copy) NSString * localizedTitle;
@end

%hook SBIconView

- (void)SBSApplicationShortcutItem:(NSArray *)shortcutItemsArray {
    
    for (SBSApplicationShortcutItem *item in shortcutItemsArray) {
        
        if ([item.type isEqual:@"com.apple.springboardhome.application-shotcut-item.rearrange-icons"]) {
            
            item.localizedTitle = @"Jiggle Mode";
            
        }
        
    }
    
    %orig(shortcutItemsArray);
    
}

%end
