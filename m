Return-Path: <virtio-comment-return-6465-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247AAEB64D8
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 16:28:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 457406004F
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 16:28:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3AEC39865EB
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 16:28:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3222F9865D0; Thu, 22 Jun 2023 16:28:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 201019865D4
	for <virtio-comment@lists.oasis-open.org>; Thu, 22 Jun 2023 16:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: _OktAiAKN06GPmjY7JHpqA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687451302; x=1690043302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y72v38nfLQmCXn8L1Fn/EK2X43kJJqE20byTx0DX9b8=;
        b=U4XvffH+wytEumpXYMguY6RKI9XTS5LSY72w6HxJ8Iw616UyVrgT6vf/Iv9JFa/bAC
         afG6jzn3rsdYw413o5kfgpAAMa2exF12SudMZt7fg/rDCHIObAEZ+LrZYyBgYAFVj5Fh
         2gm2sDworBq4GSWQTxvV1mWokQN6I2gCYizw2UuiO0MGFZ2uHsl8Vw9YsT11WADr0ys+
         Y5bHh7yEz3m1RSToAHge54oXKkP6u6WgL3cn48V84OMPj4VhfOf3Z3bGHOVkjWf3DsBp
         OnQHcglphxXUeheYot1o1RXryUyWtqg0dnzJhqHzRs/QA4XfiULBeJoPeyMkCKNLjFnD
         Jz7A==
X-Gm-Message-State: AC+VfDyokgTG6/jlO3ibAGa91LerDaoej6l52KR7IM3+R19/0VirrSFK
	g5c2mxVo1FMxH0xvs4wi277j0aa94v/7tcF9i5jqMUYq4BYbe7Vcrd7k3PICyuenyQ3nm4kCQIi
	lAso1liu7KtxUy6or+1SBm8ojcOKtVSsb4w==
X-Received: by 2002:a17:906:fd8e:b0:982:c69c:8c30 with SMTP id xa14-20020a170906fd8e00b00982c69c8c30mr16261419ejb.55.1687451302068;
        Thu, 22 Jun 2023 09:28:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ49bb1YtxVOU1Z+R7RyP4EZHlG93jYb1FK8mMJdf4k2182F+Kw0i7XxIrDdGdOfiWbqKKYmug==
X-Received: by 2002:a17:906:fd8e:b0:982:c69c:8c30 with SMTP id xa14-20020a170906fd8e00b00982c69c8c30mr16261404ejb.55.1687451301702;
        Thu, 22 Jun 2023 09:28:21 -0700 (PDT)
Date: Thu, 22 Jun 2023 12:28:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>
Message-ID: <20230622120756-mutt-send-email-mst@kernel.org>
References: <20230621104647-mutt-send-email-mst@kernel.org>
 <20230621164606.GI74977@h68b04307.sqa.eu95>
 <20230621152559-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481141E18AAF1BF214A0E29DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621161157-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C99B8504F02D39B3A6F0DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621163116-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4EA5D0614E1289DFC77DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622021932-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815D6D07A49CE775620088DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54815D6D07A49CE775620088DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v18] virtio-net: support inner
 header hash

On Thu, Jun 22, 2023 at 12:32:33PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, June 22, 2023 2:23 AM
> > 
> > On Wed, Jun 21, 2023 at 08:52:04PM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Wednesday, June 21, 2023 4:38 PM
> > >
> > > > > > And the field is RO so no memory cost to exposing it in all VFs.
> > > > > Two structures do not bring the asymmetry.
> > > > > Accessing current and enabled fields via two different mechanism
> > > > > is bringing
> > > > the asymmetry.
> > > >
> > > > I guess it's a matter of taste, but it is clearly more consistent
> > > > with other hash things, to which it's very similar.
> > > >
> > > This is consistent with new commands we define including notification
> > coalescing whose GET is not coming config space.
> > 
> > But there GET just reports the current state. Not the read only capability. So
> > there would be cost per VF to keep it in config space.
> > This one is RO no cost per VF. Let's make it convenient?
> >
> And each VF can have different value hence requires per VF storage in the device.
>  
> > > >
> > > > Nah, config space is too convenient when we can live with its
> > > > limitations. I don't thin kwe prefer not to keep growing it.
> > > > For some things such as this one it's perfect.
> > > >
> > > Fields are different between different devices.
> > 
> > Not sure what's the implication?
> Implication is device needs to store this in always available on-chip memory which is not good.

Oh by devices you mean VFs. Now I get your motivation, at least. Thanks.

> > 
> > > > For example, for migration driver might want to validate that two
> > > > devices have same capability. doing it without dma is nicer.
> > > >
> > > A migration driver for real world scenario, will almost have to use the dma for
> > amount of data it needs to exchange.
> > 
> > Not migration itself, provisioning.
> >
> Provisioning driver usually do not attach to the member device directly.
> This requires device reset, followed by reaching _DRIVER stage, querying features etc and config area.
> And unbinding it and second reset by member driver. Ugh.
> Provisioning driver also needs to get the state or capabilities even when member driver is already attached.
> So config space is not much a gain either.
>

Absolutely, that's why we have admin commands.  I was hoping for an
admin command that basically gets/sets RO fields of the config space.

> > > > Another example, future admin transport will have ability to
> > > > provision devices by supplying their config space.
> > > > This will include this capability automatically, if instead we hide
> > > > it in a command we need to do extra custom work.
> > > >
> > > > > So we do not prefer to keep growing the config space anymore,
> > > > > hence GET is the right approach to me.
> > > >
> > > > Heh I know you hate config space. Let it go, stop wasting time
> > > > arguing about the same thing on every turn and instead help define
> > > > admin transport to solve it
> > >
> > > This was discussed many times, a driver to have a direct (non-intercepted by
> > owner device) channel to device.
> > > If you mean this non-intercepted channel as admin transport, fine.
> > 
> > we can do that, sure.
> > 
> > > If you mean this is intercepted and it is going over admin cmd, then it is of no
> > use for all future interfaces.
> > >
> > > We discussed this in thread with you and Jason.
> > > I provided concrete example with size and device provisioning math too and
> > other example of multi-physical address VQ.
> > > So transporting register by register over some admin transport is sub-optimal.
> > >
> > 
> > Not register by register, we can send all of config space as long as it's RO. This
> > field is.
> >
> It is RO in context of one member device, but every VF can have different value.
> The device will never know if one will use new cmdvq to access or some old driver will use without it.
> And hence, it always needs to provision it on onchip memory for backward compatibility.
> 
> Instead of decision point being RO vs RW, 
> any new fields via cmdvq and existing fields stays in cfg space, give predictable behavior to size the member devices in the system.
> Once the cmdvq is available, we can get rid of GET command used in this version for new future features.
> Till that arrives, GET command is the efficient way.

I understand.  I just don't much like these patchwork solutions though.
And I don't like that we will pay by not having a single conherent
way to provision and query capabilities through config space,
instead just for this thing we will have a special thing.

Why don't we focus on a work on a full solution? Just don't implement
this thing in your devices meanwhile until we do.

> > --
> > MST


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

