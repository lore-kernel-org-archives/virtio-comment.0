Return-Path: <virtio-comment-return-3327-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C798998649D
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 Aug 2022 10:02:32 +0000 (UTC)
From: Zhu Lingshan <lingshan.zhu@intel.com>
Date: Fri,  5 Aug 2022 17:53:40 +0800
Message-Id: <20220805095343.486546-2-lingshan.zhu@intel.com>
In-Reply-To: <20220805095343.486546-1-lingshan.zhu@intel.com>
References: <20220805095343.486546-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH V3 RESEND 1/4] Introduce virito transport virtqueue
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio-comment@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This commit introduces transport virtqueue as a new transport
layer for virtio devices. And the format of the commands
through the transport virtqueue is defined as well.

We also give examples for the management devices and the
managed devices.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex      | 81 ++++++++++++++++++++++++++++++++++++++++++++++++
 introduction.tex |  3 ++
 2 files changed, 84 insertions(+)

diff --git a/content.tex b/content.tex
index e863709..c747d21 100644
--- a/content.tex
+++ b/content.tex
@@ -2895,6 +2895,87 @@ \subsubsection{Resetting Devices}\label{sec:Virtio T=
ransport Options / Virtio ov
 MAY also choose to verify reset completion by reading \field{device status=
} via
 CCW_CMD_READ_STATUS and checking whether it is 0 afterwards.
=20
+\section{Virtio Over Transport Virtqueue}\label{sec:Virtio Transport Optio=
ns Virtio Over Transport Virtqueue}
+
+In some cases, it is challenging to implement a virtio device in a transpo=
rt specific method.
+
+One example is that a physical device may try to present multiple managed =
(maybe virtual) devices
+with limited transport specific resources.
+
+Another example is to implement managed devices which are transport indepe=
ndent.
+
+In those cases, a transport virtqueue could be used as the transport layer=
 to
+implement virtio managed device.
+
+\subsection{Basic Concepts}\label{sec:Virtio Transport Options / Virtio ov=
er Transport Virtqueue / Basic Concepts}
+
+Feature bit VIRTIO_F_TRANSPT_VQ indicates that a device offers a transport=
 virtqueue,
+and the managed devices are created, destroyed and configured through the =
transport virtqueue.
+
+\subsubsection{The Management Device}\label{sec:Virtio Transport Options /=
 Virtio over Transport Virtqueue / Basic Concepts / The Management Device}
+
+A device that offers feature bit VIRTIO_F_TRANSPT_VQ and a transport virtq=
ueue is a management device.
+It processes the commands through the transport virtqueue commands.
+
+For example, a PCIe device with a transport virtqueue is a management devi=
ce.
+
+\devicenormative{\subsubsection}{The Management Device}{Virtio Transport O=
ptions / Virtio Over Transport Virtqueue / Basic Concepts / The management =
Device}
+
+The management device MUST offer feature bit VIRTIO_F_TRANSPT_VQ and a tra=
nsport virtqueue as a device specific virtqueue.
+
+\subsubsection{The Managed Device}\label{sec:Virtio Transport Options / Vi=
rtio over Transport Virtqueue / Basic Concepts / The Managed Device}
+
+A managed device is a kind of device that is created through a transport v=
irtqueue,
+and utilizes the transport virtqueue as its transport layer.
+
+An example of managed devices is a Scalable I/O Virtualization \hyperref[i=
ntro:SIOV]{[SIOV]} device which is created and managed
+through a transport virtqueue of a management device.
+
+\subsubsection{Managed Devices Dscovery}\label{sec:Virtio Transport Option=
s /Virtio Over Transport Virtqueue / Managed Devices Discovery}
+
+Managed devices are created and discovered through a transport virtqueue.
+
+\subsubsection{Managed Devices Interrupts}\label{sec:Virtio Transport Opti=
ons /Virtio Over Transport Virtqueue / Managed Devices Interrupts}
+
+The managed devices utilize MSI (Message Signaled Interrupts) to send inte=
rrupts, there are no legacy interrupts.
+
+A MSI entry is  composed of a 32-bit data payload and a 64-bit address.
+
+\devicenormative{\subsubsection}{The Managed Device}{sec:Virtio Transport =
Options /Virtio Over Transport Virtqueue / The Managed Device}
+
+The managed device MUST not share its MSI entries with another manged devi=
ce or with the management device.
+
+\subsection{Format of Commands through Transport Virtqueue}\label{sec:Virt=
io Transport Options / Virtio over Transport Virtqueue / Format of Commands=
 through Transport Virtqueue}
+
+All transport virtqueue commands are of the following form:
+
+\begin{lstlisting}
+struct virtio_transportq_ctrl {
+        u64 device_id;
+        u16 class;
+        u16 command;
+        u8 command-out-data[];
+        u32 ack;
+        u8 command-in-data[];
+};
+
+/* ack values */
+#define VIRTIO_TRANSPTQ_OK     0
+#define VIRTIO_TRANSPTQ_ERR    255
+\end{lstlisting}
+
+The \field{device_id}, \field{class}, \field{command} and
+\field{command-out-data} are set by the management device driver,
+and the device sets \field{ack} and \field{command-in-data}.
+
+\field{device_id} is a UUID to identify a virtio managed device,
+which defined in \hyperref[intro:rfc4122]{RFC4122}. The management device =
allocates this UUID,
+it should be unique in the management device context.
+
+The \field{device_id} value 0 is used to identify the management device it=
self.
+
+\field{class} is an identifier of a set of commands with similar  purposes=
.
+
 \chapter{Device Types}\label{sec:Device Types}
=20
 On top of the queues, config space and feature negotiation facilities
diff --git a/introduction.tex b/introduction.tex
index a9491cf..94a1b51 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -80,6 +80,9 @@ \section{Normative References}\label{sec:Normative Refere=
nces}
 =09\phantomsection\label{intro:SCMI}\textbf{[SCMI]} &
 =09Arm System Control and Management Interface, DEN0056,
 =09\newline\url{https://developer.arm.com/docs/den0056/c}, version C and a=
ny future revisions\\
+=09\phantomsection\label{intro:SIOV}\textbf{[SIOV]} &
+=09Scalable I/O Virtualization,
+=09\newline\url{https://www.opencompute.org/documents/ocp-scalable-io-virt=
ualization-technical-specification-revision-1-v1-2-pdf}\\
=20
 \end{longtable}
=20
--=20
2.35.3


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

