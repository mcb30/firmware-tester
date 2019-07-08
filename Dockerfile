FROM fedora

RUN dnf update -y \
    && dnf install -y \
	arm-none-eabi-gcc \
	arm-none-eabi-newlib \
	avr-gcc \
	avr-libc \
	findutils \
	git-core \
	make \
	srecord \
    && dnf clean all
