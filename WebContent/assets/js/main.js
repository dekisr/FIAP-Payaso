const menuAtivo = (() => {
  let idPagina = document.querySelector('main').id;
  let menuUl = document.querySelector('.menuBar').querySelectorAll('a');
  menuUl.forEach(item => {
    idPagina === item.innerHTML && item.classList.add('here');
  });
})();

const loginDiv = document.querySelector('.loginDiv');
const loginAbrir = () => {
	loginDiv.classList.add('abrir');
}
const loginFechar = () => {
	loginDiv.classList.remove('abrir');
}

const loginItem = document.querySelector('.login');
(loginItem) && loginItem.addEventListener('click', loginAbrir);

const loginBtn = document.querySelector('.loginBtn');
(loginBtn) && loginBtn.addEventListener('click', loginAbrir);

const loginBtnDrop = document.querySelector('.loginBtnDrop');
(loginBtnDrop) && loginBtnDrop.addEventListener('click', loginAbrir);

const fecharBtn = loginDiv.querySelector('.loginFechar');
fecharBtn.addEventListener('click', loginFechar);
loginDiv.addEventListener('click', (e) => {
	(e.target === loginDiv) && loginFechar();
});
document.addEventListener('keyup', (e) => {
	(e.key === 'Escape') && loginFechar();
});

// menuDrop
const btnMenuDrop = document.querySelector('.btnMenuDrop');
const divMenuDrop = document.querySelector('.divMenuDrop');
const menuFechar = () => {
	divMenuDrop.classList.remove('aberto')
}
btnMenuDrop.addEventListener('click', (e) => {
	divMenuDrop.classList.toggle('aberto');
});
divMenuDrop.addEventListener('click', (e) => {
	(e.target === divMenuDrop) && menuFechar();
})
document.addEventListener('keyup', (e) => {
	(e.key === 'Escape') && menuFechar();
});


// validar usuário
let checarEmail = (email) => {
	(email.value !== document.getElementById('emailUsuario').value) ?
	email.setCustomValidity('Os emails n\u00E3o s\u00E3o iguais.') :
	email.setCustomValidity('');
}
let checarSenha = (senha) => {
	(senha.value !== document.getElementById('senhaUsuario').value) ?
	senha.setCustomValidity('As senhas precisam ser iguais e conter entre 6 e 20 caracteres.') :
	senha.setCustomValidity('');
}