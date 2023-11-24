Return-Path: <virtio-comment-return-8595-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58302C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 05:59:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AAD6E2AEE3
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 05:59:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7EA7E9868A6
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 05:59:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 623B39862D9; Fri, 24 Nov 2023 05:59:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 528C69868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 05:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 9wp-B2dFODyvkGa1N7s8TA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700805546; x=1701410346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qh0kGSnQBx5eHGjn5tkc2J3yNMrzDfpHXz51rIaOVQk=;
        b=pEdEZyhgcnFLK7WUzaIMFVaUlmQgFyjGTnekyoI/Jj0554dbngFAzBgWk6zDLBnDPd
         x2IX6uaXKNk0kNQXrPttX5a1UugD36XWtu4dLr+UOnt4RUPFts0WVTLf610URP9ku7rK
         54LwSLhfMqxwNgatSzKpYyjtCuq7vPh/AdhbXsfc1PbTfUoJm+K3qcBh4DF7BQK2GJFA
         43Vrb3WPlyZZy5Ck+wKntoVdL5jNPwd8lUm+8sO5mZH93qUuZU/ofROCP+HyG07eVFLQ
         49n2yghlIk+w91xzz+JInl/M4qSqLuN5SwenBf9Jx2IH9mXf0s2k1u+3qTM+k7gAh0bc
         mH2g==
X-Gm-Message-State: AOJu0YwFE5MSgJEH1bgFhUGdeVJhI3LYfUHaK5p0z7oCJv4wfE5CgpYl
	2MeYZGZuNuu65CdJbeO5MWRwybN0tlS/o4rLvkLT6k9upzEie7hLhr5L/aUQMOy9msU/mHr9rKt
	w9mhNRvu8J2Z26+6FTD8x2fC5ayxyFYAlgg==
X-Received: by 2002:a17:907:c87:b0:9be:562:a44a with SMTP id gi7-20020a1709070c8700b009be0562a44amr892143ejc.23.1700805546158;
        Thu, 23 Nov 2023 21:59:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGko2jh7U0FwE+elT5tXIow9HnRzZmyb9QQkowEGaPkauN0/XoyutrTwDDNjzAQ/kZSdFXlRw==
X-Received: by 2002:a17:907:c87:b0:9be:562:a44a with SMTP id gi7-20020a1709070c8700b009be0562a44amr892131ejc.23.1700805545720;
        Thu, 23 Nov 2023 21:59:05 -0800 (PST)
Date: Fri, 24 Nov 2023 00:59:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231124004105-mutt-send-email-mst@kernel.org>
References: <20231123092119.2718448-1-parav@nvidia.com>
 <20231123092119.2718448-3-parav@nvidia.com>
 <20231123091129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481584836D0FD5025B8874EDCB9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231123174947-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A6DFAEBD321707E31BDDDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481A6DFAEBD321707E31BDDDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands

On Fri, Nov 24, 2023 at 02:57:49AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 24, 2023 4:28 AM
> > 
> > On Thu, Nov 23, 2023 at 06:40:59PM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Thursday, November 23, 2023 7:44 PM
> > > >
> > > > On Thu, Nov 23, 2023 at 11:21:16AM +0200, Parav Pandit wrote:
> > > > > The device responds flow filter capabilities using two commands.
> > > > > One command indicates generic flow filter device limits such as
> > > > > number of flow filters, number of flow filter groups, support or
> > > > > multiple transports etc.
> > > > >
> > > > > The second command indicates supported match types, and fields of
> > > > > the packet.
> > > > >
> > > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> > > > > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > >
> > > > So I am still unsure about these commands.  What exactly is the point?
> > > >
> > > Two reasons.
> > > The device reports maximum capabilities that the driver knows upfront. So
> > that it does not need to come to device to know when to fail.
> > 
> > But that requires driver to keep extra state which can easily get out of sync.
> Not sure what you mean by get out of sync from whom?
> Not from the device.

yes from the device. I can't say for sure how because I now see this
patch is implying driver requirements that you didn't document. I
thought the IDs can be any number. It appears that's not what you meant.
I can try and guess what you meant but I'd rather have you rewrite this
in a way that makes the meaning explicit.


> There are many capabilities here each with a different use.

And you are under the impression that dumping all kind of stuff in a
single place is good somehow?

> For many caps, it is to know what is supported/not to decide in the driver.

I can't parse this sentence.

> Certain caps are max to know what is the range of id that driver can use like flow filter id, group id.

Maybe then. But there's apparently no requirement for either device or
driver to put it in this range.

> > For what benefit?
> >
> For functional work.

You don't really explain what kind of work in this patchset, or in the
commit logs. Maybe it's obvious for you but not for everyone.

> > > In future one may want to provision certain max limits that device can have
> > as they eventually will consume certain device hardware resources.
> > 
> > I don't exactly see how this helps provisioning.
> > 
> Provisioning side will set parameters which will reflect these limits to be same on src and dst hypervisor when device migration is used.

But making provisioning depend on driver being fully loaded
and accessing the command is creating a chicken and egg problem.
Provisioning is much more likely to use some new admin commands
over an owner device. So this command is useless for it.



> > 
> > > > Patch 5/5 mandates that device validates all fields already.
> > >
> > > > Are there guests that will actually look at these caps as opposed to
> > > > just sending commands and looking at the return status?
> > > When the device reaches the limit it would not even send the command.
> > 
> > 
> > That's more logic for the driver to implement. Why should it bother when it
> > can just send it?
> >
> It can just send it and fail and flood with error logs.

If the spec says device can fail and that is expected then it won't flood.
If you don't want driver to send some commands you should say that
instead of saying device should filter them.

> Also it cannot just send some random id based numbers that device does not support.

Aha. I think I'm beginning to guess. You wrote:
	field{max_groups} indicates total number of flow filter groups supported
	by the device whose group identifiers can be any value in the range from 0 to
	\field{max_groups - 1}.
and you think this implies that it can't be out of that range.
That's not how logic works though ;)


> > > For example if the device supports only one group, it wont implement
> > ethtool ntuple and will chose only arfs as one example.
> > 
> > Sounds like a contrived example why does device even expose flow steering
> > then?
> It is not contrived at all.
> 
> A device may be support one or multiple groups. Each group in the OS has multiple users.
> One group is enough for either ARFS or ethool but not both.
> Two groups can allow ARFS and ethtool to co-exists.
> 3 groups will allow in future to expose some queues to user apps.

Oh I misunderstood.
Then why would driver decide to force a decision to ARFS
specifically?
It will likely leave this to the user.

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

