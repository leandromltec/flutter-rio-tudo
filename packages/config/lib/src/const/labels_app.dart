/* Github - https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

class LabelsApp {
  LabelsApp._();

  //App
  static String textLoading = 'Carregando...';
  static String versionApp = 'Versão ';

  //Home Screen
  static String titleAppBar = 'Rio Tudo';
  static String homeText =
      'Dicas sobre o que fazer no Rio de Janeiro. Tem de tudo, ou quase tudo ! 😜';
  static String textButtonCleanFilter = 'Limpar';
  static String titleLastVisitedTip = 'Última dica visitada';

  //Influencers Screen
  static String influencersText =
      'Os melhores influencers cariocas para te ajudar com várias dicas sobre o Rio de Janeiro';

  //Category Search Screen
  static String textButtonSeeAll = 'Ver todos';
  static String textButtonSeeInstagram = 'Ver Instagram';
  static String textDistrictNofound = '* Localidade não encontrada';
  static String textOrderDistric =
      '* Ordenadas por ordem alfabética crescente\n  pelo nome do bairro';

  //Favorite
  static String nameFavoriteList = 'listFavoritesSharedPreferences';
  static String titleDialogFavorite = 'Remover dos Favoritos';
  static String descriptionDialog = 'Tem certeza que deseja remover ';
  static String descriptionDialogFinal = ' dos favoritos?';

//Max Favorite
  static String titleDialogMaxFavorites = 'Máximo de dicas favoritas';
  static String descriptionDialogMaxFavorites =
      'Você atingiu o número máximo de dicas favoritas, toque em Favoritas no menu e remova uma dica para incluir novas. ';

  static String titleListImages = 'Créditos das imagens usadas neste app';

  //Button Favorite
  static String textAddFavorite = 'Adicionado aos favoritos com sucesso !';
  static String textRemovedFavorite = 'Removido dos favoritos com sucesso !';

  static String titleSeeUourFavoriteTips = 'Veja sua dicas favoritas !';

  static String labelInstagram = 'Instagram';

  static String hintTextSearch = 'Digite um bairro pra busca...';

  //Bottom Navigation Labels Menu
  static String labelBottomNavigatonHome = 'Home';
  static String labelBottomNavigatonInfluencers = 'Influencers';
  static String labelBottomNavigatonFavoritos = 'Favoritas';

  //Dialog
  static String textOps = 'Ops !';
  static String btnClose = 'Fechar';
  static String btnOk = 'OK';

  //Sucess Message
  static String sucessMessageHome = 'Home carregada com sucesso.';
  static String sucessMessageTips = 'Dicas carregadas com sucesso.';
  static String sucessMessageDistricts = 'Bairros carregados com sucesso.';
  static String sucessMessageFilterDistricts =
      'Filto bairro carregado com sucesso.';
  static String sucessMessageInfluencers =
      'Influencers carregados com sucesso.';
  static String sucessMessageInfo = 'Informações carregadas com sucesso.';
  static String sucessMessageFavorites = 'Favoritos carregados com sucesso.';
  static String sucessMessageFavoritesRemove = 'Favorito removido com sucesso.';
  static String sucessMessageFavoriteMax =
      'Quantidade máxima removida com sucesso.';

  //Error Message
  static String errorMessageHome =
      'Error ao carregar dicas da home, tente mais tarde novamente.\nVocê pode ver suas dicas favoritas.';
  static String errorMessageTips =
      'Error ao carregar dicas, tente mais tarde novamente.\nVocê pode ver suas dicas favoritas.';
  static String errorMessageDistricts =
      'Error ao carregar os bairros, tente mais tarde novamente.\nVocê pode ver suas dicas favoritas.';
  static String errorMessageFilterDistricts =
      'Error ao carregar buscar dicas por bairro, tente mais tarde novamente.\nVocê pode ver suas dicas favoritas.';
  static String errorMessageInfluencers =
      'Error ao carregar influencers, tente mais tarde novamente.\nVocê pode ver suas dicas favoritas.';
  static String errorMessageInfo =
      'Error ao carregar informações, tente mais tarde novamente.\nVocê pode ver suas dicas favoritas.';
  static String errorMessageFavorites =
      'Error ao carregar suas dicas favoritas, tente mais tarde novamente.';
  static String errorMessageFavoritesRemove =
      'Error ao carregar remover dos favoritos, tente mais tarde novamente.';
  static String errorMessageFavoriteMax =
      'Error ao carregar máximo dos favoritos, quantidade padrão definida como 10.';
}
