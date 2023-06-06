Return-Path: <virtio-comment-return-6152-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754A0C7EE24
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 12:08:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B0C022A8E3
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 12:08:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1FEC99864A2
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 12:08:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0B43798648A; Tue,  6 Jun 2023 12:08:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EBD6D98648C;
	Tue,  6 Jun 2023 12:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R561e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VkWQvnA_1686053310;
Date: Tue, 6 Jun 2023 20:08:30 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Message-ID: <20230606120830.GA28580@h68b04307.sqa.eu95>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <a471e048-b492-eb04-608d-4312da4d0b09@linux.alibaba.com>
 <PH0PR12MB5481647B8D459F5594756C93DC4EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9afe0f6a-1a15-a200-b96d-385d3f69a375@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9afe0f6a-1a15-a200-b96d-385d3f69a375@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [virtio-comment] Re: [virtio] RE: [virtio-comment] [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow steering requirements

On Fri, Jun 02, 2023 at 12:39:45PM +0800, Heng Qi wrote:
> 
> 
> 在 2023/6/2 上午11:51, Parav Pandit 写道:
> >Hi Heng,
> >
> >>From: Heng Qi <hengqi@linux.alibaba.com>
> >>Sent: Thursday, June 1, 2023 11:35 PM
> >>
> >>Hi, Parav.
> >>
> >>I also did some work on this feature, and I think it would be very useful if we
> >>could work on this interface design and VirtIO Spec together!
> >>
> >Sure, happy to bring this alive together.
> >More below.
> >
> >>>+
> >>>+## 3.4 Receive virtqueue n-tuple flow steering (RFS)
> >>I think this abbreviation can be replaced with eg Receive virtqueue n-tuple flow
> >>director, RFD? or something else?
> >One hw vendor product name has director in it, so will probably want to stay away picking such TM.
> >
> >May be we can just say flow filters.
> >A filter may have an action and a destination.
> >So it can be generic enough.
> 
> Yes, it's a good generic name.
> 
> >
> >
> >>This allows us to distinguish more clearly from (Accelerated) Recieve Flow
> >>Steering, (A)RFS.
> >>
> >The idea was for ARFS and RFS both to reuse the same underlying infra, just the OS hooks are different. (stack vs user ethtool respectively).
> 
> Yes, so I want it to have a distinguishing name from RFS, 'recieve
> flow filters' below as the name of the underlying infra is enough.:)
> 
> >>ARFS can *automatically* issue RFS rules based on n-tuple rules, and we can
> >>still issue n-tuple rules *manually*.
> >>So RFD seems more reasonable than RFS abbreviation, what do you think?:)
> >>
> >"Receive flow filters" is probably more neutral name. :)
> >
> >>>+1. The driver should be able to define a receive packet match criteria, an
> >>>+   action and a destination for a packet. For example, an ipv4 packet with a
> >>>+   multicast address to be steered to the receive vq 0. The second example is
> >>>+   ipv4, tcp packet matching a specified IP address and tcp port tuple to
> >>>+   steered to receive vq 10.
> >>>+2. The match criteria should include exact tuple fields well-defined such as
> >>mac
> >>>+   address, IP addresses, tcp/udp ports, etc.
> >>>+3. The match criteria should also include the field mask.
> >>The mask structure can be considered to reuse the same structure as the key
> >>structure.
> >Yes, mask will probably have the bit mask definition.
> >
> >>>+4. The match criteria may optionally also include specific packet data offset,
> >>>+   length, and matching pattern, which may not be defined in the standard
> >>RFC.
> >>>+5. Action includes (a) dropping or (b) forwarding the packet.
> >>>+6. Destination location is a receive virtqueue index or rss context.
> >>We may have an additional requirement internally, such as specifying the queue
> >>id of a certain VF, but we are still aligning this requirement internally, and it may
> >>be more reasonable to implement the work involving device group based on
> >>admin vq.
> >>
> >The switch side APIs bit more complex.
> >We were first considering using the flow filters/steering for the guest driver and extend further for switching side.
> 
> Yes, but it's not that hard to just extend a VF id. In general, we
> will get back to you next week after aligning because of any
> difficulties we need this.:)

