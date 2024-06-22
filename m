Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A42B63A5
	for <virtio-comment@lists.linux.dev>; Sat, 22 Jun 2024 01:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719021001; cv=none; b=OFhVbg757QRBloVZ6rCnS3aKt/SJ31hgS+e9xQTC1SlroDh4gUSBsGdEfKP5DkQ4erZm0nHKzInDFGTl4tsRuBN3zAfvKDOBqYoIU5airEJV99XP1ULrrz/pJ8kxkaIcLWvff9C3m8/GcSa3HTJoND8mhA5nLr5zjzjJR4pGR98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719021001; c=relaxed/simple;
	bh=HwZHxsJxdItJ0qpDEphLJiq4Va35G6Ya69xd2a9VdiQ=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To:
	 Content-Type; b=OvT90lgWPm9LcicZ5qyq02FHTvSmAJ2Lcrf/4mh/EHI0RWCNJiSQyWA/hVG8ihRuTWbrjLHpgWGkX+hCWJNani+fTpBLOMypvv0mrYkk3QjSK4wmYZ3PXREUMznckj49L+KwWaiOmi0W6OanBvAKM4XvGyR87gjwNNVWIp6McFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=oJd0pJpu; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="oJd0pJpu"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1719020996; h=Message-ID:Subject:Date:From:To:Content-Type;
	bh=jjaOsa//IG/dxN3r23lKwWZeZFnvGfN9I4jwfqzGl3k=;
	b=oJd0pJpuFXg2uEmSVjBg3IIW6WH614EX80dtTTOIuklH94uJ6Mr1wjijOZtdnwflviejn2cFSOAXNMBn2sGvmQ00UdATlqPgzCPeDu3wqHrjYzoVRdtjT9iOwi060Oyg+9L0QNrieqAU3vnVCcZtuAAoclrgUoDRODJAf9pQl0Y=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067109;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0W8xepRc_1719020677;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W8xepRc_1719020677)
          by smtp.aliyun-inc.com;
          Sat, 22 Jun 2024 09:44:38 +0800
Message-ID: <1719020069.8729858-17-hengqi@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Date: Sat, 22 Jun 2024 09:34:29 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: "Si-Wei Liu" <si-wei.liu@oracle.com>
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Parav Pandit <parav@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
 <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com>
 <1718026545.7557275-2-hengqi@linux.alibaba.com>
 <20240610221900.1810ea96.pasic@linux.ibm.com>
 <1718102433.0456574-3-hengqi@linux.alibaba.com>
 <20240611122756-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813E2EE4EA2BA729B2F6B7DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240613021132-mutt-send-email-mst@kernel.org>
 <1718591277.4770932-5-hengqi@linux.alibaba.com>
 <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
 <1718869209.8824844-6-hengqi@linux.alibaba.com>
 <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
