Return-Path: <virtio-comment-return-3450-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9DE969863EE
	for <virtio-comment@lists.oasis-open.org>; Tue, 20 Sep 2022 02:29:31 +0000 (UTC)
From: Sarthak Kukreti <sarthakkukreti@chromium.org>
Date: Mon, 19 Sep 2022 19:29:23 -0700
Message-Id: <20220920022923.106636-1-sarthakkukreti@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-blk: add provision feature to specification
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: virtio-comment@lists.oasis-open.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Daniel Verkamp <dverkamp@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This proposal extends virtio-blk protocol to support provision
requests, which act as a signal to the host to provision blocks
if the storage backend is thinly provisioned.

Introduced new feature flag and command type:
    VIRTIO_BLK_F_PROVISION
    VIRTIO_BLK_T_PROVISION

Given limited visibility into the provisioning state of the backend
storage, virtio-blk will report this feature to guest OS if the
storage backend is a file or if the storage backend reports support
for provisioning. virtio-blk will pass through provisioning requests
and delegate the handling to the storage backend.

Introduced new fields in virtio_blk_config for secure provision commands:
struct virtio_blk_config {
    ...
    max_provision_sectors;
    max_provision_seg;
};

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Suggested-by: Daniel Verkamp <dverkamp@chromium.org>
Signed-off-by: Sarthak Kukreti <sarthakkukreti@chromium.org>
---
 content.tex | 48 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/content.tex b/content.tex
index e863709..2c3cb60 100644
--- a/content.tex
+++ b/content.tex
@@ -4655,6 +4655,10 @@ \subsection{Feature bits}\label{sec:Device Types / B=
lock Device / Feature bits}
      maximum erase sectors count in \field{max_secure_erase_sectors} and
      maximum erase segment number in \field{max_secure_erase_seg}.
=20
+\item[VIRTIO_BLK_F_PROVISION (17)] Device supports provision command, maxi=
mum
+     provision sectors count in \field{max_provision_sectors} and maximum
+     segment number in \field{max_provision_seg}.
+
 \end{description}
