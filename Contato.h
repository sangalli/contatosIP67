//
//  Contato.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contato : NSObject

// Por padrão, atributos são strong, então não precisa marcar como strong
// Por padrão, atributos são atomic

@property NSString* nome;
@property NSString* email;
@property NSString* site;
@property NSString* endereco;
@property NSString* telefone;



@end
