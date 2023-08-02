Return-Path: <virtio-comment-return-6949-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3E6C001DF
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 06:53:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 77D5F61268
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 06:53:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6833F98663F
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 06:53:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5FA009865EC; Wed,  2 Aug 2023 06:53:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F91B9865F1
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Aug 2023 06:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5_b46iuEMfGzqYq9B8SFZA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690959219; x=1691564019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WOH5mvIn7f3nIkByu5EAEhAoAl5zNoXi/ltltE6vCI=;
        b=Kccc+rGqTqDnbKrBMT95EKMPjjvWxXxmvT+QxH/PBYdW0gPXseJtJkR9JXuhKswwSQ
         fQzwq2YpSeL+Q+zI5P2wG/BamvIJYo9g7j9VxqnAlYjeau9Uf3h8L1rM0LYTJo2NLZiz
         x0b+7pq583ulUCz8NBXczJk3sMAcvZSfb64lS+yFG+BhDH1K0MWHO6USj0cS6i1UxE1T
         f2o3+XuFHtd0s0IisBtrDp7/TbR3tOZ9vA3myVul7R1Ng44F0TQ+Mp4whwaC4iVEXvNW
         pDmL1M7EC/fFqT0BsN2X4VtVV7c7jHO0eXE+OA4LE8kWy34okBo+zU49JpGLHvTEPnZN
         D2bA==
X-Gm-Message-State: ABy/qLbRYCk2Qvm5phptTmj5hEMBf1CeEpvczSMgEBSJy/vKAPbdNgtn
	x4BN5HHFHbNGrWEpot0rcHoapcsfZK6jKD3jzNXJTNYWHC5NtdV1sM4Ym/sTdCvDcY0SJeF1xLF
	worToiFVzflmHgZdJfyw4IsjxfYMHlmX8tfPvSLymQvT3sl/WBA==
X-Received: by 2002:a2e:b001:0:b0:2b6:c2e4:a57a with SMTP id y1-20020a2eb001000000b002b6c2e4a57amr4603590ljk.38.1690959219568;
        Tue, 01 Aug 2023 23:53:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEwcHGEnwfEYOnClTokbxvMG1jDkVfUQhRcuXUwwowDjLvE+fPxC/n7K4o5W8UXSZg7dzoQeRXrRrbTDJGrYD8=
X-Received: by 2002:a2e:b001:0:b0:2b6:c2e4:a57a with SMTP id
 y1-20020a2eb001000000b002b6c2e4a57amr4603571ljk.38.1690959219172; Tue, 01 Aug
 2023 23:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com> <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <b95673d9-21e5-0fea-abdf-c0f8389e5cee@intel.com> <1688111214.8488657-2-xuanzhuo@linux.alibaba.com>
 <ac6bb15c-bb44-b1de-aef6-9974350962da@intel.com> <1688111784.0426908-3-xuanzhuo@linux.alibaba.com>
 <7ab5978d-c503-c279-a42e-bcdbf40184d4@intel.com> <1688116457.7400494-4-xuanzhuo@linux.alibaba.com>
 <259c7b04-58df-8085-755f-a36993556a89@intel.com> <PH0PR12MB5481243B22A694E42C351C20DC2AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2e176f24-293b-5be0-2928-e8ce0300e75a@intel.com> <1690425015.0990853-1-xuanzhuo@linux.alibaba.com>
 <52fa9d57-c21a-0235-b8bb-614e88e25f17@intel.com> <1690438140.7109714-2-xuanzhuo@linux.alibaba.com>
 <3f3b3a17-8199-8830-af22-94686feac956@intel.com> <1690438807.4627175-3-xuanzhuo@linux.alibaba.com>
 <CACGkMEs=zL-R8-0yvKz3ZgZ8MWiX_ErTQYCAu8G49D75GKhpAw@mail.gmail.com>
 <1690445274.7622454-1-xuanzhuo@linux.alibaba.com> <CACGkMEvT=smzoQh29cfJwuL7kgs=ME+9PckwSMZ4Y7jjBNv7mQ@mail.gmail.com>
 <aafe1885-0ec2-66ca-4511-f2606bc881ee@gmail.com> <CACGkMEv2MQyGPxwxyGJhYK0nga7fsPG8D916g+RFtsJvfOyxUg@mail.gmail.com>
 <1690958095.5061157-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1690958095.5061157-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 2 Aug 2023 14:53:28 +0800
