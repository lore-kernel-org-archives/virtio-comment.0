Return-Path: <virtio-comment-return-8611-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85665C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 10:14:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A16222B147
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 10:14:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A32A986941
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 10:14:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2F3259862D9; Fri, 24 Nov 2023 10:14:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1EEAA9868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 10:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: t0svrZJqP4-3AosHeXV0bQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820877; x=1701425677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pes9Cl4fLnvhBip6Oe1PiQDx657TWD0GA9h2N6MQJb8=;
        b=qkgknA2RhiAoILJx3F0X23Kt48XvxGY9zucE6e7Ljq6qFwpSacsmxQvw3l5HOJE38X
         qc34AZgv7LFokKioJQ7ADOYJS/6sWqEuaF1BwOsIJ4/PsyMUSSSlkPdLkQ751QYpXCSR
         N+fcn2D9WGghaRzDR32c2IHCFkJImdJGIF3xVNiit4dpiXpDoMbQZkIHpYh+RB1bbfz7
         OuhOvQS8Q9XF9bQzGyOEZGm1Muh8QEnXruOHXE90Is7Dt3/vbV7i317JSWUfFjxHE2tb
         YwZjgk97cat+2RUov8UkVfck3YVR+K4TtLqipnlKi3zd8MhESd94X2rid842IUDFV+o/
         eMLA==
X-Gm-Message-State: AOJu0YzSmJFZOx8rtHKJPcA86m6LRfKf74uANh8ELSewdDF0gtXpsnzU
	YYFwfi31G4b3Wup+YhEENFBNjaXOD6iGj+jp+ZeWxgcT779aLd7Q6OBFxyDBZyiJL5VzARFrSRw
	aRjP13miufOKGKUCpy5W9UQHoa9/MUcF/Uw==
X-Received: by 2002:a17:906:6c88:b0:9c3:1d7e:f5b5 with SMTP id s8-20020a1709066c8800b009c31d7ef5b5mr1524110ejr.20.1700820877177;
        Fri, 24 Nov 2023 02:14:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0I0BhEhpv8TrzUSWWCxgn4se5FaL/46Vn0wMUtOyhAbI///Hr5qZbGiLAPBb5BK1qpYNnMg==
X-Received: by 2002:a17:906:6c88:b0:9c3:1d7e:f5b5 with SMTP id s8-20020a1709066c8800b009c31d7ef5b5mr1524084ejr.20.1700820876670;
        Fri, 24 Nov 2023 02:14:36 -0800 (PST)
Date: Fri, 24 Nov 2023 05:14:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231124042824-mutt-send-email-mst@kernel.org>
References: <20231123092119.2718448-1-parav@nvidia.com>
 <20231123092119.2718448-3-parav@nvidia.com>
 <20231123091129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481584836D0FD5025B8874EDCB9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231123174947-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A6DFAEBD321707E31BDDDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124004105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818AFAE1E2B943C9104B59DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54818AFAE1E2B943C9104B59DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands

On Fri, Nov 24, 2023 at 06:27:34AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 24, 2023 11:29 AM
> > 
> > On Fri, Nov 24, 2023 at 02:57:49AM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 24, 2023 4:28 AM
> > > >
> > > > On Thu, Nov 23, 2023 at 06:40:59PM +0000, Parav Pandit wrote:
> > > > >
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Thursday, November 23, 2023 7:44 PM
> > > > > >
> > > > > > On Thu, Nov 23, 2023 at 11:21:16AM +0200, Parav Pandit wrote:
> > > > > > > The device responds flow filter capabilities using two commands.
> > > > > > > One command indicates generic flow filter device limits such
> > > > > > > as number of flow filters, number of flow filter groups,
> > > > > > > support or multiple transports etc.
> > > > > > >
> > > > > > > The second command indicates supported match types, and fields
> > > > > > > of the packet.
> > > > > > >
> > > > > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> > > > > > > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > >
> > > > > > So I am still unsure about these commands.  What exactly is the point?
> > > > > >
> > > > > Two reasons.
> > > > > The device reports maximum capabilities that the driver knows
> > > > > upfront. So
> > > > that it does not need to come to device to know when to fail.
> > > >
> > > > But that requires driver to keep extra state which can easily get out of sync.
> > > Not sure what you mean by get out of sync from whom?
> > > Not from the device.
> > 
> > yes from the device. I can't say for sure how because I now see this patch is
> > implying driver requirements that you didn't document. I thought the IDs can
> > be any number. 
> It cannot be any number. The device requirement has captured it.

Which requirement?

> Couldn't see a lot of point of duplicating it.
> The device requirement implies what driver has to do.

Nothing of the sort.

> But if you insist, I can duplicate in the driver requirement too.

I think spec should list the requirements we have not imply them.
In particular driver authors should be able to go over
driver conformance sections, use non-normative sections
to interpret them and then verify their conformance.
Device normative sections is not something that should interest them.
We don't always do a good job of this - not a reason to keep adding
to that problem.

