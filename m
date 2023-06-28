Return-Path: <virtio-comment-return-6586-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2269AEB64DA
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 19:44:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 023BE26A20
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 19:44:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EECC49865CF
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 19:44:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E152F98658E; Wed, 28 Jun 2023 19:44:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CFFE6986587
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Jun 2023 19:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: bD8CCewoOsqGQtZuRtqNCg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687981476; x=1690573476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6aQdwMLz/AzSdJd0aI051tJlx959H/yGGroaqRLYn4=;
        b=Y82Y5ueAnAz09IBYRB2qor1lGySXZYLci/h7EWKrJapvnZFUJuR+y7/hYaAQ1UpUve
         VWVzVEDgyT/YuSQlaVpC9AyQBl+Q9GPayZijqwrZc8dh9es0J0nWUcYFWxzARo8gi59O
         A2zHpq3ki4BkHckBLk/AzlTORkiUtWzDGqSez2xymFevD4VSvx2VmeY9x4VY3uNGFtSf
         zh5JohvwbCG6V6kgyE3LASnGvPSQ8oBzm3Eijqu/6PGU1AKiUfkW8wUOTtxyTH/TgwPi
         7TcDmLQGOW7utaG7Uvu8hUlWsy54216VE1rgc9iDd5MpVa6YGm/GOSxjXAzJYez1vuRT
         2C+A==
X-Gm-Message-State: AC+VfDxRBaCxWAQp1lj/2Gg1r3LRgNoAY2DbgZxwsPys39A35xQUNYcG
	VrvBMlynL1MbFXZKjGcbmEAVfCqTkQSHaQyRmqJTCCuSCljW6on44fEq18+G4bv8+1HlLKuDcbB
	IUwaSW+vI6A8nAh2kUT1jEpyvDI5N1XkZsA==
X-Received: by 2002:a05:600c:1c16:b0:3fb:b18a:f32d with SMTP id j22-20020a05600c1c1600b003fbb18af32dmr2498083wms.17.1687981475608;
        Wed, 28 Jun 2023 12:44:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7whBRi0GsN9DtsGGvLnymKhF+RB6AEsG7B6bqKJx0svbBP8oTH9LA5XVoVtiH8a3z4Km2YcA==
X-Received: by 2002:a05:600c:1c16:b0:3fb:b18a:f32d with SMTP id j22-20020a05600c1c1600b003fbb18af32dmr2498070wms.17.1687981475255;
        Wed, 28 Jun 2023 12:44:35 -0700 (PDT)
Date: Wed, 28 Jun 2023 15:44:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230628152125-mutt-send-email-mst@kernel.org>
References: <20230627163549.40028-1-hengqi@linux.alibaba.com>
 <CACGkMEvFmAiWDp8w=ytin21Oi+PcTb1X3Eve7Kt2NVr_RkhgmA@mail.gmail.com>
 <PH0PR12MB54811123CFCDEFE3B48D4381DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628061257-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481ED6C94DE8CC414C3369BDC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628123131-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481BA1CDA0942170186CB59DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230628132122-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814D42786A6981467D3FADDC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54814D42786A6981467D3FADDC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v19] virtio-net: support inner
 header hash

On Wed, Jun 28, 2023 at 05:38:29PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, June 28, 2023 1:24 PM
> 
> 
> > > Because when device has two ways to access config space, it always have to
> > account and build the interface that, hey some driver will not use DMA.
> > > Hence have it always in the MMIO accessible area.
> > 
> > Maybe I get it. You want to use the new features as a carrot to force drivers to
> > implement DMA? You suspect they will ignore the spec requirement just
> > because things seem to work?
> >
> Right because it is not a must normative.

Well SHOULD also does not mean "ok to just ignore".

	This word, or the adjective "RECOMMENDED", mean that there
	   may exist valid reasons in particular circumstances to ignore a
	   particular item, but the full implications must be understood and
	   carefully weighed before choosing a different course.



> > There's some logic here, for sure. you just might be right.
> > 
> > However, surely we can discuss this small tweak in 1.4 timeframe?
> 
> Sure, if we prefer the DMA approach I don't have a problem in adding temporary one field to config space.
> 
> I propose to add a line to the spec " Device Configuration Space" section, something like,
> 
> Note: Any new device configuration space fields additional MUST consider accessing such fields via a DMA interface.
> 
> And this will guide the new patches of what to do instead of last moment rush.

Yea, except again I'd probably make it a SHOULD: e.g. I can see how
switching to MMIO might be an option for qemu helping us debug DMA
issues.

The time to discuss this detail would be around when proposal for the DMA
access to config space is on list though: I feel this SHOULD vs MUST
is a small enough detail.

Going back to inner hash. If we move supported_tunnels back to config space,
do you feel we still need GET or just drop it? I note we do not
have GET for either hash or rss config.

And if we no longer have GET is there still a reason for a separate
command as opposed to a field in virtio_net_hash_config?
I know this was done in v11 but there it was misaligned.
We went with a command because we needed it for supported_tunnels
but now that is no longer the case and
there are reserved words in virtio_net_hash_config ...

Let me know how you feel it about that, not critical for me.


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

