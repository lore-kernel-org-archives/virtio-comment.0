Return-Path: <virtio-comment-return-7015-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA6DC001DE
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 07:17:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A1E31CB165
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 07:17:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8E14C9866E1
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 07:17:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7B80B9866DE; Fri,  4 Aug 2023 07:17:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 686209866DF;
	Fri,  4 Aug 2023 07:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Vp.SN-o_1691133448;
Date: Fri, 4 Aug 2023 15:17:28 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230804071728.GA7515@h68b04307.sqa.eu95>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <20230802152525.GA13690@h68b04307.sqa.eu95>
 <PH0PR12MB5481538EEC183EBE3FF16234DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230803130725.GA47086@h68b04307.sqa.eu95>
 <PH0PR12MB54811B738594B741F8F8D723DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR12MB54811B738594B741F8F8D723DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [virtio-comment] Re: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements

On Fri, Aug 04, 2023 at 06:20:53AM +0000, Parav Pandit wrote:
> 
> > From: Heng Qi <hengqi@linux.alibaba.com>
> > Sent: Thursday, August 3, 2023 6:37 PM
> > 
> > On Thu, Aug 03, 2023 at 09:59:54AM +0000, Parav Pandit wrote:
> > >
> > > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > > Sent: Wednesday, August 2, 2023 8:55 PM
> > >
> > > > Hi, Parav. Sorry for not responding to this in time due to other things
> > recently.
> > > >
> > > > Yes, RFF has two scenarios, set_rxnfc and ARFS, both of which will
> > > > affect the packet steering on the device side.
> > > > I think manually configured rules should have higher priority than
> > > > ARFS automatic configuration.
> > > > This behavior is intuitive and consistent with other drivers.
> > > > Therefore, the processing chain on a rx packet is:
> > > > {mac,vlan,promisc rx filters} -> {set_rxnfc} -> {ARFS} -> {rss/hash config}.
> > > >
> > > Correct.
> > > Within the RFF context, the priority among multiple RFF entries is governed by
> > the concept of group.
> > > So above two users of the RFF will create two groups and assign priority to it
> > and achieve the desired processing order.
> > 
> > OK, we intend to use group as the concept of rule storage. Therefore, we
> > should have two priorities:
> > 1. one is the priority of the group, this field is not seen in the structure
> > virtio_net_rff_add_modify, or the group id implies the priority (for example, the
> > smaller the priority, the higher the priority?)?
> Good catch, yes, we need priority assignment to the group.
> Hence, we need group add/delete command as well.

Yes, then group priority can be in group add command.

> 
> > 2. the other is the priority of the rule, the current structure
> > virtio_net_rff_add_modify is still missing this.
> > 
> Adding it.

Ok.

> > I think we should add some more texts in the next version describing how
> > matching rules are prioritized and how groups work. This is important for RFF.
> > 
> > I also want to confirm that for the interaction between the driver and the
> > device, the driver only needs to tell the priority of the device group and the
> > priority of the rule, and we should not reflect how the device stores and
> > queries rules (such as tcam or some acl acceleration solutions) ?
> > 
> Correct, we try to keep thing as abstract as possible.

Good! The implementation of the priority of the rules and groups can be reserved in
the driver implementation.

> > >
> > > > There are also priorities within set_rxnfc and ARFS respectively.
> > > > 1. For set_rxnfc, which has the exact match and the mask match.
> > > > Exact matches should have higher priority.
> > > > Suppose there are two rules,
> > > > 	rule1: {"tcpv4", "src-ip: 1.1.1.1"} -> rxq1
> > > > 	rule2: {"tcpv4", "src-ip: 1.1.1.1", "dst-port: 8989"} -> rxq2 .For
> > > > recieved rx packets whose src-ip is 1.1.1.1, should match rule2 instead of
> > rule1.
> > > >
> > > Yes. Driver should be able to set the priority within the group as well for above
> > scenario.
> > 
> > But here I am wrong, it should be:
> > rx packets whose src-ip is 1.1.1.1 and dst-port is 8989, should match rule2
> > instead of rule1.
> > 
> That is what you wrote, here both the rules are within one group.
> And rule2 should have higher priority than rule1.
> 

Yes.

