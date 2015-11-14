//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
@import CoreLocation;

@protocol FormularioContatoViewControllerDelegate
- (void) contatoAdicionado: (Contato*) contato;
- (void) contatoAtualizado: (Contato*) contato;
@end

@interface FormularioContatoViewController : UIViewController

// Por padrão, propriedades são strong e atomic
// Como a referência de componente de tela é armazenada pela thread de tela, pode ser weak
// Como componentes de tela só são utilizados pela thread de tela, pode ser nonatomic

// Jeito simples de lembrar de weak vs strong:
// - Se você criou o objeto, utilize strong
// - Se só vai utilizar, utilize weak
@property (weak, nonatomic) IBOutlet UIButton *botaoFoto;
@property (weak,nonatomic) IBOutlet UITextField* nome;
@property (weak,nonatomic) IBOutlet UITextField* email;
@property (weak,nonatomic) IBOutlet UITextField* site;
@property (weak,nonatomic) IBOutlet UITextField* endereco;
@property (weak,nonatomic) IBOutlet UITextField* telefone;
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;


@property Contato* contato;
@property UIImage* foto;

// Sempre declarar delegate como weak para evitar referêcia circular na memória (na hora do ARC liberar memória)
@property (weak) id<FormularioContatoViewControllerDelegate> delegate;

@end

