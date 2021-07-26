Return-Path: <virtio-comment-return-2063-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2017F9863F9
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jul 2021 16:39:06 +0000 (UTC)
From: Gaetan Harter <gaetan.harter@opensynergy.com>
Date: Mon, 26 Jul 2021 18:38:50 +0200
Message-Id: <20210726163850.201851-4-gaetan.harter@opensynergy.com>
In-Reply-To: <20210726163850.201851-1-gaetan.harter@opensynergy.com>
References: <20210726163850.201851-1-gaetan.harter@opensynergy.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 3/3] virtio-crypto: fix missing verb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org
Cc: Gaetan Harter <gaetan.harter@opensynergy.com>
List-ID: <virtio-comment.lists.oasis-open.org>

The condition was incomplete "guarantee the size IS within the max_len".

Signed-off-by: Gaetan Harter <gaetan.harter@opensynergy.com>
---
 virtio-crypto.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/virtio-crypto.tex b/virtio-crypto.tex
index 4a15e14..0d1d832 100644
--- a/virtio-crypto.tex
+++ b/virtio-crypto.tex
@@ -275,13 +275,13 @@ \subsection{Device configuration layout}\label{sec:De=
vice Types / Crypto Device
 \item The driver MUST read the detailed algorithms fields based on \field{=
crypto_services} field.
 \item The driver SHOULD read \field{max_size} to discover the maximum size=
 of the variable-length
     parameters of data operation of the crypto request's content the devic=
e supports and MUST
-    guarantee the size of each crypto request's content within the \field{=
max_size}, otherwise
+    guarantee the size of each crypto request's content is within the \fie=
ld{max_size}, otherwise
     the request will fail and the driver MUST reset the device.
 \item The driver SHOULD read \field{max_cipher_key_len} to discover the ma=
ximum length of cipher key
-    the device supports and MUST guarantee the \field{key_len} (CIPHER ser=
vice or AEAD service) within
+    the device supports and MUST guarantee the \field{key_len} (CIPHER ser=
vice or AEAD service) is within
     the \field{max_cipher_key_len} of the device configuration, otherwise =
the request will fail.
 \item The driver SHOULD read \field{max_auth_key_len} to discover the maxi=
mum length of authenticated
-    key the device supports and MUST guarantee the \field{auth_key_len} (M=
AC service) within the
+    key the device supports and MUST guarantee the \field{auth_key_len} (M=
AC service) is within the
     \field{max_auth_key_len} of the device configuration, otherwise the re=
quest will fail.
 \end{itemize*}

--
2.25.1


Please mind our privacy notice<https://www.opensynergy.com/datenschutzerkla=
erung/privacy-notice-for-business-partners-pursuant-to-article-13-of-the-ge=
neral-data-protection-regulation-gdpr/> pursuant to Art. 13 GDPR. // Unsere=
 Hinweise zum Datenschutz gem. Art. 13 DSGVO finden Sie hier.<https://www.o=
pensynergy.com/de/datenschutzerklaerung/datenschutzhinweise-fuer-geschaefts=
partner-gem-art-13-dsgvo/>

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

