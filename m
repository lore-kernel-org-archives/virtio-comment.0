Return-Path: <virtio-comment-return-2380-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 858D8986298
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Nov 2021 02:48:17 +0000 (UTC)
From: yadong.qi@intel.com
Date: Wed, 24 Nov 2021 10:47:57 +0800
Message-Id: <20211124024757.742884-1-yadong.qi@intel.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2] virtio-blk: add secure discard feature to specification
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: stefanha@redhat.com, hch@lst.de, yadong.qi@intel.com, luhai.chen@intel.com, kai.z.wang@intel.com
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

Introduced new fileds in virtio_blk_config for secure discard commands
to separate with discard commands:
struct virtio_blk_config {
    ...
    max_secdiscard_sectors;
    max_secdiscard_seg;
    secdiscard_sector_alignment;
    ...
};

v1 -> v2:
- add separated queue limits for secure discard.

Signed-off-by: Yadong Qi <yadong.qi@intel.com>
---
 content.tex | 41 +++++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/content.tex b/content.tex
index 5d112af..686389b 100644
--- a/content.tex
+++ b/content.tex
@@ -4435,6 +4435,11 @@ \subsection{Feature bits}\label{sec:Device Types / B=
lock Device / Feature bits}
=20
 \item[VIRTIO_BLK_F_LIFETIME (15)] Device supports providing storage lifeti=
me
      information.
+
+\item[VIRTIO_BLK_F_SECDISCARD (16)] Device can support secure discard comm=
and,
+    maximum discard sectors size in \field{max_secdiscard_sectors} and max=
imum
+    discard segment number in \field{max_secdiscard_seg}.
+
 \end{description}
=20
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Bl=
ock Device / Feature bits / Legacy Interface: Feature bits}
@@ -4463,7 +4468,9 @@ \subsection{Device configuration layout}\label{sec:De=
vice Types / Block Device /
 \field{discard_sector_alignment} are expressed in 512-byte units if the
 VIRTIO_BLK_F_DISCARD feature bit is negotiated. The \field{max_write_zeroe=
s_sectors}
 is expressed in 512-byte units if the VIRTIO_BLK_F_WRITE_ZEROES feature
-bit is negotiated.
+bit is negotiated. The parameters in the configuration space of the device
+\field{max_secdiscard_sectors} \field{secdiscard_sector_aligment} are expr=
essed
+in 512-byte units if the VIRTIO_BLK_F_SECDISCARD feature bit is negotiated=
.
=20
 \begin{lstlisting}
 struct virtio_blk_config {
@@ -4494,6 +4501,9 @@ \subsection{Device configuration layout}\label{sec:De=
vice Types / Block Device /
         le32 discard_sector_alignment;
         le32 max_write_zeroes_sectors;
         le32 max_write_zeroes_seg;
+        le32 max_secdiscard_sectors;
+        le32 max_secdiscard_seg;
+        le32 secdiscard_sector_alignment;
         u8 write_zeroes_may_unmap;
         u8 unused1[3];
 };
@@ -4552,6 +4562,13 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Block Device / Devic
 \item If the VIRTIO_BLK_F_MQ feature is negotiated, \field{num_queues} fie=
ld
     can be read to determine the number of queues.
=20
+\item If the VIRTIO_BLK_F_SECDISCARD feature is negotiated,
+    \field{max_secdiscard_sectors} and \field{max_secdiscard_seg} can be r=
ead
+    to determine the maximum secure discard sectors and maximum number of
+    secure discard segments for the block driver to use.
+    \field{secdiscard_sector_alignment} can be used by OS when splitting a
+    request based on alignment.
+
 \end{enumerate}
=20
 \drivernormative{\subsubsection}{Device Initialization}{Device Types / Blo=
ck Device / Device Initialization}
@@ -4619,7 +4636,8 @@ \subsection{Device Operation}\label{sec:Device Types =
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
@@ -4630,6 +4648,7 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
 #define VIRTIO_BLK_T_GET_LIFETIME 10
 #define VIRTIO_BLK_T_DISCARD      11
 #define VIRTIO_BLK_T_WRITE_ZEROES 13
+#define VIRTIO_BLK_T_SECDISCARD   14
 \end{lstlisting}
=20
 The \field{sector} number indicates the offset (multiplied by 512) where
@@ -4641,9 +4660,11 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Block Device / Device Ope
 requests write the contents of \field{data} to the block device (in multip=
les
 of 512 bytes).
=20
-The \field{data} used for discard or write zeroes commands consists of one=
 or
-more segments.  The maximum number of segments is \field{max_discard_seg} =
for
-discard commands and \field{max_write_zeroes_seg} for write zeroes command=
s.
+The \field{data} used for discard, secure discard or write zeroes commands
+consists of one or more segments. The maximum number of segments is
+\field{max_discard_seg} for discard commands, \field{max_secdiscard_seg} f=
or
+secure discard commands and \field{max_write_zeroes_seg} for write zeroes
+commands.
 Each segment is of form:
=20
 \begin{lstlisting}
@@ -4729,8 +4750,8 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
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
@@ -4738,6 +4759,10 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Block Device / Device Ope
 \field{max_discard_seg} struct virtio_blk_discard_write_zeroes segments in
 \field{data}.
=20
+VIRTIO_BLK_T_SECDISCARD requests MUST NOT contain more than
+\field{max_secdiscard_seg} struct virtio_blk_discard_write_zeroes segments=
 in
+\field{data}.
+
 VIRTIO_BLK_T_WRITE_ZEROES requests MUST NOT contain more than
 \field{max_write_zeroes_seg} struct virtio_blk_discard_write_zeroes segmen=
ts in
 \field{data}.
@@ -4764,7 +4789,7 @@ \subsection{Device Operation}\label{sec:Device Types =
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

