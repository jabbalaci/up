ifeq ($(OS),Windows_NT)
	os := windows
	fname_no_ext := up
    output := $(fname_no_ext).exe
    CAT := type
    COPY := copy
    DEL := del
	DEST := c:\\utils
else
	os := linux
	fname_no_ext := up
    output := $(fname_no_ext)
    CAT := cat
    COPY := cp
    DEL := rm -f
    DEST := $(HOME)/Dropbox/d_lang/_bin
endif

cat:
	$(CAT) Makefile

build:
	dmd main.d -of=$(output)

release:
	dmd -O -release main.d -of=$(output)

install:
	dmd -O -release main.d -of=$(output)
ifeq ($(os),linux)
	strip -s $(output)
endif
	$(COPY) $(output) $(DEST)

clean:
	$(DEL) $(fname_no_ext)
	$(DEL) $(fname_no_ext).exe
	$(DEL) *.o *.obj
