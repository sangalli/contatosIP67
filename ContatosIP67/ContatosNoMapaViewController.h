//
//  ContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios5778 on 14/11/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface ContatosNoMapaViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property CLLocationManager* manager;

@end
