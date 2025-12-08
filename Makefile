
ASOPT ?= -g


INCLUDE_DIR := include
SRC_DIR := src

CRT_DIR := crt
LIBASM_DIR := src/libasm
WRAPPA_DIR := src/wrappa


LIBASM_A := libasm.a
LIBASM_SO := libasm.so


CRT_SFILES := crt/crt0.s crt/crti.s crt/crtn.s


LIBASM_SFILES := \
	$(LIBASM_DIR)/init.s\
	$(LIBASM_DIR)/errno.s\
	\
	$(LIBASM_DIR)/memcpy.s\
	\
	$(LIBASM_DIR)/strdelim.s\
	$(LIBASM_DIR)/strlen.s\
	$(LIBASM_DIR)/strncmp.s\
	\
	$(LIBASM_DIR)/exit.s\
	$(LIBASM_DIR)/process.s\
	$(LIBASM_DIR)/mman.s\
	$(LIBASM_DIR)/alloc.s\
	$(LIBASM_DIR)/io.s


WRAPPA_BIN := wrappa

WRAPPA_SFILES :=\
	$(WRAPPA_DIR)/main.s



CRT_OFILES := $(patsubst %.s,%.o,$(CRT_SFILES))

LIBASM_OFILES := $(patsubst %.s,%.o,$(LIBASM_SFILES))
WRAPPA_OFILES := $(patsubst %.s,%.o,$(WRAPPA_SFILES))


all: $(CRT_OFILES) $(LIBASM_A) $(LIBASM_SO) $(WRAPPA_BIN)


.PHONY: clean
clean:
	$(RM) $(LIBASM_A) 
	$(RM) $(LIBASM_SO)
	$(RM) $(LIBASM_OFILES)
	$(RM) $(CRT_OFILES)
	$(RM) $(WRAPPA_BIN)
	$(RM) $(WRAPPA_OFILES)


$(CRT_DIR)/%.o: $(CRT_DIR)/%.s
	$(AS) $(ASOPT) $< -o $@


$(LIBASM_A): $(LIBASM_OFILES) $(START_OFILE)
	$(AR) cr $@ $+


$(LIBASM_SO): $(LIBASM_OFILES)
	$(LD) -shared $+ -o $@


$(LIBASM_DIR)/%.o: $(LIBASM_DIR)/%.s
	$(AS) -I$(INCLUDE_DIR) -I$(LIBASM_DIR) $(ASOPT) $< -o $@


$(WRAPPA_BIN): $(WRAPPA_OFILES) $(LIBASM_A) $(CRT_OFILES)
	$(LD) $(CRT_DIR)/crt0.o $(CRT_DIR)/crti.o $(WRAPPA_OFILES) $(CRT_DIR)/crtn.o -o $@ -L. -l:libasm.a


$(WRAPPA_DIR)/%.o: $(WRAPPA_DIR)/%.s
	$(AS) -I$(INCLUDE_DIR) -I$(WRAPPA_DIR) $(ASOPT) $< -o $@

