BIBTEX=bibtex
PDFLATEX=pdflatex

PDFARGS=-dEmbedAllFonts=true -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress

BIBFILES=back/general.bib

TARGET=thesis

SRCS=$(wildcard *.tex)


pdf: $(SRCS)
	$(PDFLATEX) $(PDFARGS) $(TARGET).tex



bib: $(TARGET).bbl

$(TARGET).bbl: $(TARGET).tex $(TARGET).aux $(BIBFILES)
	$(BIBTEX) $(TARGET)


tar:
	$(RM) /tmp/$(TARGET).tgz
	tar -cvz --exclude=.svn '--exclude=*~' -f /tmp/$(TARGET).tgz .
	mv /tmp/$(TARGET).tgz .

clean:
	$(RM) *~ $(TARGET).aux $(TARGET).log $(TARGET).dvi \
	$(TARGET).toc $(TARGET).lof $(TARGET).lot $(TARGET).cb $(TARGET).cb2 \
	$(TARGET).thm $(TARGET).pdf pubinfo.aux missfont.log $(TARGET).blg texput.log \
	$(TARGET).out


