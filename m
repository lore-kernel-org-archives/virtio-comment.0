Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4891CE0A1
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 21:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719954262; cv=none; b=bg5lfB3b/QUYdCsBTh2ecSG6NJmxQ6qPpDT2f2cuHsFxGv+SREfno5MFjRKEbz41lGTISiXMGLpeHy7abuAHxcMLUWBeoN8RZTscg/YeXR9YJ3TgCQCMtkd4wlgOhp0NNVkEp/BQgrAopq+ru5fh6YvZXLERFNfZF2fduH+rX/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719954262; c=relaxed/simple;
	bh=iqWkSnlxp9MfQ8ftBq9w/6rTrF6YrF0inZeGkym1mtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=f2drt009l2upMEQC9soK59Z86DMZhg18vRRhFT7RH3nTXs62fXstbb9aKgV9nm6yabbehQLJR9BUq/ri8/DsnqCzh0RZ4oP3ZEFsNmR/mhNUAmxZsswavFLdJu77qpQdRItb3kLPDHvbkrolJNtkcutTxntROtaivdLkmKW9AGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XjqAJl/J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XjqAJl/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719954259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HN3+k9Rl1azLJoKaqVSqJ0f13bmn5SY/Cq/vZIr1Te8=;
	b=XjqAJl/JRw8xz828v5TOqZ3sfl+yYVwS64PAAvCk8AFpsPlVVgfqZNRzxziCP708UG4PZz
	1b8P26uP7Tl4IE66+T3rLTje+uprYMPi0k5ht9ZxA03LQ7uEZZWsp3dz3gxd4UQeQkof7Z
	/VywuciGgYJIONPP/zNY2c1gVDYPLdY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-mJdO6G72NPyl2sG5P5Mulg-1; Tue, 02 Jul 2024 17:04:17 -0400
X-MC-Unique: mJdO6G72NPyl2sG5P5Mulg-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52e765bc03bso4667533e87.0
        for <virtio-comment@lists.linux.dev>; Tue, 02 Jul 2024 14:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719954256; x=1720559056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HN3+k9Rl1azLJoKaqVSqJ0f13bmn5SY/Cq/vZIr1Te8=;
        b=NaC35A8xZh7I198ZHuYAWiM2eZDDsocVT30cnMJNIYgY4Ka+zPkmWr8fkZZrVsayB8
         87e1RsfmkpCOXH64AXGZg4EL+2Mt5wmoUIPhFid1gZtgmuCHktCoeW3+AF1fi7ytlHuu
         e6RYJE7pJw19Nv9bXtkwr2duZU5srE01ERONsOlnO7tfnwI6ipu8hZJR5VoRIofjGG8E
         FP3mNleJOHu8QVgUqQF1lowViYzG9kHcMgaofdYzcIUGEXGUWoIPNupIHNlTSDHdzWgS
         HNe2BhDr6LHxznFX4AOOpvfFFhpNJxId9dSh71sETWeaU+YaGsvixE05ywseJETljnn7
         qkcw==
X-Forwarded-Encrypted: i=1; AJvYcCWeXKabyyTq8A3h/y3tSfLWb8gNbQDzLVIR5p94CulXJS6olpAovmLRIZzb5PFZ08NfFIfeHTQwkkbNaB82JcmoL1NuQEW5k+XwkbgkcOI=
X-Gm-Message-State: AOJu0YzQL1qLh/1bU+WXRj5vMZZeWioayOPSBu4OXvKll2jnzMoqoP5u
	XMF5CiQngZqC26I/j9oeBxMl6c8Tg8ZWJdIAQ7VOv3pC6ng/AhSvkchKmKS4xW+jpM6zXKuqh8M
	eR945DA5d6Jk8iLfAgSLBdTKpdOEi9zHPDsFpXAAjSRwReJCYrnvg1kacWcrWQRj7
