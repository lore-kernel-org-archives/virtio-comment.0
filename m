Return-Path: <virtio-comment-return-7301-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83964C71153
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 03:01:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C10DD120D4D
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 03:01:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7106986460
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 03:01:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A38469862F3; Mon, 11 Sep 2023 03:01:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 901EE98635C
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Sep 2023 03:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: siLWU4-rP_CMAGkQGgTYQg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694401276; x=1695006076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fR3GISSUmd39QfQGXsaV2GtHfJRBypAlP8x+Z9lgtNk=;
        b=MZ9p7QXAdLsXX0jaN6Tkeahvc2eiF+8gHVRPGtG0uVp3XnV6BrbLkE5BGqYFUfsV6h
         E3eMOWBc4IoSctWoTWYAsKW7cW1xymFPcshf8YswhKn8AzuQoTdYHTqV+XaLbEmwvPs9
         CmYxoh5kEcSAEF+7EqSOjxpdySCCYWG3lgkT3v+Qdi4dSRCQvPuuer6RGQG2LSJuv3kZ
         Hvn7cV9FR2R/FfZnLtJi990IwqduwbJZLslbX+/kdKt0P9vw6Xa5z2jGsEIE/mmxyj+K
         BEfGs5UZxGkve+LYCvOk4oSvAEjzSj3BlOnFuoxB8Dfv14YKlIxX/eD9Gcu8AC3bQH9n
         IeGw==
X-Gm-Message-State: AOJu0Yyf8aEjLUYAbAp3wnxlfL1HX5kS63rohPS4j8RP1u2EfUMnpr61
	UDZ7WyjdkaiLoTMdMs1zA9Jwwecf9C+pPiDGhgcYg4i4dafr8TszuwW6xdBaX5xJZ0mIUSnB1vl
	qWgZETvan9h3+1INterxEJw8pwswvSUw4rVQaA3NmFgALOLxW4w==
X-Received: by 2002:a05:6512:36c6:b0:500:9ab8:b790 with SMTP id e6-20020a05651236c600b005009ab8b790mr5616139lfs.60.1694401275760;
        Sun, 10 Sep 2023 20:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6M8bF8YorQ2T/7nM8jLnY8gQ5BbAUthN4lYtPFxZtXEtqKlBKHY3Fes+0hVFYnWKa2/eUWVa2ML74yqAAwxw=
X-Received: by 2002:a05:6512:36c6:b0:500:9ab8:b790 with SMTP id
 e6-20020a05651236c600b005009ab8b790mr5616128lfs.60.1694401275390; Sun, 10 Sep
 2023 20:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-6-lingshan.zhu@intel.com> <20230906043016-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230906043016-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 11 Sep 2023 11:01:03 +0800
Message-ID: <CACGkMEu4R_nUFmpoNesmjJ-PtoE5brpWh8NLruWhEWycm2K4yg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@intel.com>, eperezma@redhat.com, cohuck@redhat.com, 
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org, 
	virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 5/5] virtio-pci: implement VIRTIO_F_QUEUE_STATE

On Wed, Sep 6, 2023 at 4:33=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Wed, Sep 06, 2023 at 04:16:37PM +0800, Zhu Lingshan wrote:
> > This patch adds two new le16 fields to common configuration structure
> > to support VIRTIO_F_QUEUE_STATE in PCI transport layer.
> >
> > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>
>
> I do not see why this would be pci specific at all.

This is the PCI interface for live migration. The facility is not
specific to PCI.

It can choose to reuse the common configuration or not, but the
semantic is general enough to be used by other transports. We can
introduce one for MMIO for sure.

>
> But besides I thought work on live migration will use
> admin queue. This was explicitly one of the motivators.

I think not. Using admin virtqueue will end up with several problems:

1) the feature is not self contained so at the end we need transport
specific facility to migrate the admin virtqueue
2) won't work in the nested environment, or we need complicated SR-IOV
emulation in order to work

>
> Poking at the device from the driver to migrate it
> is not going to work if the driver lives within guest.

This is by design to allow live migration to work in the nested layer.
And it's the way we've used for CPU and MMU. Anything may virtio
different here?

Thanks


>
>
>
>
> > ---
> >  transport-pci.tex | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/transport-pci.tex b/transport-pci.tex
> > index a5c6719..3161519 100644
> > --- a/transport-pci.tex
> > +++ b/transport-pci.tex
> > @@ -325,6 +325,10 @@ \subsubsection{Common configuration structure layo=
ut}\label{sec:Virtio Transport
> >          /* About the administration virtqueue. */
> >          le16 admin_queue_index;         /* read-only for driver */
> >          le16 admin_queue_num;         /* read-only for driver */
> > +
> > +     /* Virtqueue state */
> > +        le16 queue_avail_state;         /* read-write */
> > +        le16 queue_used_state;          /* read-write */
> >  };
> >  \end{lstlisting}
> >
> > @@ -428,6 +432,17 @@ \subsubsection{Common configuration structure layo=
ut}\label{sec:Virtio Transport
> >       The value 0 indicates no supported administration virtqueues.
> >       This field is valid only if VIRTIO_F_ADMIN_VQ has been
> >       negotiated.
> > +
> > +\item[\field{queue_avail_state}]
> > +        This field is valid only if VIRTIO_F_QUEUE_STATE has been
> > +        negotiated. The driver sets and gets the available state of
> > +        the virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}=
).
> > +
> > +\item[\field{queue_used_state}]
> > +        This field is valid only if VIRTIO_F_QUEUE_STATE has been
> > +        negotiated. The driver sets and gets the used state of the
> > +        virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
> > +
> >  \end{description}
> >
> >  \devicenormative{\paragraph}{Common configuration structure layout}{Vi=
rtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common c=
onfiguration structure layout}
> > @@ -488,6 +503,9 @@ \subsubsection{Common configuration structure layou=
t}\label{sec:Virtio Transport
> >  present either a value of 0 or a power of 2 in
> >  \field{queue_size}.
> >
> > +If VIRTIO_F_QUEUE_STATE has not been negotiated, the device MUST ignor=
e
> > +any accesses to \field{queue_avail_state} and \field{queue_used_state}=
.
> > +
> >  If VIRTIO_F_ADMIN_VQ has been negotiated, the value
> >  \field{admin_queue_index} MUST be equal to, or bigger than
> >  \field{num_queues}; also, \field{admin_queue_num} MUST be
> > --
> > 2.35.3
> >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >
>


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

