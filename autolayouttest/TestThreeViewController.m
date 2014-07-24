#import "TestThreeViewController.h"

// Cells with constraints but no width/height specified, estimated row height, row animation.
@implementation TestThreeViewController

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
    UIView *customView = [[UIView alloc] init];
    customView.translatesAutoresizingMaskIntoConstraints = NO;

    cell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [cell.contentView addSubview:customView];

    NSDictionary *views = NSDictionaryOfVariableBindings(customView);
    [cell.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[customView]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:views]];

    [cell.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[customView]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:views]];

    return cell;

}

@end