X-Received: by 2002:a05:6512:acd:b0:52e:7674:b51d with SMTP id 2adb3069b0e04-52e8264bf35mr6635040e87.12.1719954256222;
        Tue, 02 Jul 2024 14:04:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJV9ku3i/oghnD53HEhv8qg0NzbNsCTUinAP8epTTyzBq/QKEQCnCcJku9rFbJlsdpWaaQtg==
X-Received: by 2002:a05:6512:acd:b0:52e:7674:b51d with SMTP id 2adb3069b0e04-52e8264bf35mr6635028e87.12.1719954255474;
        Tue, 02 Jul 2024 14:04:15 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f5:eadd:8c31:db01:9d01:7604])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b09abbfsm210415175e9.35.2024.07.02.14.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 14:04:15 -0700 (PDT)
Date: Tue, 2 Jul 2024 17:04:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Jason Wang <jasowang@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
	Parav Pandit <parav@nvidia.com>, Heng Qi <hengqi@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240702165806-mutt-send-email-mst@kernel.org>
References: <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org>
 <b57acf4d-84e1-4360-a229-eeb7b3d752fc@oracle.com>
 <20240627181635-mutt-send-email-mst@kernel.org>
 <3297e270-e9a5-404e-92eb-55fbe6c3f78c@oracle.com>
 <CACGkMEsxP0eKK2DbKVTig8MPW0J7z4o5xSSRtk4JAcOMoXmsPw@mail.gmail.com>
 <20240702223735.4fd2847a.pasic@linux.ibm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240702223735.4fd2847a.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 02, 2024 at 10:37:35PM +0200, Halil Pasic wrote:
> On Fri, 28 Jun 2024 16:23:17 +0800
> Jason Wang <jasowang@redhat.com> wrote:
> 
> > > Hmmm, this next sentence you reference above was indeed for the
> > > interaction between coalescing and used buffer suppression. Then what's
> > > the best-effort part was about, really? Round-up or round down the set
> > > value to the power of 2 to save space? How is it relevant to our
> > > discussion? I think even with rounding it shouldn't be too off? (as
> > > said, by best-effort v.s. give up)  
> > 
> > Would it help if we add something like below in the guidance?
> >
> 
> It would IMHO greatly benefit clarity, provided we do get it right.
>  
> > When the device wants to send a notification it needs:
> > 
> > 1) check notification suppression, don't send interrupt if it is
> > suppressed otherwise goto 2)
> > 2) check event index, don't send interrupt if event index is not
> > crossed otherwise goto 3)
> > 3) check coalescing, don't send interrupt if the coalescing limit is
> > not exceed, otherwise send the interrupt
> > 
> > (Just to demonstrate the idea, needs tweaking for sure)
> 
> Yes I agree this indeed needs tweaking. Let me make some points.

Very good points below.


> 1) for virtio-net we have 3 distinct mechanisms that police used
> buffer notification avoidance, but 2 of the three are actually
> mutually exclusive if I understand it correctly. Namely we have
> coalescing guarded by VIRTIO_NET_F_NOTF_COAL and then depending on
> whether _F_EVENT_IDX was negotiated or not, we have "event_idx based" or
> "crude flag based" notification suppression.
> 
> 2) Let me just quote the entire section on the good old used buffer
> notification suppression
> """
> 2.7.7.2 Device Requirements: Used Buffer Notification Suppression
> 
> If the VIRTIO_F_EVENT_IDX feature bit is not negotiated:
> 
>     * The device MUST ignore the used_event value.
>     * After the device writes a descriptor index into the used ring:
>        -  If flags is 1, the device SHOULD NOT send a notification.
>        -  If flags is 0, the device MUST send a notification.
> 
> Otherwise, if the VIRTIO_F_EVENT_IDX feature bit is negotiated:
> 
>     * The device MUST ignore the lower bit of flags.
>     * After the device writes a descriptor index into the used ring:
>        - If the idx field in the used ring (which determined where that
>       descriptor index was placed) was equal to used_event, the device
>       MUST send a notification.
>        - Otherwise the device SHOULD NOT send a notification.
> 
> Note: For example, if used_event is 0, then a device using
> 
> VIRTIO_F_EVENT_IDX would send a used buffer notification to the driver
> after the first buffer is used (and again after the 65536th buffer,
> etc).
> """ 
> 
> Frankly, a MUST is a must, and I don't see very little leeway
> for the coalescing to avoid any notifications. But on the other hand,
> that is the very purpose of the coalescing so IMHO we have a problem
> here.
> 
> The only loophole here is "after", which could be stretched to
> "eventually, before the end of the world". Which would basically reduce
> the MUST ad-absurdum, and I would not like that.

