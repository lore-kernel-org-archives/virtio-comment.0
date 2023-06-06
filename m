Return-Path: <virtio-comment-return-6163-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92812C7EE24
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:20:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C93E423D59
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:20:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 986189864D1
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:20:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7A4479864BB; Tue,  6 Jun 2023 19:20:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5DB199864C1
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 19:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 8raaXfjENhitsFOr0RZrkw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686079199; x=1688671199;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFGhB9PrHLnSTfuKStfiDkScHVH3g4ITj0Fp/LkdTEE=;
        b=YUFo2xGHj2OfWVZfKnaR9D4gpgUH9SFjDqNeq9kYg+4+LkWK/p1kf1kFcGnktPqWtE
         ufha8Fi7o8ts5JnyvcAjZvdQonsirCHIoFmC3ne5thB8JmxqtRhKI3YBwHST6kkqNpeN
         koDxK7EQ/OEN6ke36V00HvM5YUt9Cc+p7hYpkFvsxwIpmHpRUa31xz9L6Qir8+ifOIkW
         T/SPigmV8P4laOefhsgjz+/KK1WZw1yivCdlOcG1D8ISaXkwWY0Ef/AC5LjV7ifM6F/o
         /8v6ws7Ia6meNz5wZ18Y6kUeY/krad/uWqZ86E8RQ8UEAqXufd2ylVgBlbutP/0MfiZZ
         2O2w==
X-Gm-Message-State: AC+VfDwuV+TmDUJqXnrEgxLoXd8dcSPIjoHj6NS9Ex4aNJlPu7AgLbvT
	SLjYVx14dF5BxUywiBbFfxNU7CLstNfzy+DitqtqmJVp3f3QvNFmY7eRVKE0TtISXwJ7c4mpdFA
	PtHyigijRNl3BOJ1KrXnEYQgvjEyucFcYqg==
X-Received: by 2002:a5d:4d8a:0:b0:307:9d2a:fd35 with SMTP id b10-20020a5d4d8a000000b003079d2afd35mr2574524wru.53.1686079199485;
        Tue, 06 Jun 2023 12:19:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Dc18VHyZqddK1KC9XFEgcusBJvvcqHSM41ehE+U9SsByLKdc5r0ElsZCZitU3yWLqpgF2Lg==
X-Received: by 2002:a5d:4d8a:0:b0:307:9d2a:fd35 with SMTP id b10-20020a5d4d8a000000b003079d2afd35mr2574505wru.53.1686079199080;
        Tue, 06 Jun 2023 12:19:59 -0700 (PDT)
Date: Tue, 6 Jun 2023 15:19:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"alvaro.karsz@solid-run.com" <alvaro.karsz@solid-run.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>,
	"longpeng2@huawei.com" <longpeng2@huawei.com>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
Message-ID: <20230606151520-mutt-send-email-mst@kernel.org>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-2-eperezma@redhat.com>
 <PH0PR12MB5481D1ACC60311CE48D622CFDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481D1ACC60311CE48D622CFDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH 1/2] virtio: introduce selective queue enabling

On Tue, Jun 06, 2023 at 06:04:32PM +0000, Parav Pandit wrote:
> Hi Eugenio,
> 
> > From: Eugenio Pérez <eperezma@redhat.com>
> > Sent: Tuesday, June 6, 2023 1:55 PM
> > 
> > This patch allows the driver to start the device (as set DRIVER_OK) with only
> > some queues enabled, and then enable another queues later.
> > 
> > This is the current way to migrate net device state through control virtqueue, in
> > a software assisted framework with vDPA:
> > * First, only net CVQ is enabled at DRIVER_OK
> > * All the control commands (mac address, mq, etc) needed for the device to
> > behave the same as the source of migration are sent
> > * Finally all the dataplane queues are enabled.
> > 
> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > ---
> >  content.tex | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/content.tex b/content.tex
> > index d2ab9eb..ea4a6d8 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
> > Virtio Device / Feature B  \begin{description}
> >  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
> > 
> > -\item[24 to 41] Feature bits reserved for extensions to the queue and
> > +\item[24 to 42] Feature bits reserved for extensions to the queue and
> >    feature negotiation mechanisms
> > 
> > -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
> > +\item[43 to 49, and 128 and above] Feature bits reserved for future
> > extensions.
> >  \end{description}
> > 
> >  \begin{note}
> > @@ -398,6 +398,13 @@ \section{Virtqueues}\label{sec:Basic Facilities of a
> > Virtio Device / Virtqueues}  Every driver and device supports either the Packed
> > or the Split  Virtqueue format, or both.
> > 
> > +\subsection{Virtqueue selective enabling}\label{sec:Basic Facilities of
> > +a Virtio Device / Virtqueues / Selective Virtqueue Enable}
> > +
> > +If the driver negotiates VIRTIO\_F\_RING\_ENABLE\_ANYTIME, it can
> > +enable individual virtqueues both before and after the DRIVER\_OK. The
> > +way to enable a virtqueue is transport specific, but it mimics the
> > +re-enabling after an hypothetical reset.
> > +
> >  \subsection{Virtqueue Reset}\label{sec:Basic Facilities of a Virtio Device /
> > Virtqueues / Virtqueue Reset}
> > 
> >  When VIRTIO_F_RING_RESET is negotiated, the driver can reset a virtqueue
> > @@ -870,6 +877,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> > Feature Bits}
> >  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
> >  	handling features reserved for future use.
> > 
> > +  \item[VIRTIO_F_RING_ENABLE_ANYTIME(42)] This feature indicates  that
> > + the driver can enable a queue both before and after DRIVER\_OK.
> > +  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Selective
> > Virtqueue Enable}.
> > +
> 
> Can you please highlight, current spec normative which indicates that
> all queues must be enabled before DRIVER_OK and more queues cannot be
> enabled after DRIVER_OK?


This one:
\drivernormative{\subsection}{Device Initialization}{General Initialization And Device Operation / Device Initialization}

it does not say "all queues" if you want to split hairs but I think
assuming it's safe to enable queues later is dangerous.

E.g. vhost user backends tend to assume no new queues appear
after DRIVER_OK.

-- 
MST


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

