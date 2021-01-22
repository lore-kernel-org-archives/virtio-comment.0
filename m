Return-Path: virtio-comment-return-1654-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AA1EB98655F
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Jan 2021 08:41:58 +0000 (UTC)
Date: Fri, 22 Jan 2021 03:41:23 -0500 (EST)
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1877911059.48448087.1611304883835.JavaMail.zimbra@redhat.com>
In-Reply-To: <20210122032907-mutt-send-email-mst@kernel.org>
References: <20210122082325.17298-1-jasowang@redhat.com> <20210122032907-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH] virtio-net: introduce admin
 control virtqueue
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>



----- Original Message -----
> On Fri, Jan 22, 2021 at 04:23:25PM +0800, Jason Wang wrote:
> > When implementing multiple (sub)functions virtio device like SRIOV or
> > sub-function. We're suffering from several issues:
> > 
> > - There's no management interface for management function (PF) to
> >   configure features, attributes for a (sub)function
> > - Per (sub)function control virtqueue could be too expensive as the
> >   number of (sub)functions could be very large
> > - Virtualize per (sub)function control virtqueue could be very
> >   challenge as we need the support of DMA isolation at queue level
> > 
> > So this patch introduces the feature of VIRTIO_NET_CTRL_ADMIN_VQ. This
> > allows the device to implement a single admin control virtqueue to
> > manage per (sub)function features and attributes.
> > 
> > The idea is simple, a new function id is introduced on top of the
> > exist virtio_net_ctrl structure. This id is transport or device
> > specific to uniquely identify a (sub)function.
> > 
> > With this, we get a way of using management function (PF) to configure
> > per (sub)function features and attributes. And since the admin control
> > virtqueue belongs to management function (PF), the DMA is naturally
> > isolated at (sub)function level instead of the queue level for per
> > (sub)function control vq.
> > 
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> 
> Let's specify how this works at least for PCI? What about sub-functions
> under VF level? How are these specified?

Ok, will do.

> 
> > ---
> >  content.tex | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/content.tex b/content.tex
> > index 620c0e2..98592a4 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2940,6 +2940,9 @@ \subsection{Feature bits}\label{sec:Device Types /
> > Network Device / Feature bits
> >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> >      channel.
> >  
> > +\item[VIRTIO_NET_F_ADMIN_CTRL_VQ(56)] Admin control channel is
> > +    available.
> > +
> >  \item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet hash
> >      value and a type of calculated hash.
> >  
> > @@ -3864,6 +3867,26 @@ \subsubsection{Control Virtqueue}\label{sec:Device
> > Types / Network Device / Devi
> >  do except issue a diagnostic if \field{ack} is not
> >  VIRTIO_NET_OK.
> >  
> > +\subsubsection{Admin Control Virtqueue}\label{sec:Device Types / Network
> > Device / Device Operation / Control Virtqueue}
> > +
> > +When VIRTIO_NET_F_ADMIN_CTRL_VQ is negotiated, the driver can use the
> > +control virtqueue to manipulate features of individual function where
> 
> manipulate features? You don't mean feature bits, do you?

I copy from the control virtqueue paragraph above:

"""
The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
negotiated) to send commands to manipulate various features of
the device which would not easily map into the configuration
space.
"""

Do we need to tweak that part as well?

Thanks

> 
> > +the control virtqueues is not easily implemented in each function.
> > +
> > +All commands are of the following form:
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_admin_ctrl {
> > +        u32 function_id;
> > +        struct virtio_net_ctrl ctrl;
> > +};
> > +
> > +\end{lstlisting}
> > +
> > +The \field{function_id} is an unique transport or device specific
> > +identifier for a function. E.g for the case of PCI SRIOV, it's the id
> > +of PCI function.
> > +
> >  \paragraph{Packet Receive Filtering}\label{sec:Device Types / Network
> >  Device / Device Operation / Control Virtqueue / Packet Receive Filtering}
> >  \label{sec:Device Types / Network Device / Device Operation / Control
> >  Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
> >  
> > --
> > 2.25.1
> 
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

