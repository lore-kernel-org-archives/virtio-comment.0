Return-Path: <virtio-comment-return-8635-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDA0C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:22:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D5AF9217AE
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:22:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF3C89863A4
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:22:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B026B98638E; Mon, 27 Nov 2023 11:22:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1B56986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 11:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Nv96i-IxMPOBwoWbUbMrYg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701084159; x=1701688959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgzyiEUCZH/nPAXprvVeBZ5aHqlWscZryrxBedHDsWE=;
        b=qP4/b5pGXYf5JM/SlcaccC4Xv2YVd47gVFQ7zLvgl1BepeF5fG/RxcY/22AN7J5wFm
         K85jxFXVWPpmaDJXEjW7Am1LsHGp2ni/ipwhTr/g+4RM5TGh/rpQu197a1mf/96wJQcH
         g/1HJRoSh1pWb3rU9E2eoZ70XGGkz69glPLmhNILF8lSMIJln1W9n/NEUvspHvSLrogI
         tOT0Px4jh5JMxQtKYf5ApcyP/3G/TEsoqgVM9JfpoKGH4thmF3fLmhNM3tC+TxT1uf/y
         KuJCIYIAOcSeBmDd7phh37HBFDvD7lkpHQ1+SU305sRvxTBuEfpASgg/Vfgz1TJDKXcw
         goFg==
X-Gm-Message-State: AOJu0Yz3WSLqGCyDdcWuMb33UkoINrgulZONRykqDAH45XGthJINmAob
	jsf18TCjLojjxq9hJq0+/M7badiv0DHtdYCPi7pxM527fRIfD2SnUvj9oRBiDK49Hr8ZhMsAqLB
	5ag7iwxVWPhUNhtf11xbQMc7kTvvLPtwH3pckLCv7dA==
X-Received: by 2002:a17:907:2da9:b0:9fe:38b7:4278 with SMTP id gt41-20020a1709072da900b009fe38b74278mr10597732ejc.16.1701084159535;
        Mon, 27 Nov 2023 03:22:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBu4WmytReWO1zw8/DVJzt83VwYUrE76Di3pBJKWDlhVRjFWA1wMET55yrCKSa6hNC/2JdUw==
X-Received: by 2002:a17:907:2da9:b0:9fe:38b7:4278 with SMTP id gt41-20020a1709072da900b009fe38b74278mr10597700ejc.16.1701084159056;
        Mon, 27 Nov 2023 03:22:39 -0800 (PST)
Date: Mon, 27 Nov 2023 06:22:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231127061203-mutt-send-email-mst@kernel.org>
References: <20231123092119.2718448-1-parav@nvidia.com>
 <20231123092119.2718448-3-parav@nvidia.com>
 <20231123091129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481584836D0FD5025B8874EDCB9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231123174947-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A6DFAEBD321707E31BDDDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124004105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818AFAE1E2B943C9104B59DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124042824-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548126B6C07BFA6271020982DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548126B6C07BFA6271020982DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands

On Mon, Nov 27, 2023 at 10:19:47AM +0000, Parav Pandit wrote:
> > > > It appears that's not what you meant.
> > > > I can try and guess what you meant but I'd rather have you rewrite
> > > > this in a way that makes the meaning explicit.
> > > >
> > > If you insist, I can duplicate in driver requirements too.
> > > >
> > > > > There are many capabilities here each with a different use.
> > > >
> > > > And you are under the impression that dumping all kind of stuff in a
> > > > single place is good somehow?
> > > It is not dumped.
> > > It is structured based on the functionality.
> > > The config space proposal tends to dump everything in unstructured way at
> > single place that cannot extended elegantly.
> > >
> > > For example, Xuan's dynamic array cannot be placed next to other dynamic
> > array of flow filter.
> > 
> > I don't know what "dynamic array" is exactly but generally, Any kind of a big
> > array is not appropriate in config space - I don't see any of these here, though.
> Ah, now I see the disconnect.
> 
> There is.
> struct virtio_net_ctrl_ff_match_types

Now I think I don't understand what this array does at all.
Why are there multiple entries with each entry also including
a mask of multiple fields?


> > 
> > 
> > > >
> > > > > For many caps, it is to know what is supported/not to decide in the
> > driver.
> > > >
> > > > I can't parse this sentence.
> > > >
> > > The driver checks things upfront what is supported while serving the
> > command, instead of random trial and error guess work game with he device.
> > 
> > There's no real guesswork with these specific commands: user types an
> > ethtool command, driver sends it on, it either succeeds or fails.
> It is a guess work without driver knowing if its supported or not.

What we do not need is both driver and device checking
these values.


