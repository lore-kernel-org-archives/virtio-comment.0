Return-Path: <virtio-comment-return-9123-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F6EC48BC3
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Feb 2024 07:42:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 379857A2ED
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Feb 2024 07:42:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0DF6C9865C9
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Feb 2024 07:42:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0041F98640B; Mon, 19 Feb 2024 07:42:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E60BD98642D
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Feb 2024 07:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 1u2eku5jOWOHI0vwmwLbRA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328531; x=1708933331;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gF6sbJ3+Ht94/f53QpZC/f1xLrCP5Ef+HmZxuAzHsY8=;
        b=epSwx710J32zPQvN/ePKzl5baXvXAZ3ymPqPybpytmftUUWw59luXxeT5+Vj5b7HUH
         SdtGHglC4RUiSelp+5fpjdUWCXavEYtcndz5zizh4fay/Ehok4tyoRVCNSBq08LH7RC2
         8xPCO82jAc0Mu+BhkpjzEgf7OjjGIOpY7avhfyZVf5NaaFByU6yBnu9qyYJ/QyuR7JGw
         81ksUQJYsRPcuHBY1QCVXvDzZM6Y2ISAkWQE7lHkC1WHOH/f1AsJB7tpXSfkUzF5+syq
         cTphapA2San2LqCyrKm8bIgkA5WP4ui14l7QbHa253R8v3HhP1rsvx1odfEVedPVk1go
         nQpA==
X-Forwarded-Encrypted: i=1; AJvYcCUVMUGpDMcuGd8S4dMvzj75O9rpcTy7deS2jVKuCarI3/OUXNHS/oKASzmmq+FbZN9DFS/bjATuAf9R6fEV9bQ4zTljg6cM9GaYM6DEOcMZSJWBTQ==
X-Gm-Message-State: AOJu0YxbN2zzxSXWOz2S28F98zSllsWzYTNsFqSCj0hiWrh9R6mqkxRQ
	noSf2r0+2qjFc50NoRKj5pMRLM/a9/e6aqNLITyP2VcBCyHdjVU273480vsXfWCKgDI55L+dOK3
	8dHYT2kgN95lt0N9GwWeIYwRbUpsl9ikDcdfLcPXij4DQt3H3+tB5yTyYhwCrCM4VjL2/stY=
X-Received: by 2002:adf:cb05:0:b0:33d:3896:be5f with SMTP id u5-20020adfcb05000000b0033d3896be5fmr2851965wrh.54.1708328530979;
        Sun, 18 Feb 2024 23:42:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9lEFbdndHpAeM2K86yRrbxuzBm2RSKuC9u9sU4lYJTXMVgNMHXY5vJuNuFg+E73MfpwgbrA==
X-Received: by 2002:adf:cb05:0:b0:33d:3896:be5f with SMTP id u5-20020adfcb05000000b0033d3896be5fmr2851954wrh.54.1708328530607;
        Sun, 18 Feb 2024 23:42:10 -0800 (PST)
Date: Mon, 19 Feb 2024 02:42:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org, parav@nvidia.com
Message-ID: <20240219023718-mutt-send-email-mst@kernel.org>
References: <20240216082432.709956-1-stevensd@chromium.org>
 <20240216082432.709956-2-stevensd@chromium.org>
 <20240216035144-mutt-send-email-mst@kernel.org>
 <CAD=HUj79esxJTKZNMk3MkWOW5Ch=9L4kuokjvPryuTsV2z=sdA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=HUj79esxJTKZNMk3MkWOW5Ch=9L4kuokjvPryuTsV2z=sdA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v4 1/1] Add suspend support for virtio PCI devices

