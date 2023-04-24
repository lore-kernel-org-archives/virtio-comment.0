Return-Path: <virtio-comment-return-5588-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01850C77B73
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 15:36:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2830886683
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 15:36:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0A68D986394
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 15:36:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EE863986350; Mon, 24 Apr 2023 15:36:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD442986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Apr 2023 15:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5YTuNz2ePjm6Vmt6kvWn7w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682350585; x=1684942585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnAhXu5NVK+CUYiJoQcTfw6/CKRkPzwXqWlgf+CVS/g=;
        b=Ro5sC4CrsQycogKRVCg7ufXtBPzGwmr2ZqNOdw3aN8eFFLAp9Y5IQO5e9gXqVhSPNg
         AUr0YED6HX05uleeNoRLH8+pyNXMZST14bwykO8hPvCnijxqkSVCHtaKYMffgw0Oy++A
         zNusFn/KLeUNK1ARdF5cIQlfIUWZiNTbnElJwzoXGt6tdyGXLqodmucMp3scrr0z+vls
         7+dyczbjk/9orv+s/jqfzJji871kqQ+XjuipKMLC5PLmjABOV4PJPQquKG+rH76N3VNq
         WuK+OJvdD4xOQyF+7qBGd0vkQ/fLkykvFwXEw8DYz8hBSf3/vTVtK0GcqQ3H+5OMR0n0
         4rGQ==
X-Gm-Message-State: AAQBX9dhLFdlCH41KTccifhlFv9RTNxZGS/OtejyZZjxn1yefI0SZsZO
	UQQJ0R7outnKl4+45HA4uUdFpqhN60ABQe0eBEb0DcHnz1WMA30FSblRXakKgh9BV/vc1FbL/O/
	43SvdGieaLM2Kg0A2ahUsAa0h01uA1+ntww==
X-Received: by 2002:adf:e6d0:0:b0:2d1:7ade:aac with SMTP id y16-20020adfe6d0000000b002d17ade0aacmr10629216wrm.0.1682350585673;
        Mon, 24 Apr 2023 08:36:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZTl8tMA32IIVH1fTAzF7aWGZyJwT0gcir/fITbJ11QOPxNZR6KNn3QietdRbvF2Mdkle6nFA==
X-Received: by 2002:adf:e6d0:0:b0:2d1:7ade:aac with SMTP id y16-20020adfe6d0000000b002d17ade0aacmr10629197wrm.0.1682350585302;
        Mon, 24 Apr 2023 08:36:25 -0700 (PDT)
Date: Mon, 24 Apr 2023 11:36:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
	stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
	hang.yuan@intel.com, virtio@lists.oasis-open.org,
	Jiri Pirko <jiri@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230424113515-mutt-send-email-mst@kernel.org>
References: <cover.1680533760.git.mst@redhat.com>
 <fbf6f659974884f7430ec7ef68028305d7acee0c.1680533760.git.mst@redhat.com>
 <a69f2e1d-bf93-8f65-791f-510d2703cd9a@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <a69f2e1d-bf93-8f65-791f-510d2703cd9a@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v11 05/10] pci: add admin vq
 registers to virtio over pci

On Thu, Apr 06, 2023 at 12:14:32AM -0400, Parav Pandit wrote:
> 
> 
> On 4/3/2023 11:03 AM, Michael S. Tsirkin wrote:
> > Add new registers to the PCI common configuration structure.
> > 
> > These registers will be used for querying the indices of the admin
> > virtqueues of the owner device. To configure, reset or enable the admin
> > virtqueues, the driver should follow existing queue configuration/setup
> > sequence.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > ---
> > dropped Max's S.O.B
> > make queue_num not 0 based
> > ---
> >   content.tex | 34 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 34 insertions(+)
> > 
> > diff --git a/content.tex b/content.tex
> > index 2eb15fa..5057df2 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -948,6 +948,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> >           le64 queue_device;              /* read-write */
> >           le16 queue_notify_data;         /* read-only for driver */
> >           le16 queue_reset;               /* read-write */
> > +
> > +        /* About the administration virtqueue. */
> > +        le16 admin_queue_index;         /* read-only for driver */
> > +        le16 admin_queue_num;         /* read-only for driver */
> >   };
> >   \end{lstlisting}
> > @@ -1033,6 +1037,19 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> >           This field exists only if VIRTIO_F_RING_RESET has been
> >           negotiated. (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
> > +\item[\field{admin_queue_index}]
> > +        The device uses this to report the index of the first administration virtqueue.
> > +        This field is valid only if VIRTIO_F_ADMIN_VQ has been negotiated.
> > +\item[\field{admin_queue_num}]
> > +	The device uses this to report the number of the
> > +	supported administration virtqueues.
> > +	Virtqueues with index
> > +	between \field{admin_queue_index} and (\field{admin_queue_index} +
> > +	\field{admin_queue_num} - 1) inclusive serve as administration
> > +	virtqueues.
> > +	The value 0 indicates no supported administration virtqueues.
> no supported .. reads odd.
> How about,
> The value of 0 indicates that administration virtuques are unsupported.

I went back and forth on this but I feel "no queues" is clearer
in the end, and not odd: zero number of queues means no queues.

> > +	This field is valid only if VIRTIO_F_ADMIN_VQ has been
> > +	negotiated.
> >   \end{description}
> >   \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
> > @@ -1119,6 +1136,14 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> >   were used before the queue reset.
> >   (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
> > +If VIRTIO_F_ADMIN_VQ has been negotiated, and if the driver
> > +configures any administration virtqueues, the driver MUST
> > +configure the administration virtqueues using the index
> > +in the range \field{admin_queue_index} to
> > +\field{admin_queue_index} + \field{admin_queue_num} - 1 inclusive.
> > +The driver MAY configure less administration virtqueues than
> > +supported by the device.
> > +
> >   \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
> >   The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
> > @@ -7686,6 +7711,15 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >     \item[VIRTIO_F_ADMIN_VQ(41)] This feature indicates that the device exposes one or more
> >     administration virtqueues.
> > +  At the moment this feature is only supported for devices using
> > +  \ref{sec:Virtio Transport Options / Virtio Over PCI
> > +	  Bus}~\nameref{sec:Virtio Transport Options / Virtio Over PCI Bus}
> > +	  as the transport and is reserved for future use for
> > +	  devices using other transports (see
> > +	  \ref{drivernormative:Basic Facilities of a Virtio Device / Feature Bits}
> > +	and
> > +	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
> > +	handling features reserved for future use.
> >   \end{description}
> Reviewed-by: Parav Pandit <parav@nvidia.com>
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

