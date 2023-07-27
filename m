Return-Path: <virtio-comment-return-6903-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A701EC00528
	for <virtio-comment@archiver.kernel.org>; Thu, 27 Jul 2023 08:41:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CC881CB129
	for <virtio-comment@archiver.kernel.org>; Thu, 27 Jul 2023 08:41:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A032C9866D5
	for <virtio-comment@archiver.kernel.org>; Thu, 27 Jul 2023 08:41:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 839829866C5; Thu, 27 Jul 2023 08:41:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6FFFE9866C6
	for <virtio-comment@lists.oasis-open.org>; Thu, 27 Jul 2023 08:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R331e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VoJuX-5_1690447296;
Message-ID: <1690446628.8877509-2-xuanzhuo@linux.alibaba.com>
Date: Thu, 27 Jul 2023 16:30:28 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Parav Pandit <parav@nvidia.com>,
 Washizu Yui <yui.washidu@gmail.com>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <b95673d9-21e5-0fea-abdf-c0f8389e5cee@intel.com>
 <1688111214.8488657-2-xuanzhuo@linux.alibaba.com>
 <ac6bb15c-bb44-b1de-aef6-9974350962da@intel.com>
 <1688111784.0426908-3-xuanzhuo@linux.alibaba.com>
 <7ab5978d-c503-c279-a42e-bcdbf40184d4@intel.com>
 <1688116457.7400494-4-xuanzhuo@linux.alibaba.com>
 <259c7b04-58df-8085-755f-a36993556a89@intel.com>
 <PH0PR12MB5481243B22A694E42C351C20DC2AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2e176f24-293b-5be0-2928-e8ce0300e75a@intel.com>
 <1690425015.0990853-1-xuanzhuo@linux.alibaba.com>
 <52fa9d57-c21a-0235-b8bb-614e88e25f17@intel.com>
 <1690438140.7109714-2-xuanzhuo@linux.alibaba.com>
 <3f3b3a17-8199-8830-af22-94686feac956@intel.com>
 <1690438807.4627175-3-xuanzhuo@linux.alibaba.com>
 <CACGkMEs=zL-R8-0yvKz3ZgZ8MWiX_ErTQYCAu8G49D75GKhpAw@mail.gmail.com>
 <1690445274.7622454-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEvT=smzoQh29cfJwuL7kgs=ME+9PckwSMZ4Y7jjBNv7mQ@mail.gmail.com>
In-Reply-To: <CACGkMEvT=smzoQh29cfJwuL7kgs=ME+9PckwSMZ4Y7jjBNv7mQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] About the plan of Admin Queue

On Thu, 27 Jul 2023 16:28:07 +0800, Jason Wang <jasowang@redhat.com> wrote:
> On Thu, Jul 27, 2023 at 4:20=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba=
.com> wrote:
> >
> > On Thu, 27 Jul 2023 16:03:56 +0800, Jason Wang <jasowang@redhat.com> wr=
ote:
> > > On Thu, Jul 27, 2023 at 2:23=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.ali=
baba.com> wrote:
> > > >
> > > > On Thu, 27 Jul 2023 14:17:53 +0800, "Zhu, Lingshan" <lingshan.zhu@i=
ntel.com> wrote:
> > > > >
> > > > >
> > > > > On 7/27/2023 2:09 PM, Xuan Zhuo wrote:
> > > > > > On Thu, 27 Jul 2023 11:56:32 +0800, "Zhu, Lingshan" <lingshan.z=
hu@intel.com> wrote:
> > > > > >>
> > > > > >> On 7/27/2023 10:30 AM, Xuan Zhuo wrote:
> > > > > >>> On Mon, 3 Jul 2023 12:29:32 +0800, "Zhu, Lingshan" <lingshan.=
zhu@intel.com> wrote:
> > > > > >>>> On 6/30/2023 7:35 PM, Parav Pandit wrote:
> > > > > >>>>>> From: virtio-comment@lists.oasis-open.org <virtio-comment@=
lists.oasis-
> > > > > >>>>>> open.org> On Behalf Of Zhu, Lingshan
> > > > > >>>>>> Sent: Friday, June 30, 2023 6:33 AM
> > > > > >>>>>>
> > > > > >>>>>>>>> Can we let the DPU notify the driver to create a new de=
vicer from the
> > > > > >>>>>> backend?
> > > > > >>>>> Yes, why not.
> > > > > >>>>>
> > > > > >>>>>>>>> The key point is who want to create a new device.
> > > > > >>>>>>>> DPU can come with a certain number of pre-created ADIs, =
just make
> > > > > >>>>>>>> sure the orchestration SW is aware of their device IDs.
> > > > > >>>>>>>>
> > > > > >>>>> Cloud often need these devices to be created dynamically, m=
any a time after the host OS is booted.
> > > > > >>>>> To be more generic, those devices to be created and connect=
ed to the host regardless of the life cycle of the host.
> > > > > >>>>> Xuan partly explained it.
> > > > > >>>>>
> > > > > >>>>>>>> If you want the DPU randomly create ADIs and notify the =
driver, I
> > > > > >>>>>>>> think we need interrupt, e.g., re-use config interrupt. =
But why DPU
> > > > > >>>>>>>> wants to create and hot plug in a device to a guest?
> > > > > >>>>>>>> Shall the host handle that or DPU pre-create then expose=
 to baremteal