> > However if you feel it important to do checks in driver - OK.
> Yes, because there are many parsing fields and good to know.
> 
> > But that makes cap query an init time thing.
> Yes, caps does not change dynamically.
> But sure it is different among different member devices and owner too.
> 
> > 
> > 
> > > > > Certain caps are max to know what is the range of id that driver
> > > > > can use like
> > > > flow filter id, group id.
> > > >
> > > > Maybe then. But there's apparently no requirement for either device
> > > > or driver to put it in this range.
> > > >
> > >
> > > I will add this requirement statements in device requirements and that will
> > make things clear.
> > > Good point.
> > >
> > > > > > For what benefit?
> > > > > >
> > > > > For functional work.
> > > >
> > > > You don't really explain what kind of work in this patchset, or in
> > > > the commit logs. Maybe it's obvious for you but not for everyone.
> > > What text are you expecting?
> > > We have undergone all the requirements study that you conveniently
> > choose to not participate for 2 months.
> > 
> > Yea ... I'm sorry. Things have been going on here, man.
> > I'm glad I'm back and able to participate though.
> > 
> Great.
> 
> > > >
> > > > > > > In future one may want to provision certain max limits that
> > > > > > > device can have
> > > > > > as they eventually will consume certain device hardware resources.
> > > > > >
> > > > > > I don't exactly see how this helps provisioning.
> > > > > >
> > > > > Provisioning side will set parameters which will reflect these
> > > > > limits to be same
> > > > on src and dst hypervisor when device migration is used.
> > > >
> > > > But making provisioning depend on driver being fully loaded and
> > > > accessing the command is creating a chicken and egg problem.
> > > I didn't explain well likely.
> > > Provisioning as you described, will be on owner device.
> > > This command tells driver what is provisioned.
> > >
> > > > Provisioning is much more likely to use some new admin commands over
> > > > an owner device. So this command is useless for it.
> > > >
> > > Provisioning owner device will use exact same structure while provisioning.
> > 
> > So the advantage of using config space is that we can have a single generic
> > provision command that gets device config space format. Your approach will
> > need some kind of net device specific thing.
> > 
> 
> I see the advantage. But it very small and largely hidden beneath the sw layers how a provisioning command sets things.
> A provisioning command sets the value, it surfaces at different level.
> 
> Multiple device vendors want to follow the design pattern to use " most uses it is better to use a virtqueue to
> update configuration information"
> 
> Instead of RO = config space, RW = cvq.
> 
> The more pragmatic design pattern is:
> driver initialization time => feature bit + virtio config space.
> Driver runtime => cvq.

yes. capability check is initialization time though.


> > 
> > > >
> > > >
> > > > > >
> > > > > > > > Patch 5/5 mandates that device validates all fields already.
> > > > > > >
> > > > > > > > Are there guests that will actually look at these caps as
> > > > > > > > opposed to just sending commands and looking at the return
> > status?
> > > > > > > When the device reaches the limit it would not even send the
> > command.
> > > > > >
> > > > > >
> > > > > > That's more logic for the driver to implement. Why should it
> > > > > > bother when it can just send it?
> > > > > >
> > > > > It can just send it and fail and flood with error logs.
> > > >
> > > > If the spec says device can fail and that is expected then it won't flood.
> > > > If you don't want driver to send some commands you should say that
> > > > instead of saying device should filter them.
> > > I will add the normative in the driver requirement section.
> > >
> > > >
> > > > > Also it cannot just send some random id based numbers that device
> > > > > does
> > > > not support.
> > > >
> > > > Aha. I think I'm beginning to guess. You wrote:
> > > > 	field{max_groups} indicates total number of flow filter groups
> > > > supported
> > > > 	by the device whose group identifiers can be any value in the range
> > > > from 0 to
> > > > 	\field{max_groups - 1}.
> > > > and you think this implies that it can't be out of that range.
> > > > That's not how logic works though ;)
> > > >
> > > Which logic?
> > 
> > The aristotelian logic we commonly use.  You say "group identifiers can be any
> > value in the range".  You seem to mean "group identifiers can not be any value
> > not in the range". These two statements are not equivalent and neither implies
> > the other.
> I fail to see the difference between the two English sentence you wrote.
> Can you please have an example, how second is any different?
> 
> In my example max_groups = 5, so group id must be from 0 to 4.

No, your sentence does not say it must. It says it can be in range.
Can it be out of range, e.g. 5? You don't state either way.
The second sentence says it can not be out of range so 5 is illegal.
Are there illegal values inside the range? E.g. might 3 be illegal?
According to second sentence, maybe. According to 1st sentence, 3
is legal.

> It can be any value.

:(


> In device and driver requirements, I will write the explicit line that it MUST be in this range.

Then it will be different.

> > 
> > 
> > > The driver will honor the limit given to him.
> > > The device will also naturally honor what it published to driver.
> > > >
> > > > > > > For example if the device supports only one group, it wont
> > > > > > > implement
> > > > > > ethtool ntuple and will chose only arfs as one example.
> > > > > >
> > > > > > Sounds like a contrived example why does device even expose flow
> > > > > > steering then?
> > > > > It is not contrived at all.
> > > > >
> > > > > A device may be support one or multiple groups. Each group in the
> > > > > OS has
> > > > multiple users.
> > > > > One group is enough for either ARFS or ethool but not both.
> > > > > Two groups can allow ARFS and ethtool to co-exists.
> > > > > 3 groups will allow in future to expose some queues to user apps.
> > > >
> > > > Oh I misunderstood.
> > > > Then why would driver decide to force a decision to ARFS specifically?
> > > > It will likely leave this to the user.
> > > It is the driver implementation choice, For example:
> > > if there is only one group, driver can choose to give strong preference, say for
> > ARFS only.
> > >
> > > Or it can let it be on first come first usage, for example, if ethtool wants to
> > use first, it will allow it, not letting ARFS to work.
> > >
> > 
> > Practically, drivers are highly unlikely to make the choice.
> It will make the choice when there is only one group available.
> 
> > That is why it is reasonable not to have checks in the driver if device is doing
> > them anyway.
> The groups particularly have the priority as well. So the check in device does not work.

I don't know what that means.

> > But OTOH if you want driver to do the checks then I don't see why we should
> > also add them to device unless there's a good reason to.
> > Less checks in devices -> cheaper simpler devices.
> > 
> The cheaper devices can always place UINT_32 max values and ignore any checking etc.

Then won't driver expect inifinite # of groups to be supported?

> The check in the device will be done as it uses such an id for its own bookkeeping.
> 
I don't know what that means.
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

