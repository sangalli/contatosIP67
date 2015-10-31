//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"
#import "ContatoDao.h"
#import "Contato.h"

@interface ListaContatosViewController()
@property ContatoDao* dao;
@end

@implementation ListaContatosViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Selector é utilizado para guarder referência do método
        UIBarButtonItem* botaoAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        self.navigationItem.title = @"Contatos";
        self.navigationItem.rightBarButtonItem = botaoAdd;
        self.dao = [ContatoDao contatoDaoInstance];
    }
    return self;
}

- (void)exibeFormulario {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoViewController* form = [storyboard instantiateViewControllerWithIdentifier:@"FormContato"];
    [self.navigationController pushViewController:form animated:YES];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dao total];
}

- (UITableViewCell*) tableView:(UITableView*) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identificador = @"celular";
    Contato* contato = [self.dao contatoDaPosicao:indexPath.row];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identificador];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    cell.textLabel.text = contato.nome;
    return cell;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}



@end
