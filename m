Return-Path: <virtio-comment-return-3884-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9D838986668
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Jan 2023 10:34:06 +0000 (UTC)
Message-ID: <603fa6fd-5ee5-88f8-6b57-36d29b9c6fdb@nvidia.com>
Date: Thu, 19 Jan 2023 12:33:54 +0200
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <40a63ca5-1273-d334-8d81-d5880e4fdff1@nvidia.com>
 <1DDD350DC1DCE386+2023011811234242045568@sudoinfotech.com>
 <9b0655f9-cf97-8d9a-cfd9-bf756821d7e3@nvidia.com>
 <528ED8FCD32C3FF2+2023011918190209488153@sudoinfotech.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <528ED8FCD32C3FF2+2023011918190209488153@sudoinfotech.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] About adding a new device type virtio-nvme
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 19/01/2023 12:19, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> Wed, 18 Jan 2023 12:09:59 +0200, Max Gurtovoy wrote:
>> On 18/01/2023 5:23, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
>>> On=C2=A0 Tue, 17 Jan 2023 19:19:59 +0200, Max Gurtovoy wrote:
>>>> On 17/01/2023 4:04, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
>>>>> On Wed, 11 Jan 2023 10:16:55 -0500, Stefan wrote:
>>>>>>> On Wed, Jan 11, 2023 at 11:21:35AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=
=90 wrote:
>>>>>>> As we know, nvme has more features than virtio-blk. For example, wi=
th the development of virtualization IO offloading to hardware, virtio-blk =
and NVME-OF offloading to hardware >are developing rapidly.=C2=A0 So if vir=
tio and nvme are combined into Virtio-NvMe, Is it necessary to add a device=
 type Virtio-NvMe ?
>>>>>    =20
>>>>>> Hi,
>>>>>> In theory, yes, virtio-nvme can be done. The question is why do it?
>>>>>> NVMe already provides a PCI hardware spec for software and hardware
>>>>>> implementations to follow. An NVMe PCI device can be exposed to the
>>>>>> guest and modern operating systems recognize it without requiring ne=
w
>>>>>> drivers.
>>>>>> The value of VIRTIO here is probably in the deep integration into th=
e
>>>>>> virtualization stack with vDPA, vhost, etc. A virtio-nvme device can=
 use
>>>>>> all these things whereas a PCI device needs to do everything from
>>>>>> scratch.
>>>>> The NVME technology and ecosystem are complete. However, in virtualiz=
ation scenarios, NVME devices can only use PCIe pass-through . When NVME an=
d virtio combine to connect to the vDPA ecosystem, live migration is suppor=
ted.
>>>>>> Let's not forget that virtio-blk is widely used and new commands are
>>>>>> being added as needed. Which NVMe features are you missing in
>>>>>> virtio-blk?
>>>>> With the introduction of the concept of DPU, a large number of vendor=
s are offloading virtual devices to hardware. The back-end of Virtio-blk do=
es not support remote storage. Therefore, Virtio-Nvme-of can well combine t=
he advantages of remote storage and virtio live migration
>>>>>> I guess this is why virtio-nvme hasn't been done before: people who =
want
>>>>> NVMe can already do NVMe PCI, people who want VIRTIO can use virtio-b=
lk,
>>>>>> and so there hasn't been a great need to combine VIRTIO and NVMe yet=
.
>>>>>> What advantages do you see in having virtio-nvme?
>>>>> virtio-nvme=C2=A0advantages :
>>>>> 1)=C2=A0 live migration
>>>>   =20
>>>> This is WIP and will use VFIO live migration framework.
>>> Yes, VFIO live migration framework is WIP,=C2=A0 but I still think vdpa=
 is a friendlier framework.
>
>
>> Not sure what you consider friendly ?
> My personal opinion: VFIO live migration requires device design requireme=
nts.
> But vDPA-based live migration, the software-abstracted vDPA device in the=
 vDPA
> framework can do some state recording, The design requirements for virtio=
 devices
> that are offloading to hardware may be lower.
>
>  =20
>
>
>> The community agreed that in SR-IOV - VF migration is done via PF interf=
ace.
>
>
>> Any device specific migration (e.g. vdpa/virtio)=C2=A0 is not as generic=
 as
>> VFIO migration. Also it will be maintained by a smaller group of enginee=
rs.
>
>> If you would like to use vdpa - I suggest using virtio-blk and not
>> inventing virtio-nvme device that will for sure be with less feature set
>> than pure NVMe.
>
>
>> In case you're missing some feature in virtio-blk that exist in NVMe,
>> you're welcome to submit a proposal to the technical group with that
>> feature.
>
> Yes, this is good advice.
> virtio-blk adds Fabrics related commands to enable virtio-blk to support
> virtio-blk-of (over Fabric), I wonder if it is feasible.

I'm totally confused.
I thought you're are trying to build some virtualized environment and=20
you're looking for storage devices that support Live migration.
How does virtio-blk-of will assist here ?

And how will it be better than using existing over fabric solutions that=20
can be the backend of the storage device (iscsi, nvmf, etc..) ?

>
>
>
>
>> NVIDIA also has a DPU based physical Virtio-blk device (NVIDIA'S
>> virtio-blk SNAP) that support SR-IOV and remote storage access.
>
> For remote storage access, how is the physical Virtio-blk device's back-e=
nd implemented?
> What protocol is used?
> Is it an open source solution?
>
>
>
>
>> Live migration specification is WIP in both NVMe and Virtio working
>> groups. I can't say who will be merge first.
> Yes, I agree with you on that point.
>
>
>
>>>>   =20
>>>>> 2)=C2=A0 support remote storage
>>>> There are solutions today that can use remote storage as an NVMe
>>>> Namespace. For example, DPU based NVMe device such as NVIDIA'S NVMe SN=
AP
>>>> device.
>>> Yes, you're right. Nvme has a built-in advantage over virtio-blk hardwa=
re offloading.
>>> The reason why I propose Virtio-NVMe is to combine nvme and virtio, so =
that NVME
>>> can adapt to virtio ecosystem based on virtio interface specifications,=
 such as vdpa.

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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

