Return-Path: <virtio-comment-return-5730-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062D9C7EE21
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 19:20:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 20F0BF9368
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 19:20:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0578D9866B5
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 19:20:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DE62F986594; Wed,  3 May 2023 19:20:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A1A09865A3
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 May 2023 19:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: n9ggoz1DN7iWUjyj_oJXow-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683141537; x=1685733537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1Y3yxDZcV/u1QAlX+ci/HGx1VQ6PRImQZbFIHfUUOE=;
        b=TM9llKFYx1AQ8rzZQVrIeehAHQiMZFBJANSJL46e1T3egB5zvwmqpOn44r/GAA+xY+
         JJNsIL1kGvpXiDcs/qSPUwVkTdbxIZy+ZWEmm8Oy9EIUtIlaS6FOg/lerLumlz9izR7Y
         9plVKmot43MNO5O/D0bYyadvXJlIkdIburbIV4SuvuNNp0rDIScyHAbETvsUQb6fZmfE
         83pN7gfFnA4fpC62C9Vu9WxvFPu9DRl8Zb1pl2doM4J1mzOJOJXRQv1foLBWC4s4Xv2E
         I2YAqTJ2xonGmldJ59zBAjRUkrCsSdhvf/WaiKde1vjz9tzQrb4r2WcSa/gl6IfCyGSz
         YFtg==
X-Gm-Message-State: AC+VfDzLFBFtnXUKr9KmJwSJaqySKIsPIzeBtoETH9gf/OEunjjuC76r
	f8RSyzN6cJF0t+GJu8PKs35O9UPeITAuUEnnpaS/jb2WmSuRTsfmVnrU30EqAmmCLNxXNIUIX82
	72gD0xlgddGLpwHAE0zvX5ZJKyEo7QYJYqQ==
X-Received: by 2002:adf:fc06:0:b0:306:484e:e568 with SMTP id i6-20020adffc06000000b00306484ee568mr859165wrr.40.1683141537741;
        Wed, 03 May 2023 12:18:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4NjTOwk5FweEJb3lH3YIU0/wEmjo6lQM6OelH1MRSlKVSN6VF5+3pXFhoc5bt7Ip1DFMXjKg==
X-Received: by 2002:adf:fc06:0:b0:306:484e:e568 with SMTP id i6-20020adffc06000000b00306484ee568mr859151wrr.40.1683141537388;
        Wed, 03 May 2023 12:18:57 -0700 (PDT)
Date: Wed, 3 May 2023 15:18:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	david.edmondson@oracle.com, sburla@marvell.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230503151509-mutt-send-email-mst@kernel.org>
References: <20230503032659.530330-1-parav@nvidia.com>
 <20230503032659.530330-3-parav@nvidia.com>
 <20230503014259-mutt-send-email-mst@kernel.org>
 <f9ecf8f5-1be7-179c-4d96-1c44d4601710@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <f9ecf8f5-1be7-179c-4d96-1c44d4601710@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 2/2] transport-pci: Add legacy
 register access conformance section