> > > > > >>>>>>>> machines?
> > > > > >>>>>>> In your scenario, the supervisor is on the os, which cont=
rols the DPU
> > > > > >>>>>>> to create new devices.
> > > > > >>>>>>>
> > > > > >>>>>>> In the cloud scenario, the vendor manager is in the DPU, =
and the
> > > > > >>>>>>> entire host is for users. Of course, there are situations=
 where the
> > > > > >>>>>>> vendor manager are in the HOST. But for bare metal machin=
es, the host
> > > > > >>>>>>> belongs to the customer, the vendor manager is only in th=
e DPU.
> > > > > >>>>>>>
> > > > > >>>>>>> So when the customers buy a new nic for the host, the ven=
dor manager
> > > > > >>>>>>> will plug a device to the host from the DPU.
> > > > > >>>>>> I understand once a customer orders a new NIC, you wants t=
o present the NIC
> > > > > >>>>>> to the host.
> > > > > >>>>>> However you only owns the DPU and the customer owns the ho=
st, that means
> > > > > >>>>>> this creation and hot plug must be transparent to the host=
 and there may not be
> > > > > >>>>>> a host driver help handling an interrupt/probe.
> > > > > >>>>>>
> > > > > >>>>> That is ok. when driver is loaded, it would query about its=
 child devices and probe it, if we strictly want to follow SIOV model.
> > > > > >>>>>
> > > > > >>>>>> However this is not PCI which has a tree/switch and can en=
umerate devices to
> > > > > >>>>>> the host by spanning the device across the PCI hierarchy.
> > > > > >>>>>>
> > > > > >>>>> Those enumeration is triggered by the parent PCI device and=
 pci bridge and switch will also discover it.
> > > > > >>>>>
> > > > > >>>>>> To address an ADI, there is only a device_id.
> > > > > >>>>>>
> > > > > >>>>> SIOV device must have a unique identifier at PCI bus level =
for sure.
> > > > > >>>>> I cannot speak more about it in this forum due to other log=
istics issue.
> > > > > >>>>> But assume that there is PCI level unique identifier for SI=
OV device that switches on the path will learn about.
> > > > > >>>>>
> > > > > >>>>>> So, do you mind share how your DPU offload the device mode=
l? What kind of
> > > > > >>>>>> device your DPU provide to the host? Lets see whether DPU =
can mediate this by
> > > > > >>>>>> its own?
> > > > > >>>>>>
> > > > > >>>>> It is a virtio nic, blk and other virtio devices for us.
> > > > > >>>>> A DPU hotplugs a device, host side either gets interrupt or=
 later gets to know about it when explicitly queries.
> > > > > >>>>> There is no mediation per say here, it is just a dpu based =
SIOV device like a regular PF.
> > > > > >>>>>
> > > > > >>>>> For non virtio DPU device, I implemented them in Linux for =
dpus 2 years ago.
> > > > > >>>>> You might find a Linux reference model useful at [1].
> > > > > >>>>> A usage model already exists in one OS and in use for non v=
irtio devices.
> > > > > >>>>> This certainly works without SIOV unique PCI device identif=
iers, because DPU (non-host) managed SIOV device spec still does not exist.
> > > > > >>>>>
> > > > > >>>>> For virtio, I think we should wait for this piece to be def=
ined and leverage that, instead of virtio tc creating its own.
> > > > > >>>>>
> > > > > >>>>> [1] https://github.com/Mellanox/scalablefunctions/wiki
> > > > > >>>> well I see SF facing the similar challenge, I can add a comm=
and for the
> > > > > >>>> driver to query all existing SIOV ADIs of a device,
> > > > > >>>> and the device return ADIs id and status. Looks good? and wo=
rk for you
> > > > > >>>> @Xuan?
> > > > > >>> Could I have your plan for this?
> > > > > >>>
> > > > > >>> If you do not mind, I'd like to add a command to query VF's i=
nfo. Such
> > > > > >>> as mac, ip, etc.
> > > > > >> I think the query commands for SIOV is a little more complex, =
e.g.,
> > > > > >> need to report device type and its scale(e.g., features, mq).
> > > > > >> There can be thousands of SIOV ADIs and we don't want output f=
lood.
> > > > > >>
> > > > > >> We have discussed implementation a config interrupt to report =
new
> > > > > >> created / deleted
> > > > > >> ADIs on the DPU side, therefore there must be a cap contains r=
elated
> > > > > >> information,
> > > > > >> my rough approach of the process is:
> > > > > >> 1) a cap contains the total number of existing ADIs and the ma=
x dev id
> > > > > >> 2) driver queries detailed information of a certain ADI or a b=
unch of
> > > > > >> ADIs in a [dev_id....dev_id2] range.
> > > > > > Yes, Admin Queue can obtain the info of the specific one or mor=
e devices.
> > > > > >
> > > > > >> I am not sure whether a NIC stores its IP
> > > > > >
> > > > > > IP is the other topic. I want the Admin Queue manage the switch.
> > > > > > So the switch know about the IP of every device, and the
> > > > > > Admin Queue will has the ability to config the IP of the device=
 inside the