> > It appears that's not what you meant.
> > I can try and guess what you meant but I'd rather have you rewrite this in a
> > way that makes the meaning explicit.
> > 
> If you insist, I can duplicate in driver requirements too.
> > 
> > > There are many capabilities here each with a different use.
> > 
> > And you are under the impression that dumping all kind of stuff in a single
> > place is good somehow?
> It is not dumped.
> It is structured based on the functionality.
> The config space proposal tends to dump everything in unstructured way at single place that cannot extended elegantly.
> 
> For example, Xuan's dynamic array cannot be placed next to other dynamic array of flow filter.

I don't know what "dynamic array" is exactly but generally,
Any kind of a big array is not appropriate in config space - I don't see any
of these here, though.


> > 
> > > For many caps, it is to know what is supported/not to decide in the driver.
> > 
> > I can't parse this sentence.
> > 
> The driver checks things upfront what is supported while serving the command, instead of random trial and error guess work game with he device.

There's no real guesswork with these specific commands: user types
an ethtool command, driver sends it on, it either succeeds or fails.
However if you feel it important to do checks in driver - OK.
But that makes cap query an init time thing.


> > > Certain caps are max to know what is the range of id that driver can use like
> > flow filter id, group id.
> > 
> > Maybe then. But there's apparently no requirement for either device or driver
> > to put it in this range.
> > 
> 
> I will add this requirement statements in device requirements and that will make things clear.
> Good point.
> 
> > > > For what benefit?
> > > >
> > > For functional work.
> > 
> > You don't really explain what kind of work in this patchset, or in the commit
> > logs. Maybe it's obvious for you but not for everyone.
> What text are you expecting?
> We have undergone all the requirements study that you conveniently choose to not participate for 2 months.

Yea ... I'm sorry. Things have been going on here, man.
I'm glad I'm back and able to participate though.

> > 
> > > > > In future one may want to provision certain max limits that device
> > > > > can have
> > > > as they eventually will consume certain device hardware resources.
> > > >
> > > > I don't exactly see how this helps provisioning.
> > > >
> > > Provisioning side will set parameters which will reflect these limits to be same
> > on src and dst hypervisor when device migration is used.
> > 
> > But making provisioning depend on driver being fully loaded and accessing the
> > command is creating a chicken and egg problem.
> I didn't explain well likely.
> Provisioning as you described, will be on owner device.
> This command tells driver what is provisioned.
> 
> > Provisioning is much more likely to use some new admin commands over an
> > owner device. So this command is useless for it.
> > 
> Provisioning owner device will use exact same structure while provisioning.

So the advantage of using config space is that we can have a single
generic provision command that gets device config space format. Your
approach will need some kind of net device specific thing.


> > 
> > 
> > > >
> > > > > > Patch 5/5 mandates that device validates all fields already.
> > > > >
> > > > > > Are there guests that will actually look at these caps as
> > > > > > opposed to just sending commands and looking at the return status?
> > > > > When the device reaches the limit it would not even send the command.
> > > >
> > > >
> > > > That's more logic for the driver to implement. Why should it bother
> > > > when it can just send it?
> > > >
> > > It can just send it and fail and flood with error logs.
> > 
> > If the spec says device can fail and that is expected then it won't flood.
> > If you don't want driver to send some commands you should say that instead
> > of saying device should filter them.
> I will add the normative in the driver requirement section.
> 
> > 
> > > Also it cannot just send some random id based numbers that device does
> > not support.
> > 
> > Aha. I think I'm beginning to guess. You wrote:
> > 	field{max_groups} indicates total number of flow filter groups
> > supported
> > 	by the device whose group identifiers can be any value in the range
> > from 0 to
> > 	\field{max_groups - 1}.
> > and you think this implies that it can't be out of that range.
> > That's not how logic works though ;)
> > 
> Which logic?

The aristotelian logic we commonly use.  You say "group identifiers can
be any value in the range".  You seem to mean "group identifiers can not
be any value not in the range". These two statements are not
equivalent and neither implies the other.


> The driver will honor the limit given to him.
> The device will also naturally honor what it published to driver.
> > 
> > > > > For example if the device supports only one group, it wont
> > > > > implement
> > > > ethtool ntuple and will chose only arfs as one example.
> > > >
> > > > Sounds like a contrived example why does device even expose flow
> > > > steering then?
> > > It is not contrived at all.
> > >
> > > A device may be support one or multiple groups. Each group in the OS has
> > multiple users.
> > > One group is enough for either ARFS or ethool but not both.
> > > Two groups can allow ARFS and ethtool to co-exists.
> > > 3 groups will allow in future to expose some queues to user apps.
> > 
> > Oh I misunderstood.
> > Then why would driver decide to force a decision to ARFS specifically?
> > It will likely leave this to the user.
> It is the driver implementation choice,
> For example: 
> if there is only one group, driver can choose to give strong preference, say for ARFS only.
> 
> Or it can let it be on first come first usage, for example, if ethtool wants to use first, it will allow it, not letting ARFS to work.
> 

Practically, drivers are highly unlikely to make the choice.
That is why it is reasonable not to have checks in the
driver if device is doing them anyway.
But OTOH if you want driver to do the checks then I don't see why we
should also add them to device unless there's a good reason to.
Less checks in devices -> cheaper simpler devices.

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

