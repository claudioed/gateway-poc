# Kong API Gateway (Ingress) + Istio Service Mesh

## Contexto

A ideia deste repositorio e mostrar a integracao de uma ferramenta de Service Mesh, no nosso caso Istio, com uma ferramenta de API Gateway.

Este repositorio serve como ponto de partida para os estudos, tenha em mente que em ambientes produtivos alguns requisitos que nao estao listados aqui podem ser necessarios.

## Provisionamento do cluster

Voce pode usar um cluster local minikube, caso a ferramenta seja mais facil para voce, se voce deseja utilizar o kind a pasta [kind](./kind) contexto o arquivo **kind.sh** que se executado vai criar um cluster local, o arquivo de [config](./kind/clusterconfig.yaml) pode ser editado se for necessario.

Uma vez provisionado o cluster podemos ir para o nosso proximo passo que sera a instalacao do Istio.

## Instalacao do Istio

Um dos nossos objetivos e testar algumas funcionalidades de Service Mesh, como por exemplo mTLS. Entao sem mais, vamos a instalacao!!!

Utilizaremos a ver 1.11 da ferramenta e a instalacao que pode ser feita utilizando o [arquivo de instalacao](./istio/istio.sh), se for souber outra maneira sem problemas.

Para instalar as dependencias externas do istio, como jaeger, prometheus e grafana voce pode utilizar o [arquivo](./istio/addons.sh)

## Provisionamento das aplicacoes da Demo

Como mostrado na apresentacao nossas 4 aplicacoes precisam estar instaladas no nosso cluster, um detalhe importante e que elas precisam estar com sidecar injetado, basta adicionar a anotacao do istio no namespace **bets**. 

Para realizar a instalacao da aplicacao voce pode executar o seguinte comando

```shell
kubectl apply -f bets --recursive -n bets
```

Este comando vai provisionar todos os manifestos localizado dentro da pasta [bets](./bets)

## Instalacao do Keycloak (OpenID Connect Provider)

O nosso API Gateway Kong vai utilizar uma implementacao de OpenID Connect para realizar a validacao dos tokens, nesse caso precisamos realizar a instalacao da ferramenta no nosso cluster de kubernetes.

O procedimento para instalacao e bem simples, na pratica vamos utilizar o Helm para fazer o deployment, voce pode fazer isso executando o sh de [instalacao](./keycloak/keycloak.sh).

**Dica:** voce pode utilizar o kubectl port-forward para visualizar o painel da ferramenta


## Instalacao do Kong API Gateway

Uma das ferramentas prinicipais da nossa stack e hora de instalarmos nosso API Gateway, como ferramenta vamos utilizar o Kong. Voce pode instala-lo em qualquer namespace, lembre-se que o sidecar do istio tambem deve estar injetado no POD, _vamos testar o mTLS_. Para isso basta adicionar o label para que o kubernetes injete automaticamente o sidecar.

Voce pode executar o arquivo [kong](./kong/kong.sh) para realizar a instalacao da ferramenta assim que os 3 containers do POD estiverem *Ready* a infraestrutura esta apta a receber requisicoes.






### Ferramentas necessarias

* docker
* minikube ou kind 
* istioctl v1.11 (somente para instalacao)
* kubectl
* helm
