##Script para verificar quantos dias faltam para um certificado SSL expirar
##O script pode ser usado como item no Zabbix
data=`echo | openssl s_client -servername $1 -connect $1:443 2>/dev/null | openssl x509 -noout -enddate | sed -e 's#notAfter=##'`

ssldate=`date -d "${data}" '+%s'`
nowdate=`date '+%s'`
diff="$((${ssldate}-${nowdate}))"

echo $((${diff}/86400))
