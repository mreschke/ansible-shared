#!/usr/bin/awk -f

BEGIN {
	FS = " "

	# Output as CSV
	csv=0
}

{
	client=$6
	date=$7
	time=substr(date, 14, 12)
	backend=$9
	split($10, timers, "/")
	tt=timers[4]
	status=$11
	size=$12 / 1024 #in kb
	termination=$15
	split($16, conns, "/")
	host=substr($18, 2, length($18)-2)
	subdomain=substr(host, 1, index(host, ".")-1)
	request=$20
	page=getPage(request)


	#out(date, 26)
	out(time, 12)
	#out(substr(host, 1, 30), 30)
	if (csv == 1)
		out(subdomain, 20)
	else
		out(substr(subdomain, 1, 20), 20)
	out(status, 3)
	#out(client, 21)
	out("["termination"]", 4)
	out(size, 6.1, "f")
	out(tt, 5, "d")
	out(page)
	
	printf("\n")

}

function out(data, pad, type) {
	if (type == "") type = "s"
	if (csv == 1)
		printf("%s", "\""data"\",")
	else
		printf("%-"pad""type"  ", data)
}

function getPage(request) {
	if (index(request, "?") > 0) 
		return substr(request, 1, index(request, "?")-1)
	else
		return request

}

