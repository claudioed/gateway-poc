# Tokens

O objetivo desta pasta e fornecer uma maneira mais simplificada de obter tokens na nossa implementacao de OpenID Connect, lembre-se que as instrucoes aqui servem como base, voce pode usar a maneira mais adequada de obter um token seguindo o padrao OpenID Connect.

O arquivo [pod.yaml](pod.yaml) vai realizar a criacao de um POD com a ferramenta **curl**. O objetivo desta funcionalidade e para que atraves desse POD consigamos obter um token JWT.

Feito o deployment do POD, voce pode executar o arquivo de [obtencao](get-token.sh) de token, lembre-se que la temos a configuracao de um client qualquer, voce pode precisar alterar algumas informacoes do client OpenID Connect.
