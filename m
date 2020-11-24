Return-Path: virtio-comment-return-1536-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 91CF2986250
	for <virtio-comment@lists.oasis-open.org>; Tue, 24 Nov 2020 10:20:54 +0000 (UTC)
Date: Tue, 24 Nov 2020 11:19:07 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20201124111907.4e6fea45.cohuck@redhat.com>
In-Reply-To: <20201123171642.2da4abfa.pasic@linux.ibm.com>
References: <BN6PR1801MB20674853EEEB69E982B02C8BC5EE0@BN6PR1801MB2067.namprd18.prod.outlook.com>
	<20201123171642.2da4abfa.pasic@linux.ibm.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v9] virtio-net: Add support for the
 flexible driver notification structure.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, 23 Nov 2020 17:16:42 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Thu, 5 Nov 2020 22:41:42 +0000
> Vitaly Mireyno <vmireyno@marvell.com> wrote:
> 
> > When the driver is required to send an available buffer notification to the device, it sends the virtqueue number to be notified.
> > With this new feature, the device can optionally provide a per-virtqueue value for the driver to use in driver notifications, instead of the virtqueue number.
> > Some devices may benefit from this flexibility by providing, for example, an internal virtqueue identifier, or an internal offset related to the virtqueue number.
> > 
> > Changes from v8:
> >  * Incorporated comments for v8:
> >      - moved the feature from a network device to a global section
> >      - few minor changes
> > 
> > Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> > ---
> >  content.tex | 46 +++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 45 insertions(+), 1 deletion(-)

> 
> Whith your patch applied on top of current master I get something like this
> 
> """
> \subsubsection{Available Buffer Notifications}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Available Buffer Notifications}
> 
> When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
> the driver sends an available buffer notification to the device by writing
> the 16-bit virtqueue index
> of this virtqueue to the Queue Notify address.
> 
> When VIRTIO_F_NOTIFICATION_DATA has been negotiated,
> the driver sends an available buffer notification to the device by writing
> the following 32-bit value to the Queue Notify address:
> \lstinputlisting{notifications-le.c}
> 
> See \ref{sec:Virtqueues / Driver notifications}~\nameref{sec:Virtqueues / Driver notifications}
> for the definition of the components.
> 
> See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
> for how to calculate the Queue Notify address.
> 
> \drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Available Buffer Notifications}
> If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
> \begin{itemize}
> \item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver MUST use the
> \field{queue_notify_data} value instead of the virtqueue index.
> \item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver MUST set the
> \field{vqn} field to the \field{queue_notify_data} value.
> \end{itemize}
> 
> \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Used Buffer Notifications}
> """
> 
> The device normative section and the preceding text are IMHO in
> contradiction. The former says  the driver sends a 16-bit virtqueue
> index unconditionally, the later says if if VIRTIO_F_NOTIFICATION_DATA
> has been negotiated then use queue_notify_data, instead (thus
> referencing the non-normative content).
> 

I'd probably reword the paragraph above to

"When VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver
sends an available buffer notification to the device by writing either
the 16-bit virtqueue index of this virtqueue or, if
VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated, the 16-bit queue
notification data to the Queue Notify address."

> IMHO we need a normative section that fully describes all the available
> cases.
> 
> I think we can do this on top.

Agreed.

> 
> Regards,
> Halil
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
> 


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