Message-ID: <CACGkMEsxOwyytv7+Ox4nGTCRKgatUbx6w2rrJqh3f9bfkYEs=A@mail.gmail.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Parav Pandit <parav@nvidia.com>, Yui Washizu <yui.washidu@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] About the plan of Admin Queue

On Wed, Aug 2, 2023 at 2:37=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.co=
m> wrote:
>
> On Wed, 2 Aug 2023 14:15:55 +0800, Jason Wang <jasowang@redhat.com> wrote=
:
> > On Wed, Aug 2, 2023 at 2:01=E2=80=AFPM Yui Washizu <yui.washidu@gmail.c=
om> wrote:
> > >
> > >
> > > On 2023/07/27 17:28, Jason Wang wrote:
> > > > On Thu, Jul 27, 2023 at 4:20=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.a=
libaba.com> wrote:
> > > >> On Thu, 27 Jul 2023 16:03:56 +0800, Jason Wang <jasowang@redhat.co=
m> wrote:
> > > >>> On Thu, Jul 27, 2023 at 2:23=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux=
.alibaba.com> wrote:
> > > >>>> On Thu, 27 Jul 2023 14:17:53 +0800, "Zhu, Lingshan" <lingshan.zh=
u@intel.com> wrote:
> > > >>>>>
> > > >>>>> On 7/27/2023 2:09 PM, Xuan Zhuo wrote:
> > > >>>>>> On Thu, 27 Jul 2023 11:56:32 +0800, "Zhu, Lingshan" <lingshan.=
zhu@intel.com> wrote:
> > > >>>>>>> On 7/27/2023 10:30 AM, Xuan Zhuo wrote:
> > > >>>>>>>> On Mon, 3 Jul 2023 12:29:32 +0800, "Zhu, Lingshan" <lingshan=
.zhu@intel.com> wrote:
> > > >>>>>>>>> On 6/30/2023 7:35 PM, Parav Pandit wrote:
> > > >>>>>>>>>>> From: virtio-comment@lists.oasis-open.org <virtio-comment=
@lists.oasis-
> > > >>>>>>>>>>> open.org> On Behalf Of Zhu, Lingshan
> > > >>>>>>>>>>> Sent: Friday, June 30, 2023 6:33 AM
> > > >>>>>>>>>>>
> > > >>>>>>>>>>>>>> Can we let the DPU notify the driver to create a new d=
evicer from the
> > > >>>>>>>>>>> backend?
> > > >>>>>>>>>> Yes, why not.
> > > >>>>>>>>>>
> > > >>>>>>>>>>>>>> The key point is who want to create a new device.
> > > >>>>>>>>>>>>> DPU can come with a certain number of pre-created ADIs,=
 just make
> > > >>>>>>>>>>>>> sure the orchestration SW is aware of their device IDs.
> > > >>>>>>>>>>>>>
> > > >>>>>>>>>> Cloud often need these devices to be created dynamically, =
many a time after the host OS is booted.
> > > >>>>>>>>>> To be more generic, those devices to be created and connec=
ted to the host regardless of the life cycle of the host.
> > > >>>>>>>>>> Xuan partly explained it.
> > > >>>>>>>>>>
> > > >>>>>>>>>>>>> If you want the DPU randomly create ADIs and notify the=
 driver, I
> > > >>>>>>>>>>>>> think we need interrupt, e.g., re-use config interrupt.=
 But why DPU
