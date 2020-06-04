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
      NULL
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
      '${faker.date.past('30', '2010').toISOString()}',
      '${firstName.toLowerCase()}.${lastName.toLowerCase()}',
      '${faker.internet.password()}',
      ${tutor}
    )`)
  }

  console.log(sql.join(',') + ';')
}

function makePossui() {
  /* Até o usuario_id = 10, só pode ter perfil 1, 3 e 6.
   * Do 11 ao 15 (usuários tutelados), só pode ter 2, 4, 5 (perfis de
   * tutelado)
  */
  console.log(`INSERT INTO possui(
      id_usuario, id_perfil)
      VALUES `
  );

  const sql = []

  for (let i = 1; i <= 15; i++) {
    let perfil;

    if (i <= 10) {
      perfil = randomItem([1, 3, 6])
    }
    else {
      perfil = randomItem([2, 4, 5])
    }

    sql.push(`(${i}, ${perfil})`)
  }

  console.log(sql.join(',\n') + ';');
}

function makePaciente() {
  console.log(`INSERT INTO paciente(
    id_paciente, cpf, nome, endereco, nascimento)
    VALUES`
  );

  const sql = []

  for (let i = 1; i <= 10; i++) {
    sql.push(`(
      ${i},
      '${faker.br.cpf()}',
      '${faker.name.firstName()} ${faker.name.lastName()}',
      '${faker.address.streetSuffix()} ${faker.name.firstName()}, ${Math.ceil((Math.random() * 1000))} - ${faker.address.city(1)}, ${faker.address.state()}',
      '${faker.date.past('70', '2010').toISOString()}'
    )`)
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
else if (command === 'paciente') {
  makePaciente()
}
