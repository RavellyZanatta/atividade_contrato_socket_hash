from socket import *
# porta de conexão
serverPort = 12000
serverSocket = socket(AF_INET,SOCK_STREAM)
# servidor executado na mesma máquina = 'localhost'
serverSocket.bind(('localhost',serverPort))
serverSocket.listen(1)
print('The server is ready to receive')
while 1:
     connectionSocket, addr = serverSocket.accept()

     sentence = connectionSocket.recv(1024)
     print("TCP Receive", sentence, "FROM", addr)

     #capitalizedSentence = sentence.upper()
     #connectionSocket.send(capitalizedSentence)
     connectionSocket.close()