Return-Path: <virtio-comment-return-7064-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F41C001B0
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 06:56:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DB76E45B2D
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 06:56:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BA33F986559
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 06:56:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A243C9864C1; Thu, 10 Aug 2023 06:56:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8E0409864C2
	for <virtio-comment@lists.oasis-open.org>; Thu, 10 Aug 2023 06:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: KaDcWwR-OEO33D65SnfIrg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691650572; x=1692255372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+mTXKA3SYyDC6RMh0vz5uqokNjKq15py1Gcjb1M7qY=;
        b=ZoGjE2vkT6Et1TrnaEb2N2k3Z5M7HlKiS53QD0iAaX88srs8N7ApczywrQABOBpqDm
         /S1k+z8CetgRnETn/iIsMoAMOuUIejBa532DtiNzjYlfm4AJm3iVPQcNmtXvtua5/qRR
         Hz8MfAzNb5Zh2aN53mdcZ01c0t8zLZXtLPYhBwzdlQXqynu9GfVXH3KEBd4FVGxMIajb
         Cl7cXLRODc6K0IUZtbM1EYxPSfIkalGatbDN59Ui8p+Xw/P4dPdvgiyqt2o/WHrYOuDE
         pf1fAcWwI0YbVfi11WO3Rtf2dIEs7RJ21XNHpbSnQ1X668LjkmaGOezHGFn0aKksTz8N
         bczQ==
X-Gm-Message-State: AOJu0YzjDVCMrdoJY4mFXC92HSX/2bxCwGXDZ+Aiv2T8cH3RwUnN0mih
	HQELrTFPKqrspWl4XAlDAW95Z3i5M18lpN0yJ9WWuEHwjmzZ1cqowXQaxLf0Wfm/R/cGKWUxVxg
	BDEm7Z1L7t2a+9jQfmMeqg1D5j5leijgZpzJj//7c6V/y+XcclQ==
X-Received: by 2002:a2e:8ecb:0:b0:2b9:eb9d:cc51 with SMTP id e11-20020a2e8ecb000000b002b9eb9dcc51mr1146687ljl.49.1691650572675;
        Wed, 09 Aug 2023 23:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/Y6qcTBgeTL7pCjFnMc/laTJvZoK6IhaggMfqqALh8X5y1GqoKn6ywrB77Tg8hF1Fqb328nR3QwGQkNUCWsI=
X-Received: by 2002:a2e:8ecb:0:b0:2b9:eb9d:cc51 with SMTP id
 e11-20020a2e8ecb000000b002b9eb9dcc51mr1146674ljl.49.1691650572348; Wed, 09
 Aug 2023 23:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230724033421.249893-1-parav@nvidia.com> <20230724033421.249893-7-parav@nvidia.com>
 <1691570137.0487022-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1691570137.0487022-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 10 Aug 2023 14:56:00 +0800
Message-ID: <CACGkMEs-d-zPLByDNuDNda7UPDsm6hgZKw-3A1aNA4npUsWy7g@mail.gmail.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Parav Pandit <parav@nvidia.com>, shahafs@nvidia.com, hengqi@linux.alibaba.com, 
	virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [virtio] [PATCH requirements 6/7]
 net-features: Add packet timestamp requirements

On Wed, Aug 9, 2023 at 4:47=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.co=
m> wrote:
>
> On Mon, 24 Jul 2023 06:34:20 +0300, Parav Pandit <parav@nvidia.com> wrote=
:
> > Add tx and rx packet timestamp requirements.
> >
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  net-workstream/features-1.4.md | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1=
.4.md
> > index d228462..37820b6 100644
> > --- a/net-workstream/features-1.4.md
> > +++ b/net-workstream/features-1.4.md
> > @@ -10,6 +10,7 @@ together is desired while updating the virtio net int=
erface.
> >  2. Low latency tx and rx virtqueues for PCI transport
> >  3. Virtqueue notification coalescing re-arming support
> >  4  Virtqueue receive flow filters (RFF)
> > +5. Device timestamp for tx and rx packets
> >
> >  # 3. Requirements
> >  ## 3.1 Device counters
> > @@ -280,3 +281,28 @@ struct virtio_net_rff_delete {
> >       u8 padding[2];
> >       le32 flow_id;
> >  };
> > +
> > +## 3.5 Packet timestamp
> > +1. Device should provide transmit timestamp and receive timestamp of t=
he packets
> > +   at per packet level when the device is enabled.
> > +2. Device should provide the current free running clock in the least l=
atency
> > +   possible using an MMIO register read of 64-bit to have the least ji=
tter.
> > +3. Device should provide the current frequency and the frequency unit =
for the
> > +   software to synchronize the reference point of software and the dev=
ice using
> > +   a control vq command.
> > +
> > +### 3.5.1 Transmit timestamp
> > +1. Transmit completion must contain a packet transmission timestamp wh=
en the
> > +   device is enabled for it.
> > +2. The device should record the packet transmit timestamp in the compl=
etion at
> > +   the farthest egress point towards the network.
> > +3. The device must provide a transmit packet timestamp in a single DMA
> > +   transaction along with the rest of the transmit completion fields.
> > +
> > +### 3.5.2 Receive timestamp
> > +1. Receive completion must contain a packet reception timestamp when t=
he device
> > +   is enabled for it.
> > +2. The device should record the received packet timestamp at the close=
t ingress
> > +   point of reception from the network.
> > +3. The device should provide a receive packet timestamp in a single DM=
A
> > +   transaction along with the rest of the receive completion fields.
>
>
> According to the last discuss, the feature will depend on the new desc
> structure.
>
> I would to know, can we introduce this to the current spec with a simple =
change?
>
>  struct vring_used_elem {
>         /* Index of start of used descriptor chain. */
>         __virtio32 id;
>         /* Total length of the descriptor chain which was used (written t=
o) */
>         __virtio32 len;
>
> +       __virtio64 timestamp;
>  };

I think this could be one way and another proposal from Willem is:

https://lists.linuxfoundation.org/pipermail/virtualization/2021-February/05=
2422.html

which might be tricky for TX but it's more flexible since it allows
timestamps to be done per buffer.

>
>
> Then, the existing devices can support this easily. If we introduce this =
by the
> new desc structure, we can foresee that this function will not be impleme=
nted by
> many existing machines. But this function is useful. So we want support t=
his by
> a simple way.

Make sense.

Thanks

>
>
> Thanks.
>
> > --
> > 2.26.2
> >
> >
> > ---------------------------------------------------------------------
> > To unsubscribe from this mail list, you must leave the OASIS TC that
> > generates this mail.  Follow this link to all your TCs in OASIS at:
> > https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php
> >
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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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

