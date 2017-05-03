#!/bin/bash
#Autor: Alan Ramires - Analista de Infraestrutura
#Data de criação: 03/05/2017 13:12
escolha=10
clear
while (( escolha != 7 )); do

echo "Escolha uma das opções abaixo, digitando seu número correspondente:"
echo; sleep 1
echo "1) Criar novo usuário;"
echo "2) Alterar senha;"
echo "3) Deletar usuário; (INDISPONÍVEL)"
echo "4) Criar grupo;"
echo "5) Incluir usuário ao grupo;"
echo "6) Alterar a permissão de pasta;"
#echo "5)  "
echo "7) Sair."
read escolha
	if (( $escolha == 1 )); then
		echo -n "Digite um nome para o novo usuário a ser criado:"
		read nome 
		useradd $nome -s /bin/MySecureShell -m
		sleep 1
		passwd $nome
		echo
		echo "Usuário $nome criado com sucesso!"	
		sleep 2
	fi

	if (( $escolha == 2 )); then
		echo "Digite o nome do usuário que deseja alterar a senha:"
		read nome
		passwd $nome
		sleep 2
	fi

	if (( $escolha == 3 )); then
#		echo "Escreva o nome do usuário qeu deseja deletar! TOME CUIDADO PARA NÃO ESCREVER O NOME INCORRETAMENTE"
#		read nomedel		
#		userdel -f $nomedel
#		echo "Usuario $nomedel deletado do sistema com sucesso!"
		sleep 2	
		echo "Opçao invalida"
	fi

	if (( $escolha == 4 )); then
		echo "Escreva um nome para o novo grupo a ser criado:"
		read grupo
		groupadd $grupo
		echo "Grupo $grupo criado com sucesso!"
		sleep 2
		
	fi

	if (( $escolha == 5 )); then
		echo "Digite o nome do usuário:"
		read nome
		echo "Digite o nome do grupo:"
		read grupo
		gpasswd -a $nome $grupo
		echo "Usuario $nome incluido no grupo $grupo com socesso!"

	fi

	if (( $escolha == 6 )); then
	
		echo "Digite o caminho absoluto da pasta a ser alterada suas permissões: (Exemplo: /home/suporte01"
		read caminho
		echo "Digite a permissão que deseja atribuir a esta pasta em decimal: (Exemplo: 770)"
		read permissao
		chmod -R $permissao $caminho
		echo "Permissões da pasta $caminho alteradas para $permissao com sucesso!"		
	fi

done
