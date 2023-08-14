Return-Path: <virtio-comment-return-7071-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56264C001B0
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 02:54:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 87195370F1
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 02:54:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7488998637D
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 02:54:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6B8C4983BBC; Mon, 14 Aug 2023 02:54:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 56DD798633D
	for <virtio-comment@lists.oasis-open.org>; Mon, 14 Aug 2023 02:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: nO5aK_4_Ma6IPaVmZQ_1DQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691981679; x=1692586479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofcgpCJ8o23ZxfJToBXCStFSV4PfQzgvKQSUOIsRzVg=;
        b=GGwkJ//CrlPO+s6+HwyJkep05Bvu1Ma2v3ThPJ1SqO/14LIqDouC4Ud0XRr1GxhjGU
         jV1QTaObTdDtguHLLNyHu3y6ACrO5zg+jqzy3cr3b+/IpiBov49r8lvLlvWqdRE6aMer
         vx5+oXV+aZwkbMWm1AyiVbvYr4NCXesXHmXkuQtIPnrpb7G+tGJZVIG3/Y1MaTpbcAA0
         dMmOLit9NsYr0lclDjjDefgtj+tIH6TraMkaOrqQFPo4VQDEn6I7GpCdVsBcK/PF1Rs2
         alOk331hQWnCTKqNcvu/G1jc1arsdGQUb8kU95dlx7qOS90pHRtjqggSeuV/F+Z0UVPQ
         23hA==
X-Gm-Message-State: AOJu0YxsfdfjNiyZrdAR+FVgII4ZrZEkBBCLvDJGQI1CDeGXrMWs4p1/
	az1ZfwkW1m6budhlNaJFYiHtBhmeOyWuUoVju+YNd4gNSOBuMKokqUf24qL7HAx+85dkkyeFF0s
	LwmxN/d/tfAdgFGSvFhSn3OFGq2gGYD9J22GwhWdEz8092V5Ptw==
X-Received: by 2002:a2e:9198:0:b0:2b7:65:fca2 with SMTP id f24-20020a2e9198000000b002b70065fca2mr5615356ljg.49.1691981679372;
        Sun, 13 Aug 2023 19:54:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfQB5owbNh92yYDeHv2lQ06f5ZQTvS5DfwiQv2zTw/MjNL1tDYKpSbJRLPZOSGTyV9sZs2ZQ11mT9W+6Xg50w=
X-Received: by 2002:a2e:9198:0:b0:2b7:65:fca2 with SMTP id f24-20020a2e9198000000b002b70065fca2mr5615350ljg.49.1691981679015;
 Sun, 13 Aug 2023 19:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230724033421.249893-1-parav@nvidia.com> <20230724033421.249893-7-parav@nvidia.com>
 <1691570137.0487022-1-xuanzhuo@linux.alibaba.com> <CACGkMEs-d-zPLByDNuDNda7UPDsm6hgZKw-3A1aNA4npUsWy7g@mail.gmail.com>
 <CAF=yD-+LMY3yE3qtd4vHc8CGOz6UAf4njM2QiZcajrQgL=KZRQ@mail.gmail.com>
In-Reply-To: <CAF=yD-+LMY3yE3qtd4vHc8CGOz6UAf4njM2QiZcajrQgL=KZRQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 14 Aug 2023 10:54:27 +0800
Message-ID: <CACGkMEsw+H+2nuWBSRZQZ4GG1t2xynwi1Tku1PwDNVLt-R=p7g@mail.gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>, shahafs@nvidia.com, 
	hengqi@linux.alibaba.com, virtio@lists.oasis-open.org, 
	virtio-comment@lists.oasis-open.org, Willem de Bruijn <willemb@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [virtio] [PATCH requirements 6/7]
 net-features: Add packet timestamp requirements

On Fri, Aug 11, 2023 at 5:28=E2=80=AFAM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> On Thu, Aug 10, 2023 at 2:56=E2=80=AFAM Jason Wang <jasowang@redhat.com> =
wrote:
> >
> > On Wed, Aug 9, 2023 at 4:47=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibab=
a.com> wrote:
> > >
> > > On Mon, 24 Jul 2023 06:34:20 +0300, Parav Pandit <parav@nvidia.com> w=
rote:
> > > > Add tx and rx packet timestamp requirements.
> > > >
> > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > ---
> > > >  net-workstream/features-1.4.md | 26 ++++++++++++++++++++++++++
> > > >  1 file changed, 26 insertions(+)
> > > >
> > > > diff --git a/net-workstream/features-1.4.md b/net-workstream/featur=
es-1.4.md
> > > > index d228462..37820b6 100644
> > > > --- a/net-workstream/features-1.4.md
> > > > +++ b/net-workstream/features-1.4.md
> > > > @@ -10,6 +10,7 @@ together is desired while updating the virtio net=
 interface.
