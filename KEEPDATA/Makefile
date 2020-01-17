
all: dtd xsd web tidy xq java


dtd:
	xmllint --valid --noout master.xml

xsd:
	xmllint --noout master.xml -schema master.xsd

web:
	mkdir -p www
	xsltproc -o www/master.html xsl/master.xsl master.xml

tidy: 
	tidy -im -asxhtml -indent www/*.html

xq:
	java -cp saxon9/saxon9he.jar net.sf.saxon.Query "-q:xq.txt"
	
java:
	mkdir -p java

.PHONY : clean

clean:
	rm -f www/*.html

