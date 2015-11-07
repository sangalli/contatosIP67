//
//  GerenciadorDeAcoes.m
//  ContatosIP67
//
//  Created by ios5778 on 07/11/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "GerenciadorDeAcoes.h"


@interface GerenciadorDeAcoes()
<UIActionSheetDelegate>

@end

@implementation GerenciadorDeAcoes

- (id)initWithContato:(Contato *)contato {
    self = [super init];
    if (self) {
        self.contato = contato;
    }
    return self;
}

- (void) mostraAcoesDoController:(UIViewController*) controller {
    UIActionSheet* opcoes = [[UIActionSheet alloc] initWithTitle:@"Ações" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:NULL otherButtonTitles:@"Ligar",@"Enviar SMS",@"Mandar e-mail",@"Acessar site",@"Mostrar no mapa", nil];
    [opcoes showInView:controller.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            NSLog(@"Ligando");
            break;
        case 1:
            NSLog(@"Enviando SMS");
            break;
        case 2:
            NSLog(@"Mandando e-mail");
            break;
        case 3:
            NSLog(@"Acessando site");
            break;
        case 4:
            NSLog(@"Mostrando no mapa");
            break;
    }
}

@end
