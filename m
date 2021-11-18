Return-Path: <virtio-comment-return-2358-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A15DC9864C4
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 Nov 2021 02:57:49 +0000 (UTC)
From: yadong.qi@intel.com
Date: Thu, 18 Nov 2021 10:57:41 +0800
Message-Id: <20211118025741.230748-1-yadong.qi@intel.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-blk: add secure discard feature to specification
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: yadong.qi@intel.com, luhai.chen@intel.com, kai.z.wang@intel.com
List-ID: <virtio-comment.lists.oasis-open.org>

From: Yadong Qi <yadong.qi@intel.com>

There are user requests to use BLKSECDISCARD on virtio-blk device.
Hence in this proposal, extend virtio-blk protocol to support secure
discard command.

Introduced new feature flag and command type:
    VIRTIO_BLK_F_SECDISCARD
    VIRTIO_BLK_T_SECDISCARD

This feature is a passthrough feature on backend because it is hard
to emulate a secure discard. So virtio-blk will report this feature
to guest OS if backend device support such kind of feature. And
when guest OS issues a secure discard command, backend driver will
passthrough the command to host device blocks.

Signed-off-by: Yadong Qi <yadong.qi@intel.com>
---
 content.tex | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/content.tex b/content.tex
index 5d112af..305c51f 100644
--- a/content.tex
+++ b/content.tex
@@ -4435,6 +4435,13 @@ \subsection{Feature bits}\label{sec:Device Types / B=
lock Device / Feature bits}
=20
 \item[VIRTIO_BLK_F_LIFETIME (15)] Device supports providing storage lifeti=
me
      information.
+
+\item[VIRTIO_BLK_F_SECDISCARD (16)] Device can support secure discard comm=
and,
+    share the same maximum discard sectors size and discard segment number=
 with
+    VIRTIO_BLK_F_DISCARD. Maximum discard sectors size in
+    \field{max_discard_sectors} and maximum discard segment number in
+    \field{max_discard_seg}.
+
 \end{description}
=20
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Bl=
ock Device / Feature bits / Legacy Interface: Feature bits}
@@ -4619,7 +4626,8 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
 The type of the request is either a read (VIRTIO_BLK_T_IN), a write
 (VIRTIO_BLK_T_OUT), a discard (VIRTIO_BLK_T_DISCARD), a write zeroes
 (VIRTIO_BLK_T_WRITE_ZEROES), a flush (VIRTIO_BLK_T_FLUSH), a get device ID
-string command (VIRTIO_BLK_T_GET_ID), or a get device lifetime command
+string command (VIRTIO_BLK_T_GET_ID), a secure discard
+(VIRTIO_BLK_T_SECDISCARD), or a get device lifetime command
 (VIRTIO_BLK_T_GET_LIFETIME).
=20
 \begin{lstlisting}
@@ -4630,6 +4638,7 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
 #define VIRTIO_BLK_T_GET_LIFETIME 10
 #define VIRTIO_BLK_T_DISCARD      11
 #define VIRTIO_BLK_T_WRITE_ZEROES 13
+#define VIRTIO_BLK_T_SECDISCARD   14
 \end{lstlisting}
=20
 The \field{sector} number indicates the offset (multiplied by 512) where
@@ -4729,13 +4738,13 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Block Device / Device Ope
 and VIRTIO_BLK_T_OUT requests.
=20
 The length of \field{data} MUST be a multiple of the size of struct
-virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD and
-VIRTIO_BLK_T_WRITE_ZEROES requests.
+virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD,
+VIRTIO_BLK_T_SECDISCARD and VIRTIO_BLK_T_WRITE_ZEROES requests.
=20
 The length of \field{data} MUST be 20 bytes for VIRTIO_BLK_T_GET_ID reques=
ts.
=20
-VIRTIO_BLK_T_DISCARD requests MUST NOT contain more than
-\field{max_discard_seg} struct virtio_blk_discard_write_zeroes segments in
+VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_SECDISCARD requests MUST NOT contain=
 more
+than \field{max_discard_seg} struct virtio_blk_discard_write_zeroes segmen=
ts in
 \field{data}.
=20
 VIRTIO_BLK_T_WRITE_ZEROES requests MUST NOT contain more than
@@ -4764,7 +4773,7 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
 write any data.
=20
 The device MUST set the \field{status} byte to VIRTIO_BLK_S_UNSUPP for
-discard and write zeroes commands if any unknown flag is set.
+discard, secure discard and write zeroes commands if any unknown flag is s=
et.
 Furthermore, the device MUST set the \field{status} byte to
 VIRTIO_BLK_S_UNSUPP for discard commands if the \field{unmap} flag is set.
=20
--=20
2.25.1


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