On Wed, May 03, 2023 at 10:53:56AM -0400, Parav Pandit wrote:
> 
> 
> On 5/3/2023 1:48 AM, Michael S. Tsirkin wrote:
> > On Wed, May 03, 2023 at 06:26:59AM +0300, Parav Pandit wrote:
> > > Add device and driver conformanace section for legacy registers access
> > > commands interface.
> > > 
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/167
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > ---
> > >   conformance.tex           |  2 ++
> > >   transport-pci-vf-regs.tex | 31 +++++++++++++++++++++++++++++++
> > >   2 files changed, 33 insertions(+)
> > > 
> > > diff --git a/conformance.tex b/conformance.tex
> > > index 01ccd69..dbd8cd6 100644
> > > --- a/conformance.tex
> > > +++ b/conformance.tex
> > > @@ -109,6 +109,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> > >   \item \ref{drivernormative:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / PCI configuration access capability}
> > >   \item \ref{drivernormative:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI-X Vector Configuration}
> > >   \item \ref{drivernormative:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Notification of Device Configuration Changes}
> > > +\item \ref{drivernormative:Virtio Transport Options / Virtio Over PCI Bus / SR-IOV Legacy Registers Access}
> > >   \end{itemize}
> > >   \conformance{\subsection}{MMIO Driver Conformance}\label{sec:Conformance / Driver Conformance / MMIO Driver Conformance}
> > > @@ -194,6 +195,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> > >   \item \ref{devicenormative:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI-X Vector Configuration}
> > >   \item \ref{devicenormative:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Used Buffer Notifications}
> > >   \item \ref{devicenormative:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Notification of Device Configuration Changes}
> > > +\item \ref{devicenormative:Virtio Transport Options / Virtio Over PCI Bus / SR-IOV Legacy Registers Access}
> > >   \end{itemize}
> > >   \conformance{\subsection}{MMIO Device Conformance}\label{sec:Conformance / Device Conformance / MMIO Device Conformance}
> > > diff --git a/transport-pci-vf-regs.tex b/transport-pci-vf-regs.tex
> > > index 16ced32..7d0574b 100644
> > > --- a/transport-pci-vf-regs.tex
> > > +++ b/transport-pci-vf-regs.tex
> > > @@ -82,3 +82,34 @@ \subsubsection{Legacy Queue Notify Offset Query}\label{sec:Virtio Transport Opti
> > >   	le64 offset; /* Byte offset within the BAR */
> > >   };
> > >   \end{lstlisting}
> > > +
> > > +\devicenormative{\paragraph}{SR-IOV VFs Legacy Registers Access}{Virtio Transport Options / Virtio Over PCI Bus / SR-IOV Legacy Registers Access}
> > > +
> > > +If the PCI PF device supports legacy registers access, it SHOULD set
> > > +corresponding bits for commands VIRTIO_ADMIN_CMD_LREG_WRITE,
> > > +VIRTIO_ADMIN_CMD_LREG_READ and VIRTIO_ADMIN_CMD_LQ_NOTIFY_QUERY in
> > > +command result of VIRTIO_ADMIN_CMD_LIST_QUERY in
> > > +\field{device_admin_cmd_opcodes}.
> > 
> > Don't repeat documentation of VIRTIO_ADMIN_CMD_LIST_QUERY please.
> yeah, I had dual thoughts, I am fine if this looks duplicate.
> Will remove.
> 
> > just say all these must be supported.
> > In fact what are you saying here? That all 3 are supported
> > or none at all? What about just
> > VIRTIO_ADMIN_CMD_LREG_READ/VIRTIO_ADMIN_CMD_LREG_WRITE?
> > Looks like a slower but working way to do notifications
> > is through a common config write, no?
> Notifications to be done using the notification region exposed and queried
> using the 3rd QUERY command.
> > 
> > > +
> > > +The device MUST support legacy configuration registers to its defined width.
> > 
> > what is this?
> > 
> Each register has its defined width as 8-bit, 16-bit, 32-bit etc.
> So device support the access to its defined width.
> May be to rewrite it differently?

Again you are duplicating the existing text, no?
And in this case, contradicting it?

	When using the legacy interface the driver MAY access
	the device-specific configuration region using any width accesses, and
	a transitional device MUST present driver with the same results as
	when accessed using the ``natural'' access method (i.e.
	32-bit accesses for 32-bit fields, etc).


> > > +
> > > +The device MAY fail legacy configuration registers access when either the
> > > +access is for an incorrct register width or if the register offset is incorrect.
> > 
> Spell checkers didnt capture the error of incorrct. Need to find better
> tool.
> 
> > with which error code?
> EINVAL
> but should we repeat the general section here?

this is a command specific case, isn't it?


> > 
> > > +
> > > +The device MUST allow access of one or multiple bytes of the registers when
> > > +such register is defined as byte array, for example \field{mac} of \field{struct
> > > +virtio_net_config} of the Network Device.
> > 
> > so which accesses need to be supported then?
> > 
> Not sure I follow the question.
> Can you please explain?

Consider mac, do you allow access to any length at all, from 1 to 6
bytes?


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

