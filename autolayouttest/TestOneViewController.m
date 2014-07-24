#import "TestOneViewController.h"

// Cells with constraints, no estimated row height, row animation.
@implementation TestOneViewController

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
