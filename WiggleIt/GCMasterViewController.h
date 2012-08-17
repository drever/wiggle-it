//
//  GCMasterViewController.h
//  WiggleIt
//
//  Created by Johannes Drever on 8/17/12.
//  Copyright (c) 2012 Johannes Drever. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface GCMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
