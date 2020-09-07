@interface SBSApplicationShortcutItem : NSObject
@property (nonatomic, retain) NSString *type;
@property (nonatomic, copy) NSString * localizedTitle;
@end


%hook SBIconView

- (void)setApplicationShortcutItems:(NSArray *)itemsArray {
    
    for (SBSApplicationShortcutItem *item in itemsArray) {
        
        if ([item.type isEqual:@"com.apple.springboardhome.application-shotcut-item.rearrange-icons"]) {
            
            item.localizedTitle = @"Jiggle Mode";
            
        }
        
    }
    
    %orig(itemsArray);
    
}

%end