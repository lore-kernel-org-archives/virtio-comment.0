Return-Path: <virtio-comment-return-6468-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308ECEB64DC
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 16:54:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6235615AA5E
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 16:54:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A95B9865F7
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 16:54:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 506909865D5; Thu, 22 Jun 2023 16:54:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3DD369865D7
	for <virtio-comment@lists.oasis-open.org>; Thu, 22 Jun 2023 16:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Mh4X_fn6N2i_9Tsi9NuQUg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687452872; x=1690044872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iftxggmzPp7A7/QBDylfaXe53oatJZXxQxeKz+UeWF4=;
        b=DB6gF24FGu+8nw+bQXOsIvpoqPGIpF9NxXKrPJTgwIb6u+HUr/iAqFw/c8+mCFYRsk
         SELGqkqmNQdzHtimUXmFHMmz9VpohmpVl+c9U3yaTMQhlLzcKQxwjPQixZ7pPYKIep0i
         SisDwLdAzFRADoFU9HbQWuz/RSwINvcxDqZaK1tPviBUOIvvwBSm3PJJvEpTj/uQg18X
         tkOqaeSE0sY3R3LQuLu6YB6YtxWaLr+aLEQTE56vMMZSEZ9cECRTUhn8E3aHWT5jNgzO
         43LLlubomi5Fybc5jr6RCx2BAs/TfRJy9pa8LJSPfyrb6qmZ8Gj7S3Mo1yh+BmCOgljQ
         EfDg==
X-Gm-Message-State: AC+VfDzjcE5k5DODUp/zGXKJ1B2nD0nPT7XrWGf0Mu1chqnxqip8K6Vi
	xnsEII9aSW/jkkq7v8oMOrd2fQ4gnMZnBcPwayMQLnyLGCXX5Hy9g+O6Zz7N1DDUt7rikzhtcGa
	W7D61dzSdsxon2bcp5eGCydbi7VaWhGSt+g==
X-Received: by 2002:a17:907:72c7:b0:98c:e72c:6b8a with SMTP id du7-20020a17090772c700b0098ce72c6b8amr3747409ejc.10.1687452872005;
        Thu, 22 Jun 2023 09:54:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ478JNSnfPlxV5q45y5raVitUnw8Dha2fxy7INZbbpGRkAkQZ1fGoj52Gt1QqDK+UodFlgHHg==
X-Received: by 2002:a17:907:72c7:b0:98c:e72c:6b8a with SMTP id du7-20020a17090772c700b0098ce72c6b8amr3747386ejc.10.1687452871609;
        Thu, 22 Jun 2023 09:54:31 -0700 (PDT)
Date: Thu, 22 Jun 2023 12:54:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>
Message-ID: <20230622124701-mutt-send-email-mst@kernel.org>
References: <20230621152559-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481141E18AAF1BF214A0E29DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621161157-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C99B8504F02D39B3A6F0DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621163116-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4EA5D0614E1289DFC77DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622021932-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815D6D07A49CE775620088DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622120756-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812B8DA2A17EF07CBDC3F1DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54812B8DA2A17EF07CBDC3F1DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v18] virtio-net: support inner
 header hash

On Thu, Jun 22, 2023 at 04:42:40PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, June 22, 2023 12:28 PM
> 
> > > > Not sure what's the implication?
> > > Implication is device needs to store this in always available on-chip memory
> > which is not good.
> > 
> > Oh by devices you mean VFs. Now I get your motivation, at least. Thanks.
> >
> > > >
> > > > > > For example, for migration driver might want to validate that two
> > > > > > devices have same capability. doing it without dma is nicer.
> > > > > >
> > > > > A migration driver for real world scenario, will almost have to use the dma
> > for
> > > > amount of data it needs to exchange.
> > > >
> > > > Not migration itself, provisioning.
> > > >
> > > Provisioning driver usually do not attach to the member device directly.
> > > This requires device reset, followed by reaching _DRIVER stage, querying
> > features etc and config area.
> > > And unbinding it and second reset by member driver. Ugh.
> > > Provisioning driver also needs to get the state or capabilities even when
> > member driver is already attached.
> > > So config space is not much a gain either.
> > >
> > 
> > Absolutely, that's why we have admin commands.  I was hoping for an
> > admin command that basically gets/sets RO fields of the config space.
> >
> Admin command as I recall are not accessible directly by the member driver to the member device.
> So a cmdq or cfgq is needed.

Possible, sure. Or we actually discussed a self group. I took it away until it had a user.


> > > Instead of decision point being RO vs RW,
> > > any new fields via cmdvq and existing fields stays in cfg space, give predictable
> > behavior to size the member devices in the system.
> > > Once the cmdvq is available, we can get rid of GET command used in this
> > version for new future features.
> > > Till that arrives, GET command is the efficient way.
> > 
> > I understand.  I just don't much like these patchwork solutions though.
> > And I don't like that we will pay by not having a single conherent
> > way to provision and query capabilities through config space,
> > instead just for this thing we will have a special thing.
> >
> The single way for every device to query their capabilities is via a cfgvq for all new fields without extending the existing config space.
> (and optionally old fields).

Or adminq with self group. I like this somewhat better because we need
exactly same query from owner.

> > Why don't we focus on a work on a full solution? Just don't implement
> > this thing in your devices meanwhile until we do.
> > 
> Then Heng needs to wait for cfgvq to be defined to be implemented first.
> Doesn't look reasonable to me.

And *everything* has to wait. No, not reasonable. We somehow managed
to release several spec versions and things did not ground to
a halt without cfgvq. Don't see a reason to do it right now,
what's special about now? I feel we should add to config space
and then solve it all.

> Current GET is coherent with the new commands defined such as notification coalescing.
> 
> As community, we should work on defining the cfgvq, till that time have the optimal way to get the config, i.e. using the cvq.

cvq doesn't really work for capabilities though.

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