Hi, all.

We have already aligned the requirements internally. There is a common
requirement in the cloud scenario: a virtual nic with SR-IOV capability.
The user of a vm splits it into one PF + multiple VFs, and each VF
takes some of the queues from the PF. Each VF can get its own IP address
and mac from the PF.

However, the forwarding component (here it can be understood as an eswitch)
connected to the virtual nic cannot see VFs, but can only see the PF (when
creating the SR-IOV virtual nic, the PF is bound to a forwarding component).
This behavior does not affect users (such as users in containers) using the VF,
that is, the user sees a real virtual nic. However, the data incoming and
outgoing this VF nic needs to be distinguished in the forwarding component:

1. When the packet comes out of the VF nic (from the perspective of the
forwarding component, it comes out of a queue of the PF), the source ip of
the packet is still the ip of the VF, and the forwarding component forwards
it directly;

2. When packets arrive at the forwarding component, the IPs seen by
the forwarding component (the IPs of all VFs) are the IPs of the PF.
If the forwarding component wants to direct packets to the corresponding VF,
it should use the flow director rules with the VF id issued by the PF.

Perhaps the admin queue can achieve this capability, but the flow
director rule carrying the VF id has become the ethtool and kernel standard,
so we can try to include it in the flow director's ability first (this
means that the flow director itself can have this behavior, especially
for those PFs that intend to limit the capabilities of the VF, and
this behavior can effectively support our scenario).

Thanks.

> 
> >>>+7. The device should process RFS rules before RSS rules, i.e., when there is a
> >>>+   miss on the RFS rule RSS rule applies.
> >>>+8. The device should be able to add/remove these rules at a rate of 100K
> >>>+   rules/sec.
> >>>+9. If multiple rules are programmed which has overlapping attributes for a
> >>>+   received packet, the driver to define the location/priority of the rule.
> >>Considering the capabilities similar to some current tools such as ethtool, if it is
> >>a simple implementation, the first match principle can be applied.
> >>
> >Yes, this likely needs refinement, I just wanted to get the seed for priority to be afloat when I wrote.
> >I am thinking of defining the priority at interface level, and driver can choose first match in the programming model based on the use.
> >
> 
> Yes, in general we really need priorities, and then maybe a matching
> mode field to let the driver choose which matching principle to use.
> 
> >>>+10. The driver should be able to query flow steering table entries
> >>programmed in
> >>>+    the device by the flow id.
> >>>+11. The driver should be able to add the entry for attributes (a) match
> >>>+    criteria, (b) action, (c) destination and (d) assign a unique id of 32 bits.
> >>>+12. The driver should be able to delete the steering rule entry via a unique
> >>id.
> >>>+13. The driver should be able to add and delete the steering rules in out of
> >>>+    order manner without depending on previous commands.
> >>>+14. A group member device should be able to query the attributes of the
> >>flow
> >>>+    steering that device supports.
> >>>+15. The driver and group owner driver should be able to query supported
> >>device
> >>>+    limits for the steering entries.
> >>Do we want to support some user-defined fields, so that manufacturers can
> >>customize the interpretation of some fields.
> >>
> >Yes, we can phase out the common case of ipv{4,6} and {udp,tcp} as first phase and more customs field as second phase.
> >Those use define fields can be useful in custom filters.
> 
> Yes, for example some simple tunnel matching is possible, but the
> full, exact tunnel matching is probably not the first phase of this
> new feature.
> 
> 
> Thanks!
> 
> 
> 
> ---------------------------------------------------------------------
> To unsubscribe from this mail list, you must leave the OASIS TC that
> generates this mail.  Follow this link to all your TCs in OASIS at:
> https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php

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

