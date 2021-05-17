
RC = .zshrcc
CFGDIR = ${HOME}/.config/d-zsh

install:
	@mkdir -p ${CFGDIR}
	cp -R ./ ${CFGDIR}/
	rm ${CFGDIR}/Makefile
	echo "source "${CFGDIR}/init.zsh >> ${HOME}/${RC}
	source ${HOME}/${RC}
	
clean:
	rm -rf ${CFGDIR}

.PHONY: clean
