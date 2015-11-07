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
        contato2.nome = @"Charada";
        [defaultDao adicionaContato:contato2];
        
        Contato* contato3 = [Contato new];
        contato3.nome = @"Coringa";
        [defaultDao adicionaContato:contato3];
        
        Contato* contato4 = [Contato new];
        contato4.nome = @"Batman";
        contato4.email = @"batman@gmail.com";
        contato4.telefone = @"3335555";
        contato4.endereco = @"Rua Francisco Glicerio, Campinas, SP";
        contato4.site = @"http://www.batman.com/";
        [defaultDao adicionaContato:contato4];
        
        Contato* contato5 = [Contato new];
        contato5.nome = @"Robin";
        [defaultDao adicionaContato:contato5];
        
        Contato* contato6 = [Contato new];
        contato6.nome = @"Superman";
        [defaultDao adicionaContato:contato6];
        
        Contato* contato7 = [Contato new];
        contato7.nome = @"Clark Kent";
        [defaultDao adicionaContato:contato7];
        
        Contato* contato8 = [Contato new];
        contato8.nome = @"Hulk";
        [defaultDao adicionaContato:contato8];
        
        Contato* contato9 = [Contato new];
        contato9.nome = @"Bruce Wayne";
        [defaultDao adicionaContato:contato9];
        
        Contato* contato10 = [Contato new];
        contato10.nome = @"Iron Man";
        [defaultDao adicionaContato:contato10];
        
        Contato* contato11 = [Contato new];
        contato11.nome = @"Tony Stark";
        [defaultDao adicionaContato:contato11];
        
        Contato* contato12 = [Contato new];
        contato12.nome = @"Viuva Negra";
        [defaultDao adicionaContato:contato12];
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

- (NSInteger) posicaoDoContato:(Contato*) contato {
    return [self.contatos indexOfObject:contato];
}

@end