On Mon, Feb 19, 2024 at 03:46:37PM +0900, David Stevens wrote:
> On Fri, Feb 16, 2024 at 5:56 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Feb 16, 2024 at 05:24:32PM +0900, David Stevens wrote:
> > > Add a virtio power management PCI capability to allow drivers to suspend
> > > virtio PCI devices. This allows drivers to suspend devices at the virtio
> > > level before suspending them at the PCI transport layer. This allows
> > > drivers to do a two phase suspend, which prevents notifications from
> > > being ignored or lost if interrupts are reconfigured at the PCI
> > > transport layer immediately before or after the device is put into the
> > > PCI PM D3 low power state.
> > > ---
> > >  transport-pci.tex | 51 +++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 51 insertions(+)
> > >
> > > diff --git a/transport-pci.tex b/transport-pci.tex
> > > index a5c6719ea871..ce77708a9b69 100644
> > > --- a/transport-pci.tex
> > > +++ b/transport-pci.tex
> > > @@ -188,6 +188,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
> > >  #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
> > >  /* Vendor-specific data */
> > >  #define VIRTIO_PCI_CAP_VENDOR_CFG        9
> > > +/* Power management configuration */
> > > +#define VIRTIO_PCI_CAP_PM_CFG            10
> > >  \end{lstlisting}
> > >
> > >          Any other value is reserved for future use.
> > > @@ -804,6 +806,55 @@ \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport O
> > >  specified by some other Virtio Structure PCI Capability
> > >  of type other than \field{VIRTIO_PCI_CAP_PCI_CFG}.
> > >
> > > +\subsubsection{Power management capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Power management capability}
> > > +
> > > +The VIRTIO_PCI_CAP_PM_CFG capability refers to a single byte. The
> > > +driver can write to the byte to set the power state of the device,
> > > +and it can read from the byte to get the current power state of the
> > > +device.
> > > +
> > > +The valid power states are:
> > > +
> > > +\begin{lstlisting}
> > > +/* Device is operating normally */
> > > +#define VIRTIO_PM_STATE_ACTIVE    0
> > > +/* Device operation is suspended */
> > > +#define VIRTIO_PM_STATE_SUSPENDED 1
> > > +\end{lstlisting}
> > > +
> > > +The device power state has no effect when \field{device status} does
> > > +not have the DRIVER_OK bit set or does have the DEVICE_NEEDS_RESET bit
> > > +set.
> >
> >
> > Given this is only after DRIVER_OK, wouldn't a feature bit + status bit
> > make more sense? This will make it transport-independent and simplify
> > discovery.
> 
> A feature bit + status bit would work as well. I've posted some
> questions on Zhu Lingshan's patch.


Thanks! I like it that your patch is more specific but maybe something
can be figure out to get the best of both worlds.

> > > +\devicenormative{\paragraph}{Power management capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Power management capability}
> > > +
> > > +A device MUST maintain its state while suspended such that all driver
> > > +visible state after resuming exactly matches driver visible state
> > > +before suspending.
> > > +
> > > +A device MUST NOT send notifications while suspended.
> > > +
> > > +A device MAY operate on any buffers in its virtqueue while suspended.
> >
> > How is this reconsiled with state matching exactly? buffers are
> > driver-visible ...
> 
> Drivers can't atomically access buffers and the PM byte, so the device
> modifying a buffer while suspended is indistinguishable from the
> device modifying a buffer in the window between when it is resumed by
> the driver and when the driver accesses the buffer. But you are right
> that the wording is contradictory. Maybe the earlier requirement could
> be better phrased as:
> 
> A device MUST maintain its state while suspended such that after the
> driver resumes the device, the driver can use the device as if it had
> never been suspended in the first place.


I think you wording is fine, just make it clear how is the
contradiction resolved. E.g. exactly matches ... with the
exception of using buffers available in one of the virtqueues.

> > > +A device MUST set its power state to VIRTIO_PM_STATE_ACTIVE on reset.
> > > +
> > > +A device SHOULD take steps to minimize its resource consumption while
> > > +suspended, although what this involves is specific to the particular
> > > +device implementation.
> > > +
> > > +\drivernormative{\paragraph}{Power management capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Power management capability}
> > > +
> > > +A driver MUST NOT access a suspended device's BARs corresponding to
> > > +any virtio structures, except for the power management byte.
> > > +
> > > +A driver MAY suspend a device that has buffers in one of its
> > > +virtqueues, but it MUST NOT modify any such buffers while the device
> > > +is suspended.
> > > +
> > > +A driver MUST read from the power management byte after writing to the
> > > +byte to verify that the device successfully entered the target power
> > > +state.
> >
> > Verify how? By checking the value returned? And what should it do with the value
> > does not match?
> 
> Yes, comparing the value returned to the one it just wrote. The three
> options I can think of would be to abort the suspend, reset the
> device, or retry. Retry only makes sense if suspend/resume might
> succeed in the future.

Well actually there is a reason to retry even without a timeout -
has to do with pci rules which limit how quickly device has
to respond to a read. So if you want to implement suspend
in firmware and not be bound to any timing limits you need
retry in software.


> An API is really only retry-friendly if it has
> a way to set a timeout, since the consumer is what should be deciding
> how long to wait but can't make that decision without a timeout.
> Personally, I would lean towards not allowing timeouts here, since
> it's simpler. So maybe something like this:
> 
> After the driver writes a new value to the PM byte, if the device can
> transition to the requested state, then subsequent reads of the PM
> state byte MUST block until the transition completes. If the device
> cannot transition to the requested state, it MUST immediately return
> the prior value of the PM state byte for subsequent reads of the PM
> state byte.

PCI has timing limitations on how long reads can block though.
So that could be a reason to retry.


> In that case, the only options are to abort the suspension or to reset
> the device. That's really a policy decision of the driver, so I don't
> know how it would fit into this spec.
> 
> -David
> 
> 
> -David


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

