# Atividade sobre contrato e sockets com hash

## Ravelly coin
* O arquivo `ravelly.sol` é o contrato em solidity para a criação da moeda.
* Para fazer o deploy e interação com o contrato, você pode utilizar A IDE Remix: https://remix.ethereum.org 

## Criptografia e Descriptografia
* O código pode ser executado com o arquivo 'Criptografia_e_Descriptografia.ipynb'.

## Enviando Hash via TCP Socket
### Instruções
1 - Instale a biblioteca cryptgraphy io:
``` console
pip install cryptography
```
2 - Primeiramente execute o servidor:

``` console

python server.py
```

3 - E então, o cliente:
``` console

python client.py
```
O cliente calcula o hash e envia para o servidor.
