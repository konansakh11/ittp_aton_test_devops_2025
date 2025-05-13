#!/bin/bash
echo "Введите раздел для проверки занятого объёма (по умолчанию /):"
read part_input
echo "Введите адрес smtp сервера:"
read addr
echo "Введите логин smtp сервера:"
read login
echo "Введите пароль smtp сервера:"
read password
if [ -z $part_input ]; then
part=/;
else
part=$part_input
fi
procent_used=$(df $part | awk '{print $5}' | tail -n 1)
let procent_available=100-${procent_used::-1}
if [ $procent_available -lt 85 ]; then
msmtp --host=$addr --port=587 --from=$login --auth=login --user=$login --passwordeval="echo '$password'" --tls=on $login <<EOF
Subject: [Alert]
From: $login
To: $login

Свободного объёма диска, примонтированного к разделу $part, менее 85%!!!
EOF

fi
