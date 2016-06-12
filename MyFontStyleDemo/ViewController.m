//
//  ViewController.m
//  MyFontStyleDemo
//
//  Created by ljf on 16/5/31.
//  Copyright © 2016年 hanwang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSIndexPath *currentIndexPath;
}
@property (nonatomic, strong) NSMutableArray *familyFonts;
@property (nonatomic, strong) NSMutableArray *allFonts;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _familyFonts = [NSMutableArray arrayWithCapacity:0];
    _allFonts = [NSMutableArray arrayWithCapacity:0];
    
    NSArray *systemFonts = [UIFont familyNames];
    _familyFonts = [NSMutableArray arrayWithArray:systemFonts];
    for (NSString *familyName in systemFonts) {
        NSArray *fonts = [UIFont fontNamesForFamilyName:familyName];
        [_allFonts addObject:fonts];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _familyFonts.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_allFonts[section] count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *view = [[UILabel alloc] initWithFrame:tableView.tableHeaderView.bounds];
    view.backgroundColor = [UIColor darkGrayColor];
    view.textColor = [UIColor whiteColor];
    view.font = [UIFont boldSystemFontOfSize:20];
    view.text = [NSString stringWithFormat:@"   %@",_familyFonts[section]];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }
    
    NSString *fontName = _allFonts[indexPath.section][indexPath.row];
    cell.textLabel.text = @"iOS系统字体Demo，2016-5-31";
    cell.textLabel.font = [UIFont fontWithName:fontName size:16];
    cell.detailTextLabel.text = fontName;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if (action == @selector(copy:)) {
        return YES;
    }
    return NO;
}

- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    NSString *fontName = _allFonts[indexPath.section][indexPath.row];
    if (action == @selector(copy:)) {
        [UIPasteboard generalPasteboard].string = fontName;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_myTableview deselectRowAtIndexPath:indexPath animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
