#import "ViewController.h"
#import "TableViewController.h"
#import "TestOneViewController.h"
#import "TestTwoViewController.h"
#import "TestThreeViewController.h"
#import "TestFourViewController.h"
#import "TestFiveViewController.h"

@implementation ViewController

// Regular cells, no constraints, row animation.
- (IBAction)performBaseline:(id)sender
{
    TableViewController *controller = [[TableViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


// Cells with constraints, no estimated row height, row animation.
- (IBAction)performTestOne:(id)sender
{
    TableViewController *controller = [[TestOneViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


// Cells with constraints, estimated row height, row animation.
- (IBAction)performTestTwo:(id)sender
{
    TableViewController *controller = [[TestTwoViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


// Cells with constraints but no width/height specified, estimated row height, row animation.
- (IBAction)performTestThree:(id)sender
{
    TableViewController *controller = [[TestThreeViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


// Cells with constraints, using wrapper, estimated row height, row animation.
- (IBAction)performTestFour:(id)sender
{
    TableViewController *controller = [[TestFourViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


// Cells with constraints, estimated row height, no row animation.
- (IBAction)performTestFive:(id)sender
{
    TableViewController *controller = [[TestFiveViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
