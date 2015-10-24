//
//  ContatoDao.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDao : NSObject

@property (readonly) NSMutableArray* contatos;

+ (ContatoDao*) contatoDaoInstance;
- (void)adicionaContato:(Contato*) contato;

@end