=20
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Bl=
ock Device / Feature bits / Legacy Interface: Feature bits}
@@ -4685,7 +4689,9 @@ \subsection{Device configuration layout}\label{sec:De=
vice Types / Block Device /
 is expressed in 512-byte units if the VIRTIO_BLK_F_WRITE_ZEROES feature
 bit is negotiated. The parameters in the configuration space of the device
 \field{max_secure_erase_sectors} \field{secure_erase_sector_alignment} are=
 expressed
-in 512-byte units if the VIRTIO_BLK_F_SECURE_ERASE feature bit is negotiat=
ed.
+in 512-byte units if the VIRTIO_BLK_F_SECURE_ERASE feature bit is negotiat=
ed. The
+parameter in the configuration space of the device \field{max_provision_se=
ctors} is
+expressed in 512-byte units if the VIRTIO_BLK_F_PROVISION feature bit is n=
egotiated.
=20
 \begin{lstlisting}
 struct virtio_blk_config {
@@ -4721,6 +4727,8 @@ \subsection{Device configuration layout}\label{sec:De=
vice Types / Block Device /
         le32 max_secure_erase_sectors;
         le32 max_secure_erase_seg;
         le32 secure_erase_sector_alignment;
+        le32 max_provision_sectors;
+        le32 max_provision_seg;
 };
 \end{lstlisting}
=20
@@ -4784,6 +4792,11 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Block Device / Devic
     \field{secure_erase_sector_alignment} can be used by OS when splitting=
 a
     request based on alignment.
=20
+\item If the VIRTIO_BLK_F_PROVISION feature is negotiated,
+    \field{max_provision_sectors} and \field{max_provision_seg} can be rea=
d to
+    determine the maximum provision sectors and the maximum number of prov=
ision
+    segments for the block driver to use.
+
 \end{enumerate}
=20
 \drivernormative{\subsubsection}{Device Initialization}{Device Types / Blo=
ck Device / Device Initialization}
@@ -4852,8 +4865,8 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
 (VIRTIO_BLK_T_OUT), a discard (VIRTIO_BLK_T_DISCARD), a write zeroes
 (VIRTIO_BLK_T_WRITE_ZEROES), a flush (VIRTIO_BLK_T_FLUSH), a get device ID
 string command (VIRTIO_BLK_T_GET_ID), a secure erase
-(VIRTIO_BLK_T_SECURE_ERASE), or a get device lifetime command
-(VIRTIO_BLK_T_GET_LIFETIME).
+(VIRTIO_BLK_T_SECURE_ERASE), a provision (VIRTIO_BLK_T_PROVISION) or a get
+device lifetime command (VIRTIO_BLK_T_GET_LIFETIME).
=20
 \begin{lstlisting}
 #define VIRTIO_BLK_T_IN           0
@@ -4864,6 +4877,7 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
 #define VIRTIO_BLK_T_DISCARD      11
 #define VIRTIO_BLK_T_WRITE_ZEROES 13
 #define VIRTIO_BLK_T_SECURE_ERASE   14
+#define VIRTIO_BLK_T_PROVISION   15
 \end{lstlisting}
=20
 The \field{sector} number indicates the offset (multiplied by 512) where
@@ -4875,11 +4889,11 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Block Device / Device Ope
 requests write the contents of \field{data} to the block device (in multip=
les
 of 512 bytes).
=20
-The \field{data} used for discard, secure erase or write zeroes commands
-consists of one or more segments. The maximum number of segments is
+The \field{data} used for discard, provision, secure erase or write zeroes
+commands consists of one or more segments. The maximum number of segments =
is
 \field{max_discard_seg} for discard commands, \field{max_secure_erase_seg}=
 for
-secure erase commands and \field{max_write_zeroes_seg} for write zeroes
-commands.
+secure erase commands, \field{max_write_zeroes_seg} for write zeroes
+commands and \field{max_provision_seg} for provision commands.
 Each segment is of form:
=20
 \begin{lstlisting}
@@ -4895,9 +4909,9 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
=20
 \field{sector} indicates the starting offset (in 512-byte units) of the
 segment, while \field{num_sectors} indicates the number of sectors in each
-discarded range. \field{unmap} is only used in write zeroes commands and a=
llows
-the device to discard the specified range, provided that following reads r=
eturn
-zeroes.
+discarded or provisioned range. \field{unmap} is only used in write zeroes
+commands and allows the device to discard the specified range, provided
+that following reads return zeroes.
=20
 VIRTIO_BLK_T_GET_ID requests fetch the device ID string from the device in=
to
 \field{data}.  The device ID string is a NUL-padded ASCII string up to 20 =
bytes
@@ -4969,7 +4983,8 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
=20
 The length of \field{data} MUST be a multiple of the size of struct
 virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD,
-VIRTIO_BLK_T_SECURE_ERASE and VIRTIO_BLK_T_WRITE_ZEROES requests.
+VIRTIO_BLK_T_SECURE_ERASE, VIRTIO_BLK_T_WRITE_ZEROES and VIRTIO_BLK_T_PROV=
ISION
+requests.
=20
 The length of \field{data} MUST be 20 bytes for VIRTIO_BLK_T_GET_ID reques=
ts.
=20
@@ -4985,6 +5000,10 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Block Device / Device Ope
 \field{max_write_zeroes_seg} struct virtio_blk_discard_write_zeroes segmen=
ts in
 \field{data}.
=20
+VIRTIO_BLK_T_PROVISION requests MUST NOT contain more than
+\field{max_provision_seg} struct virtio_blk_discard_write_zeroes segments =
in
+\field{data}.
+
 If the VIRTIO_BLK_F_CONFIG_WCE feature is negotiated, the driver MAY
 switch to writethrough or writeback mode by writing respectively 0 and
 1 to the \field{writeback} field.  After writing a 0 to \field{writeback},
@@ -5011,8 +5030,8 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
 write any data.
=20
 The device MUST set the \field{status} byte to VIRTIO_BLK_S_UNSUPP for
-discard, secure erase and write zeroes commands if any unknown flag is set=
.
-Furthermore, the device MUST set the \field{status} byte to
+discard, provision, secure erase and write zeroes commands if any unknown =
flag
+is set. Furthermore, the device MUST set the \field{status} byte to
 VIRTIO_BLK_S_UNSUPP for discard commands if the \field{unmap} flag is set.
=20
 For discard commands, the device MAY deallocate the specified range of
@@ -5024,6 +5043,9 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
 is completed, reads of the specified ranges of sectors MUST return
 zeroes.  This is true independent of whether \field{unmap} was set or clea=
r.
=20
+For provision, the device MAY allocate the specified range of sectors in t=
he
+device backend storage, if the storage was thinly provisioned.
+
 The device SHOULD clear the \field{write_zeroes_may_unmap} field of the
 virtio configuration space if and only if a write zeroes request cannot
 result in deallocating one or more sectors.  The device MAY change the
--=20
2.37.3.968.ga6b4b080e4-goog


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

