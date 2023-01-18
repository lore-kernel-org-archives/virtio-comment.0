Return-Path: <virtio-comment-return-3869-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 840C7986650
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Jan 2023 10:10:10 +0000 (UTC)
Message-ID: <9b0655f9-cf97-8d9a-cfd9-bf756821d7e3@nvidia.com>
Date: Wed, 18 Jan 2023 12:09:59 +0200
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <40a63ca5-1273-d334-8d81-d5880e4fdff1@nvidia.com>
 <1DDD350DC1DCE386+2023011811234242045568@sudoinfotech.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <1DDD350DC1DCE386+2023011811234242045568@sudoinfotech.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] About adding a new device type virtio-nvme
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 18/01/2023 5:23, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> On  Tue, 17 Jan 2023 19:19:59 +0200, Max Gurtovoy wrote:
>
>> On 17/01/2023 4:04, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
>>> On Wed, 11 Jan 2023 10:16:55 -0500, Stefan wrote:
>>>>> On Wed, Jan 11, 2023 at 11:21:35AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90=
 wrote:
>>>>> As we know, nvme has more features than virtio-blk. For example, with=
 the development of virtualization IO offloading to hardware, virtio-blk an=
d NVME-OF offloading to hardware >are developing rapidly.=C2=A0 So if virti=
o and nvme are combined into Virtio-NvMe, Is it necessary to add a device t=
ype Virtio-NvMe ?
>>>   =20
>>>
>>>> Hi,
>>>> In theory, yes, virtio-nvme can be done. The question is why do it?
>>>> NVMe already provides a PCI hardware spec for software and hardware
>>>> implementations to follow. An NVMe PCI device can be exposed to the
>>>> guest and modern operating systems recognize it without requiring new
>>>> drivers.
>>>> The value of VIRTIO here is probably in the deep integration into the
>>>> virtualization stack with vDPA, vhost, etc. A virtio-nvme device can u=
se
>>>> all these things whereas a PCI device needs to do everything from
>>>> scratch.
>>> The NVME technology and ecosystem are complete. However, in virtualizat=
ion scenarios, NVME devices can only use PCIe pass-through . When NVME and =
virtio combine to connect to the vDPA ecosystem, live migration is supporte=
d.
>>>> Let's not forget that virtio-blk is widely used and new commands are
>>>> being added as needed. Which NVMe features are you missing in
>>>> virtio-blk?
>>> With the introduction of the concept of DPU, a large number of vendors =
are offloading virtual devices to hardware. The back-end of Virtio-blk does=
 not support remote storage. Therefore, Virtio-Nvme-of can well combine the=
 advantages of remote storage and virtio live migration
>>>> I guess this is why virtio-nvme hasn't been done before: people who wa=
nt
>>>> NVMe can already do NVMe PCI, people who want VIRTIO can use virtio-bl=
k,
>>>> and so there hasn't been a great need to combine VIRTIO and NVMe yet.
>>>> What advantages do you see in having virtio-nvme?
>>> virtio-nvme=C2=A0advantages :
>>> 1)=C2=A0 live migration
>>  =20
>> This is WIP and will use VFIO live migration framework.
> Yes, VFIO live migration framework is WIP,  but I still think vdpa is a f=
riendlier framework.

Not sure what you consider friendly ?

The community agreed that in SR-IOV - VF migration is done via PF interface=
.

Any device specific migration (e.g. vdpa/virtio)=C2=A0 is not as generic as=
=20
VFIO migration. Also it will be maintained by a smaller group of engineers.

If you would like to use vdpa - I suggest using virtio-blk and not=20
inventing virtio-nvme device that will for sure be with less feature set=20
than pure NVMe.

In case you're missing some feature in virtio-blk that exist in NVMe,=20
you're welcome to submit a proposal to the technical group with that=20
feature.

NVIDIA also has a DPU based physical Virtio-blk device (NVIDIA'S=20
virtio-blk SNAP) that support SR-IOV and remote storage access.

Live migration specification is WIP in both NVMe and Virtio working=20
groups. I can't say who will be merge first.

>
>
>>  =20
>>> 2)=C2=A0 support remote storage
>> There are solutions today that can use remote storage as an NVMe
>> Namespace. For example, DPU based NVMe device such as NVIDIA'S NVMe SNAP
>> device.
>
>
> Yes, you're right. Nvme has a built-in advantage over virtio-blk hardware=
 offloading.
> The reason why I propose Virtio-NVMe is to combine nvme and virtio, so th=
at NVME
> can adapt to virtio ecosystem based on virtio interface specifications, s=
uch as vdpa.
>
>
>
> --
> Leo Hou/houyingle
>

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

