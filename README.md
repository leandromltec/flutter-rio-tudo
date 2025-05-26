# Flutter Rio Tudo

O Rio Tudo é um aplicativo para celular que tem o objetivo de reunir dicas sobre o que fazer no Rio de Janeiro.  

<h2>🚀 Sobre o Projeto</h2>
Aplicativo desenvolvido em Flutter e disponível para Android (Play Store) e IOS (App Store).<br />
Para conhecer e baixar o aplicativo, acesse o link - <a href="https://riotudo.com.br" rel="noopener">https://riotudo.com.br</a></p>
Utilizada arquitetura Clean Architecture como foco em escalabilidade, manutenibilidade e boas práticas de desenvolvimento.

<h2>📝 Licença</h2>
Não é permitido o uso do código para publicação ou uso da marca Rio Tudo porque o mesmo possui direitos reservados. Este repositório é para portfólio e estudo da tecnologia Flutter.


Abaixo pode ser analisado tudo que foi utilizado para a implementação do app.

 - Versão do Flutter 3.16.4 e Dart versão 3.23;
 - Estrutura do projeto Clean Architecture (arquitetura aprendida com a experiência em empresas como Bradesco no app Next e app ClaroPay);
 - Projeto orientado a packages;
 - Design System definido para layout;
 - Uso do compute isolate para executar tarefas grandes em diferentes threads;
 - Conceito de SOLID Aberto/Fechado;
 -  Principais packages:
    - Shared Preferences - marcação de dicas favoritas 
    - Url Lancher - redirecionamento da dica para respectivo Instagram
    - Typeahead - textfield sugestivo para busca de dicas por localidade 
    - Staggered Animations - animação dos box de categorias e subcategorias de dicas
- Teste unitários utilizando mockito e mocktail.


Apresentação do app:




https://github.com/leandromltec/flutter-rio-tudo/assets/39128248/14d9a6b7-ee8d-43cc-99eb-613b595e459e




Estrutura de pastas do projeto (Clean Architecture):
![til](./assets/images/arquitetura.png)


Exemplo do Conceito de SOLID Aberto/Fechado aplicado no projeto:

![solid](https://github.com/leandromltec/flutter-rio-tudo/assets/39128248/ecddc45d-4d92-4b4d-8025-81779a69db44)


Relatório de testes unitários atingindo uma porcentagem de aprovação:
![Captura de Tela 2024-03-15 às 08 59 20](https://github.com/leandromltec/flutter-rio-tudo/assets/39128248/220b4f59-a91f-4a0b-91ce-f11203ce9194)





