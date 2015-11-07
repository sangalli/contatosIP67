//
//  GerenciadorDeAcoes.h
//  ContatosIP67
//
//  Created by ios5778 on 07/11/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "Contato.h"

@interface GerenciadorDeAcoes : NSObject

- (id) initWithContato:(Contato*) contato;
- (void) mostraAcoesDoController:(UIViewController*) controller;

@property Contato* contato;

@end
