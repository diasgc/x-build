#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='librabbitmq'
dsc='RabbitMQ C client'
lic='MIT License'
src="https://github.com/alanxz/rabbitmq-c.git"
cfg='cmake'

dev_bra='master'
dev_vrs='0.15.0'
eta='20'
pkg_deb='librabbitmq-dev'

lst_inc='amqp.h amqp_framing.h amqp_tcp_socket.h amqp_ssl_socket.h rabbitmq-c/*.h'
lst_lib='librabbitmq'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='librabbitmq.pc'



. xbuild && start