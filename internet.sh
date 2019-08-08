#!/bin/bash

echo 'Aguarde alguns segundos por favor...'
sleep 02
while [ 1 ]
do
#liga a internet
echo "Vou reiniciar  a placa de rede. Aguarde um instante..."
sleep 02
ifconfig wlp8s0 down
sleep 04
ifconfig wlp8s0 up
sleep 05

echo "Vou reiniciar o serviço de rede agora. Aguarde mais um pouco..."
sleep 02
service networking restart
sleep 05

echo "Vou mostrar agora como está a conexão do computador com a internet:"
ifconfig
sleep 03

echo "O IP  192.168.0.199 aparece abaixo da interface wlp8s0?"
echo "Digite s (SIM) ou n (NÃO)"
read resposta

if [ $resposta == s ]
then
        echo "Está tudo ok!"
        echo "Vou apenas reiniciar o serviço de impressão"
        while [ 1 ]
        do
        /etc/init.d/cups restart
        echo "Um segundo..."
        sleep 03
        /etc/init.d/cups status
        echo "Poderia confirmar se está tudo ok? (verde)"
        echo "Digite ok se estiver tudo certo:"
        read resp
                if [ $resp == ok ]
                then
                echo "Beleza, obrigado. Já está tudo ok."
                break
                fi
                if [ $resp != ok ]
                then
                echo "Hum...Droga! Isso não era para acontecer."
                sleep 02
                echo "Vou reiniciar o serviço novamente ok?"
                sleep 01
                fi
        done
        break
fi

if [ $resposta == n ]
then
        echo "Pressione Fn+F2."
        echo "Vou reiniciar o serviço de internet e verificar novamente."
        echo "Se o problema persistir, o erro pode estar na conexão com a rede"
        echo "Verifique se os outros dispositivos possuem conexão também."
sleep 04
fi
done

sleep 02
clear
echo "Pronto!"