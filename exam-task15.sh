ssh server2 "grep -R '[Aa]dministrator' /etc/* 2>/dev/null | sort" > /tmp/expected_lab15


ssh server2 "sort /root/administratorfiles.txt 2>/dev/null" > /tmp/found_lab15

if diff -u /tmp/expected_lab15 /tmp/found_lab15 >/dev/null 2>&1
then
	echo -e "\033[32m[OK]\033[0m\t\t you correctly identified all files in /etc that contain the text administrator"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t you did not correctly identify all files in /etc that contain the text administrator"
fi
TOTAL=$(( TOTAL + 10 ))
