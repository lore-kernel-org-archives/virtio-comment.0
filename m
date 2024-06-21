Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8852EEC4
	for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 03:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718940513; cv=none; b=sSAMU+WiW+sudDjkXhR04GccPbbw+NlA2VAvH61v90LJiiJVszLY1b9CYKUew1ARw9PZaI7zLDqhOl84g4ZpYHA3okqmu5diVX6j4gSL45/ML7HqUn2BwyH9BUnS9+hIdbCVrHENvLJY3drTKalHHeQqmBO7L5DUnHMWaCOskys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718940513; c=relaxed/simple;
	bh=2EuMQCm8Ovl+VXI1mxOtPH97esH7LHH+BsW9svhAh2g=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To:
	 Content-Type; b=Y8CRlVHvrGZwnWkxnRvfkaRAEpPWDzreJ2jQlzVN+yLipaKKzp5iSNKfkr01mlPJNHlWrWa7qbWrumTiNfMItmursPM+KA44lWPOAvip91IyArI7P9jiQ5xtuH3O00iX2EaLqplp+o25LGXnwjEXTiIn0nxj9VZeQj1qIYV9Sas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ULv/8L2I; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ULv/8L2I"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718940507; h=Message-ID:Subject:Date:From:To:Content-Type;
	bh=/2tR5J20D4TdpRmBHrsD8uRhefEBBcQgXeZjTpPMg5w=;
	b=ULv/8L2IcmvvQ2mUHEQIPZaL3C0OD7ZH2L4ZaqqpcfZPG2EieZI6BYDM61DIfYREzZeqE/gWlRsG8F5UVDRiE4VOP0c3ZvZwYEm7gqbJT2rQPPC5QIPu3vK8psynx0ZBPOeVSP6ac2yrkw/wWWJHzTVNH3GJENshKdi3IxG1A84=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067112;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0W8upjM4_1718940506;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W8upjM4_1718940506)
          by smtp.aliyun-inc.com;
          Fri, 21 Jun 2024 11:28:26 +0800
Message-ID: <1718940245.6932242-13-hengqi@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Date: Fri, 21 Jun 2024 11:24:05 +0800
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
In-Reply-To: <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Thu, 20 Jun 2024 18:21:03 -0700, "Si-Wei Liu" <si-wei.liu@oracle.com> wr=
ote:
>=20
>=20
> On 6/20/2024 12:40 AM, Heng Qi wrote:
> > On Mon, 17 Jun 2024 16:31:25 -0700, "Si-Wei Liu" <si-wei.liu@oracle.com=
> wrote:
> >>
> >> On 6/16/2024 7:27 PM, Heng Qi wrote:
> >>> On Thu, 13 Jun 2024 02:13:50 -0400, "Michael S. Tsirkin" <mst@redhat.=
com> wrote:
> >>>> On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
> >>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>> Sent: Tuesday, June 11, 2024 10:00 PM
> >>>>>> How we can we make progress with
> >>>>>> the realease but sure we don't make backwards compat a pain?
> >>>>>>
> >>>>>> Ideas?
> >>>>>>
> >>>>> There is no functional break with this relaxation.
> >>>>> Device set some non-zero defaults and driver didn't modify them....
> >>>>> Anything broken? Unlikely.
> >> Generally it's inappropriate to leave this decision making to the devi=
ce
> >> for what would be the best / most performant default config, as the
> >> device is generally considered agnostic to the guest load...
> > Instead, the performance of the virtual machine and the driver depends =
heavily
> > on how the device is implemented, just as we have proposed various ways=
 to
> > offload the data queue in the device to the hardware. The reason why mo=
st
> > devices use software to simulate ctrlq instead of using hardware offloa=
d is
> > that the driver has no requirements for the performance of ctrlq before=
, that is,
> > the device implementation is responsible for and meets the driver's per=
formance
> > requirements.
> I am not sure I follow the arguments of ctrlq being s/w or h/w, I=20
> thought that it was for the debate why we need coalescing=C2=A0on hardwar=
e=20
> offload device in the first place, instead of reusing event index or=20
> similar s/w based notification suppression. I don't doubt the value of=20
> coalescing, but how's it relevant to the default value disposition?=C2=A0=20
> Generally the default config disposition is not considered to be part of=20
> device implementation, especially when it comes to the situation where=20
> device can't easily figure out the specific workload to occur in the=20
> guest, and there's no perfect single default value that could meet every=20
> single performance metric across the board. This is a typical tuning=20
> knob left up to the user to adjust, why the device or driver needs to=20
> set or load the initial value? The driver just needs to start with=20
> certain value, be it 0 or non-zero, which guest user can override at any=20
> point of time, depending on his/her need, and that's it! I guess I still=20
> don't understand your user case here, why device / driver default is of=20
> such importance.