> > > >>>>>>>>>>>>> wants to create and hot plug in a device to a guest?
> > > >>>>>>>>>>>>> Shall the host handle that or DPU pre-create then expos=
e to baremteal
> > > >>>>>>>>>>>>> machines?
> > > >>>>>>>>>>>> In your scenario, the supervisor is on the os, which con=
trols the DPU
> > > >>>>>>>>>>>> to create new devices.
> > > >>>>>>>>>>>>
> > > >>>>>>>>>>>> In the cloud scenario, the vendor manager is in the DPU,=
 and the
> > > >>>>>>>>>>>> entire host is for users. Of course, there are situation=
s where the
> > > >>>>>>>>>>>> vendor manager are in the HOST. But for bare metal machi=
nes, the host
> > > >>>>>>>>>>>> belongs to the customer, the vendor manager is only in t=
he DPU.
> > > >>>>>>>>>>>>
> > > >>>>>>>>>>>> So when the customers buy a new nic for the host, the ve=
ndor manager
> > > >>>>>>>>>>>> will plug a device to the host from the DPU.
> > > >>>>>>>>>>> I understand once a customer orders a new NIC, you wants =
to present the NIC
> > > >>>>>>>>>>> to the host.
> > > >>>>>>>>>>> However you only owns the DPU and the customer owns the h=
ost, that means
> > > >>>>>>>>>>> this creation and hot plug must be transparent to the hos=
t and there may not be
> > > >>>>>>>>>>> a host driver help handling an interrupt/probe.
> > > >>>>>>>>>>>
> > > >>>>>>>>>> That is ok. when driver is loaded, it would query about it=
s child devices and probe it, if we strictly want to follow SIOV model.
> > > >>>>>>>>>>
> > > >>>>>>>>>>> However this is not PCI which has a tree/switch and can e=
numerate devices to
> > > >>>>>>>>>>> the host by spanning the device across the PCI hierarchy.
> > > >>>>>>>>>>>
> > > >>>>>>>>>> Those enumeration is triggered by the parent PCI device an=
d pci bridge and switch will also discover it.
> > > >>>>>>>>>>
> > > >>>>>>>>>>> To address an ADI, there is only a device_id.
> > > >>>>>>>>>>>
> > > >>>>>>>>>> SIOV device must have a unique identifier at PCI bus level=
 for sure.
> > > >>>>>>>>>> I cannot speak more about it in this forum due to other lo=
gistics issue.
> > > >>>>>>>>>> But assume that there is PCI level unique identifier for S=
IOV device that switches on the path will learn about.
> > > >>>>>>>>>>
> > > >>>>>>>>>>> So, do you mind share how your DPU offload the device mod=
el? What kind of
> > > >>>>>>>>>>> device your DPU provide to the host? Lets see whether DPU=
 can mediate this by
> > > >>>>>>>>>>> its own?
> > > >>>>>>>>>>>
> > > >>>>>>>>>> It is a virtio nic, blk and other virtio devices for us.
> > > >>>>>>>>>> A DPU hotplugs a device, host side either gets interrupt o=
r later gets to know about it when explicitly queries.
> > > >>>>>>>>>> There is no mediation per say here, it is just a dpu based=
 SIOV device like a regular PF.
> > > >>>>>>>>>>
> > > >>>>>>>>>> For non virtio DPU device, I implemented them in Linux for=
 dpus 2 years ago.
