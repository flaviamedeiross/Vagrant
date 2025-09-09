USE meu_db;

CREATE TABLE IF NOT EXISTS receitas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(500) NOT NULL,
    ingredientes TEXT NOT NULL,
    preparo TEXT NOT NULL
);

INSERT IGNORE INTO receitas (nome, descricao, ingredientes, preparo) VALUES
(
    'Bolo de Cenoura',
    'Um clássico bolo fofinho com cobertura de chocolate crocante.',
    'Bolo: 4 cenouras médias, 4 ovos, 2 copos americanos de açúcar, 2 copos americanos de farinha de trigo, 1 copo americano de óleo, 1 colher de sopa de fermento em pó. Cobertura: 3 colheres de sopá de chocolate em pó, 1 xícara de açucar, 2 colheres de manteiga/margarina, 1 xícara de leite',
    'Bata as cenouras, os ovos e o óleo no liquidificador, coloque em um refratário e junte a farinha e o açucar, e por fim, o fermento, misture bem e leve ao forno por uns 40 minutos a 180° C. Já a cobertura, coloque todos os ingredientes em uma panela e leve ao fogo até o líquido engrossar. Quando o bolo estiver pronto, basta jogar a cobertura por cima do bolo'
),
(
    'Brigadeiro',
    'Doce tradicional brasileiro feito com leite condensado e chocolate.',
    '1 lata de leite condensado, 3 colheres de sopa de chocolate em pó ou 90g de chocolate em barra, 1 colher de sopa de manteiga, chocolate granulado',
    'Misture todos os ingredientes (exceto o granulado) em fogo baixo até desgrudar da panela (ver o fundo da panela). Modele bolinhas e passe no granulado.'
),
(
    'Doce de Abacaxi', 
    'Doce gelado fácil para aproveitar no almoço de domingo',
    '1 abacaxi, 2 gelatinas sabor abacaxi, 7 copos americanos de água, 11 colheres de sopa de açucar, 1 lata de creme de leite',
    'Em uma panela, coloque o abacaxi picado, a água e o açucar, deixe ferver por mais ou menos 20 minutos em fogo médio. Desligue o forno e misture a gelatina e o creme de leite, e coloque em um refratario, após esfriar, leve à geladeira'
),
(
    'Beijo de Mulata', 
    'Se você não conhece os docinhos beijo de mulata, temos a certeza que quererá provar quando conferir a receita!',
    'Massa: 3 ovos, 1 colher de sopa de manteiga, 1 cálice de cachaça, 1 colher de sopa de extrato de baunilha, 7 colheres de açucar, 1 colher de sopa de fermento em pó, 500g de farinha de trigo, 500ml de oléo (para a fritura). Cobertura: 1/2 xícara de chá de leite, 1 xicara de chocolate em pó, 1 xicara de açucar, coco ralado a gosto',
    'Misture todos os ingredientes até a massa desgrudar das mãos. Obs: coloque a farinha aos poucos. Quando a massa estiver pronta, faça bolinhas e coloque para fritar. Para a cobertura, misture os ingredientes e leve ao fogo até ferver. Ao final, molhe os bolinhos na calda e passar em coco ralado'
),
(
    'Pão Caseiro',
    'Quando sentir o cheiro saindo do forno, vai querer repetir a receita milhares de vezes', 
    '2 xícaras de leite, 2 ovos, 1/2 xicara de oleo, 20g de fermento biologico para pão, 2 colheres de sopa de açucar, 1 colher de sopa de sal (rasa)' ,
    'Aqueça o leite, até ele ficar morno. Coloque os ovos, o oleo, o leite, o açucar e o sal no liquidificador, bata até ficar homogeneo, ao final coloque o fermento e bata novamente por pouco tempo. Coloque o liquido em um refratario, e acrescente a farinha aos poucos, logo em seguida misture com as mãos. Deixe descansar por 40 min, faça o formato desejado e deixe descansar novamente por 40min, leve ao forno em 180°C por 20min, ou até a crosta ficar dourada'
);