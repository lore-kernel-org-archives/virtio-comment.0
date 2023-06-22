Return-Path: <virtio-comment-return-6460-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B44CEB64DC
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 06:23:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D63E4850A7
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 06:23:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CC5AD9865DB
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 06:23:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C0AD398626D; Thu, 22 Jun 2023 06:23:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AB6F59865D0
	for <virtio-comment@lists.oasis-open.org>; Thu, 22 Jun 2023 06:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: pZvUxD3PMISuhLeWPBfmew-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687415011; x=1690007011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIr+/DcU/Q5ols09ga5xI7N071LMzU7R1IernlYz5eQ=;
        b=CbUW23R0dH2rvnfQAauD5YLsKlyIAw01AxjYximJiaBgXfw17zyCO/tNd/87h+kLq6
         YOGzGQXDaNDqhLPPHyl2ycvSuLon48FHogu1qZO1/Lkiem+MJi7DGlb4czSepsP7Es+E
         WcXIZuSJ923VtBcE//XGChuhqJXAmQ96otLofgDFHVrhjb0k2/t/vDGSYmarBVbFCFRG
         5ptQpeBi+Kk3Q43hBicpYs6M3mdxrosf6jwLTs7oh0r2VLOl7ToUrmii87pZ+TsoZx2m
         wJ3XPW9HwDXGIDeLcLVnLgdFVZllhytMQH6jhkLdNYOWUzqjVMmAFKE29PVw/h0YHFGl
         ESeQ==
X-Gm-Message-State: AC+VfDz2jSJ2xT4LjV0G+xwoktd1pv3smR1gd0cBghWL35RB5UfIWwsc
	LKtNpkfyyg7Nx58BrahBSeecJ4vTL5zi5pqd/I2cgNVlqiqrtq0SSpjboACVvej+gzxkrmJ65fN
	SaGaBK/Ws5c+LiDcd0avUuys3optl4f6ydw==
X-Received: by 2002:a17:907:1c95:b0:987:15ee:4399 with SMTP id nb21-20020a1709071c9500b0098715ee4399mr15749497ejc.29.1687415011111;
        Wed, 21 Jun 2023 23:23:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5+FtoIJpYqYh+6D9d+xoUXb1bQAx+JOAYg8FrKbS4AZ/YtQWU7198P7PQeo++eFQZWTbEhLA==
X-Received: by 2002:a17:907:1c95:b0:987:15ee:4399 with SMTP id nb21-20020a1709071c9500b0098715ee4399mr15749480ejc.29.1687415010703;
        Wed, 21 Jun 2023 23:23:30 -0700 (PDT)
Date: Thu, 22 Jun 2023 02:23:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>
Message-ID: <20230622021932-mutt-send-email-mst@kernel.org>
References: <20230621135052.76028-1-hengqi@linux.alibaba.com>
 <20230621104647-mutt-send-email-mst@kernel.org>
 <20230621164606.GI74977@h68b04307.sqa.eu95>
 <20230621152559-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481141E18AAF1BF214A0E29DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621161157-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C99B8504F02D39B3A6F0DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621163116-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4EA5D0614E1289DFC77DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C4EA5D0614E1289DFC77DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v18] virtio-net: support inner
 header hash

On Wed, Jun 21, 2023 at 08:52:04PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, June 21, 2023 4:38 PM
> 
> > > > And the field is RO so no memory cost to exposing it in all VFs.
> > > Two structures do not bring the asymmetry.
> > > Accessing current and enabled fields via two different mechanism is bringing
> > the asymmetry.
> > 
> > I guess it's a matter of taste, but it is clearly more consistent with other hash
> > things, to which it's very similar.
> >
> This is consistent with new commands we define including notification coalescing whose GET is not coming config space.

But there GET just reports the current state. Not the read only
capability. So there would be cost per VF to keep it in config space.
This one is RO no cost per VF. Let's make it convenient?

> > 
> > Nah, config space is too convenient when we can live with its limitations. I don't
> > thin kwe prefer not to keep growing it.
> > For some things such as this one it's perfect.
> >
> Fields are different between different devices.

Not sure what's the implication?

> > For example, for migration driver might want to validate that two devices have
> > same capability. doing it without dma is nicer.
> > 
> A migration driver for real world scenario, will almost have to use the dma for amount of data it needs to exchange.

Not migration itself, provisioning.

> > Another example, future admin transport will have ability to provision devices
> > by supplying their config space.
> > This will include this capability automatically, if instead we hide it in a command
> > we need to do extra custom work.
> > 
> > > So we do not prefer to keep growing the config space anymore, hence
> > > GET is the right approach to me.
> > 
> > Heh I know you hate config space. Let it go, stop wasting time arguing about the
> > same thing on every turn and instead help define admin transport to solve it
> 
> This was discussed many times, a driver to have a direct (non-intercepted by owner device) channel to device.
> If you mean this non-intercepted channel as admin transport, fine.

we can do that, sure.

> If you mean this is intercepted and it is going over admin cmd, then it is of no use for all future interfaces.
> 
> We discussed this in thread with you and Jason.
> I provided concrete example with size and device provisioning math too and other example of multi-physical address VQ.
> So transporting register by register over some admin transport is sub-optimal.
> 

Not register by register, we can send all of config space as long as
it's RO. This field is.

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