I agree as such but I also think we can just go ahead and make this
explicit. That is s/after/at some point in time after/.

And then let's add text that actually explains how
- devices can defer notifications for performance
- some devices can have device specific mechanisms
  for driver to control how much notifications are deferred.


WDYT?



> 3) AFAIU if multiple suppression mechanisms are active
> concurrently we are aiming for some sort of an logical AND semantic i.e.
> a further reduction over just a single one being employed (and not OR).
> 
> But IMHO the both the wording for the event_idx based and curde
> suppression, as well as for coalescing.
> 
> Let me quote the full description for the coalescing:
> 
> """
> 5.1.6.5.9.1 Operation
> The device sends a used buffer notification once the notification conditions are met and if the notifications are not suppressed as explained in 2.7.7.
> 
> When the device has non-zero max_usecs and non-zero max_packets, it starts counting microseconds and packets upon receiving/sending a packet. The device counts packets and microseconds for each receive virtqueue and transmit virtqueue separately. In this case, the notification conditions are met when max_usecs microseconds elapse, or upon sending/receiving max_packets packets, whichever happens first. Afterwards, the device waits for the next packet and starts counting packets and microseconds again.
> 
> When the device has max_usecs = 0 or max_packets = 0, the notification conditions are met after every packet received/sent. 
> """
> 
> Here "Afterwards" is ambiguous. What we want here is "afterwards" ==
> "after the notification has been sent", but one can also read it as
> "after the condition has been met".
> 
> 4) I see two ways to make sense out of it.
> 
> My preferred way would be to replace "send a notification" with
> "generate a notification" in the main text including "2.7.7.2 Device
> Requirements: Used Buffer Notification Suppression", along with adding an
> explanation which states that generated notifications are sent
> immediately unless a device has an active facility that under a certain
> set of conditions  retains and possibly coalesces notifications. 
> 
> Please notice that here coalescence is used with its dictionary
> meaning (see https://dictionary.cambridge.org/dictionary/english/coalesce), 
> and that the current description of NET_F_NOTIF_COAL is more akin to a
> suppression mechanism where notifications are suppressed or discarded and
> not coalesced.
> 
> The notification coalescing facility would then retain the first
> used buffer notification request for each queue (those are still
> generated by the same rules), until either the packet count or the
> timeout type max frequency (or delay we need to clarify that) condition
> is met, and coalesce any further notification requests with the retained
> one until it is sent.
> 
> The other way, which I'm not sure is actually viable, is basically to
> try to clarify the hell out of the current approach as taken by
> "5.1.6.5.9.1 Operation" by making it crystal clear when exactly are the
> "notification conditions met" and what is the complement state of that,
> and add a sentence to 2.7.7.2 that references device specific mechanisms
> to do more suppression.  And  of course we would have to find a nice
> definition for "if the notifications are not suppressed as explained in
> 2.7.7." such that loss of initiative is not possible.
> 
> IMHO any solution where things can stall because we would have sent
> an used buffer notification without "coalescing" but we did not because
> of coalescing  is not acceptable. This could happen if we cross
> event_idx when the coalescing notification conditions are not met and
> thus do not notify, and then when the coalescing notification condition
> are finally met (e.g. via timeout) the event_id type suppression
> is active again because we crossed event_idx when coalescing
> notification condition was not met, and we end up not notifying again.
> 
> Sorry for the wall of text.
> 
> Regards,
> Halil
> 
> 
> 

