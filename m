Return-Path: virtio-comment-return-1528-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7779E986141
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Nov 2020 15:58:03 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Thu, 19 Nov 2020 15:57:57 +0000
Message-ID: <BN6PR1801MB2067CCC5F29DB0AA634E96B2C5E00@BN6PR1801MB2067.namprd18.prod.outlook.com>
References: <BN6PR1801MB20674853EEEB69E982B02C8BC5EE0@BN6PR1801MB2067.namprd18.prod.outlook.com>
In-Reply-To: <BN6PR1801MB20674853EEEB69E982B02C8BC5EE0@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
Subject: [virtio-comment] RE: [PATCH v9] virtio-net: Add support for the flexible driver
 notification structure.
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Requesting a TC vote.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/89

>-----Original Message-----
>From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-open=
.org> On Behalf Of Vitaly
>Mireyno
>Sent: Friday, 6 November, 2020 0:42
>To: virtio-comment@lists.oasis-open.org
>Cc: Michael S. Tsirkin <mst@redhat.com>; Jason Wang <jasowang@redhat.com>;=
 Ariel Elior
><aelior@marvell.com>
>Subject: [EXT] [virtio-comment] [PATCH v9] virtio-net: Add support for the=
 flexible driver notification
>structure.
>
>External Email
>
>----------------------------------------------------------------------
>When the driver is required to send an available buffer notification to th=
e device, it sends the virtqueue
>number to be notified.
>With this new feature, the device can optionally provide a per-virtqueue v=
alue for the driver to use in
>driver notifications, instead of the virtqueue number.
>Some devices may benefit from this flexibility by providing, for example, =
an internal virtqueue
>identifier, or an internal offset related to the virtqueue number.
>
>Changes from v8:
> * Incorporated comments for v8:
>     - moved the feature from a network device to a global section
>     - few minor changes
>
>Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>---
> content.tex | 46 +++++++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 45 insertions(+), 1 deletion(-)
>
>diff --git a/content.tex b/content.tex
>index 91735e3..bf50bfd 100644
>--- a/content.tex
>+++ b/content.tex
>@@ -824,6 +824,7 @@ \subsubsection{Common configuration structure layout}\=
label{sec:Virtio
>Transport
>         le64 queue_desc;                /* read-write */
>         le64 queue_driver;              /* read-write */
>         le64 queue_device;              /* read-write */
>+        le16 queue_notify_data;         /* read-only for driver */
> };
> \end{lstlisting}
>
>@@ -890,6 +891,19 @@ \subsubsection{Common configuration structure layout}=
\label{sec:Virtio
>Transport
>
> \item[\field{queue_device}]
>         The driver writes the physical address of Device Area here.  See =
section \ref{sec:Basic Facilities of a
>Virtio Device / Virtqueues}.
>+
>+\item[\field{queue_notify_data}]
>+        This field exists only if VIRTIO_F_NOTIF_CONFIG_DATA has been neg=
otiated.
>+        The driver will use this value to put it in the 'virtqueue number=
' field
>+        in the available buffer notification structure.
>+        See section \ref{sec:Virtio Transport Options / Virtio Over PCI B=
us / PCI-specific Initialization And
>Device Operation / Available Buffer Notifications}.
>+        \begin{note}
>+        This field provides the device with flexibility to determine how =
virtqueues
>+        will be referred to in available buffer notifications.
>+        In a trivial case the device can set \field{queue_notify_data}=3D=
vqn. Some devices
>+        may benefit from providing another value, for example an internal=
 virtqueue
>+        identifier, or an internal offset related to the virtqueue number=
.
>+        \end{note}
> \end{description}
>
> \devicenormative{\paragraph}{Common configuration structure layout}{Virti=
o Transport Options /
>Virtio Over PCI Bus / PCI Device Layout / Common configuration structure l=
ayout} @@ -940,7 +954,7
>@@ \subsubsection{Common configuration structure layout}\label{sec:Virtio =
Transport
>
> \drivernormative{\paragraph}{Common configuration structure layout}{Virti=
o Transport Options /
>Virtio Over PCI Bus / PCI Device Layout / Common configuration structure l=
ayout}
>
>-The driver MUST NOT write to \field{device_feature}, \field{num_queues}, =
\field{config_generation}
>or \field{queue_notify_off}.
>+The driver MUST NOT write to \field{device_feature}, \field{num_queues}, =
\field{config_generation},
>\field{queue_notify_off} or \field{queue_notify_data}.
>
> If VIRTIO_F_RING_PACKED has been negotiated,  the driver MUST NOT write t=
he value 0 to
>\field{queue_size}.
>@@ -1519,6 +1533,15 @@ \subsubsection{Available Buffer Notifications}\labe=
l{sec:Virtio Transport
>Option  See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI =
Device Layout / Notification
>capability}  for how to calculate the Queue Notify address.
>
>+\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio
>+Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And=
 Device Operation / Available
>Buffer Notifications} If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
>+\begin{itemize}
>+\item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver
>+MUST use the \field{queue_notify_data} value instead of the virtqueue ind=
ex.
>+\item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver
>+MUST set the \field{vqn} field to the \field{queue_notify_data} value.
>+\end{itemize}
>+
> \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Opti=
ons / Virtio Over PCI Bus /
>PCI-specific Initialization And Device Operation / Used Buffer Notificatio=
ns}
>
> If a used buffer notification is necessary for a virtqueue, the device wo=
uld typically act as follows:
>@@ -6132,6 +6155,25 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved =
Feature Bits}
>   that the driver passes extra data (besides identifying the virtqueue)
>   in its device notifications.
>   See \ref{sec:Virtqueues / Driver notifications}~\nameref{sec:Virtqueues=
 / Driver notifications}.
