Return-Path: virtio-comment-return-1532-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 94F309861E1
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Nov 2020 14:38:37 +0000 (UTC)
Date: Mon, 23 Nov 2020 09:38:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20201123093538-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB20674853EEEB69E982B02C8BC5EE0@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <BN6PR1801MB2067CCC5F29DB0AA634E96B2C5E00@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB2067CCC5F29DB0AA634E96B2C5E00@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: [virtio-comment] Re: [PATCH v9] virtio-net: Add support for the flexible driver
 notification structure.
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

I see the reaction is generally positive.

I had a thought meanwhile - how about changing
"virt queue number" to "virt queue id" in the notification
description? we can then explain that the id can be vq number
or retrieved from config space.

Thoughts?
Can be a patch on top does not have to delay vote on this one.



On Thu, Nov 19, 2020 at 03:57:57PM +0000, Vitaly Mireyno wrote:
> Requesting a TC vote.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/89
> 
> >-----Original Message-----
> >From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-open.org> On Behalf Of Vitaly
> >Mireyno
> >Sent: Friday, 6 November, 2020 0:42
> >To: virtio-comment@lists.oasis-open.org
> >Cc: Michael S. Tsirkin <mst@redhat.com>; Jason Wang <jasowang@redhat.com>; Ariel Elior
> ><aelior@marvell.com>
> >Subject: [EXT] [virtio-comment] [PATCH v9] virtio-net: Add support for the flexible driver notification
> >structure.
> >
> >External Email
> >
> >----------------------------------------------------------------------
> >When the driver is required to send an available buffer notification to the device, it sends the virtqueue
> >number to be notified.
> >With this new feature, the device can optionally provide a per-virtqueue value for the driver to use in
> >driver notifications, instead of the virtqueue number.
> >Some devices may benefit from this flexibility by providing, for example, an internal virtqueue
> >identifier, or an internal offset related to the virtqueue number.
> >
> >Changes from v8:
> > * Incorporated comments for v8:
> >     - moved the feature from a network device to a global section
> >     - few minor changes
> >
> >Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> >---
> > content.tex | 46 +++++++++++++++++++++++++++++++++++++++++++++-
> > 1 file changed, 45 insertions(+), 1 deletion(-)
> >
> >diff --git a/content.tex b/content.tex
> >index 91735e3..bf50bfd 100644
> >--- a/content.tex
> >+++ b/content.tex
> >@@ -824,6 +824,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio
> >Transport
> >         le64 queue_desc;                /* read-write */
> >         le64 queue_driver;              /* read-write */
> >         le64 queue_device;              /* read-write */
> >+        le16 queue_notify_data;         /* read-only for driver */
> > };
> > \end{lstlisting}
> >
> >@@ -890,6 +891,19 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio
> >Transport
> >
> > \item[\field{queue_device}]
> >         The driver writes the physical address of Device Area here.  See section \ref{sec:Basic Facilities of a
> >Virtio Device / Virtqueues}.
> >+
> >+\item[\field{queue_notify_data}]
> >+        This field exists only if VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated.
> >+        The driver will use this value to put it in the 'virtqueue number' field
> >+        in the available buffer notification structure.
> >+        See section \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And
> >Device Operation / Available Buffer Notifications}.
> >+        \begin{note}
> >+        This field provides the device with flexibility to determine how virtqueues
> >+        will be referred to in available buffer notifications.
> >+        In a trivial case the device can set \field{queue_notify_data}=vqn. Some devices
> >+        may benefit from providing another value, for example an internal virtqueue
> >+        identifier, or an internal offset related to the virtqueue number.
> >+        \end{note}
> > \end{description}
> >
> > \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options /
> >Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout} @@ -940,7 +954,7
> >@@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> >
> > \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options /
> >Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
> >
> >-The driver MUST NOT write to \field{device_feature}, \field{num_queues}, \field{config_generation}
> >or \field{queue_notify_off}.
> >+The driver MUST NOT write to \field{device_feature}, \field{num_queues}, \field{config_generation},
> >\field{queue_notify_off} or \field{queue_notify_data}.
> >
> > If VIRTIO_F_RING_PACKED has been negotiated,  the driver MUST NOT write the value 0 to
> >\field{queue_size}.
> >@@ -1519,6 +1533,15 @@ \subsubsection{Available Buffer Notifications}\label{sec:Virtio Transport
> >Option  See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification
> >capability}  for how to calculate the Queue Notify address.
> >
> >+\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio
> >+Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Available
> >Buffer Notifications} If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
> >+\begin{itemize}
> >+\item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver
> >+MUST use the \field{queue_notify_data} value instead of the virtqueue index.
> >+\item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver
> >+MUST set the \field{vqn} field to the \field{queue_notify_data} value.
> >+\end{itemize}
> >+
> > \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Options / Virtio Over PCI Bus /
> >PCI-specific Initialization And Device Operation / Used Buffer Notifications}
> >
> > If a used buffer notification is necessary for a virtqueue, the device would typically act as follows:
> >@@ -6132,6 +6155,25 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >   that the driver passes extra data (besides identifying the virtqueue)
> >   in its device notifications.
> >   See \ref{sec:Virtqueues / Driver notifications}~\nameref{sec:Virtqueues / Driver notifications}.
> >+
> >+  \item[VIRTIO_F_NOTIF_CONFIG_DATA(39)] This feature indicates that the
> >+ driver  uses the data provided by the device as a virtqueue identifier
> >+ in available  buffer notifications.
> >+  As mentioned in section \ref{sec:Virtqueues / Driver notifications},
> >+ when the  driver is required to send an available buffer notification
> >+ to the device, it  sends the virtqueue number to be notified. The
> >+ method of delivering  notifications is transport specific.
> >+  With the PCI transport, the device can optionally provide a
> >+ per-virtqueue value  for the driver to use in driver notifications, instead of the virtqueue number.
> >+  Some devices may benefit from this flexibility by providing, for
> >+ example,  an internal virtqueue identifier, or an internal offset
> >+ related to the  virtqueue number.
> >+
> >+  This feature indicates the availability of such value. The definition
> >+ of the  data to be provided in driver notification and the delivery
> >+ method is  transport specific.
> >+  For more details about driver notifications over PCI see \ref{sec:Virtio Transport Options / Virtio Over
> >PCI Bus / PCI-specific Initialization And Device Operation / Available Buffer Notifications}.
> >+
> > \end{description}
> >
> > \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits} @@ -6166,6 +6208,8 @@
> >\chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}  or partially reset, and even without
> >re-negotiating  VIRTIO_F_SR_IOV after the reset.
> >
> >+A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
> >+
> > \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> >
> > A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate further
> >--
> >
> >This publicly archived list offers a means to provide input to the OASIS Virtual I/O Device (VIRTIO) TC.
> >
> >In order to verify user consent to the Feedback License terms and to minimize spam in the list archive,
> >subscription is required before posting.
> >
> >Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >List help: virtio-comment-help@lists.oasis-open.org
> >List archive: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.oasis-
> >2Dopen.org_archives_virtio-
> >2Dcomment_&d=DwIFAg&c=nKjWec2b6R0mOyPaz7xtfQ&r=lDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4
> >A_NO7xgI&m=9sSbqF1KpHIFmfi3xuwQhbv2hrkdA_lb_J2Fb2qt2to&s=hzKDqGxcnN9WQnr4Jc3OcgqMT
> >3U5nCDh_0Aul2iIjQU&e=
> >Feedback License: https://urldefense.proofpoint.com/v2/url?u=https-3A__www.oasis-
> >2Dopen.org_who_ipr_feedback-
> >5Flicense.pdf&d=DwIFAg&c=nKjWec2b6R0mOyPaz7xtfQ&r=lDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4
> >A_NO7xgI&m=9sSbqF1KpHIFmfi3xuwQhbv2hrkdA_lb_J2Fb2qt2to&s=ESZuGwsKNRcKonNog-
> >xpHwjs45YF23tMb-mzNXV28zo&e=
> >List Guidelines: https://urldefense.proofpoint.com/v2/url?u=https-3A__www.oasis-
> >2Dopen.org_policies-2Dguidelines_mailing-
> >2Dlists&d=DwIFAg&c=nKjWec2b6R0mOyPaz7xtfQ&r=lDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7
> >xgI&m=9sSbqF1KpHIFmfi3xuwQhbv2hrkdA_lb_J2Fb2qt2to&s=pjKJz0ZLYi5T6p28dB162e0Ncv8Q8HSiJOU
> >T7o8_mqw&e=
> >Committee: https://urldefense.proofpoint.com/v2/url?u=https-3A__www.oasis-
> >2Dopen.org_committees_virtio_&d=DwIFAg&c=nKjWec2b6R0mOyPaz7xtfQ&r=lDHJ2FW52oJ3lqqsArgF
> >Rdcevq01tbLQAw4A_NO7xgI&m=9sSbqF1KpHIFmfi3xuwQhbv2hrkdA_lb_J2Fb2qt2to&s=gMfsfrPmiyi8
> >KQwGKsjQNZq0BzbecsDJ0KJm1vtj3A8&e=
> >Join OASIS: https://urldefense.proofpoint.com/v2/url?u=https-3A__www.oasis-
> >2Dopen.org_join_&d=DwIFAg&c=nKjWec2b6R0mOyPaz7xtfQ&r=lDHJ2FW52oJ3lqqsArgFRdcevq01tbLQ
> >Aw4A_NO7xgI&m=9sSbqF1KpHIFmfi3xuwQhbv2hrkdA_lb_J2Fb2qt2to&s=YcQy1CHlfc2vxDxrjQLS2C3Z_
> >Txk9xsHSsl-SgSAePY&e=


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

