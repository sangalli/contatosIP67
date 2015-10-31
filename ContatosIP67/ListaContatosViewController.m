//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"

@implementation ListaContatosViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Selector é utilizado para guarder referência do método
        UIBarButtonItem* botaoAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        self.navigationItem.title = @"Contatos";
        self.navigationItem.rightBarButtonItem = botaoAdd;
    }
    return self;
}

- (void)exibeFormulario {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoViewController* form = [storyboard instantiateViewControllerWithIdentifier:@"FormContato"];
    [self.navigationController pushViewController:form animated:YES];
}

@end