> > > >  2. Low latency tx and rx virtqueues for PCI transport
> > > >  3. Virtqueue notification coalescing re-arming support
> > > >  4  Virtqueue receive flow filters (RFF)
> > > > +5. Device timestamp for tx and rx packets
> > > >
> > > >  # 3. Requirements
> > > >  ## 3.1 Device counters
> > > > @@ -280,3 +281,28 @@ struct virtio_net_rff_delete {
> > > >       u8 padding[2];
> > > >       le32 flow_id;
> > > >  };
> > > > +
> > > > +## 3.5 Packet timestamp
> > > > +1. Device should provide transmit timestamp and receive timestamp =
of the packets
> > > > +   at per packet level when the device is enabled.
> > > > +2. Device should provide the current free running clock in the lea=
st latency
> > > > +   possible using an MMIO register read of 64-bit to have the leas=
t jitter.

Btw, register is not offered via all transports.

> > > > +3. Device should provide the current frequency and the frequency u=
nit for the
> > > > +   software to synchronize the reference point of software and the=
 device using
> > > > +   a control vq command.
> > > > +
> > > > +### 3.5.1 Transmit timestamp
> > > > +1. Transmit completion must contain a packet transmission timestam=
p when the
> > > > +   device is enabled for it.
> > > > +2. The device should record the packet transmit timestamp in the c=
ompletion at
> > > > +   the farthest egress point towards the network.
> > > > +3. The device must provide a transmit packet timestamp in a single=
 DMA
> > > > +   transaction along with the rest of the transmit completion fiel=
ds.
> > > > +
> > > > +### 3.5.2 Receive timestamp
> > > > +1. Receive completion must contain a packet reception timestamp wh=
en the device
> > > > +   is enabled for it.
> > > > +2. The device should record the received packet timestamp at the c=
loset ingress
> > > > +   point of reception from the network.
> > > > +3. The device should provide a receive packet timestamp in a singl=
e DMA
> > > > +   transaction along with the rest of the receive completion field=
s.
> > >
> > >
> > > According to the last discuss, the feature will depend on the new des=
c
> > > structure.
> > >
> > > I would to know, can we introduce this to the current spec with a sim=
ple change?
> > >
> > >  struct vring_used_elem {
> > >         /* Index of start of used descriptor chain. */
> > >         __virtio32 id;
> > >         /* Total length of the descriptor chain which was used (writt=
en to) */
> > >         __virtio32 len;
> > >
> > > +       __virtio64 timestamp;
> > >  };
> >
> > I think this could be one way and another proposal from Willem is:
> >
> > https://lists.linuxfoundation.org/pipermail/virtualization/2021-Februar=
y/052422.html
> >
> > which might be tricky for TX but it's more flexible since it allows
> > timestamps to be done per buffer.
>
> Thanks for looping me in, Jason.
>
> I would separate timestamping data from clock synchronization and
> timestamping control path.
>
>
> For synchronization, a single 64-bit MMIO read is not necessarily the
> fastest when traversing real hardware boundaries, or sufficient. PCIe
> has Precision Time Measurement (PTM) hardware logic to capture
> clock measurement with less uncertainty and possibly latency, for instanc=
e.
> Indeed, uncertainty is more important than raw latency.
>
> FWIW, we're also trying to capture similar requires for physical devices
> through the Open Compute Platform NIC Core Offloads effort:
> https://www.opencompute.org/w/index.php?title=3DCore_Offloads#Timestampin=
g

This is interesting and the whole idea of "NIC Core Offloads" looks
great as well.

>
> Virtio defines both a virtual interface and one that can be supported
> by hardware, so it's not a 1:1 match, but many subtle points probably
> apply to both.

Yeah, I think virito-net may try to align with that.

>
>
> For timestamping, the difficult part is the transmit completion stamp,
> asynchronous with data flow. If this is taken on the device before or
> at the time of queuing the completion to the host, then it can be stored
> in\ the completion descriptor.

Yes, this is the proposal from Xuan actually.

> But if taken at the PHY, say, it is not
> uncommon for this to happen after the completion is written.

This seems the requirement of the this patch which says:

"
 The device should record the packet transmit timestamp in the completion a=
t
 the farthest egress point towards the network.
"

It seems to imply the PHY but with a DMA interface:

"
The device must provide a transmit packet timestamp in a single DMA
transaction along with the rest of the transmit completion fields.
"

Parav, can you clarify? And

> And
> instead a block of dedicated registers is used and the host must poll
> a register. There are examples of these in the Linux device driver
> directory. For virtio, it is probably sufficient to only support the
> first kind.

RIght, for the second, it could be tricky for a virtual environemnt.

>
>
> A third aspect is the control path: querying and configuring hardware
> timestamps (siocgstamp/siosgstamp). If hardware is capable, easiest is
> to just timestamp every packet. Much hardware out there targets low
> rate PTP messages. But a virtualized virtio device could timestamp
> all. In which case this control API can maybe be punted on.
>

That could be one way.

Thanks


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

