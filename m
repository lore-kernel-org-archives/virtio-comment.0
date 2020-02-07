Return-Path: virtio-comment-return-1054-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DC178986105
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Feb 2020 07:40:52 +0000 (UTC)
From: David Stevens <stevensd@chromium.org>
Date: Fri,  7 Feb 2020 16:40:32 +0900
Message-Id: <20200207074033.172289-2-stevensd@chromium.org>
In-Reply-To: <20200207074033.172289-1-stevensd@chromium.org>
References: <20200207074033.172289-1-stevensd@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v3 1/2] content: define what an exported object is
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dylan Reid <dgreid@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Zach Reizner <zachr@chromium.org>, Keiichi Watanabe <keiichiw@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, Alex Lau <alexlau@chromium.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Pawel Osciak <posciak@chromium.org>, Gurchetan Singh <gurchetansingh@chromium.org>, Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, David Stevens <stevensd@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Define a mechanism for sharing objects between different virtio
devices.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 content.tex      | 12 ++++++++++++
 introduction.tex |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/content.tex b/content.tex
index b1ea9b9..ad3723c 100644
--- a/content.tex
+++ b/content.tex
@@ -373,6 +373,18 @@ \section{Driver Notifications} \label{sec:Virtqueues /=
 Driver notifications}
=20
 \input{shared-mem.tex}
=20
+\section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device =
/ Exporting Objects}
+
+When an object created by one virtio device needs to be
+shared with a seperate virtio device, the first device can
+export the object by generating a UUID which can then
+be passed to the second device to identify the object.
+
+What constitutes an object, how to export objects, and
+how to import objects are defined by the individual device
+types. It is RECOMMENDED that devices generate version 4
+UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
+
 \chapter{General Initialization And Device Operation}\label{sec:General In=
itialization And Device Operation}
=20
 We start with an overview of device initialization, then expand on the
diff --git a/introduction.tex b/introduction.tex
index 40f16f8..fc2aa50 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -40,6 +40,10 @@ \section{Normative References}\label{sec:Normative Refer=
ences}
 =09\phantomsection\label{intro:rfc2119}\textbf{[RFC2119]} &
 Bradner S., ``Key words for use in RFCs to Indicate Requirement
 Levels'', BCP 14, RFC 2119, March 1997. \newline\url{http://www.ietf.org/r=
fc/rfc2119.txt}\\
+=09\phantomsection\label{intro:rfc4122}\textbf{[RFC4122]} &
+Leach, P., Mealling, M., and R. Salz, ``A Universally Unique
+IDentifier (UUID) URN Namespace'', RFC 4122, DOI 10.17487/RFC4122,
+July 2005. \newline\url{http://www.ietf.org/rfc/rfc4122.txt}\\
 =09\phantomsection\label{intro:S390 PoP}\textbf{[S390 PoP]} & z/Architectu=
re Principles of Operation, IBM Publication SA22-7832, \newline\url{http://=
publibfi.boulder.ibm.com/epubs/pdf/dz9zr009.pdf}, and any future revisions\=
\
 =09\phantomsection\label{intro:S390 Common I/O}\textbf{[S390 Common I/O]} =
& ESA/390 Common I/O-Device and Self-Description, IBM Publication SA22-7204=
, \newline\url{http://publibfp.dhe.ibm.com/cgi-bin/bookmgr/BOOKS/dz9ar501/C=
CONTENTS}, and any future revisions\\
 =09\phantomsection\label{intro:PCI}\textbf{[PCI]} &
--=20
2.25.0.341.g760bfbb309-goog


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

