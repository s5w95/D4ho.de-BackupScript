
curDate=$(date "+%Y-%m-%d-%k-%M-%S")
bakPath="./"
tarPath="Backup/"
TARGETIP=""
PASSWORD=""

mkdir $tarPath
for i in $(ls $bakPath); do
	FILENAME=${curDate}_$i.tar
	DIRECTORY=$tarPath$i
	if [ ! -d "$DIRECTORY" ]; then
		mkdir $DIRECTORY
	fi
	tar cfv $FILENAME $i
	mv $FILENAME $DIRECTORY
done
sshpass -p $PASSWORD scp -r Backup backup_space@${TARGETIP}:/home/backup_space/
rm -R $tarPath