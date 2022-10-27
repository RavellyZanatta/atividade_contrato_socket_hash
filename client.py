from cryptography.hazmat.primitives import hashes
import hashlib
from socket import *
serverName = "localhost"
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName,serverPort))
#sentence = bytes(input('Input lowercase sentence: '), 'utf_8')
digest = hashes.Hash(hashes.SHA256())

# criação do hash da String
myhash = digest.update(b"eu amo meu orientador 1")
myhash = digest.finalize()
sentence = myhash
# Envia para o servidor
clientSocket.send(sentence)
modifiedSentence = clientSocket.recv(1024)
clientSocket.close()