> > > >>>>>>>>>> You might find a Linux reference model useful at [1].
> > > >>>>>>>>>> A usage model already exists in one OS and in use for non =
virtio devices.
> > > >>>>>>>>>> This certainly works without SIOV unique PCI device identi=
fiers, because DPU (non-host) managed SIOV device spec still does not exist=
.
> > > >>>>>>>>>>
> > > >>>>>>>>>> For virtio, I think we should wait for this piece to be de=
fined and leverage that, instead of virtio tc creating its own.
> > > >>>>>>>>>>
> > > >>>>>>>>>> [1] https://github.com/Mellanox/scalablefunctions/wiki
> > > >>>>>>>>> well I see SF facing the similar challenge, I can add a com=
mand for the
> > > >>>>>>>>> driver to query all existing SIOV ADIs of a device,
> > > >>>>>>>>> and the device return ADIs id and status. Looks good? and w=
ork for you
> > > >>>>>>>>> @Xuan?
> > > >>>>>>>> Could I have your plan for this?
> > > >>>>>>>>
> > > >>>>>>>> If you do not mind, I'd like to add a command to query VF's =
info. Such
> > > >>>>>>>> as mac, ip, etc.
> > > >>>>>>> I think the query commands for SIOV is a little more complex,=
 e.g.,
> > > >>>>>>> need to report device type and its scale(e.g., features, mq).
> > > >>>>>>> There can be thousands of SIOV ADIs and we don't want output =
flood.
> > > >>>>>>>
> > > >>>>>>> We have discussed implementation a config interrupt to report=
 new
> > > >>>>>>> created / deleted
> > > >>>>>>> ADIs on the DPU side, therefore there must be a cap contains =
related
> > > >>>>>>> information,
> > > >>>>>>> my rough approach of the process is:
> > > >>>>>>> 1) a cap contains the total number of existing ADIs and the m=
ax dev id
> > > >>>>>>> 2) driver queries detailed information of a certain ADI or a =
bunch of
> > > >>>>>>> ADIs in a [dev_id....dev_id2] range.
> > > >>>>>> Yes, Admin Queue can obtain the info of the specific one or mo=
re devices.
> > > >>>>>>
> > > >>>>>>> I am not sure whether a NIC stores its IP
> > > >>>>>> IP is the other topic. I want the Admin Queue manage the switc=
h.
> > > >>>>>> So the switch know about the IP of every device, and the
> > > >>>>>> Admin Queue will has the ability to config the IP of the devic=
e inside the
> > > >>>>>> switch.
> > > >>>>> DPU onboard switch? OVS? Does it beyond virtio spec?
> > > >>>> YES.
> > > >>> Adding Washizu.
> > > >>>
> > > >>> We can have a switch/dpa defined in the networking device for sur=
e.
> > > >> Yes, I think we should introduce that for the sr-iov. Or for other=
.
> > > > This should be a general one as a switch should be transport indepe=
ndent.
> > > >
> > > >> I would like to know who is doing this?
> > > > Washizu, could you confirm if you want to do this or not?
> > >
> > >
> > > Does this mean adding a switch definition to the virtio spec?
> > >
> > >
> > > If so, it will be necessary for the implementation of my plan,
> > >
> > > but it may take time (probably several months?) to get started,
> > >
> > > as I'm currently working on another task (virtio-net SR-IOV feature i=
n
> > > qemu).
> > >
> > > Anyone is welcome to work on adding the switch definition in the mean=
time,
> > >
> > > it's completely fine with me.
> > >
> > > I think I'll work on that if no one has finished the work.
> >
> > Ok, great, I think we need to start this by considering reusing one of
> > the existing DPA spec. (For example, ofdpa? or any other?)
>
> We have a need on this area. I want to start this work now.
>
> Could you give me the link of the spec?

I'm not sure this is the best one, we can hear from others. I mention
it since it has an emulation code that is done in Qemu (rocker
switch).

The spec is:

https://docs.broadcom.com/doc/12378911

(not sure this is the recent one though).

Thanks

>
> Thanks
>
>
>
> >
> > Thanks
> >
> > >
> > >
> > >
> > > >
> > > >> Another question, @Jason are you referring to a new device type or=
 a
> > > >> new virtio-net feature.
> > > > Extending virtio-net should be fine, did you see any issues for thi=
s?
> > > >
> > > >>>> For SIOV, I think this is MUST.
> > > >>> A learning bridge would be fine as a starter. It's better not to
> > > >>> couple new scalable capability with any device specific features.
> > > >>>
> > > >>>> Maybe you have one simple implementation.
> > > >>>> But you have to solve the IP steering. So admin queue should has=
 the ability