I've explained that, and I understand your argument is why default value is=
 needed,
and users should be able to adjust them, right?

The default value is working when the user doesn't adjust them.
It's not practical to rely entirely on user adjustment, and for devices
that serve hundreds of thousands of customers, the device implementation
has to be comprehensive.

Thanks.

>=20
> >> Unless the
> >> device is specially hard wired to some fixed guest setup that users
> >> couldn't change, it doesn't seem logical that the device could derive
> >> the best or most performant config on driver's behalf. What if the gue=
st
> >> wants best latency for its load but the device just blindlessly guess
> >> the guest might prefer throughput friendly that it miserably uses
> >> latency impacting non-zero default?
> > The device does not want to guess and cannot guess. This patch does not=
 force
> > the device to choose a non-zero value, but relaxes it to allow the devi=
ce to
> > choose 0 or non-zero, which is very friendly to virtual machines with d=
ifferent
> > performance requirements, right?
> I don't understand the friendly part - do you imply your VM users are on=20
> kinda fixed wired setup that they cannot change these coalescing=20
> parameters after driver is loaded? Can the owner of the VM in control=20
> apply certain initial config for the coalescing parameters to the VM=20
> image? Or is it the problem of the guest driver that doesn't yet expose=20
> coalescing parameters to the end user? Otherwise I would think that=20
> guest user should be able to set parameters accordingly that would best=20
> fit the specific performance requirement of their own. How the device=20
> could even help here? I don't feel there's a lot of value to grant the=20
> device or host admin the flexibility to policy the *best* config on=20
> guest user's behalf, to be honest. And you seem to admit the fact that=20
> the default doesn't really matter, be it 0 or non-zero.
>=20
> >
> >> Could this device side change for
> >> the default config regress boot time performance (which may need best
> >> latency over throughput)?
> > Don't make these assumptions, what if the driver needs better throughpu=
t?
> There's a misconception here: what we think that driver may need in=20
> terms on performance does actually reflect what guest user would like to=20
> have. Driver cannot read guest user's mind to make the decision, either.
>=20
> In history there was drastic change in the Linux virtio-net driver that=20
> ever changed the default disposition for=C2=A0XPS (and RPS as well) from=20
> throughput and long-lived connection oriented to concurrency and=20
> short-lived oriented, which regressed a lot of existing setups that=20
> expects sustained throughput and packet rate after kernel upgrade.=20
> Although the occurrence of such drastic change for default disposition=20
> is not so welcome (that is one of the reasons why I valued consistent=20
> initial value and back compatible=C2=A0 behavior), I don't see people yel=
ling=20
> at virtio spec for less flexibility of offering the default disposition,=20
> given that the guest user can override the config any time with their=20
> own tooling or script, there's no problem at all for them to just set=20
> the corresponding config back explicitly to what it was before.
>=20
> >
> >>>>> And device/driver has better performance, is that a problem? Unlike=
ly.
> >>>>>
> >> Even for rare case with a hard wired setup, the way to tackle the very
> >> problem using device's default is still quite questionable. Usually the
> >> mgmt software or network config utility should be equipped with some
> >> default value if need be. And we know the guest has the best position =
to
> >> impose the best / most performant config for its own load. What is the
> >> issue or use case that this initial config couldn't be applied by the
> >> guest mgmt software ahead but has to resort to the device to load some
> >> default (which is odd and irrelevant to any guest load), before the
> >> interface is brought up for operation i.e. performing I/O?
> > Use cases are everywhere, Alibaba Cloud, MLX and all other modern netwo=
rk cards
> > have a default value that is not 0.
> You seems to be referencing your own setup basically, and the question=20
> is still left answered - why the initial config can't be done through=20
> the mgmt software or network config utility within the guest?
>=20
> > (0 is actually a kind of default value)
> >
> >>> Sorry, my vacation just ended.
> >>>
> >>>> Yes, it is possible. Driver can cache values it sets
> >>>> and never query device with get.
> >>> Don't we already have a lot of behaviors to drive queries from device=
s?
> >>> RSS context, device stats.
> >>>
> >>>> Before anything is set, driver will report incorrect values.
> >>> Devices that are widely supported and supported by good practices sho=
uld have
> >>> any initialization value. Just reporting 0 is incorrect value. Althou=
gh the
> >>> spec now says so.
> >> I don't have an aligned view here, sorry. As I recall having 0 as the
> >> default is just to keep device started in a state where coalescing is
> >> disabled, so it's backward compatible and consistent with a
> >> non-coalescing supporting driver - such that it won't yield surprising
> >> effect (for e.g. regressed latency) inadvertently after user's getting
> >> driver software upgraded. Unlike the other virtio-net features that
> >> could 100% improve performance in all aspect, this coalescing feature =
is
> >> more of a performance tuning knob that may improve performance metrics
> >> (such as cpu usage or throughput) of one dimension while demoting the
> >> others (such as latency, jitter or connection rate) from the equation.
> >> That said, there's not a single and fixed set of default config that
> >> device could supply which is able to satisfy all kind of guest load.
> >> Rather than rely on the device to offer a matching default for driver
> >> (which I think it's technically wrong), I'd lean to having guest
> >> software or network utility to apply the initial config for the guest,
> >> where they should have best knowledge for the specific guest workload
> >> than what device could do.
> > Before this feature, a good device implementation should also support c=
oalescing
> > (of course we don't necessarily assume it has coalescing).
> Again, I don't doubt the value of supporting coalescing.
>=20
> >   In addition, virtual
> > machines that tend to favor latency and throughput exist. If the device=
 supported
> > by the manufacturer needs to provide a low-latency virtual machine, ple=
ase
> > continue to keep the default value of 0.
> No, that's not what I was asking. There's no such requirement for any=20
> vendor to provide a low-latency or high throughput VM. The more general=20
> use case is - the setup for real world workload might just be too=20
> complex that end users would prefer low-latency on some virtual NIC or=20
> even some specific queues, while the other queues of a virtual NIC, or=20
> reset virtual NIC might have very different dispositions. Due to the=20
> needs and dynamics of workload scaling up & down, they might have more=20
> or less queues or virtual NICs to configure, so these disposition would=20
> need to be readjusted at any point of time, for which there's no easy=20
> way for device to adapt to easily. The guest user should have best=20
> knowledge for the specific guest workload and setup than what device=20
> could/should offer.
>=20
> >
> >>>> What will break as a result? Hard to predict.
> >>>>
> >>>>
> >>>> Given the patch is big, I am inclined to say it just should use
> >>>> a feature bit.
> >>> This doesn't seem to break anything in my opinion, we just told the d=
evice that
> >>> now you can set more values.
> >> Another thing this could break is live migration between devices with
> >> varied default. How do you make sure the guest doesn't rely on some
> >> default from the source device, while on the destination it just doesn=
't
> >> get the same default coalescingjjj value? To get rid of this side effe=
ct
> >> the guest would still need to apply the initial config for its own,
> >> anyway... Which eventually would render this proposal with arbitrary
> >> default rather pointless.
> > I don't quite understand why this would affect hot migration, the values
> > would be migrated over.
> Then I don't see this has been discussed (wouldn't the initial value be=20
> part of virtio device state to migrate over?) in the thread or described=20
> in the proposed text. And your proposed per-queue coalescing parameters=20
> (default plus current value) would have to be described too as part of=20
> virtio-net device state, so that people don't misunderstand your proposal.
>=20
> Thanks,
> -Siwei
>=20
> > Thanks.
> >
> >>
> >> Thanks,
> >> -Siwei
> >>> Using new feature bits does not seem necessary.
> >>>
> >>> Thanks.
> >>>
> >>>> --=20
> >>>> MST
> >>>>
>=20
