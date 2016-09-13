all:
	gpg -o - --default-recipient-self -e credentials.clj >credentials.clj.gpg && rm credentials.clj

edit:
	gpg -d -o - credentials.clj.gpg >credentials.clj && vi credentials.clj
