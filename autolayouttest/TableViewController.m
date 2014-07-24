#import "TableViewController.h"

NSString * const CellIdentifier = @"CellIdentifier";

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];

    self.rows = [NSMutableArray array];
    [self.rows addObject:@"A"];
    [self.rows addObject:@"B"];
    [self.rows addObject:@"C"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self fillRows];
}

- (void)fillRows
{
    NSMutableArray *newRows = [NSMutableArray array];

    for (NSInteger i = 3; i < 10; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [newRows addObject:indexPath];
        [self.rows addObject:[NSString stringWithFormat:@"%d", i]];
    }

    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:newRows withRowAnimation:[self rowAnimation]];
    [self.tableView endUpdates];
}


- (UITableViewRowAnimation)rowAnimation
{
    return UITableViewRowAnimationAutomatic;
}

- (UITableViewCell *)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [self.rows objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.rows count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [self configureCell:cell forIndexPath:indexPath];
    return cell;
}

@end
