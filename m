Return-Path: <yadong.qi@intel.com>
From: yadong.qi@intel.com
Subject: [PATCH v4] virtio-blk: add secure erase feature to specification
Date: Tue,  7 Dec 2021 09:22:22 +0800
Message-Id: <20211207012222.1308123-1-yadong.qi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: stefanha@redhat.com, hch@lst.de, cohuck@redhat.com, yadong.qi@intel.com, luhai.chen@intel.com, kai.z.wang@intel.com
List-ID: <virtio-comment.lists.oasis-open.org>

From: Yadong Qi <yadong.qi@intel.com>

There are user requests to use the Linux BLKSECDISCARD ioctl on
virtio-blk device. A secure discard is the same as a regular discard
except that all copies of the discarded blocks that were possibly
created by garbage collection must also be erased. This requires
support from the device. And "secure erase" is more commonly used
in industry to name this feature. Hence in this proposal, extend
virtio-blk protocol to support secure erase command.

Introduced new feature flag and command type:
    VIRTIO_BLK_F_SECURE_ERASE
    VIRTIO_BLK_T_SECURE_ERASE

This feature is a passthrough feature on backend because it is hard
to emulate a secure erase. So virtio-blk will report this feature
to guest OS if backend device support such kind of feature. And
when guest OS issues a secure erase command, backend driver will
passthrough the command to host device blocks.

Introduced new fileds in virtio_blk_config for secure erase commands:
struct virtio_blk_config {
    ...
    max_secure_erase_sectors;
    max_secure_erase_seg;
    secure_erase_sector_alignment;
};

v1 -> v2:
- add separated queue limits for secure discard.

v2 -> v3:
- reword "secure discard" to "secure erase".
- adjust offset of new fields

v3 -> v4
- unify the wording to "secure erase"

Signed-off-by: Yadong Qi <yadong.qi@intel.com>
---
 content.tex | 41 +++++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/content.tex b/content.tex
index 5d112af..d380c51 100644
--- a/content.tex
+++ b/content.tex
@@ -4435,6 +4435,11 @@ \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
 
 \item[VIRTIO_BLK_F_LIFETIME (15)] Device supports providing storage lifetime
      information.