In-Reply-To: <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Fri, 21 Jun 2024 16:46:27 -0700, "Si-Wei Liu" <si-wei.liu@oracle.com> wr=
ote:
>=20
>=20
> On 6/20/2024 8:24 PM, Heng Qi wrote:
> > On Thu, 20 Jun 2024 18:21:03 -0700, "Si-Wei Liu" <si-wei.liu@oracle.com=
> wrote:
> >>
> >> On 6/20/2024 12:40 AM, Heng Qi wrote:
> >>> On Mon, 17 Jun 2024 16:31:25 -0700, "Si-Wei Liu" <si-wei.liu@oracle.c=
om> wrote:
> >>>> On 6/16/2024 7:27 PM, Heng Qi wrote:
> >>>>> On Thu, 13 Jun 2024 02:13:50 -0400, "Michael S. Tsirkin" <mst@redha=
t.com> wrote:
> >>>>>> On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
> >>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>> Sent: Tuesday, June 11, 2024 10:00 PM
> >>>>>>>> How we can we make progress with
> >>>>>>>> the realease but sure we don't make backwards compat a pain?
> >>>>>>>>
> >>>>>>>> Ideas?
> >>>>>>>>
> >>>>>>> There is no functional break with this relaxation.
> >>>>>>> Device set some non-zero defaults and driver didn't modify them..=
..
> >>>>>>> Anything broken? Unlikely.
> >>>> Generally it's inappropriate to leave this decision making to the de=
vice
> >>>> for what would be the best / most performant default config, as the
> >>>> device is generally considered agnostic to the guest load...
> >>> Instead, the performance of the virtual machine and the driver depend=
s heavily
> >>> on how the device is implemented, just as we have proposed various wa=
ys to
> >>> offload the data queue in the device to the hardware. The reason why =
most
> >>> devices use software to simulate ctrlq instead of using hardware offl=
oad is
> >>> that the driver has no requirements for the performance of ctrlq befo=
re, that is,
> >>> the device implementation is responsible for and meets the driver's p=
erformance
> >>> requirements.
> >> I am not sure I follow the arguments of ctrlq being s/w or h/w, I
> >> thought that it was for the debate why we need coalescing=C2=A0on hard=
ware
> >> offload device in the first place, instead of reusing event index or
> >> similar s/w based notification suppression. I don't doubt the value of
> >> coalescing, but how's it relevant to the default value disposition?
> >> Generally the default config disposition is not considered to be part =
of
> >> device implementation, especially when it comes to the situation where
> >> device can't easily figure out the specific workload to occur in the
> >> guest, and there's no perfect single default value that could meet eve=
ry
> >> single performance metric across the board. This is a typical tuning
> >> knob left up to the user to adjust, why the device or driver needs to
> >> set or load the initial value? The driver just needs to start with
> >> certain value, be it 0 or non-zero, which guest user can override at a=
ny
> >> point of time, depending on his/her need, and that's it! I guess I sti=
ll
> >> don't understand your user case here, why device / driver default is of
> >> such importance.
> > I've explained that, and I understand your argument is why default valu=
e is needed,
> > and users should be able to adjust them, right?
> Sounds about right. You'll soon realize that there's no perfect default=20
> that could work with everyone - in that it's just a static value to=20
> begin with, no matter whatever initial value the device comes up with,=20
> one user or another will come over to you and complain that what is=20
> loaded from the device doesn't match the workload they have, so those=20
> users are still expected to adjust manually tweaking for their own. As=20
> long as it's a tunable that guest user can control and override anytime,=20
> I don't feel it too much different what initial config the device would=20
> start with.

When you have a large number of customers and they buy your machines,
how many users do you think have experience adjusting this value? More belo=
w.

>=20
> > The default value is working when the user doesn't adjust them.
> > It's not practical to rely entirely on user adjustment,
> That's where the adaptive interrupt moderation framework (e.g. DIM for=20
> Linux) could come to the play, I think?

Last time, this work is only useful if DIM is not enabled. I don't want to
explain it again, I've said it many times to different people in the history
discussion, don't you want to check any history discussion?

>=20
> >   and for devices
> > that serve hundreds of thousands of customers, the device implementation
> > has to be comprehensive.
> Would you mind elaborating the technical difficulty for why the device=20
> implementation has to be comprehensive to serve hundreds or thousands of=20
> customers (i.e. adaptive moderation in the device), and is there better=20
> way to improve the current interface (ctrlq v.s. doorbell/MMIO register)=20
> that is hardware offload implementation wise. I feel people reading the=20
> thread without understanding the full background would become even more=20
> confused as to why it's relevant to your proposal, to me it's completely=20
> distinct use case or problem area that we are talking about.

Regardless of whether DIM can be enabled by default (it cannot accelerate a=
ll
scenarios, right?), therefore, a considerable number of machines on the
cloud vendors' line still have to rely on static values to provide boot-up
performance. The vendors will also make optimizations to optimize scenarios
like ping-pong, so the boot-up performance is very good.

Thanks.