>+
>+  \item[VIRTIO_F_NOTIF_CONFIG_DATA(39)] This feature indicates that the
>+ driver  uses the data provided by the device as a virtqueue identifier
>+ in available  buffer notifications.
>+  As mentioned in section \ref{sec:Virtqueues / Driver notifications},
>+ when the  driver is required to send an available buffer notification
>+ to the device, it  sends the virtqueue number to be notified. The
>+ method of delivering  notifications is transport specific.
>+  With the PCI transport, the device can optionally provide a
>+ per-virtqueue value  for the driver to use in driver notifications, inst=
ead of the virtqueue number.
>+  Some devices may benefit from this flexibility by providing, for
>+ example,  an internal virtqueue identifier, or an internal offset
>+ related to the  virtqueue number.
>+
>+  This feature indicates the availability of such value. The definition
>+ of the  data to be provided in driver notification and the delivery
>+ method is  transport specific.
>+  For more details about driver notifications over PCI see \ref{sec:Virti=
o Transport Options / Virtio Over
>PCI Bus / PCI-specific Initialization And Device Operation / Available Buf=
fer Notifications}.
>+
> \end{description}
>
> \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits} =
@@ -6166,6 +6208,8 @@
>\chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}  or parti=
ally reset, and even without
>re-negotiating  VIRTIO_F_SR_IOV after the reset.
>
>+A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
>+
> \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>
> A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate fur=
ther
>--
>
>This publicly archived list offers a means to provide input to the OASIS V=
irtual I/O Device (VIRTIO) TC.
>
>In order to verify user consent to the Feedback License terms and to minim=
ize spam in the list archive,
>subscription is required before posting.
>
>Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>List help: virtio-comment-help@lists.oasis-open.org
>List archive: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists=
.oasis-
>2Dopen.org_archives_virtio-
>2Dcomment_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFR=
dcevq01tbLQAw4
>A_NO7xgI&m=3D9sSbqF1KpHIFmfi3xuwQhbv2hrkdA_lb_J2Fb2qt2to&s=3DhzKDqGxcnN9WQ=
nr4Jc3OcgqMT
>3U5nCDh_0Aul2iIjQU&e=3D
>Feedback License: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__w=
ww.oasis-
>2Dopen.org_who_ipr_feedback-
>5Flicense.pdf&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsAr=
gFRdcevq01tbLQAw4
>A_NO7xgI&m=3D9sSbqF1KpHIFmfi3xuwQhbv2hrkdA_lb_J2Fb2qt2to&s=3DESZuGwsKNRcKo=
nNog-
>xpHwjs45YF23tMb-mzNXV28zo&e=3D
>List Guidelines: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__ww=
w.oasis-
>2Dopen.org_policies-2Dguidelines_mailing-
>2Dlists&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdce=
vq01tbLQAw4A_NO7
>xgI&m=3D9sSbqF1KpHIFmfi3xuwQhbv2hrkdA_lb_J2Fb2qt2to&s=3DpjKJz0ZLYi5T6p28dB=
162e0Ncv8Q8HSiJOU
>T7o8_mqw&e=3D
>Committee: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasi=
s-
>2Dopen.org_committees_virtio_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlD=
HJ2FW52oJ3lqqsArgF
>Rdcevq01tbLQAw4A_NO7xgI&m=3D9sSbqF1KpHIFmfi3xuwQhbv2hrkdA_lb_J2Fb2qt2to&s=
=3DgMfsfrPmiyi8
>KQwGKsjQNZq0BzbecsDJ0KJm1vtj3A8&e=3D
>Join OASIS: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oas=
is-
>2Dopen.org_join_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqq=
sArgFRdcevq01tbLQ
>Aw4A_NO7xgI&m=3D9sSbqF1KpHIFmfi3xuwQhbv2hrkdA_lb_J2Fb2qt2to&s=3DYcQy1CHlfc=
2vxDxrjQLS2C3Z_
>Txk9xsHSsl-SgSAePY&e=3D


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