> > > >>>> to config the IP steering.
> > > >>> I think not. Those L2/LN tables/filters are networking specific.
> > > >> Let us assume that there is a switch/bridge firstly.
> > > >> The VFs may be passed to different VMs.
> > > >>
> > > >> I also think this is the networking specific. But I want to config
> > > >> the ip for every vf from the pf.
> > > > What do you mean by ip here (e.g who is the user for this ip?)
> > > >
> > > >> Because the user of the vf may be unreliable.
> > > >> We need a manager to config the ip for every vf.
> > > > Did you mean you're using a tunnel or not?
> > > >
> > > >>
> > > >>> Control virtqueue is better than admin virtqueue here.
> > > >> by cq?
> > > >>
> > > >> What case?
> > > > We've already used control virtqueue for steering.
> > > >
> > > > Thanks
> > > >
> > > >> Thanks.
> > > >>
> > > >>> Thanks
> > > >>>
> > > >>>> Thanks.
> > > >>>>
> > > >>>>>>
> > > >>>>>> Thanks.
> > > >>>>>>
> > > >>>>>>
> > > >>>>>>> Thanks
> > > >>>>>>>> Thanks.
> > > >>>>>>>>
> > > >>>>>>>>
> > > >>>>>>>>
> > > >>>>>>>>> Thanks
> > > >>>>>>>>>
> > > >>>>>>>> This publicly archived list offers a means to provide input =
to the
> > > >>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> > > >>>>>>>>
> > > >>>>>>>> In order to verify user consent to the Feedback License term=
s and
> > > >>>>>>>> to minimize spam in the list archive, subscription is requir=
ed
> > > >>>>>>>> before posting.
> > > >>>>>>>>
> > > >>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > >>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > >>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
> > > >>>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-c=
omment/
> > > >>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedbac=
k_license.pdf
> > > >>>>>>>> List Guidelines: https://www.oasis-open.org/policies-guideli=
nes/mailing-lists
> > > >>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
> > > >>>>>>>> Join OASIS: https://www.oasis-open.org/join/
> > > >>>>>>>>
> > > >>>>>
> > > >>>>> This publicly archived list offers a means to provide input to =
the
> > > >>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> > > >>>>>
> > > >>>>> In order to verify user consent to the Feedback License terms a=
nd
> > > >>>>> to minimize spam in the list archive, subscription is required
> > > >>>>> before posting.
> > > >>>>>
> > > >>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > >>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > >>>>> List help: virtio-comment-help@lists.oasis-open.org
> > > >>>>> List archive: https://lists.oasis-open.org/archives/virtio-comm=
ent/
> > > >>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_l=
icense.pdf
> > > >>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines=
/mailing-lists
> > > >>>>> Committee: https://www.oasis-open.org/committees/virtio/
> > > >>>>> Join OASIS: https://www.oasis-open.org/join/
> > > >>>>>
> > > >>>> This publicly archived list offers a means to provide input to t=
he
> > > >>>> OASIS Virtual I/O Device (VIRTIO) TC.
> > > >>>>
> > > >>>> In order to verify user consent to the Feedback License terms an=
d
> > > >>>> to minimize spam in the list archive, subscription is required
> > > >>>> before posting.
> > > >>>>
> > > >>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > >>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > >>>> List help: virtio-comment-help@lists.oasis-open.org
> > > >>>> List archive: https://lists.oasis-open.org/archives/virtio-comme=
nt/
> > > >>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_li=
cense.pdf
> > > >>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/=
mailing-lists
> > > >>>> Committee: https://www.oasis-open.org/committees/virtio/
> > > >>>> Join OASIS: https://www.oasis-open.org/join/
> > > >>>>
> > >
> >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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

