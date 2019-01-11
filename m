Return-Path: virtio-comment-return-582-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F808985DC7
	for <virtio-comment@lists.oasis-open.org>; Fri, 11 Jan 2019 11:42:11 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Date: Fri, 11 Jan 2019 11:42:00 +0000
Message-Id: <20190111114200.10026-4-dgilbert@redhat.com>
In-Reply-To: <20190111114200.10026-1-dgilbert@redhat.com>
References: <20190111114200.10026-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH 3/3] shared memory: Define mmio registers
To: virtio-comment@lists.oasis-open.org
Cc: stefanha@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Define an MMIO interface to enumerate and map shared
memory regions.

Note: This hasn't been implemented, I also worrying it's using
too much of the register address space.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 content.tex | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/content.tex b/content.tex
index 776162a..e2435ff 100644
--- a/content.tex
+++ b/content.tex
@@ -1641,6 +1641,33 @@ All register values are organized as Little Endian.
     selected by writing to \field{QueueSel}.
   }
   \hline 
+  \mmioreg{SHMSel}{Shared memory region select}{0x0b0}{W}{%
+    Writing to this register selects the shared memory region \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions}
+    following operations on \field{SHMId}, \field{SHMLenLow}, \field{SHMLenHigh},
+    \field{SHMBaseLow} and \field{SHMBaseHigh} apply to. The index
+    number of the first region is zero (0x0); note that it is a
+    simple index that does not correspond to the \field{id}.
+  }
+  \hline 
+  \mmioreg{SHMId}{Shared memory id}{0x0b4}{R}{%
+    This register returns the id value of the selected shared
+    memory region.
+  }
+  \hline 
+  \mmiodreg{SHMLenLow}{SHMLenHigh}{Shared memory region 64 bit long length}{0x0b8}{0x0xbc}{R}{%
+    These registers return the length of the shared memory
+    region, as defined by the device for the region selected by
+    the \field{SHMSel} register.  Reading from a non-existent
+    region (i.e. a too large \field{SHMSel} value) results in a
+    length of -1.  This should be used to enumerate the list of
+    regions.
+  }
+  \hline 
+  \mmiodreg{SHMBaseLow}{SHMBaseHigh}{Shared memory region 64 bit long physical address}{0x0c0}{0x0xc4}{W}{%
+    The driver writes these registers to indicate where it wishes
+    the device to map the shared memory region currently selected.
+  }
+  \hline 
   \mmioreg{ConfigGeneration}{Configuration atomicity value}{0x0fc}{R}{
     Reading from this register returns a value describing a version of the device-specific configuration space (see \field{Config}).
     The driver can then access the configuration space and, when finished, read \field{ConfigGeneration} again.
@@ -1676,6 +1703,9 @@ driver seeing an inconsistent configuration state.
 
 The device MUST NOT access virtual queue contents when \field{QueueReady} is zero (0x0).
 
+The device MUST NOT respond to SHM Base writes for none-existent
+shared memory regions.
+
 \drivernormative{\subsubsection}{MMIO Device Register Layout}{Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}
 The driver MUST NOT access memory locations not described in the
 table \ref{tab:Virtio Trasport Options / Virtio Over MMIO / MMIO Device Register Layout}
@@ -1730,6 +1760,13 @@ If both values are valid, it MUST read \field{DeviceID}
 and if its value is zero (0x0) MUST abort initialization and
 MUST NOT access any other register.
 
+Devices expecting shared memory regions MUST enumerate the
+regions by selecting each region in tern and checking that the
+length is not -1.
+
+Devices not expecting shared memory MUST NOT use the shared
+memory registers.
+
 Further initialization MUST follow the procedure described in
 \ref{sec:General Initialization And Device Operation / Device Initialization}~\nameref{sec:General Initialization And Device Operation / Device Initialization}.
 
-- 
2.20.1


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

