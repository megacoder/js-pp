TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=${DESTDIR}/opt
BINDIR=${PREFIX}/bin
LIBDIR=${PREFIX}/lib/js-pp
SUBDIRS=

ifeq	(${MAKE},gmake)
	INSTALL=ginstall
else
	INSTALL=install
endif

.PHONY: ${TARGETS} ${SUBDIRS}

all::

${TARGETS}::

clobber distclean:: clean

check::	js-pp
	./js-pp js-pp

install:: js-pp
	${INSTALL} -D js-pp ${BINDIR}/js-pp
	sed -i "s;\$${LIBDIR};${LIBDIR};g" ${BINDIR}/js-pp
	mkdir -p ${LIBDIR}
	cp -r js ${LIBDIR}/

uninstall::
	${RM} ${BINDIR}/js-pp
	${RM} -r ${LIBDIR}

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
