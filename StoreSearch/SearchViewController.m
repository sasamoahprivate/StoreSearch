//
//  ViewController.m
//  StoreSearch
//
//  Created by Stephen Asamoah on 28/04/2012.
//  Copyright (c) 2012 CO-267 Jacobs Consultancy Ltd. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchResult.h"


@interface SearchViewController ()
@property (nonatomic, weak)IBOutlet UISearchBar *searcBar;
@property (nonatomic, weak)IBOutlet UITableView *tableView;

@end

@implementation SearchViewController {
    NSMutableArray *searchResults;
}

@synthesize searcBar = _searcBar;
@synthesize tableView = _tableView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (searchResults == nil) {
        return 0;
    } else if ([searchResults count] == 0) {
        return 1;
    }else {
        return [searchResults count];
    }
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([searchResults count] == 0) {
        return nil;
    } else {
        return indexPath;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SearchResultCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    if ([searchResults count] ==0) {
        cell.textLabel.text = @"Nothing Found";
        cell.detailTextLabel.text = @"";
    } else {
        SearchResult *searchResult = [searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = searchResult.name;
        cell.detailTextLabel.text = searchResult.artistName;
    }
  
 
    return cell;
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    searchResults = [NSMutableArray arrayWithCapacity:10];
    
    if (![searchBar.text isEqualToString:@"justin bieber"]) {
        for (int i=0; i<3; i++) {
            SearchResult *searchResult = [[SearchResult alloc]init];
            searchResult.name = [NSString stringWithFormat:@"Fake Result %d" ,i ];
            searchResult.artistName = searchBar.text;
            [searchResults addObject:searchResult];
        }
    }

    [self.tableView reloadData];
    NSLog(@"The search text is: '%@'", searchBar.text);
}

@end
