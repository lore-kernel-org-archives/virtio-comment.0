Return-Path: <virtio-comment-return-7856-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06AACDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:33:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 28CAF7DD66
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:33:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E7B829868E1
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:33:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C441E9868D6; Thu, 19 Oct 2023 09:33:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B22BF9868D7
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -pCskiGEN8uU9ikH2NRDDA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697708000; x=1698312800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnrvdyKwAgGxgdq9xtvjr6Q/FKSVbm8ZkSX7dbovvXs=;
        b=Lm3sYXNyZ2vJ3oR3hAiXnzv+/qhjSe+4FkhViU50NjBpzXg+pEZ93m9WyL2Wf8DAVG
         b77CII00qJe/hi86f9T+YX7YElv3KqAdsDlcWMOuAhNsfttQIWHMgvvLW5wNLqfePNup
         XUWpLFgbldCI0/AJkKV3Ws3WvBVOWO4jDhv7qM4GpDVTBRfrh7zQNq24eqtXVmydEuQW
         0uqCmuVPDFy9hf/nzhavhcvS0nRKcw3qKI5tQgNdY6QJ/y1cFfsMvkvPoRv3+Gp+iE8X
         rRxFXZr22JYeqlPWSG4g55V7ke1IKMIR1LoCht1ebnYpgn0K/1EAnpBl7sT+JedljKFO
         i5Ag==
X-Gm-Message-State: AOJu0Yzizwwn0WDekVzZCk+IOlpl+0rr8l9FMuvJjS2qE6QHJ5wz3cR0
	T8AobnRk/OttpxXyoUK/VvcQs9EDRpRGqhnDVaFNo7uQQanYo3Ax++wtoPcnrPazNzRCHugd3m0
	5B8mmdBDBvCM2Yn9g/NpnOCBKRYBWKaPXVA==
X-Received: by 2002:a05:600c:5254:b0:407:8e68:4a5b with SMTP id fc20-20020a05600c525400b004078e684a5bmr1431431wmb.38.1697707999924;
        Thu, 19 Oct 2023 02:33:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXkkozILA2Oq9FtuOeMxY2kuO5RPCR32xujlPjw8Ynt1bshlEwYieJQkoAKr5k79rsz1/eFQ==
X-Received: by 2002:a05:600c:5254:b0:407:8e68:4a5b with SMTP id fc20-20020a05600c525400b004078e684a5bmr1431410wmb.38.1697707999557;
        Thu, 19 Oct 2023 02:33:19 -0700 (PDT)
Date: Thu, 19 Oct 2023 05:33:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231019052725-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019020413-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019041629-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481373C657AE3EFA123D1C4DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019050553-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819E1EAA41F3CAE420942ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019052328-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231019052328-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Oct 19, 2023 at 05:26:54AM -0400, Michael S. Tsirkin wrote:
> On Thu, Oct 19, 2023 at 09:20:22AM +0000, Parav Pandit wrote:
> > 
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, October 19, 2023 2:41 PM
> > > 
> > > On Thu, Oct 19, 2023 at 08:58:10AM +0000, Parav Pandit wrote:
> > > > It cannot be in the PCI 4K config space for sure.
> > > > It must reside in the virtio config space.
> > > 
> > > Why? 
> > Because pci spec has clearly called out to not place any device specific things in there.
> > 
> > Citation in pci spec
> > " It is strongly recommended that PCI Express devices place no registers in Configuration Space other than those in
> > headers or Capability structures architected by applicable PCI specifications."
> 
> But of course, we'd place them inside a vendor specific capability.
> We just need a version of virtio_pci_cap64 that's suitable for express.
> 
> 
> > > My concern with virtio config space would be that it's not orthogonal to
> > > other things in the config space. E.g. you need to look at feature bits to discover
> > > presence. How does this work while you are documenting that device can
> > > undergo reset at any time?
> > This is why such solution cannot work for passthrough. It can only fulfil #2 based approach.
> > 
> > > With a capability you can discover it without poking at features.
> > > 
> > It is discouraged by pci spec.
> > Pci caps for mostly doing very small init time sort of config.
> > Not to run frequent commands.
> 
> Interesting. where in the spec exactly?

And the reason I ask is because I'd like to understand the exact
limitation.

In any case, we should still maybe look for ways to separate it from config.
Maybe a capability points at a BAR and that is where we
have this stuff?

 
> > > > I am sure that this is used for passthrough mode of #1.
> > > > So, can you please confirm to write this up for mode #2 only?
> > > 
> > > To me it sounds like a generally useful capability that could be used as basis e.g.
> > > for admin command transport.
> > > 
> > Unfortunately, it cannot be pci capability. 
> > It needs to stay in virtio area and only fulfill use case of #2.


> > > > > > A variation of that for the member device, there is owner device,
> > > > > > hence
> > > > > admin command on the AQ can be used.
> > > > > >
> > > > > > If we can converge on common virtio interface between #1 and #2, great.
> > > > > > If we cannot be due to technical issues, we shouldn't step on each
> > > > > > other's
> > > > > toes, instead build the two interfaces for two different use cases
> > > > > overcoming its own technical challenges.
> > > > > >
> > > > > > And when in future, someone want to implement different kind of
> > > > > > bisections,
> > > > > they can propose the extensions.
> > > > >
> > > > > Not good at all, this means the interface is very narrow.
> > > > > Your "propose an extension" just doesn't work practically.
> > > > > It takes years for things to be widely deployed in the field, by the
> > > > > time they are there are more use-cases.
> > > >
> > > > We usually see it getting deployed in < 1 year time with new spec
> > > advancement pace for many features.
> > > > Building something for unreasonable amount of time without use case results
> > > in missing the immediate deployments that happens in 2024 to 2027 of 1.4 spec
> > > time frame.
> > > >
> > > > > We need something universal and admin commands were supposed to be
> > > > > just this.
> > > > I don't see a universal solution for all problems for above #1 and #2.
> > > >
> > > > Solving above #2 will cover large part of deployments that users are doing.
> > > 
> > > OK. But additionally, if an interface can cover a couple of use-cases we can be
> > > reasonably sure it's going to cover more going forward.
> > May be.
> 
> Yes hard to be sure. But if it can't then that's a good sign it's
> problematic.
> 
> -- 
> MST


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

