//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormularioContatoViewController : UIViewController

// Por padrão, propriedades são strong e atomic
// Como a referência de componente de tela é armazenada pela thread de tela, pode ser weak
// Como componentes de tela só são utilizados pela thread de tela, pode ser nonatomic

// Jeito simples de lembrar de weak vs strong:
// - Se você criou o objeto, utilize strong
// - Se só vai utilizar, utilize weak

@property (weak,nonatomic) IBOutlet UITextField* nome;
@property (weak,nonatomic) IBOutlet UITextField* email;
@property (weak,nonatomic) IBOutlet UITextField* site;
@property (weak,nonatomic) IBOutlet UITextField* endereco;
@property (weak,nonatomic) IBOutlet UITextField* telefone;

// O símbolo - significa que é um método da instância
// O símbolo + significa que é um método da classe
- (IBAction)pegaDadosDoFormulario;

@end

