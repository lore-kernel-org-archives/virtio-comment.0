Return-Path: <virtio-comment-return-8425-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2063C072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:55:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 383851336EB
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:55:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2C527986E25
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:55:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 225EA986E1A; Fri, 17 Nov 2023 09:55:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14987986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 09:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 7Hh8J4rHMWy0Lwqn7jnicw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700214932; x=1700819732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1/tb5Y30rX69auKG6mplE47p8Vi++m6+Cd/h7SQoZA=;
        b=HJY/JSE0urzE0rFJyMyBybUoyApnRAw8cmsw1XFMpljtJ9XPMU161CgSq1JXyCdxTh
         2OuI7iUZkDZFxKzLSas7g21YTpS+bH+FkGKHk4ib6MMpPLkIYmaVANN4Eq0sV0vZPCj+
         F85y8W14ogSwvBNZhFWejU15bDArLgQs6ewqevAnvv8AKEibufNb0rNRp3xjz6yh7/6x
         Jgjh3pyaTDTw2xdk7tGHuJcjJr69uXVvF959vOoBBEQ66AtWZEdSfGEqOMnF17tTBlnf
         qKxPluHgwWPtd3MgUvrUV+X+Pqw1Q0RtDZhxFPX4JSdfNFsAaMcHKICldhs9sQd4gyue
         NyuQ==
X-Gm-Message-State: AOJu0YyV0vUDe7JyGWVb8sVKBXM+Bmfqh/Juewr1W1uFsI9aIOT9aGYH
	PYQf3hTWNEmIFpxzbqz1HqngKTzjUJEoNo2LYlXcUVTP6ITQDCj9ORgQGg7pwkepCGzzDw2GLXI
	iuvMX+G0cQQMcG0fjQg6iKfO4RRRSNBWJbg==
X-Received: by 2002:a05:600c:154a:b0:401:bdd7:49ae with SMTP id f10-20020a05600c154a00b00401bdd749aemr15795488wmg.18.1700214931758;
        Fri, 17 Nov 2023 01:55:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEA6oBLpZLWdS0AXZgKSMr7mjvftBC7cnBIXK3J5vINa5ZX8AgXfjVwFpQl0p6p+ycedAoM8Q==
X-Received: by 2002:a05:600c:154a:b0:401:bdd7:49ae with SMTP id f10-20020a05600c154a00b00401bdd749aemr15795465wmg.18.1700214931324;
        Fri, 17 Nov 2023 01:55:31 -0800 (PST)
Date: Fri, 17 Nov 2023 04:55:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231117045200-mutt-send-email-mst@kernel.org>
References: <20231114032553-mutt-send-email-mst@kernel.org>
 <b9b8a564-b2eb-4c1c-9ada-975f3833e282@intel.com>
 <20231115025002-mutt-send-email-mst@kernel.org>
 <5c1c6815-f144-4d81-bef7-59a7608936c6@intel.com>
 <20231115030025-mutt-send-email-mst@kernel.org>
 <ba5a3fe9-4c2c-4d59-ae99-fdf6ce29927e@intel.com>
 <20231115063832-mutt-send-email-mst@kernel.org>
 <e21e91be-4696-4f67-94bd-e1663c85bdb7@intel.com>
 <20231116071230-mutt-send-email-mst@kernel.org>
 <37c65584-2d55-4221-8755-dd174476cc3b@intel.com>
