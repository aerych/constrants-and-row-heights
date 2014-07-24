#import "TestFourViewController.h"

// Cells with constraints, using wrapper, estimated row height, row animation.
@implementation TestFourViewController

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // When actual height is 100, an estimated height larger than 150 triggers the warning.
    return 151.0;
}

- (UITableViewRowAnimation)rowAnimation
{
    return UITableViewRowAnimationFade;
}

- (UITableViewCell *)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    UIView *wrapperView = [[UIView alloc] init];
    wrapperView.translatesAutoresizingMaskIntoConstraints = NO;

    UIView *customView = [[UIView alloc] init];
    customView.translatesAutoresizingMaskIntoConstraints = NO;

    [wrapperView addSubview:customView];
    [cell.contentView addSubview:wrapperView];

    NSDictionary *views = NSDictionaryOfVariableBindings(customView);
    [wrapperView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[customView(1)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:views]];
    
    [wrapperView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[customView(1)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:views]];

    return cell;
}

@end
