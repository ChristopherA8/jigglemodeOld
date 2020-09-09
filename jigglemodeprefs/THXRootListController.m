#include "THXRootListController.h"

@implementation THXRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)respring {
  [HBRespringController respring];
}

@end

///////////////////////////

@implementation bannerImageCell // Header Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if (self) {
	    UILabel *tweakLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, self.contentView.bounds.size.width + 30, 55)];
	    [tweakLabel setTextAlignment:NSTextAlignmentLeft];
	    [tweakLabel setFont:[UIFont systemFontOfSize:50 weight:UIFontWeightRegular]];
	    tweakLabel.text = @"Jiggle Mode";

	    UILabel *devLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 75, self.contentView.bounds.size.width + 30, 50)];
	    [devLabel setTextAlignment:NSTextAlignmentLeft];
	    [devLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightMedium]];
	    devLabel.alpha = 0.7;
	    devLabel.text = @"1.1.6";

	    NSBundle *bundle = [[NSBundle alloc] initWithPath:@"/Library/PreferenceBundles/jigglemodeprefs.bundle"];
	    UIImage *logo = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"iconFullSize" ofType:@"png"]];
	    UIImageView *icon = [[UIImageView alloc] initWithImage:logo];
	    //icon.frame = CGRectMake(self.contentView.bounds.size.width - 35, 35, 70, 70);
		icon.frame = CGRectMake(20, 30, self.contentView.bounds.size.width + 30, 55);
	    icon.translatesAutoresizingMaskIntoConstraints = NO;

	    [self addSubview:icon];
	    [self addSubview:tweakLabel];
	    [self addSubview:devLabel];

	    [icon.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-20].active = YES;
	    [icon.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
	    [icon.widthAnchor constraintEqualToConstant:70].active = YES;
	    [icon.heightAnchor constraintEqualToConstant:70].active = YES;

	    icon.layer.masksToBounds = YES;
	    icon.layer.cornerRadius = 15;
    }

    return self;
}

- (instancetype)initWithSpecifier:(PSSpecifier *)specifier {
    return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bannerImageCell" specifier:specifier];
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x = 0;
    [super setFrame:frame];
}

- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    return 140.0f;
}

@end 
