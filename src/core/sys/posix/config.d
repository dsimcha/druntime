/**
 * D header file for POSIX.
 *
 * Copyright: Copyright Sean Kelly 2005 - 2009.
 * License:   <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
 * Authors:   Sean Kelly
 * Standards: The Open Group Base Specifications Issue 6, IEEE Std 1003.1, 2004 Edition
 */

/*          Copyright Sean Kelly 2005 - 2009.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module core.sys.posix.config;

public import core.stdc.config;

extern (C):

version (Posix)
{
    enum _XOPEN_SOURCE     = 600;
    enum _POSIX_C_SOURCE   = 200112L;
}

version (linux)
{
    // man 7 feature_test_macros
    // http://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.html
    enum _GNU_SOURCE         = false;
    enum _BSD_SOURCE         = false;
    enum _SVID_SOURCE        = false;

    enum _FILE_OFFSET_BITS   = 64;
    // <sys/cdefs.h>
    enum __REDIRECT          = false;

    // deduced <features.h>
    enum __USE_FILE_OFFSET64 = _FILE_OFFSET_BITS == 64;
    enum __USE_LARGEFILE     = __USE_FILE_OFFSET64 && !__REDIRECT;
    enum __USE_LARGEFILE64   = __USE_FILE_OFFSET64 && !__REDIRECT;

    enum __USE_XOPEN2K       = _XOPEN_SOURCE >= 600;
    enum __USE_XOPEN2KXSI    = _XOPEN_SOURCE >= 600;
    enum __USE_XOPEN2K8      = _XOPEN_SOURCE >= 700;
    enum __USE_XOPEN2K8XSI   = _XOPEN_SOURCE >= 700;

    enum __USE_GNU           = _GNU_SOURCE;
    enum __USE_MISC          = _BSD_SOURCE || _SVID_SOURCE;

    version(D_LP64)
        enum __WORDSIZE=64;
    else
        enum __WORDSIZE=32;
}
