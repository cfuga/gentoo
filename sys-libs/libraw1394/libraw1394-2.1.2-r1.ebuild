# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib-minimal

DESCRIPTION="Library that provides direct access to the IEEE 1394 bus"
HOMEPAGE="https://ieee1394.wiki.kernel.org/"
SRC_URI="https://www.kernel.org/pub/linux/libs/ieee1394/${P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~loong ~mips ppc ppc64 ~riscv sparc x86"
IUSE="valgrind"

DEPEND="valgrind? ( dev-debug/valgrind )"

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf \
		--disable-static \
		$(use_with valgrind)
}

multilib_src_install_all() {
	einstalldocs
	find "${D}" -name '*.la' -type f -delete || die
}
