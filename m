Return-Path: <virtio-comment-return-6209-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAC8C77B7A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:57:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 78A1068465
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:57:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 66067986651
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:57:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 54A8D98664C; Wed,  7 Jun 2023 08:57:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 41667986650
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 08:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: x62KswOOO3yGD2MvWjqgyw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128244; x=1688720244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ucg3jCxL78xCcPTdrV+9X0SV41LLLRqrkj85Fd8Z0vk=;
        b=OOWPRx8UMIivVPM9Ub2TC+jWCdoRk3mNvRoRRCP+DNwAfUsjNEXz1u+i2isX4xf5AJ
         UDgvWHSWfTjsPg7ZPiTfaonVwbwSfcptY6OmgfTJ6vwvqzK9IYBpUM5lDmfZ83vS9OSo
         n0yxE2UvP4KZF0cSl+gA2W9nGQramJLM3wWC7pu3tiWkWT0KkIZ0AIkr+eRtDn9gp2kS
         M2MAoxSJwQYWEkF+4ePob74cx11jZ8dR5kV6HvELIFmb2koiyTyLvpX8vofLdrhWOqTV
         +QOxxT3N20NjUYslkNDndDQgyzI2ap3mET5RAm7Ep66R83X1jy/eyyNcG5xZstSE4EE9
         ysNA==
X-Gm-Message-State: AC+VfDxLHdNTiruB//rtopE0wJQDbPNo9ZGDqm7xJ2qQgCevE1l790L7
	X/r2a7wgMsWo5VL1IpJ8lCRDVNbbqgPWd1CAeKUANBy/y3KI9c9QoZbJCZs885aLnsX0KrUPYl/
	wR81cgFmMRVv3cvLJOCLh6DBwUEJbFyjrFA==
X-Received: by 2002:a5d:480b:0:b0:30e:5b7c:de1c with SMTP id l11-20020a5d480b000000b0030e5b7cde1cmr847383wrq.11.1686128244210;
        Wed, 07 Jun 2023 01:57:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5cVBV6nE7RtmcEBXn+HzuRodoDcm43tX6NFthW7AyByONHB9mNt2RgHuwDFwOrvr3zyeFr0A==
X-Received: by 2002:a5d:480b:0:b0:30e:5b7c:de1c with SMTP id l11-20020a5d480b000000b0030e5b7cde1cmr847364wrq.11.1686128243933;
        Wed, 07 Jun 2023 01:57:23 -0700 (PDT)
Date: Wed, 7 Jun 2023 04:57:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230607045414-mutt-send-email-mst@kernel.org>
References: <20230604174224-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481DABA25CA36A5460B13E5DC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605014539-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C14D65D5E10CD23A9F67DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605092859-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CEB3A34AAB49A282F2A8DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605174755-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548180E16376862A3C0DFF1DDC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606073544-mutt-send-email-mst@kernel.org>
 <CACGkMEv1so_KGwJZG3GnAf=JNky7+BMNK7N4NTtucDS+WyW5VA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEv1so_KGwJZG3GnAf=JNky7+BMNK7N4NTtucDS+WyW5VA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v3 0/3] transport-pci: Introduce legacy
 registers access using AQ

On Wed, Jun 07, 2023 at 10:27:12AM +0800, Jason Wang wrote:
> On Tue, Jun 6, 2023 at 7:56 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jun 05, 2023 at 10:12:59PM +0000, Parav Pandit wrote:
> > > Rolling v4 now.
> >
> > Great thanks! I think the result will be in a good shape from
> > the ABI point of view. Good job!
> >
> > I think so far Jason was the only one with significant comments
> > on the series so let's see what he says.
> 
> I can't say I like this. I prefer to do meditation on top of a modern
> device with some lightweight features like _F_LEAGCY_HEADER. I don't
> see any advantages of a new legacy ABI over _F_LEGACY_HEADER. I don't
> want to repeat but I don't get any response here
> 
> https://lore.kernel.org/virtio-dev/CACGkMEuixsBibSq_pEQvcKOH0WBQWnta4Q2c28SV8qTS8gaVcA@mail.gmail.com/#t


After trying to write this I came away with a conviction that
if hardware vendors are prepared to implement legacy
in hardware we should let them do exactly that.


> >
> > From my personal POV what will be left to do to get this
> > feature ready for merging would be
> >
> > - tightening the language:
> > - thinking of and addressing all kind of corner cases.
> 
> We need first to check whether it's possible (not too late) to find
> all the corner cases.
> 
> Thanks

For sure, but of course we need to stop arguing about whether
to have the feature in the 1st place.

> >
> >
> > Since by now from our email discussions I have I think
> > a decent understanding of how the feature is supposed to work
> > I understand how these things work but I think there are still
> > things that would be a bit unclear for an unprepared reader.
> >
> > Just to give a random example, there's no explicit
> > time where the member kind of switches to the legacy/back to modern
> > mode. I am guessing setting DRIVER bit through legacy interface
> > does this. We'll want to list that.
> >
> > I'll try to help find these issues and maybe even suggest wording.
> >
> > I've delayed commenting on these until the high level design is agreed
> > on, didn't want to make you waste time on polishing as the patches
> > undergo significant changes, and I suggest you do the same in v4: let's
> > make sure there's a wide agreement on the ABI then focus on the spec
> > language.
> >
> >
> >
> > --
> > MST
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