MIME-Version: 1.0
In-Reply-To: <37c65584-2d55-4221-8755-dd174476cc3b@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Fri, Nov 17, 2023 at 05:50:24PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/16/2023 8:18 PM, Michael S. Tsirkin wrote:
> > On Thu, Nov 16, 2023 at 05:38:35PM +0800, Zhu, Lingshan wrote:
> > > 
> > > On 11/15/2023 7:52 PM, Michael S. Tsirkin wrote:
> > > > On Wed, Nov 15, 2023 at 04:42:56PM +0800, Zhu, Lingshan wrote:
> > > > > On 11/15/2023 4:05 PM, Michael S. Tsirkin wrote:
> > > > > > On Wed, Nov 15, 2023 at 03:59:16PM +0800, Zhu, Lingshan wrote:
> > > > > > > On 11/15/2023 3:51 PM, Michael S. Tsirkin wrote:
> > > > > > > > On Wed, Nov 15, 2023 at 12:05:59PM +0800, Zhu, Lingshan wrote:
> > > > > > > > > On 11/14/2023 4:27 PM, Michael S. Tsirkin wrote:
> > > > > > > > > > On Tue, Nov 14, 2023 at 03:34:32PM +0800, Zhu, Lingshan wrote:
> > > > > > > > > > > > > So I can't
> > > > > > > > > > > > > believe it has good performance overall. Logging via IOMMU or using
> > > > > > > > > > > > > shadow virtqueue doesn't need any extra PCI transactions at least.
> > > > > > > > > > > > On the other hand they have an extra CPU cost.  Personally if this is
> > > > > > > > > > > > coming from a hardware vendor, I am inclined to trust them wrt PCI
> > > > > > > > > > > > transactions.  But anyway, discussing this at a high level theoretically
> > > > > > > > > > > > is pointless - whoever bothers with actual prototyping for performance
> > > > > > > > > > > > testing wins, if no one does I'd expect a back of a napkin estimate
> > > > > > > > > > > > to be included.
> > > > > > > > > > > if so, Intel has released productions implementing these interfaces years
> > > > > > > > > > > ago,
> > > > > > > > > > > see live migration in 4.1. IFCVF vDPA Implementation,
> > > > > > > > > > > https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html
> > > > > > > > > > > and
> > > > > > > > > > That one is based on shadow queue, right? Which I think this shows
> > > > > > > > > > is worth supporting.
> > > > > > > > > Yes, it is shadow virtqueue, I assume this is already mostly done,
> > > > > > > > > do you see any gaps we need to address in our series that we should work on?
> > > > > > > > > 
> > > > > > > > > Thanks
> > > > > > > > There were a ton of comments posted on your series.
> > > > > > > Hope I didn't miss anything. I see your latest comments are about vq states,
> > > > > > > as replied before, I think we can record the states by two le16 and the
> > > > > > > in-flight
> > > > > > > descriptor tracking facility.
> > > > > > I don't know why you need the le16. in-flight tracking should be enough.
> > > > > > And given it needs DMA I would try really hard to actually use
> > > > > > admin commands for this.
> > > > > we need to record the on-device avail_idx and used_idx, or
> > > > > how can the destination side know the device internal values.
> > > > Again you never documented what state the device is in so I can't really
> > > > say for sure.  But generally whenever a buffer is used the internal
> > > > values are written out to memory.
> > > This is the state of a virtqueue, in my series I have defined what is
> > > vq state in [PATCH V2 1/6] virtio: introduce virtqueue state,
> > > and give an example of PCI implementation.
> > > 
> > > In short, for split vq it is last_avail_idx and in-flight descriptors.
> > > 
> > > I humbly request an explicit list of missing gaps, so that I can improve my
> > > V3
> > > 
> > > Thanks
> > I don't know how to help you without resorting to writing it instead of
> > you, I sent 3 messages in response to that one patch alone. Your patch
> > just adds some bits here and there without much in the way of
> > documentation. Patch needs to explain what these things are and how do they
> > interact with VQ state in memory.
> Please allow me quote the series:
> +The available state field is two bytes of virtqueue state that is used by
> +the device to read the next available buffer. It is presented in the
> following format:
> +
> +\begin{lstlisting}
> +le16 last_avail_idx;
> +\end{lstlisting}
> +
> +The \field{last_avail_idx} field is the free-running available ring
> +index where the device will read the next available head of a
> +descriptor chain.

Next *after what*? The last used buffer? This is exactly the used index.

> 
> +When SUSPEND is set, the device MUST record the Available State of every
> enabled splited virtqueue
> +in \field{Available State} field,
> +and correspondingly restore the Available State of every enabled splited
> virtqueue
> +from \field{Available State} field when DRIVER_OK is set.
> +
> +The device SHOULD reset \field{Available State} field upon a device reset
> 
> I will add these contents in next series:
> 1) vq states refer to the device internal states, so have to record and
> restore them
> 2) in-flight descriprots tracking.
> 
> Not sure whether I should describe how in-guest-memory vq config migrated,
> because they migrated with guest memory.
> > 
> > 
> > But besides, Parav needs to do exactly the same too. So why don't you
> > let Parav do the work on this and then later just add a small interface
> > to send admin commands through VF itself? Looks like this will be good
> I think this is the topic: shall we process admin cmds in config space.....
> > enough for VDPA. Meanwhile I feel your energy would be better spend
> > working on transport vq which no one else is working on.
> I can start rework on transport vq next week.
> 
> Thanks
> > 
> > 
> > 
> > 
> > > > > > > For this shadow virtqueue, do you think I should address this in my V4?
> > > > > > > Like saying: acknowledged control commands through the control virtqueue
> > > > > > > should be recorded, and we want to use shadow virtqueue to track dirty
> > > > > > > pages.
> > > > > > What you need to do is actually describe what do you expect the device
> > > > > > to do when it enters this suspend state. since you mention control
> > > > > > virtqueue then it seems that there needs to be a device type
> > > > > > specific text explaining the behaviour. If so this implies there
> > > > > > needs to be a list of device types that support suspend
> > > > > > until someone looks at each type and documents what it does.
> > > > > On a second thought, shadow vqs are hypervisor behaviors, maybe should not
> > > > > be
> > > > > described in this device spec.
> > > > > 
> > > > > Since SUSPEND is in device status, so for now I see every type of device
> > > > > implements
> > > > > device_status should support SUSPEND. This should be a general facility.


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

