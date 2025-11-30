ssh server2 "find /usr -perm /6000 -size -100k -printf '%f \n' 2>/dev/null | sort" > /tmp/expected_suidgid

ssh server2 "find /root/sugidfiles -type f -printf '%f \n' 2>/dev/null | sort" > /tmp/found_suidgid


if diff /tmp/expected_suidgid /tmp/found_suidgid &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t you correctly identified all SUID and SGID files"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t you did not correctly identify all SUID and SGID files"
fi
TOTAL=$(( TOTAL + 10 ))
