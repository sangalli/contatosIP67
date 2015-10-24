//
//  ContatoDao.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "ContatoDao.h"

@implementation ContatoDao

static ContatoDao* defaultDao;

// Convenção do iOS para padrões de fábricas é começar com o nome do objeto (abaixo: contatoDao)
// Uma fábrica para singleton tem a palavra instance como abaixo
+(ContatoDao*) contatoDaoInstance {
    if (!defaultDao) {
        defaultDao = [ContatoDao new];
    }
    return defaultDao;
}

// A palavra id é um atalho para NSObject*
- (id)init
{
    self = [super init];
    if (self) {
        _contatos = [NSMutableArray new];
    }
    return self;
}

- (void)adicionaContato:(Contato*) contato {
    [self.contatos addObject: contato];
}

@end
