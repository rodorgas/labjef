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
  console.log(`INSERT INTO usuario (
    cpf,
    nome,
    area_de_pesquisa,
    instituicao,
    data_de_nascimento,
    login,
    senha,
    id_tutor
    )
    VALUES
  `)

  const sql = []

  for (let i = 1; i <= 9; i++) {
    const firstName = faker.name.firstName()
    const lastName = faker.name.lastName()

    sql.push(`(
      ${i},
      '${faker.br.cpf()}',
      '${firstName} ${lastName}',
      '${randomItem(areas)}',
      '${randomItem(instituicoes)}',
      '${faker.date.past('40', '1990').toISOString()}',
      '${firstName.toLowerCase()}.${lastName.toLowerCase()}',
      '${faker.internet.password()}',
      ${Math.ceil(Math.random() * 9 + 20)}
    )`)
  }

  for (let i = 1; i <= 5; i++) {
    const firstName = faker.name.firstName()
    const lastName = faker.name.lastName()
    const tutor = randomItem([2, 4, 9])

    sql.push(`(
      ${i + 9},
      '${faker.br.cpf()}',
      '${firstName} ${lastName}',
      '${randomItem(areas)}',
      '${randomItem(instituicoes)}',
      '${faker.date.past('40', '1990').toISOString()}',
      '${firstName.toLowerCase()}.${lastName.toLowerCase()}',
      '${faker.internet.password()}',
      ${tutor}
    )`)
  }

  console.log(sql.join(',') + ';')
}

function paciente() {
}

function makePossui() {
  console.log(`INSERT INTO public.possui(
      id_usuario, id_perfil)
      VALUES `
  );

  const sql = []

  for (let i = 1; i <= 15; i++) {
    sql.push(`(${i}, ${randomNumber(1, 6)})`)
  }

  console.log(sql.join(',\n') + ';');
}

const command = process.argv[2]
if (command === 'usuario') {
  makeUsuario()
}
else if (command === 'possui') {
  makePossui()
}
