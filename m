Return-Path: virtio-comment-return-1547-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E2E8E9865D1
	for <virtio-comment@lists.oasis-open.org>; Fri,  4 Dec 2020 05:46:26 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
Date: Fri,  4 Dec 2020 13:46:15 +0800
Message-Id: <20201204054615.26124-1-jasowang@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH] virtio-pci: introduce device state capability
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org, mst@redhat.com
Cc: eperezma@redhat.com, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This patch tries to introduce device state capability in order to be
self virtualized. One possible user is the support of live migration.

The minimal requirements for achieving are:

- The ability to pause and resume the the datapath. This patch choose
  to do this per virtqueue via a dedicated rw field queue_status to do
  this. Driver may choose to write 0 to stop a queue and device can
  only advertise the stop when it completes all the inflight
  descriptors.
- The ability to set and get the device internal ring state. As an RFC
  this patch only introduce the last_avail_idx field for split
  ring. We could extend it to support packed ring (e.g with the wrap
  counters).

We probably need a new feature bit for advertising this new feature
but this draft should be sufficient for starting the discussion.

Several other choices:

1) allow writing 0 to queue_enable when the new feature is negotiated
2) reuse the common structure for queue index save and restore
3) introduce new virtio device status to stop/resume the whole device

Please share your thoughts.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 content.tex | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/content.tex b/content.tex
index 61eab41..7cdb66a 100644
--- a/content.tex
+++ b/content.tex
@@ -705,6 +705,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{se=
c:Virtio Transport Option
 #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
 /* Vendor-specific data */
 #define VIRTIO_PCI_CAP_VENDOR_CFG        9
+/* Device state */
+#define VIRTIO_PCI_CAP_DEVICE_STATE_CFG        10
 \end{lstlisting}
=20
         Any other value is reserved for future use.
@@ -1247,6 +1249,55 @@ \subsubsection{PCI configuration access capability}\=
label{sec:Virtio Transport O
 specified by some other Virtio Structure PCI Capability
 of type other than \field{VIRTIO_PCI_CAP_PCI_CFG}.
=20
+\subsubsection{Device State capability}\label{sec:Virtio Transport Options=
 / Virtio Over PCI Bus / PCI Device Layout / Device state capability}
+
+The device state structure is found at the \field{bar} and \field{offset} =
within the VIRTIO_PCI_CAP_DEVICE_STATE_CFG capability; its layout is below.
+
+\begin{lstlisting}
+struct virtio_pci_device_state {
+        /* About a specific virtqueue. */
+        le16 queue_select;              /* read-write */
+        le16 last_avail_idx;            /* read-write */
+        u8 queue_status;                /* read-write */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{queue_select}]
+        Queue Select. The driver selects which virtqueue the following
+        fields refer to.
+
+\item[\field{last_avail_idx}]
+        Last avail index for this virtqueue that is used by the device.
+
+\item[\field{queue_status}]
+        The driver uses this to stop the executing request for this virtqu=
eue.
+        1 - running; 0 - stopped.
+\end{description}
+
+\devicenormative{\paragraph}{PCI Device State capability}{Virtio Transport=
 Options / Virtio Over PCI Bus / PCI Device Layout / PCI Device State capab=
ility}
+
+The device MUST present a 0 in \field{queue_status} on reset.
+
+The device MUST present a 1 in \field{queue_status} upon writing 1
+to \field{queue_enable} from common configuration structure by driver.
+
+The device MUST complete all inflight requests before presenting a 0
+in \field{queue_status}.
+
+The device MUST ignore the write to \field{queue_status} if the
+virtqueue is unavailable when the value \field{queue_enable} is zero
+from common configuration structure.
+
+\drivernormative{\paragraph}{PCI Device State capability}{Virtio Transport=
 Options / Virtio Over PCI Bus / PCI Device Layout / PCI Device State capab=
ility}
+
+To stop using the queue the driver MUST write zero (0x0) to this
+\field{queue_status} and MUST read the value back to ensure
+synchronization.
+
+The driver MUST NOT access \field{last_avail_idx} when
+\field{queue_status} is not zero.
+
 \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:V=
irtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Legacy =
Interfaces: A Note on PCI Device Layout}
=20
 Transitional devices MUST present part of configuration
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

