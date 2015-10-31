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
        
        Contato* contato1 = [Contato new];
        contato1.nome = @"Rafael Sangalli";
        [defaultDao adicionaContato:contato1];
        
        Contato* contato2 = [Contato new];
        contato2.nome = @"Aline Domingues";
        [defaultDao adicionaContato:contato2];
        
        Contato* contato3 = [Contato new];
        contato3.nome = @"John Appleseed";
        [defaultDao adicionaContato:contato3];
        
        Contato* contato4 = [Contato new];
        contato4.nome = @"Joao Silva";
        [defaultDao adicionaContato:contato4];
        
        Contato* contato5 = [Contato new];
        contato5.nome = @"Jose Ruela";
        [defaultDao adicionaContato:contato5];
        
        Contato* contato6 = [Contato new];
        contato6.nome = @"Maria de Souza";
        [defaultDao adicionaContato:contato6];
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

- (void)removeContatoDaPosicao:(NSInteger) posicao {
    [_contatos removeObjectAtIndex:posicao];
}

- (NSMutableArray*) todosContatos {
    return self.contatos;
}

- (NSInteger) total {
    return [self.contatos count];
}

- (Contato *) contatoDaPosicao:(NSInteger) posicao {
    return self.contatos[posicao];
}

@end
