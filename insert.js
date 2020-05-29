const faker = require('faker-br')
const areas = ['Computação', 'Astrologia', 'Homeopatia', 'Geografia', 'Direito Penal', 'Biologia Molecular', 'Literatura Africana', 'Oceanografia', 'Física Nuclear', 'Psicanálise']
const instituicoes = ['USP', 'ITA', 'IME', 'IMPA', 'UFRJ', 'UFPR', 'UNICAMP', 'UNESP', 'MACKENZIE', 'PUC']

function randomItem(array) {
  return array[Math.ceil(Math.random() * array.length - 1)]
}

function randomNumber(lower, upper) {
  return Math.ceil(Math.random() * (upper - lower + 1) + lower - 1)
}


function makeUsuario() {
  const firstName = faker.name.firstName()
  const lastName = faker.name.lastName()

  const sql = `INSERT INTO usuario (
    cpf,
    nome,
    area_de_pesquisa,
    instituicao,
    data_de_nascimento,
    login,
    senha,
    id_tutor
  )
  VALUES (
    '${faker.br.cpf()}',
    '${firstName} ${lastName}',
    '${randomItem(areas)}',
    '${randomItem(instituicoes)}',
    '${faker.date.past('40', '1990').toISOString()}',
    '${firstName.toLowerCase()}.${lastName.toLowerCase()}',
    '${faker.internet.password()}',
    ${Math.ceil(Math.random() * 9 + 20)}
  );`
}

function paciente() {

}

function makePossui(user, rangePerfil) {
  const sql = (user, perfil) => `INSERT INTO public.possui(
	id_usuario, id_perfil)
	VALUES (${user}, ${perfil});
  `

  return sql(user, randomNumber(rangePerfil[0], rangePerfil[1]))
}

for (let i = 20; i <= 30; i++) {
  console.log(makePossui(i, [1, 6]))
}
