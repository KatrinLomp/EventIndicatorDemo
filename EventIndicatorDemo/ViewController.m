//
//  ViewController.m
//  EventIndicatorDemo
//
//  Created by Katrin Annuk on 28/06/16.
//
//

#import "ViewController.h"
#import "FSCalendar.h"

@interface ViewController ()<FSCalendarDataSource, FSCalendarDelegateAppearance>
@property (weak, nonatomic) IBOutlet FSCalendar *calendar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // [self.calendar.appearance setWeekdayFont:[UIFont fontWithName:@"SFUIText-Regular" size:10]];
   // [self.calendar.appearance setTitleFont:[UIFont fontWithName:@"SFUIText-Regular" size:18]];
   // [self.calendar.appearance setHeaderTitleFont:[UIFont fontWithName:@"SFUIText-Regular" size:18]];
    
    [self.calendar setCurrentPage:[NSDate date]];
    [self.calendar selectDate:[NSDate date]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)calendar:(FSCalendar *)calendar numberOfEventsForDate:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    if ((comp.year == 2016 && comp.month == 05 && comp.day == 26)
        || (comp.year == 2016 && comp.month == 06 && comp.day == 01)
        || (comp.year == 2016 && comp.month == 06 && comp.day == 23)
        || (comp.year == 2016 && comp.month == 06 && comp.day == 24)
        || (comp.year == 2016 && comp.month == 06 && comp.day == 25)
        || (comp.year == 2016 && comp.month == 07 && comp.day == 01)
        || (comp.year == 2016 && comp.month == 07 && comp.day == 07)
        || (comp.year == 2016 && comp.month == 07 && comp.day == 18)) {
        return 1;
    }
    
    return 0;
}

- (NSArray *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance eventColorsForDate:(NSDate *)date {
    return @[[UIColor yellowColor]];
}

- (void)calendarCurrentMonthDidChange:(FSCalendar *)calendar {
    [self performSelector:@selector(updateEvents) withObject:nil afterDelay:0.3];
}

- (void)updateEvents {
    [self.calendar reloadData];
}

@end
