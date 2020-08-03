Return-Path: virtio-comment-return-1379-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D51AE98455A
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Aug 2020 15:49:02 +0000 (UTC)
Date: Mon, 3 Aug 2020 17:48:53 +0200
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20200803174853.1f361b17.cohuck@redhat.com>
In-Reply-To: <31432886-aa75-231d-59a1-1badd5048860@redhat.com>
References: <20200803132431.139149-1-lvivier@redhat.com>
	<20200803155729.4d30fb01.cohuck@redhat.com>
	<31432886-aa75-231d-59a1-1badd5048860@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-rng: add a control queue
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Laurent Vivier <lvivier@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S . Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>, Amit Shah <amit@kernel.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, 3 Aug 2020 17:00:34 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> On 03/08/2020 15:57, Cornelia Huck wrote:
> > On Mon,  3 Aug 2020 15:24:31 +0200
> > Laurent Vivier <lvivier@redhat.com> wrote:
> >   
> >> A control queue is needed to send command to ask the device to
> >> release the request buffers if it cannot provide data.
> >>
> >> Changes:
> >>
> >>   5.4.2 Virtqueues
> >>   0 requestq
> >>   1 controlq
> >>   controlq only exists if VIRTIO_RNG_F_CTRL_VQ set.
> >>
> >>   5.4.3 Feature bits
> >>   VIRTIO_RNG_F_CTRL_VQ (0)
> >>   Device has a control queue
> >>
> >>   5.4.5 Device Initialization
> >>   Identify and initialize the request virtqueue.
> >>   If the VIRTIO_RNG_F_CTRL_VQ feature bit is negotiated,
> >>   identify the control virtqueue.
> >>
> >>   5.4.6.3 Control Virtqueue
> >>   The driver uses the control virtqueue (if VIRTIO_RNG_F_CTRL_VQ is negotiated)
> >>   to send commands to control the device.
> >>   All commands are of the following form:
> >>   struct virtio_rng_ctrl_hdr {
> >>          u8 cmd;
> >>   };
> >>
> >>   5.4.6.3.1 Request Virtqueue Flushing
> >>   When the device is not able to provide enough entropy to the driver,
> >>   the driver can be stuck. And for instance, it cannot be removed from the
> >>   system to switch to another one. The flush command allows the driver to ask
> >>   the device to release all the buffers sent to the device and to unlock the
> >>   driver.
> >>   #define VIRTIO_RNG_CMD_FLUSH 0
> >>
> >> Bug-Link: https://github.com/oasis-tcs/virtio-spec/issues/83
> >> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >> ---
> >>  content.tex | 38 ++++++++++++++++++++++++++++++++++++--
> >>  1 file changed, 36 insertions(+), 2 deletions(-)  
> > 
> > (...)
> >   
> >> +\paragraph{Request Virtqueue Flushing}\label{sec:Device Types / Entropy Device / Device Operation / Control Virtqueue / Request Virtqueue Flushing}
> >> +
> >> +When the device is not able to provide enough entropy to the driver, the driver can be stuck.
> >> +And for instance, it cannot be removed from the system to switch to another one.  
> > 
> > Maybe
> > 
> > "...the driver may be stuck waiting for the device returning buffers,
> > and cannot be removed..." ?  
> 
> ok
> 
> >   
> >> +The flush command allows the driver to ask the device to release all the buffers sent to the
> >> +device and to unlock the driver.  
> > 
> > What does "unlock the driver" mean?  
> 
> In fact, this is very implementation specific: in current linux
> implementation the driver is waiting on the data with read mutex locked.
> And with this mutex locked you can't do anything else in the driver...
> 
> I will replace this by:
> "This allows the driver to release resources allocated to receive data
> from the device."

Sounds good.

> 
> > 
> > You'll probably also want a device normative statement for that, something like
> > 
> > "When the driver sends a flush request, the device MUST release all
> > outstanding buffers."
> >   
> >> +
> >> +\begin{lstlisting}
> >> +#define VIRTIO_RNG_CMD_FLUSH 0
> >> +\end{lstlisting}  
> > 
> > As we (currently) have only that one command, I think we need to
> > specify that (a) negotiation of the CTRL_VQ feature implies that the
> > flush command is available, and that (b) any other value of cmd should
> > (must?) be ignored by the device. (I'd assume that new commands would
> > require new feature bits.)  
> 
> I will add:
> 
> "The negociation of the CTRL_VQ feature implies that the flush command
> is available."

"If VIRTIO_RNG_F_CTRL_VQ is negotiated, the device MUST implement the
flush command." ?

> "Any other value of cmd MUST be ignored by the device."
> 
> But where? In this section?

I think you want a devicenormative paragraph in the control vq
subsection (also for the MUST statement above.) This needs to be
referenced by the conformance part of the spec.

> 
> Thanks,
> Laurent
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