> > >
> > > > The rules of set_rxnfc come from manual configuration, the number of
> > > > these rules is small and we may not need group grouping for this.
> > > > And ctrlq can meet the configuration rate,
> > > >
> > > Yes, but having single interface for two use cases enables the device
> > implementation to not build driver interface specific infra.
> > > Both can be handled by unified interface.
> > 
> > I agree:) Is ctrlq an option when the num_flow_filter_vqs exposed by the device
> > is 0?
> >
> I think ctrlq would in above scenario offers, a quick start to the feature by making flowvq optional.
> It comes with the tradeoff of perf, and dual code implementation.
> Which is fine, the problem occurs is when flowvq is also supported, and flowvq is created, if driver issues command on cvq and flowvq both, synchronizing these on the device is nightmare.
> 
> So if we can draft it as: 
> If flowvq is created, RFF must be done only on flowvq by the driver.
> If flowvq is supported, but not created, cvq can be used.
> 
> In that case it is flexible enough for device to implement with reasonable trade off.

Yes, but a small update:
If flowvq is created, RFF must be done only on flowvq by the driver.
If flowvq is supported, but not created, cvq can be used.
If flowvq is not supported, cvq is used.

> 
> > >
> > > > 2. For ARFS, which only has the exact match.
> > > > For ARFS, since there is only one matching rule for a certain flow,
> > > > so there is no need for group?
> > > Groups are defining the priority between two types of rules.
> > > Within ARFS domain we don't need group.
> > 
> > Yes, ARFS doesn't need group.
> > 
> > >
> > > However instead of starting with only two limiting groups, it is better to have
> > some flexibility for supporting multiple groups.
> > > A device can device one/two or more groups.
> > > So in future if a use case arise, interface wont be limiting to it.
> > 
> > Ok. This works.
> > 
> > >
> > > > We may need different types of tables, such as UDPv4 flow table,
> > > > TCPv4 flow table to speed up the lookup for differect flow types.
> > > > Besides, the high rate and large number of configuration rules means
> > > > that we need flow vq.
> > > >
> > > Yes, I am not sure if those tables should be exposed to the driver.
> > > Thinking that a device may be able to decide on table count which it may be
> > able to create.
> > 
> > o how to store and what method to use to store rules is determined by the
> > device, just like my question above. If yes, I think this is a good way to work,
> > because it allows for increased flexibility in device implementation.
> > 
> Right, we can possibly avoid concept of table in spec.
> So far I see below objects:
> 
> 1. group with priority (priority applies among the group)
> 2. flow entries with priority (priority applies to entries within the group)

Yes!