+
+\item[VIRTIO_BLK_F_SECURE_ERASE (16)] Device supports secure erase command,
+     maximum erase sectors count in \field{max_secure_erase_sectors} and
+     maximum erase segment number in \field{max_secure_erase_seg}.
+
 \end{description}
 
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Block Device / Feature bits / Legacy Interface: Feature bits}
@@ -4463,7 +4468,9 @@ \subsection{Device configuration layout}\label{sec:Device Types / Block Device /
 \field{discard_sector_alignment} are expressed in 512-byte units if the
 VIRTIO_BLK_F_DISCARD feature bit is negotiated. The \field{max_write_zeroes_sectors}
 is expressed in 512-byte units if the VIRTIO_BLK_F_WRITE_ZEROES feature
-bit is negotiated.
+bit is negotiated. The parameters in the configuration space of the device
+\field{max_secure_erase_sectors} \field{secure_erase_sector_alignment} are expressed
+in 512-byte units if the VIRTIO_BLK_F_SECURE_ERASE feature bit is negotiated.
 
 \begin{lstlisting}
 struct virtio_blk_config {
@@ -4496,6 +4503,9 @@ \subsection{Device configuration layout}\label{sec:Device Types / Block Device /
         le32 max_write_zeroes_seg;
         u8 write_zeroes_may_unmap;
         u8 unused1[3];
+        le32 max_secure_erase_sectors;
+        le32 max_secure_erase_seg;
+        le32 secure_erase_sector_alignment;
 };
 \end{lstlisting}
 
@@ -4552,6 +4562,13 @@ \subsection{Device Initialization}\label{sec:Device Types / Block Device / Devic
 \item If the VIRTIO_BLK_F_MQ feature is negotiated, \field{num_queues} field
     can be read to determine the number of queues.
 
+\item If the VIRTIO_BLK_F_SECURE_ERASE feature is negotiated,
+    \field{max_secure_erase_sectors} and \field{max_secure_erase_seg} can be read
+    to determine the maximum secure erase sectors and maximum number of
+    secure erase segments for the block driver to use.
+    \field{secure_erase_sector_alignment} can be used by OS when splitting a
+    request based on alignment.
+
 \end{enumerate}
 
 \drivernormative{\subsubsection}{Device Initialization}{Device Types / Block Device / Device Initialization}
@@ -4619,7 +4636,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 The type of the request is either a read (VIRTIO_BLK_T_IN), a write
 (VIRTIO_BLK_T_OUT), a discard (VIRTIO_BLK_T_DISCARD), a write zeroes
 (VIRTIO_BLK_T_WRITE_ZEROES), a flush (VIRTIO_BLK_T_FLUSH), a get device ID
-string command (VIRTIO_BLK_T_GET_ID), or a get device lifetime command
+string command (VIRTIO_BLK_T_GET_ID), a secure erase
+(VIRTIO_BLK_T_SECURE_ERASE), or a get device lifetime command
 (VIRTIO_BLK_T_GET_LIFETIME).
 
 \begin{lstlisting}
@@ -4630,6 +4648,7 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 #define VIRTIO_BLK_T_GET_LIFETIME 10
 #define VIRTIO_BLK_T_DISCARD      11
 #define VIRTIO_BLK_T_WRITE_ZEROES 13
+#define VIRTIO_BLK_T_SECURE_ERASE   14
 \end{lstlisting}
 
 The \field{sector} number indicates the offset (multiplied by 512) where
@@ -4641,9 +4660,11 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 requests write the contents of \field{data} to the block device (in multiples
 of 512 bytes).
 
-The \field{data} used for discard or write zeroes commands consists of one or
-more segments.  The maximum number of segments is \field{max_discard_seg} for
-discard commands and \field{max_write_zeroes_seg} for write zeroes commands.
+The \field{data} used for discard, secure erase or write zeroes commands
+consists of one or more segments. The maximum number of segments is
+\field{max_discard_seg} for discard commands, \field{max_secure_erase_seg} for
+secure erase commands and \field{max_write_zeroes_seg} for write zeroes
+commands.
 Each segment is of form:
 
 \begin{lstlisting}
@@ -4729,8 +4750,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 and VIRTIO_BLK_T_OUT requests.
 
 The length of \field{data} MUST be a multiple of the size of struct
-virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD and
-VIRTIO_BLK_T_WRITE_ZEROES requests.
+virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD,
+VIRTIO_BLK_T_SECURE_ERASE and VIRTIO_BLK_T_WRITE_ZEROES requests.
 
 The length of \field{data} MUST be 20 bytes for VIRTIO_BLK_T_GET_ID requests.
 
@@ -4738,6 +4759,10 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 \field{max_discard_seg} struct virtio_blk_discard_write_zeroes segments in
 \field{data}.
 
+VIRTIO_BLK_T_SECURE_ERASE requests MUST NOT contain more than
+\field{max_secure_erase_seg} struct virtio_blk_discard_write_zeroes segments in
+\field{data}.
+
 VIRTIO_BLK_T_WRITE_ZEROES requests MUST NOT contain more than
 \field{max_write_zeroes_seg} struct virtio_blk_discard_write_zeroes segments in
 \field{data}.
@@ -4764,7 +4789,7 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 write any data.
 
 The device MUST set the \field{status} byte to VIRTIO_BLK_S_UNSUPP for
-discard and write zeroes commands if any unknown flag is set.
+discard, secure erase and write zeroes commands if any unknown flag is set.
 Furthermore, the device MUST set the \field{status} byte to
 VIRTIO_BLK_S_UNSUPP for discard commands if the \field{unmap} flag is set.
 
-- 
2.25.1

