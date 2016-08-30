###############################################################################
# EDIT
###############################################################################

CEU_DIR ?= $(error set absolute path to "<ceu>" repository)

###############################################################################
# DO NOT EDIT
###############################################################################

HTTP_DIR ?= .
ARCH_DIR ?= $(HTTP_DIR)/arch
include $(CEU_DIR)/Makefile

ifneq ($(MAKECMDGOALS),link)
ifeq ("$(wildcard $(HTTP_DIR)/arch/up)","")
$(error run "make link")
endif
endif

link:
	rm -f arch/up
	ln -s `readlink -f $(CEU_DIR)/arch` $(HTTP_DIR)/arch/up
