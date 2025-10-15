# Flutter Rio Tudo

O Rio Tudo é um aplicativo para celular que tem o objetivo de reunir dicas sobre o que fazer no Rio de Janeiro.  

<h2>🚀 Sobre o Projeto</h2>
Aplicativo desenvolvido em Flutter e disponível para Android (Play Store) e IOS (App Store).<br />
Para conhecer e baixar o aplicativo, acesse o link - <a href="https://riotudo.com.br" rel="noopener">https://riotudo.com.br</a>.<br />
Utilizada arquitetura Clean Architecture como foco em escalabilidade, manutenibilidade e boas práticas de desenvolvimento. <br /><br />

<h2>📝 Licença</h2>
Não é permitido o uso do código para publicação ou uso da marca Rio Tudo, o mesmo possui direitos reservados.<br />
Este repositório é para portfólio e estudo da tecnologia Flutter.<br /><br />

<h2>🏗️ Arquitetura</h2>
O projeto segue Clean Architecture, como exemplificado neste repositório <a href="https://github.com/Flutterando/Clean-Dart?tab=readme-ov-file" rel="noopener">Clean Architecture Flutter</a>, possibilitando flexbilidade para remoção ou inclusão de novas features. <br />
O Clean Architecture foi a arquitetura escolhinda com a experiência obtida em empresas como Bradesco no app Next e app ClaroPay. <br /><br />

<h2>📱 Funcionalidades</h2>
<ul>
 <li>Tela inicial com agrupamento de categorias de dicas para seleção;</li>
 <li>Tela de seleção de dicas com links para redirecionamento para redes socias e busca de dicas por localidade;</li>
 <li>Opção de favoritar dicas;</li>
 <li>Tela de seleção de dicas por influencers;</li>
 <br />
</ul>

<h2>🛠️ Tecnologias utilizadas</h2>

<ul>
 <li>Versão inicial do Flutter 3.16.4 e Dart versão 3.23;</li>
 <li>Projeto orientado a packages;</li>
 <li>Design System definido para layout;</li>
 <li>Uso do compute isolate para executar tarefas grandes em diferentes threads;</li>
 <li>Conceito de SOLID;</li>
 <br />

</ul>
 <ul><h3>Principais packages:</h3>
  <li>Shared Preferences - salvamento local para marcação de dicas favoritas; </li>
   <li>Url Lancher - carregmento de urls para redirecionamento da dica para respectivo Instagram;</li>
    <li>Typeahead - textfield sugestivo para busca de dicas por localidade; </li>
    <li>Staggered Animations - animação dos box de categorias e subcategorias de dicas;</li>
<li>Teste unitários utilizando mockito e mocktail.</li>
 </ul><br />

 <h2>⚠️ Observação</h2>
O código neste github é a primeira versão do aplicativo, podendo ser diferente do aplicativo atual publicado nas lojas. <br />
O objetivo do repositório é comprovação de conhecimento em arquitetura Clean Architecture, SOLID e tecnologia Flutter. <br /><br />

<h3>Apresentação do app:</h3>

https://github.com/leandromltec/flutter-rio-tudo/assets/39128248/14d9a6b7-ee8d-43cc-99eb-613b595e459e




Estrutura de pastas do projeto (Clean Architecture):
![til](./assets/images/arquitetura.png)


<h2>⚙️ Teste unitários</h2>

Relatório de testes unitários atingindo uma porcentagem de aprovação: <br />
![Captura de Tela 2024-03-15 às 08 59 20](https://github.com/leandromltec/flutter-rio-tudo/assets/39128248/220b4f59-a91f-4a0b-91ce-f11203ce9194)





