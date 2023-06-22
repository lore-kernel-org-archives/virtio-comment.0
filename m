Return-Path: <virtio-comment-return-6470-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EDDEB64D8
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 17:03:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C102329FCB
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 17:03:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A18729865D7
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 17:03:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8E52D9865D0; Thu, 22 Jun 2023 17:03:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7B2519865D1
	for <virtio-comment@lists.oasis-open.org>; Thu, 22 Jun 2023 17:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: fJA59lcSOGqUB0EtUjDS9A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453428; x=1690045428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FU5bOb1fwDJ5zNnTCuNT2umXePAegzs3lSNC9JcaNhQ=;
        b=b+xr4DnTbPP8PlclpFUZM5ltSB5NEn9diRg4QKr7RAkTxjldHlmRJrgXUpzba7DOzX
         p47TgW7yAeQ15EmB+/e5lCZhpiamlebfcsFaADNErrKKpnVdnQnJK2+aXB94J7Gu3EK3
         biluyDBOM6CWXA0xiazJrLYvlLLd1HcI1DeGYSoKrK0O7ilLS+yAQlCdgYK6iQ6RU5ta
         lorKCVL1RaD633QTT12KKw7ubLf421fhF1KkMzcJbvVvy6Hz2XZqTrDpBkdMHSwVD0P6
         2bbJQJPyv4A59eX/d40srZYCCdmWeaShZTCK/5G6v/G3YdzF+Z4LxXtG5Rvrnn6AbNuz
         wKAw==
X-Gm-Message-State: AC+VfDxijo5IyTQFaBJqZdeUvn+rzEj6gAmCjwc/Zd+rmqcczAxJohgD
	fcoA6csEXkHL9Yfob6DPpm5QaeXF0F8Osriw15r5l/ejlLok6tZuZsz2k+6vgM8IDkqQhwfEDXw
	OmxzQKF1a8n5NoE59HpGxL/aC3v1i5kwPYg==
X-Received: by 2002:aa7:c64e:0:b0:518:721e:f594 with SMTP id z14-20020aa7c64e000000b00518721ef594mr13398372edr.37.1687453428241;
        Thu, 22 Jun 2023 10:03:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6c5MEUquKt7NTc7OCZDFkSmJcL7Ugif/GWNjhJ4yYGRsJ2ebHKqX6rJMw2FRcwTg6XH90uJg==
X-Received: by 2002:aa7:c64e:0:b0:518:721e:f594 with SMTP id z14-20020aa7c64e000000b00518721ef594mr13398356edr.37.1687453427935;
        Thu, 22 Jun 2023 10:03:47 -0700 (PDT)
Date: Thu, 22 Jun 2023 13:03:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>
Message-ID: <20230622125601-mutt-send-email-mst@kernel.org>
References: <20230621161157-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C99B8504F02D39B3A6F0DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621163116-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4EA5D0614E1289DFC77DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622021932-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815D6D07A49CE775620088DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <82e83a90-6491-c20b-d96d-f9e0d15c2641@linux.alibaba.com>
 <PH0PR12MB5481A5055A5F58045437391CDC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622123203-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548100743287D401B8ED78CFDC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548100743287D401B8ED78CFDC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v18] virtio-net: support inner
 header hash

On Thu, Jun 22, 2023 at 04:54:48PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, June 22, 2023 12:47 PM
> 
> > 
> > The hardware footprint of keeping this in memory is also fairly small :) I care
> > about a messy interface because this mess builds up over time.
> >
> It is really a simple GET command.
> It is actually messy for the device to implement functionality in two places in cfg space and cvq.
>  
> > And I am worried about capabilities really. My bad that I missed this change in
> > v13. I only can say in my defence that I already had to rewrite huge chunks of
> > this proposal to make it readable so one can't say I'm only delaying things, I also
> > made an effort to help this progress faster :)
> > 
> > I feel we need a single place where device capabilities can live. So far they were
> > in config space.  It's consistent, yes I get this has hardware costs *if* there's a
> > huge number of VFs and *if* there's a way to provision each VF with a different
> > configuration.  
> All the ifs are valid today.
> 
> > And yes querying VFs over MMIO is kind of ugly. But it does at
> > least work, and works fine while VF is assigned.  So we can build migration
> > around that *today*.
> >
> Other way to say migration can be skipped for this feature bit, and it still works for rest.

If VF is assigned then we can't really control what does guest enable.

> > But querying over cvq while VF is assigned clearly *doesn't* work.
> > 
> That is not the idea at all.
> Querying VF capabilities is the role of the admin command for which we built it.

This GET is exactly that though.

> > So what is the solution proposed for this?
> > 
> 1. Query member device capabilities via admin command

But that's not 1.3 material.

> > Yes the current migration is broken in many ways but that's what we have. Let's
> > build something better sure but that is not 1.3 material.
> 
> True, it is not 1.3 material, hence the proposal was to have the GET command.
> Once/if we reach agreement that no new fields to be added to config space starting 1.4 and should be queried using non intercepted cfgvq, it makes sense to let this go in cfg space.
> Else GET command seems the elegant and right approach.

I expect no such agreement at all. Instead, I expect that we'll have an
alternative way to access config space. guest virtio core then needs to
learn both ways, and devices can support one or both.

A good implementation of virtio_cread can abstract that easily so we
don't need to change drivers.

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