>=20
> Thanks,
> -Siwei
>=20
> >
> > Thanks.
> >
> >>>> Unless the
> >>>> device is specially hard wired to some fixed guest setup that users
> >>>> couldn't change, it doesn't seem logical that the device could derive
> >>>> the best or most performant config on driver's behalf. What if the g=
uest
> >>>> wants best latency for its load but the device just blindlessly guess
> >>>> the guest might prefer throughput friendly that it miserably uses
> >>>> latency impacting non-zero default?
> >>> The device does not want to guess and cannot guess. This patch does n=
ot force
> >>> the device to choose a non-zero value, but relaxes it to allow the de=
vice to
> >>> choose 0 or non-zero, which is very friendly to virtual machines with=
 different
> >>> performance requirements, right?
> >> I don't understand the friendly part - do you imply your VM users are =
on
> >> kinda fixed wired setup that they cannot change these coalescing
> >> parameters after driver is loaded? Can the owner of the VM in control
> >> apply certain initial config for the coalescing parameters to the VM
> >> image? Or is it the problem of the guest driver that doesn't yet expose
> >> coalescing parameters to the end user? Otherwise I would think that
> >> guest user should be able to set parameters accordingly that would best
> >> fit the specific performance requirement of their own. How the device
> >> could even help here? I don't feel there's a lot of value to grant the
> >> device or host admin the flexibility to policy the *best* config on
> >> guest user's behalf, to be honest. And you seem to admit the fact that
> >> the default doesn't really matter, be it 0 or non-zero.
> >>
> >>>> Could this device side change for
> >>>> the default config regress boot time performance (which may need best
> >>>> latency over throughput)?
> >>> Don't make these assumptions, what if the driver needs better through=
put?
> >> There's a misconception here: what we think that driver may need in
> >> terms on performance does actually reflect what guest user would like =
to
> >> have. Driver cannot read guest user's mind to make the decision, eithe=
r.
> >>
> >> In history there was drastic change in the Linux virtio-net driver that
> >> ever changed the default disposition for=C2=A0XPS (and RPS as well) fr=
om
> >> throughput and long-lived connection oriented to concurrency and
> >> short-lived oriented, which regressed a lot of existing setups that
> >> expects sustained throughput and packet rate after kernel upgrade.
> >> Although the occurrence of such drastic change for default disposition
> >> is not so welcome (that is one of the reasons why I valued consistent
> >> initial value and back compatible=C2=A0 behavior), I don't see people =
yelling
> >> at virtio spec for less flexibility of offering the default dispositio=
n,
> >> given that the guest user can override the config any time with their
> >> own tooling or script, there's no problem at all for them to just set
> >> the corresponding config back explicitly to what it was before.
> >>
> >>>>>>> And device/driver has better performance, is that a problem? Unli=
kely.
> >>>>>>>
> >>>> Even for rare case with a hard wired setup, the way to tackle the ve=
ry
> >>>> problem using device's default is still quite questionable. Usually =
the
> >>>> mgmt software or network config utility should be equipped with some
> >>>> default value if need be. And we know the guest has the best positio=
n to
> >>>> impose the best / most performant config for its own load. What is t=
he
> >>>> issue or use case that this initial config couldn't be applied by the
> >>>> guest mgmt software ahead but has to resort to the device to load so=
me
> >>>> default (which is odd and irrelevant to any guest load), before the
> >>>> interface is brought up for operation i.e. performing I/O?
> >>> Use cases are everywhere, Alibaba Cloud, MLX and all other modern net=
work cards
> >>> have a default value that is not 0.
> >> You seems to be referencing your own setup basically, and the question
> >> is still left answered - why the initial config can't be done through
> >> the mgmt software or network config utility within the guest?
> >>
> >>> (0 is actually a kind of default value)
> >>>
> >>>>> Sorry, my vacation just ended.
> >>>>>
> >>>>>> Yes, it is possible. Driver can cache values it sets
> >>>>>> and never query device with get.
> >>>>> Don't we already have a lot of behaviors to drive queries from devi=
ces?
> >>>>> RSS context, device stats.
> >>>>>
> >>>>>> Before anything is set, driver will report incorrect values.
> >>>>> Devices that are widely supported and supported by good practices s=
hould have
> >>>>> any initialization value. Just reporting 0 is incorrect value. Alth=
ough the
> >>>>> spec now says so.
> >>>> I don't have an aligned view here, sorry. As I recall having 0 as the
> >>>> default is just to keep device started in a state where coalescing is
> >>>> disabled, so it's backward compatible and consistent with a
> >>>> non-coalescing supporting driver - such that it won't yield surprisi=
ng
> >>>> effect (for e.g. regressed latency) inadvertently after user's getti=
ng
> >>>> driver software upgraded. Unlike the other virtio-net features that
> >>>> could 100% improve performance in all aspect, this coalescing featur=
e is
> >>>> more of a performance tuning knob that may improve performance metri=
cs
> >>>> (such as cpu usage or throughput) of one dimension while demoting the
> >>>> others (such as latency, jitter or connection rate) from the equatio=
n.
> >>>> That said, there's not a single and fixed set of default config that
> >>>> device could supply which is able to satisfy all kind of guest load.
> >>>> Rather than rely on the device to offer a matching default for driver
> >>>> (which I think it's technically wrong), I'd lean to having guest
> >>>> software or network utility to apply the initial config for the gues=
t,
> >>>> where they should have best knowledge for the specific guest workload
> >>>> than what device could do.
> >>> Before this feature, a good device implementation should also support=
 coalescing
> >>> (of course we don't necessarily assume it has coalescing).
> >> Again, I don't doubt the value of supporting coalescing.
> >>
> >>>    In addition, virtual
> >>> machines that tend to favor latency and throughput exist. If the devi=
ce supported
> >>> by the manufacturer needs to provide a low-latency virtual machine, p=
lease
> >>> continue to keep the default value of 0.
> >> No, that's not what I was asking. There's no such requirement for any
> >> vendor to provide a low-latency or high throughput VM. The more general
> >> use case is - the setup for real world workload might just be too
> >> complex that end users would prefer low-latency on some virtual NIC or
> >> even some specific queues, while the other queues of a virtual NIC, or
> >> reset virtual NIC might have very different dispositions. Due to the
> >> needs and dynamics of workload scaling up & down, they might have more
> >> or less queues or virtual NICs to configure, so these disposition would
> >> need to be readjusted at any point of time, for which there's no easy
> >> way for device to adapt to easily. The guest user should have best
> >> knowledge for the specific guest workload and setup than what device
> >> could/should offer.
> >>
> >>>>>> What will break as a result? Hard to predict.
> >>>>>>
> >>>>>>
> >>>>>> Given the patch is big, I am inclined to say it just should use
> >>>>>> a feature bit.
> >>>>> This doesn't seem to break anything in my opinion, we just told the=
 device that
> >>>>> now you can set more values.
> >>>> Another thing this could break is live migration between devices with
> >>>> varied default. How do you make sure the guest doesn't rely on some
> >>>> default from the source device, while on the destination it just doe=
sn't
> >>>> get the same default coalescingjjj value? To get rid of this side ef=
fect
> >>>> the guest would still need to apply the initial config for its own,
> >>>> anyway... Which eventually would render this proposal with arbitrary
> >>>> default rather pointless.
> >>> I don't quite understand why this would affect hot migration, the val=
ues
> >>> would be migrated over.
> >> Then I don't see this has been discussed (wouldn't the initial value be
> >> part of virtio device state to migrate over?) in the thread or describ=
ed
> >> in the proposed text. And your proposed per-queue coalescing parameters
> >> (default plus current value) would have to be described too as part of
> >> virtio-net device state, so that people don't misunderstand your propo=
sal.
> >>
> >> Thanks,
> >> -Siwei
> >>
> >>> Thanks.
> >>>
> >>>> Thanks,
> >>>> -Siwei
> >>>>> Using new feature bits does not seem necessary.
> >>>>>
> >>>>> Thanks.
> >>>>>
> >>>>>> --=20
> >>>>>> MST
> >>>>>>
>=20
