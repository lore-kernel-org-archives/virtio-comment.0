Return-Path: <virtio-comment-return-3851-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F0DB9864BB
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Jan 2023 08:32:18 +0000 (UTC)
Message-ID: <96c93361-1497-1eb2-7fcb-452696ae6a56@redhat.com>
Date: Tue, 17 Jan 2023 09:32:05 +0100
MIME-Version: 1.0
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
From: David Hildenbrand <david@redhat.com>
In-Reply-To: <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
Subject: Re: [virtio-comment] About adding a new device type virtio-nvme
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 17.01.23 03:04, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> On Wed, 11 Jan 2023 10:16:55 -0500, Stefan wrote:
>=20
>=20
>>> On Wed, Jan 11, 2023 at 11:21:35AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 w=
rote:
>>> As we know, nvme has more features than virtio-blk. For example, with t=
he development of virtualization IO offloading to hardware, virtio-blk and =
NVME-OF offloading to hardware >are developing rapidly.=C2=A0 So if virtio =
and nvme are combined into Virtio-NvMe, Is it necessary to add a device typ=
e Virtio-NvMe ?
>=20
>=20
>=20
>  =20
>=20
>=20
>=20
>> Hi,
>> In theory, yes, virtio-nvme can be done. The question is why do it?
>=20
>=20
>=20
>> NVMe already provides a PCI hardware spec for software and hardware
>> implementations to follow. An NVMe PCI device can be exposed to the
>> guest and modern operating systems recognize it without requiring new
>> drivers.
>=20
>=20
>> The value of VIRTIO here is probably in the deep integration into the
>> virtualization stack with vDPA, vhost, etc. A virtio-nvme device can use
>> all these things whereas a PCI device needs to do everything from
>> scratch.
>=20
>=20
> The NVME technology and ecosystem are complete. However, in virtualizatio=
n scenarios, NVME devices can only use PCIe pass-through . When NVME and vi=
rtio combine to connect to the vDPA ecosystem, live migration is supported.
>=20
>=20
>> Let's not forget that virtio-blk is widely used and new commands are
>> being added as needed. Which NVMe features are you missing in
>> virtio-blk?
>=20
> With the introduction of the concept of DPU, a large number of vendors ar=
e offloading virtual devices to hardware. The back-end of Virtio-blk does n=
ot support remote storage. Therefore, Virtio-Nvme-of can well combine the a=
dvantages of remote storage and virtio live migration
>=20
>=20
>=20
>> I guess this is why virtio-nvme hasn't been done before: people who want
>> NVMe can already do NVMe PCI, people who want VIRTIO can use virtio-blk,
>> and so there hasn't been a great need to combine VIRTIO and NVMe yet.
>=20
>=20
>> What advantages do you see in having virtio-nvme?
>=20
>=20
>=20
> virtio-nvme=C2=A0advantages :
> 1)  live migration
> 2)  support remote storage

At least 1) is an implementation detail in the NVME implementation in=20
the hypervisor. I suspect 2) in a similar way, or is there a fundamental=20
issue with that?

One problematic thing about the NVME implementation in QEMU is that it=20
will pin (via vfio) all guest RAM. Could that be avoided using=20
virtio-NVME, or what exactly would be the difference between virtio-nvme=20
and ordinary NVME?

--=20
Thanks,

David / dhildenb


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

