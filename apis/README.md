# Deployment da API

Depois de instalado a infraestrutura podemos realizar o deployment das APIs, no nosso caso vamos utilizar o Kong como Ingress Controller entao precisamos realizar a configuracao de um objeto Ingress, mas antes vamos realizar a configuracao dos plugins do Kong para adicionarmos comportamentos relacionados a um API Gateway. 

Para realizar a configuracao dos plugins podemos executar o seguinte comando

```shell
kubectl apply -f plugins --recursive -n bets
```

Uma vez que o comando for executado o Ingress Controller ira comecar realizar a configuracao no Kong API Gateway

Os seguintes comportamentos estao configurados na API

* Tracing Distribuido (Jaeger)
* OpenID Connect
* Rate Limit
* Metricas (prometheus)
* Substituicao do Host, para funcionamento do Kong API Gateway + Istio

## Configuracao dos plugins

Especificamente a configuracao dos plugins OpenID Connect e Jaeger precisam ser modificadas, de maneira que voce utilize os valores da sua infraestrutura, como por exemplo client do OpenID Connect
