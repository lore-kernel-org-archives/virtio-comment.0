Return-Path: <virtio-comment-return-7065-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CE4C001B0
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 07:05:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 759046034D
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 07:05:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4771E9864D2
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 07:05:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 25344983D41; Thu, 10 Aug 2023 07:05:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ECE249864C2
	for <virtio-comment@lists.oasis-open.org>; Thu, 10 Aug 2023 07:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Tp5fe2CXPiiyyALXoRKGyg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691651069; x=1692255869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5uxDjsg6JtAfxSL1L+AkFz6NMZcX68UTVFZ3Nt0nos=;
        b=R/HItMWnoibGPn4oB/lYEglK2QryrQSCZrDYAQwGDiB/nOvHolxwWcZWkU3nZWIf5k
         HxtGEGWY0uCdVD+VIwZoc9suUUn171OANhCYk9BczfWXd2Tk6w2ppxfI9xfnOuDNZK2M
         GzV0dB1RYzOqGtyIIRvBCRIVvvYkHWPY1KG0qNejokOBWyg+tFoprUrM96S0yyyNllqf
         JFWtg6oe1wcffzBxFiiNLzi1o6+sSTyYNl/bFKlCZM4WyV4dgtmDNOaICV/fK5pUqwsY
         FsBS+G/2fRAc7YuouM45DHInu/o4mkN4gjlhCQgVFL9z9SHHFLgQU/VfRO++ZcwPfpPo
         cgPQ==
X-Gm-Message-State: AOJu0Yyi40q/ADLYuuq3AFVOQU6f+K7y3Vk6T7TAfR/uUQ+wxL9Yhc7U
	dpMTNM8RoQ0ukgZE2urOcV3hiaTcYTWKuS27Do+3w5Lhgb1RLXJLDmvlnC5F6B396LaZo/+/24Z
	g1oE/v2EFII3eJR6xLxX10W7qEO0GUbzl1jnC5Np0vrQwYZYNhg==
X-Received: by 2002:a2e:b179:0:b0:2b7:2ea:33c9 with SMTP id a25-20020a2eb179000000b002b702ea33c9mr1216779ljm.20.1691651069204;
        Thu, 10 Aug 2023 00:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkYCM9XDMALq44vzv0bxau7zqGmKMGbVH2kskpnN0f9CpblU2fZBVJO8qbiFLt6yUOyHrVWMDXI20FHGwFWhA=
X-Received: by 2002:a2e:b179:0:b0:2b7:2ea:33c9 with SMTP id
 a25-20020a2eb179000000b002b702ea33c9mr1216755ljm.20.1691651068871; Thu, 10
 Aug 2023 00:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <1691481880.8297818-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1691481880.8297818-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 10 Aug 2023 15:04:17 +0800
Message-ID: <CACGkMEtfHvg5YAi1Cz0PZV2w_CqU70hQA3XU3gwYx0Gg2Ke+RQ@mail.gmail.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Satananda Burla <sburla@marvell.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] virtio-net ip restriction.

On Tue, Aug 8, 2023 at 4:09=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.co=
m> wrote:
>
> ## Background
>
> For cloud, the ip restriction is important. Because the user of the vm is
> untrustworthy. One user may use the ip of another to config the netdevice=
 to
> receive and send packets. So we need to restrict the ip traffic of the de=
vice(or port).
>
> ## Implement
> Now we have these choice:
>
> 1. introduce the switch(as the part of pf or as a separate device under a=
ll PF
>    and VFs ), the switch support rx/tx filter
> 2. the virtio-net device support the ip restriction

I think they are not contradictory, we can have both. I'd suggest
starting from 2 as it's simple without new dependencies.

One question though, besides ip restriction, how did you implement the
trust and spoof checking?

Thanks

>
>
> Parav wrote:
> > I understood that you for some reason do not need restrictions for the =
PF.
> > I do not know why you don't need it. :)
> > Most cloud setups that I came across so far, needs it, but ok...
>
> PF is used by the administrator, so the ip restriction for the PF is
> not important. But we can have this feature.
>
> > The design for the switch object needs to cover the PF as well, even th=
ough it may not be done initially.
> > (hint: an abstraction of switch port to be done, instead of doing thing=
s directly on the group member id).
> >
> > We are seeing use cases reducing of having switch located on the PF for=
 its VFs.
>
> So for you, we should introduce a switching PF?
>
> > So please reconsider.
> > I remember you mentioned in past in other thread, that mac etc is contr=
olled from the infrastructure side.
>
> YES.
>
> > So, I repeatedly ask if you _really_ need to have the switch object as =
part of the owner PF or not.
>
> For me, that are all ok.
> Could you explain the difference between these?
> So I would to know which one is better and which one is simper?
>
> > Which sort of contradicts with locating the administrative switch on th=
e owner PF.
>
> Why?
>
> For us, all is on the DPU.
>
> >
> > If it does, flow filters vq that is being worked with Heng, Satananda, =
David
> > and others seems right direction to implement simple->complex switch ob=
ject
> > progressively.
>
> Great!!
>
>
> Thanks.
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

