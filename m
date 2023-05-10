Return-Path: <virtio-comment-return-5847-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CCEC77B7C
	for <virtio-comment@archiver.kernel.org>; Wed, 10 May 2023 07:43:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 20250FD567
	for <virtio-comment@archiver.kernel.org>; Wed, 10 May 2023 07:43:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 056C2986575
	for <virtio-comment@archiver.kernel.org>; Wed, 10 May 2023 07:43:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E7D3C986569; Wed, 10 May 2023 07:43:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D58D098656B
	for <virtio-comment@lists.oasis-open.org>; Wed, 10 May 2023 07:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: dg5OBJavOS6VyCkrkQA1-Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683704604; x=1686296604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1sh1CKFGV6rXJgC6lW/6Xlf36Ciy/6yh4KDr2YmBYQ=;
        b=gMySeQFzv7niEcRRAQQniv3P2L09zwo9H+nBzPftS+fWV3JI6Z1shiIebRpuMYFyp+
         LNBWVVYTAIpZBT6H62+FWwtCT+bQCTx3/l0e3MlKPlrMAAuLt3VnSnChIp4wRopI10hn
         9O4DIhGJtnzoZWInNyUi3TRgkVyeuxjDV0lpuRGKK3X36IlxPICX66KjPU91YDac3o7U
         /m0LR92htWVAq0U+6mq9ueIKaG9i9YSqo44bPMxHUahUJ8CNxqMh5owFsAbHW+Nq06B2
         eCM7PFge0L6jHZHQEVG2+OPkJJ1w9HmAE/40i9KenQioksMUoYqGqW9qQJGxBAGPpijL
         Ltmw==
X-Gm-Message-State: AC+VfDwm01uLFfb/SRkD8PHgPwLgb1OKrpEz8bF5gHoJeULhgEXkQFID
	G5ObZtlcgrBzc2+PfAQf7ThBjWLuZLM4HaYpRjqfEnZpdmcFnVdqI9RURWyTUW6PS38hIr7igeo
	OIHSRaQF/NOwxSCoHofj9XCQoy1yxbOWxfg==
X-Received: by 2002:adf:f946:0:b0:306:32fa:6750 with SMTP id q6-20020adff946000000b0030632fa6750mr10394943wrr.33.1683704603829;
        Wed, 10 May 2023 00:43:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4SadztY4vFL7iJapGYUEoNJtdlvTMcycschUtXXzK3HYQczfB4K7cek5/2mWE5uY45hVMSzg==
X-Received: by 2002:adf:f946:0:b0:306:32fa:6750 with SMTP id q6-20020adff946000000b0030632fa6750mr10394929wrr.33.1683704603520;
        Wed, 10 May 2023 00:43:23 -0700 (PDT)
Date: Wed, 10 May 2023 03:43:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org,
	cohuck@redhat.com, david.edmondson@oracle.com, sburla@marvell.com,
	yishaih@nvidia.com, maorg@nvidia.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230510033812-mutt-send-email-mst@kernel.org>
References: <20230506000135.628899-1-parav@nvidia.com>
 <CACGkMEt_2B68a+BZ4-vfeDf_eYj5ZhxrDNd6dxuiF85qr0yN2g@mail.gmail.com>
 <20230507093959-mutt-send-email-mst@kernel.org>
 <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <20230510014534-mutt-send-email-mst@kernel.org>
 <CACGkMEvTs9oMewgrQpYZu1v1wdUXtxsvjqB6CPRf+y4C8EN_KQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvTs9oMewgrQpYZu1v1wdUXtxsvjqB6CPRf+y4C8EN_KQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Wed, May 10, 2023 at 03:01:25PM +0800, Jason Wang wrote:
> On Wed, May 10, 2023 at 2:05 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, May 08, 2023 at 10:23:39AM +0800, Jason Wang wrote:
> > > > I thought so too originally. Unfortunately I now think that no, legacy is not
> > > > going to be a byproduct of transport virtqueue for modern -
> > > > it is different enough that it needs dedicated commands.
> > >
> > > If you mean the transport virtqueue, I think some dedicated commands
> > > for legacy are needed. Then it would be a transport that supports
> > > transitional devices. It would be much better than having commands for
> > > a partial transport like this patch did.
> >
> > OK I am beginning to get what you are saying.  So your criticism is
> > this: what if device supports vq transport for modern, and we want to
> > build a transitional device on top.  how will that look. yes?
> 
> Yes. I think it needs to be done through the transport virtqueue
> otherwise the transport is not self-contained.

I mean, any feature can be done over transport vq.

But there is value in adding legacy commands to an otherwise
modern device without reworking it completely to
switch to a different transport.


> > A reasonable thing to include at least in the commit log. Parav?
> >
> > You are also asking what if the device uses transport vq,
> > and we want transitional on top of that.
> > It's a fair question but I don't exactly get why would
> > this legacy support feature be wanted for the vq transport
> > and not for other transports.
> 
> Not sure I get the question, but all the existing transport support
> legacy, if we want to have another, should the legacy support be a
> must or not?

This specific proposal is for tunneling legacy over admin vq.
It can live alongside a normal modern VF, with hypervisor
combining these to create a transitional device.

> >
> >
> >
> >
> > > > Consider simplest case, multibyte fields. Legacy needs multibyte write,
> > > > modern does not even need multibyte read.
> > >
> > > I'm not sure I will get here,
> >
> > What does this mean?
> 
> I meant I don't get what the issue if "modern does not even need
> multibyte read".

parse error again. reword?

> >
> > > since we can't expose admin vq to
> > > guests, it means we need some software mediation. So if we just
> > > implement what PCI allows us, then everything would be fine (even if
> > > some method is not used).
> > >
> > > Thanks
> >
> > To repeat discussion on one of the previous versions, no it will not be
> > fine because legacy virtio abuses pci in fundamentally broken ways.
> > So yes you need a mediator on the host but even giving this
> > mediator a chance to be robust on top of hardware
> > means the hardware interface can not simply mirror legacy
> > to hardware.
> >
> > For example, host mediator needs to trap writes into mac,
> > buffer them and then send a 6 byte write.
> > Now, pci actually does allow 6 byte writes, but legacy
> > guests instead to 6 single byte writes for portability reasons.
> 
> It's a known race condition, so PCI over adminq doesn't make it worse.

it can however make it better - you can do a single 6 byte write command.

> The mediator can just mirror what guests write over the admin
> commands.

and this "just" just isn't good enough, or we end up with hacks
in hardware.

> Thanks
> 
> > --
> > MSr
> >


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