> > >
> > > > Therefore, although set_rxnfc and ARFS share a set of
> > > > infrastructure, there are still some differences, such as
> > > > configuration rate and quantity. So do we need add two features
> > > > (VIRTIO_NET_F_RXNFC and VIRTIO_NET_F_ARFS) for set_rxnfc and ARFS
> > respectively, and ARFS can choose flow vq?
> > > Not really, as one interface can fullfil both the needs without attaching it to a
> > specific OS interface.
> > >
> > 
> > Ok!
> > 
> > > > In this way, is it more conducive to advancing the work of RFF (such
> > > > as accelerating the advancement of set_rxnfc)?
> > > >
> > > Both the use cases are equally immediately usable so we can advance it easily
> > using single interface now.
> > >
> > > > > +
> > > > > +### 3.4.1 control path
> > > > > +1. The number of flow filter operations/sec can range from
> > > > > +100k/sec to
> > > > 1M/sec
> > > > > +   or even more. Hence flow filter operations must be done over a
> > queueing
> > > > > +   interface using one or more queues.
> > > >
> > > > This is only for ARFS, for devices that only want to support
> > > > set_rxnfc, they don't provide VIRTIO_NET_F_ARFS and consider
> > implementing flow vq.
> > > >
> > > Well once the device implements flow vq, it will service both cases.
> > > A simple device implementation who only case for RXNFC, can implement
> > flowvq in semi-software serving very small number of req/sec.
> > >
> > 
> > When the device does not provide flow vq, whether the driver can use ctrlq to
> > the device.
> > 
> Please see above.
> 
> > > > > +2. The device should be able to expose one or more supported flow
> > > > > +filter
> > > > queue
> > > > > +   count and its start vq index to the driver.
> > > > > +3. As each device may be operating for different performance
> > characteristic,
> > > > > +   start vq index and count may be different for each device. Secondly, it is
> > > > > +   inefficient for device to provide flow filters capabilities via a config
> > space
> > > > > +   region. Hence, the device should be able to share these attributes using
> > > > > +   dma interface, instead of transport registers.
> > > > > +4. Since flow filters are enabled much later in the driver life cycle, driver
> > > > > +   will likely create these queues when flow filters are enabled.
> > > >
> > > > I understand that the number of flow vqs is not reflected in
> > > > max_virtqueue_pairs. And a new vq is created at runtime, is this
> > > > supported in the existing virtio spec?
> > > >
> > > We are extending the virtio-spec now if it is not supported.
> > > But yes, it is supported because max_virtqueue_pairs will not expose the
> > count of flow_vq.
> > > (similar to how we did the AQ).
> > > And flowvq anyway is not _pair_ so we cannot expose there anyway.
> > 
> > Absolutely.
> > 
> > >
> > > > > +5. Flow filter operations are often accelerated by device in a hardware.
> > > > Ability
> > > > > +   to handle them on a queue other than control vq is desired.
> > > > > + This achieves
> > > > near
> > > > > +   zero modifications to existing implementations to add new
> > > > > + operations on
> > > > new
> > > > > +   purpose built queues (similar to transmit and receive queue).
> > > > > +6. The filter masks are optional; the device should be able to expose if it
> > > > > +   support filter masks.
> > > > > +7. The driver may want to have priority among group of flow
> > > > > +entries; to
> > > > facilitate
> > > > > +   the device support grouping flow filter entries by a notion of a group.
> > Each
> > > > > +   group defines priority in processing flow.
> > > > > +8. The driver and group owner driver should be able to query
> > > > > +supported
> > > > device
> > > > > +   limits for the flow filter entries.
> > > > > +
> > > > > +### 3.4.2 flow operations path
> > > > > +1. The driver should be able to define a receive packet match criteria, an
> > > > > +   action and a destination for a packet.
> > > >
> > > > When the user does not specify a destination when configuring a
> > > > rule, do we need a default destination?
> > > >
> > > I think we should not give such option to driver.
> > > A human/end user may not have the destination, but driver should be able to
> > decide a predictable destination.
> > 
> > Yes, that's what I mean:), and I said "we" for "the driver."
> >
> Ok. got it.
>  
> > >
> > > > > For example, an ipv4 packet with a
> > > > > +   multicast address to be steered to the receive vq 0. The second
> > example is
> > > > > +   ipv4, tcp packet matching a specified IP address and tcp port tuple to
> > > > > +   be steered to receive vq 10.
> > > > > +2. The match criteria should include exact tuple fields
> > > > > +well-defined such as
> > > > mac
> > > > > +   address, IP addresses, tcp/udp ports, etc.
> > > > > +3. The match criteria should also optionally include the field mask.
> > > > > +4. The match criteria may optionally also include specific packet byte
> > offset
> > > > > +   pattern, match length, mask instead of RFC defined fields.
> > > > > +   length, and matching pattern, which may not be defined in the
> > > > > +standard
> > > > RFC.
> > > >
> > > > Is there a description error here?
> > > >
> > > Didn't follow your comment. Do you mean there is an error in above
> > description?
> > 
> > I don't quite understand what "specific packet byte offset pattern" means :(
> > 
> Time to make it verbose. :)

Oh, I got it, I think we should let people see more details in the next version.:)

> For any new/undefined protocol, if user wants to say, 
> In a packet at byte offset A, if you find pattern == 0x800, drop the packet.
> In a packet at byte offset B, if you find pattern == 0x8100, forward to rq 10.
> 
> I didn't consider multiple matching patterns for now, though it is very useful.
> I am inclined to keep the option of _any_match to take up later, for now to do only well defined match?
> WDYT?

I think it's ok, but we don't seem to need the length here. But in any
case, I don't think it's that important to have or not ^^

> 
> 
> > >
> > > > > +5. Action includes (a) dropping or (b) forwarding the packet.
> > > > > +6. Destination is a receive virtqueue index.
> > > >
> > > > Since the concept of RSS context does not yet exist in the virtio spec.
> > > > Did we say that we also support carrying RSS context information
> > > > when negotiating the RFF feature? For example, RSS context
> > > > configuration commands and structures, etc.
> > > >
> > > > Or support RSS context functionality as a separate feature in another
> > thread?
> > > >
> > > Support RSS context as separate feature.
> > 
> > Ok, humbly asking if your work plan includes this part, do you need me to share
> > your work, such as rss context.
> >
> Lets keep rss context in future work as its orthogonal to it.
> Yes, your help for rss context will be good.
> Lets first finish RFF as its bit in the advance stage.

Yes! But I worry that a spec that references a concept that doesn't
exist in the existing spec may be blocked, so if you have no objections,
I will push this work forward in the near future to help RFF possible
blocking.

Thanks.

>  
> > Thanks a lot!
> > 
> > >
> > > > A related point to consider is that when a user inserts a rule with
> > > > an rss context, the RSS context cannot be deleted, otherwise the
> > > > device will cause undefined behavior.
> > > >
> > > Yes, for now we can keep rss context as separate feature.

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

