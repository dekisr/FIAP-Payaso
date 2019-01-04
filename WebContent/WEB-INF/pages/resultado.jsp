<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link href="https://fonts.googleapis.com/css?family=Carter+One" rel="stylesheet">
  <title>Payaso - ${mensagem}</title>
  <style>
    *, html, body {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    html, body {
      height: 100%;
      min-height: 100%;
    }
    body {
      font-family: 'Carter One', cursive;
      background-color: hsl(185, 70%, 50%);
    }
    main {
      display: grid;
      justify-items: center;
      align-items: center;
      align-content: center;
      height: 100%;
    }
    main span {
      width: 300px;
      height: 300px;
      margin: 1rem;
      font-size: 0;
      background-image: url(images/payaso_face.svg);
      background-repeat: no-repeat;
      background-position: center;
    }
    .resultado {
      display: grid;
      justify-items: center;
      align-items: center;
      position: relative;
      width: 100%;
      padding: 1rem;
      background-color: hsla(0, 100%, 100%, .5);
    }
    .resultado p {
      font-size: 2rem;
      text-align: center;
      color: hsl(0, 0%, 30%);
    }
    a {
      margin: 1rem;
      padding: 1rem;
      font-size: 1.5rem;
      border: 0;
      outline: 0;
      text-decoration: none;
      color: hsl(0, 0%, 100%);
      border-radius: .3rem;
      background-color: hsl(0, 0%, 30%);
    }
    a:hover {
      cursor: pointer;
      background-color: hsl(0, 100%, 65%);
    }
  </style>
</head>
<body>
  <main>
    <span>Payaso</span>
    <section class="resultado">
      <p>${mensagem}</p>
    </section>
    <a href="${voltar}">Voltar</a>
  </main>
</body>
</html>