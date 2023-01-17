Return-Path: <virtio-comment-return-3863-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2A9169865D1
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Jan 2023 17:20:09 +0000 (UTC)
Message-ID: <40a63ca5-1273-d334-8d81-d5880e4fdff1@nvidia.com>
Date: Tue, 17 Jan 2023 19:19:59 +0200
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] About adding a new device type virtio-nvme
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 17/01/2023 4:04, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> On Wed, 11 Jan 2023 10:16:55 -0500, Stefan wrote:
>
>
>>> On Wed, Jan 11, 2023 at 11:21:35AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 w=
rote:
>>> As we know, nvme has more features than virtio-blk. For example, with t=
he development of virtualization IO offloading to hardware, virtio-blk and =
NVME-OF offloading to hardware >are developing rapidly.=C2=A0 So if virtio =
and nvme are combined into Virtio-NvMe, Is it necessary to add a device typ=
e Virtio-NvMe ?
>
>
>  =20
>
>
>
>> Hi,
>> In theory, yes, virtio-nvme can be done. The question is why do it?
>
>
>> NVMe already provides a PCI hardware spec for software and hardware
>> implementations to follow. An NVMe PCI device can be exposed to the
>> guest and modern operating systems recognize it without requiring new
>> drivers.
>
>> The value of VIRTIO here is probably in the deep integration into the
>> virtualization stack with vDPA, vhost, etc. A virtio-nvme device can use
>> all these things whereas a PCI device needs to do everything from
>> scratch.
>
> The NVME technology and ecosystem are complete. However, in virtualizatio=
n scenarios, NVME devices can only use PCIe pass-through . When NVME and vi=
rtio combine to connect to the vDPA ecosystem, live migration is supported.
>
>
>> Let's not forget that virtio-blk is widely used and new commands are
>> being added as needed. Which NVMe features are you missing in
>> virtio-blk?
> With the introduction of the concept of DPU, a large number of vendors ar=
e offloading virtual devices to hardware. The back-end of Virtio-blk does n=
ot support remote storage. Therefore, Virtio-Nvme-of can well combine the a=
dvantages of remote storage and virtio live migration
>
>
>
>> I guess this is why virtio-nvme hasn't been done before: people who want
>> NVMe can already do NVMe PCI, people who want VIRTIO can use virtio-blk,
>> and so there hasn't been a great need to combine VIRTIO and NVMe yet.
>
>> What advantages do you see in having virtio-nvme?
>
>
> virtio-nvme=C2=A0advantages :
> 1)  live migration

This is WIP and will use VFIO live migration framework.

> 2)  support remote storage

There are solutions today that can use remote storage as an NVMe=20
Namespace. For example, DPU based NVMe device such as NVIDIA'S NVMe SNAP=20
device.

>
>
>
> Leo Hou/=E4=BE=AF=E8=8B=B1=E4=B9=90
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

