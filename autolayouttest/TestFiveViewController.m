#import "TestFiveViewController.h"

// Cells with constraints, estimated row height, no row animation.
@implementation TestFiveViewController

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // When actual height is 100, an estimated height larger than 150 triggers the warning.
    return 151.0;
}

- (UITableViewRowAnimation)rowAnimation
{
    return UITableViewRowAnimationNone;
}

- (UITableViewCell *)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    UIView *customView = [[UIView alloc] init];
    customView.translatesAutoresizingMaskIntoConstraints = NO;

    cell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [cell.contentView addSubview:customView];

    NSDictionary *views = NSDictionaryOfVariableBindings(customView);
    [cell.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[customView(1)]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:views]];

    [cell.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[customView(1)]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:views]];

    return cell;
}

@end