> > > > > > switch.
> > > > > DPU onboard switch? OVS? Does it beyond virtio spec?
> > > >
> > > > YES.
> > >
> > > Adding Washizu.
> > >
> > > We can have a switch/dpa defined in the networking device for sure.
> >
> > Yes, I think we should introduce that for the sr-iov. Or for other.
>
> This should be a general one as a switch should be transport independent.

I agree.


>
> >
> > I would like to know who is doing this?
>
> Washizu, could you confirm if you want to do this or not?
>
> >
> > Another question, @Jason are you referring to a new device type or a
> > new virtio-net feature.
>
> Extending virtio-net should be fine, did you see any issues for this?

You kwnow the packet will be steered to different virtio-net devices.
So I think this is odd if the feature is the extending of virtio-net.

How do you think about this?


>
> >
> > >
> > > >
> > > > For SIOV, I think this is MUST.
> > >
> > > A learning bridge would be fine as a starter. It's better not to
> > > couple new scalable capability with any device specific features.
> > >
> > > > Maybe you have one simple implementation.
> > > > But you have to solve the IP steering. So admin queue should has th=
e ability
> > > > to config the IP steering.
> > >
> > > I think not. Those L2/LN tables/filters are networking specific.
> >
> > Let us assume that there is a switch/bridge firstly.
> > The VFs may be passed to different VMs.
> >
> > I also think this is the networking specific. But I want to config
> > the ip for every vf from the pf.
>
> What do you mean by ip here (e.g who is the user for this ip?)

1. the admin queue config the ip for the vf to the switch
2. the vf get the ip by dhcp from the switch. (or other way)

Here we config an ip for the vf, and we also limit that
just this vf can use the ip for security. Other vf can not use the ip confi=
gured
by self.


>
> > Because the user of the vf may be unreliable.
> > We need a manager to config the ip for every vf.
>
> Did you mean you're using a tunnel or not?

No.

Multiple VMs on a host may be used by different users. Some users are not
trustworthy. We want to prevent a user from maliciously using ip

>
> >
> >
> > > Control virtqueue is better than admin virtqueue here.
> >
> > by cq?
> >
> > What case?
>
> We've already used control virtqueue for steering.
>


More details?

You config the steering rule to other virtio-net device by the cq of one
virtio-net?

Thanks.



> Thanks
>
> >
> > Thanks.
> >
> > >
> > > Thanks
> > >
> > > >
> > > > Thanks.
> > > >
> > > > > >
> > > > > >
> > > > > > Thanks.
> > > > > >
> > > > > >
> > > > > >> Thanks
> > > > > >>> Thanks.
> > > > > >>>
> > > > > >>>
> > > > > >>>
> > > > > >>>> Thanks
> > > > > >>>>
> > > > > >>> This publicly archived list offers a means to provide input t=
o the
> > > > > >>> OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > >>>
> > > > > >>> In order to verify user consent to the Feedback License terms=
 and
> > > > > >>> to minimize spam in the list archive, subscription is required
> > > > > >>> before posting.
> > > > > >>>
> > > > > >>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > >>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > >>> List help: virtio-comment-help@lists.oasis-open.org
> > > > > >>> List archive: https://lists.oasis-open.org/archives/virtio-co=
mment/
> > > > > >>> Feedback License: https://www.oasis-open.org/who/ipr/feedback=
_license.pdf
> > > > > >>> List Guidelines: https://www.oasis-open.org/policies-guidelin=
es/mailing-lists
> > > > > >>> Committee: https://www.oasis-open.org/committees/virtio/
> > > > > >>> Join OASIS: https://www.oasis-open.org/join/
> > > > > >>>
> > > > >
> > > > >
> > > > > This publicly archived list offers a means to provide input to the
> > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > >
> > > > > In order to verify user consent to the Feedback License terms and
> > > > > to minimize spam in the list archive, subscription is required
> > > > > before posting.
> > > > >
> > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > List archive: https://lists.oasis-open.org/archives/virtio-commen=
t/
> > > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_lic=
ense.pdf
> > > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/m=
ailing-lists
> > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > >
> > > >
> > > > This publicly archived list offers a means to provide input to the
> > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > >
> > > > In order to verify user consent to the Feedback License terms and
> > > > to minimize spam in the list archive, subscription is required
> > > > before posting.
> > > >
> > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_licen=
se.pdf
> > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mai=
ling-lists
> > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > Join OASIS: https://www.oasis-open.org/join/
> > > >
> > >
> >
>

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

