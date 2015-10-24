//
//  Contato.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (NSString *)description
{
    return [NSString stringWithFormat:@"Nome: %@, Telefone: %@, Email: %@, Endereço: %@, Site: %@", self.nome, self.telefone, self.email, self.endereco, self.site];
}

@end
