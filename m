Return-Path: <virtio-comment-return-8347-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AABC4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 10:10:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 95DA72B12F
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 10:10:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67E2798680C
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 10:10:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 46E539867C2; Mon, 13 Nov 2023 10:10:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36DE79867DD
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Nov 2023 10:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: YxkJn28_OhWXL24WvwHniQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699870235; x=1700475035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZ+Hqps2yTjOJ7kiFScA6/ljWYH6lh23OhqoIQf6Dpg=;
        b=KUrnGUBgrjEdkkM6xBnYHclnLQV5fvbAcSZ3R1++Vztepc0vcwgp5kxgY8e+jnbF7J
         c2xUjoDqjGkcnvLnWg0xYckXg/FgMCZ7WxXlWoBMTuRvhTOatl04YlinPtGs4GPrlmls
         ysk5UA+7Gjm52xPn/RZoQSOhlC1tbr/RhDvK1GmmQsi1sMvMjy9DB3tznk8uUEes3B1b
         A7rx1WoT6I9c4wxQC1Va6ztU6tvpxqUV+DEphA/21+cvhyXfOKe5lSJYCVSRSRCWsGFT
         jpngjkOwLX5O0O1NLJQm/KwpG9W/wmjmQGcWVFoWtgOlwgmwzMUzNq8bNtyEs5t6ZKuQ
         aKRQ==
X-Gm-Message-State: AOJu0YxYDXPT6MjfxK0mIOSQ+9+bwYyfVvspNR49v2YILW2An5kOi3yf
	jo3wsTRD94Cj66ZuX8J2vYU0M+Qyx1coNFYc0DjRWZuhzqfMwAPPpiYg4EjyhSMM3r48LRdLlde
	tYzONe+Wf8aUk8SsNFEoeGZ7cZKxqyC681Q==
X-Received: by 2002:a05:600c:4f03:b0:405:37bb:d942 with SMTP id l3-20020a05600c4f0300b0040537bbd942mr4879186wmq.4.1699870235737;
        Mon, 13 Nov 2023 02:10:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVLSYzDIMxYHLRygbTGBWrHsE9Z4l76gMzRPkiFmsZhW8VvAOWYykpM+rF+6BtJDmTXXHjfg==
X-Received: by 2002:a05:600c:4f03:b0:405:37bb:d942 with SMTP id l3-20020a05600c4f0300b0040537bbd942mr4879162wmq.4.1699870235201;
        Mon, 13 Nov 2023 02:10:35 -0800 (PST)
Date: Mon, 13 Nov 2023 05:10:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231113050839-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-5-lingshan.zhu@intel.com>
 <20231108125515-mutt-send-email-mst@kernel.org>
 <6b3f5fb9-4e43-4144-9724-8ed11cac4d43@intel.com>
MIME-Version: 1.0
In-Reply-To: <6b3f5fb9-4e43-4144-9724-8ed11cac4d43@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement VIRTIO_F_QUEUE_STATE

On Mon, Nov 13, 2023 at 05:29:51PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/9/2023 1:56 AM, Michael S. Tsirkin wrote:
> > On Fri, Nov 03, 2023 at 06:34:35PM +0800, Zhu Lingshan wrote:
> > > This patch adds two new le16 fields to common configuration structure
> > > to support VIRTIO_F_QUEUE_STATE in PCI transport layer.
> > > 
> > > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > > ---
> > >   transport-pci.tex | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > > 
> > > diff --git a/transport-pci.tex b/transport-pci.tex
> > > index a5c6719..3161519 100644
> > > --- a/transport-pci.tex
> > > +++ b/transport-pci.tex
> > > @@ -325,6 +325,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> > >           /* About the administration virtqueue. */
> > >           le16 admin_queue_index;         /* read-only for driver */
> > >           le16 admin_queue_num;         /* read-only for driver */
> > > +
> > > +	/* Virtqueue state */
> > > +        le16 queue_avail_state;         /* read-write */
> > > +        le16 queue_used_state;          /* read-write */
> > >   };
> > >   \end{lstlisting}
> > > @@ -428,6 +432,17 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> > >   	The value 0 indicates no supported administration virtqueues.
> > >   	This field is valid only if VIRTIO_F_ADMIN_VQ has been
> > >   	negotiated.
> > > +
> > > +\item[\field{queue_avail_state}]
> > > +        This field is valid only if VIRTIO_F_QUEUE_STATE has been
> > > +        negotiated. The driver sets and gets the available state of
> > > +        the virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
> > > +
> > > +\item[\field{queue_used_state}]
> > > +        This field is valid only if VIRTIO_F_QUEUE_STATE has been
> > > +        negotiated. The driver sets and gets the used state of the
> > > +        virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
> > > +
> > >   \end{description}
> > >   \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
> > 
> > Two fields are pointless in the general case.  Fix this to at least
> > support out of order buffer use, then there's something to talk about.
> > I suspect we'll be back to yet another bespoke mailbox and a bitmap for
> > this.
> For split virtqueue, it has available ring, used ring and descriptor table,
> means the device can always tell which descriptor/buffer is in-flight
> or not processed even when out_of_order.

Unfortunately, I don't believe so. Hard to say exactly without a
specific algorithm you propose what the bug in it is. Describe an
algorithm I should be able to point the issues out to you.


> For packed virtqueue, because the descriptors may be overwritten, so when
> out_out_order, the descriptors behind last_avial_idx should be considered
> as in-flight and should be processed at the destination side.
> 
> Does this work for you?

Not without a lot more detail.


> > 
> > 
> > > @@ -488,6 +503,9 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> > >   present either a value of 0 or a power of 2 in
> > >   \field{queue_size}.
> > > +If VIRTIO_F_QUEUE_STATE has not been negotiated, the device MUST ignore
> > > +any accesses to \field{queue_avail_state} and \field{queue_used_state}.
> > > +
> > >   If VIRTIO_F_ADMIN_VQ has been negotiated, the value
> > >   \field{admin_queue_index} MUST be equal to, or bigger than
> > >   \field{num_queues}; also, \field{admin_queue_num} MUST be
> > > -- 
> > > 2.35.3


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

