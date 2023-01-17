Return-Path: <virtio-comment-return-3860-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8638986594
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Jan 2023 15:47:38 +0000 (UTC)
Message-ID: <3f33c53a-fe82-7c70-a63b-27efcdb1ab22@redhat.com>
Date: Tue, 17 Jan 2023 16:47:23 +0100
MIME-Version: 1.0
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <96c93361-1497-1eb2-7fcb-452696ae6a56@redhat.com>
 <202301171730174296359@sudoinfotech.com>
 <EE1B180C7FB41197+2023011717415699763014@sudoinfotech.com>
 <Y8a/8SH6sk3rgqcr@fedora>
From: David Hildenbrand <david@redhat.com>
In-Reply-To: <Y8a/8SH6sk3rgqcr@fedora>
Subject: Re: [virtio-comment] About adding a new device type virtio-nvme
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>
Cc: virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 17.01.23 16:34, Stefan Hajnoczi wrote:
> On Tue, Jan 17, 2023 at 05:41:57PM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wro=
te:
>> On Tue, 17 Jan 2023 09:32:05 +0100=EF=BC=8CDavid wrote=EF=BC=9A
>>> On 17.01.23 03:04, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
>>
>>
>>
>>>> virtio-nvme=C2=A0advantages :
>>>> 1)=C2=A0 live migration
>>>> 2)=C2=A0 support remote storage
>>
>>
>>
>>> At least 1) is an implementation detail in the NVME implementation in
>>> the hypervisor. I suspect 2) in a similar way, or is there a fundamenta=
l
>>> issue with that?
>>
>>
>>
>>> One problematic thing about the NVME implementation in QEMU is that it
>>> will pin (via vfio) all guest RAM. Could that be avoided using
>>> virtio-NVME, or what exactly would be the difference between virtio-nvm=
e
>>> and ordinary NVME?
>>
>>
>>
>> In the virtualization scenario where devices are offload to hardware=EF=
=BC=9A
>>
>>
>> NVME=EF=BC=9A
>> ------------------------------------------------------------------------=
---------------------------------------------
>>             ____________________________________________________________=
_________________
>>            |             _______________________________________________=
____________     |
>>            |            |    ___________________________________________=
__________  |    |
>>            |            |    |                                          =
          | |    |
>>            |            |    |             _____________________________=
_____     | |    |
>>            |            |    |            |    ______                   =
     |    | |    |        ______
>>            |            |    |   User     |   | Mem  |------------------=
-----|----|-|----|-----> |      |
>>            |            |    |            |   |______|        SPDK      =
     |    | |    | (gVA) |______|
>>            |            |    |            |    (gVA)                    =
     |    | |    |        |    |
>>            |            |    |            |______|______________________=
_____|    | |    |        |    |
>>            |            |    |--GuestOS----------|----------------------=
----------| |    |        |    |
>>            |            |    |             ______\/_____________________=
_____     | |    |        |    |
>>            |            | VM |            |                VFIO         =
     |    | |    |        |    |
>>            |   User     |    |   Kernel   |___________     _____________=
_____|    | |    |        |    |
>>            |            |    |            | vfio-pci  |   |             =
     |    | |    |        |    |
>>            |            |    |            |  (gIOVA)  |   | vfio_iommu_t=
ype1 |    | |    |        |    |
>> Software  |            |    |            |______|____|___|______________=
____|    | |    |        |    |
>>            |            |    |___________________|______________________=
__________| |    |        |    |
>>            |            |     ___________________|______________________=
__________  |    |        |    |
>>            |            |    |             ______|____     _____________=
_____     | |    |        \/   \/
>>            |            |    |            |      \/   |   |             =
     |    | |    |        ______
>>            |            |    |            |    NVME   |   |      vIOMMU =
     |    | |    |       |      |
>>            |            |    |   QEMU     |  Instance |   |             =
   --|----|-|----|-----> |______|
>>            |            |    |            |  (gIOVA)  |   |   (gIOVA-->g=
PA)  |    | |    | (gPA)  |    |
>>            |            |    |            |_____|_____|   |_____________=
_____|    | |    |        |    |
>>            |            |    |__________________|_______________________=
__________| |    |        |    |
>>            |            |_______________________|_______________________=
____________|    |        |    |
>>            |---HostOS---------------------------|-----------------------=
-----------------|        |    |
>>            |             _______________________|_______________________=
____________     |        |    |
>>            |            |                       |                       =
            |    |        |    |
>>            |            |                       |    VFIO               =
            |    |        |    |
>>            |   Kernel   |_______________________|_____     _____________=
____________|    |        |    |
>>            |            |                       \/    |   |             =
            |    |        |    |
>>            |            |        vfio-pci             |   |    vfio_iomm=
u_type1     |    |        |    |
>>            |            |                       |     |   |             =
            |    |        |    |
>>            |            |_______________________|_____|___|_____________=
____________|    |        |    |
>>            |____________________________________|_______________________=
_________________|        |    |
>> -----------------------------------------------|------------------------=
-------------------------|----|--------------
>>             ____________________________________\/____     _____________=
____________           ___\/___\/___________
>>            |       |    |                             |   |             =
            |         |  |      |           |
>> Hardware  |       |    |          DMA     (gIOVA)  --|---|->        IOMM=
U        --|---------|->|______|           |
>>            |       |    |_____________________________|   |      (gIOVA-=
->hPA)      |   (hPA) |   Physical Memory   |
>>            | DPU   |                                  |   |_____________=
____________|         |_____________________|
>>            |       |        NVME-of                   |
>>            |       |__________________________________|
>>            |                           |              |
>>            |___________________________|______________|
>> --------------------------------------|---------------------------------=
---------------------------------------------
>>                                        | TCP (RDMA, and so on)
>>                          ______________v__________
>>                         |                         |
>> Remote storage         |                         |
>>                         |     Network Storage     |
>>                         |                         |
>>                         |_________________________|
>>                        =20
>> ------------------------------------------------------------------------=
---------------------------------------------
>>
>>
>> It is difficult to implement PCIe passthrough live migration.
>=20
> Linux commit 115dcec65f61d53e25e1bed5e380468b30f98b14 ("vfio: Define
> device migration protocol v2") defines the VFIO migration API and it's
> implemented by several drivers in the kernel.
>=20
> Can you explain the difficulty of implementing PCIe passthrough live
> migration in more detail?
>=20
>>
>>
>>
>>  =20
>> virtio-nvme:
>> ------------------------------------------------------------------------=
---------------------------------------------
>>             ____________________________________________________________=
_________________
>>            |             _______________________________________________=
____________     |
>>            |            |    ___________________________________________=
__________  |    |
>>            |            |    |                                          =
          | |    |
>>            |            |    |             _____________________________=
_____     | |    |
>>            |            |    |            |    ______                   =
     |    | |    |        ______
>>            |            |    |   User     |   | Mem  |------------------=
-----|----|-|----|-----> |      |
>>            |            |    |            |   |______|        SPDK      =
     |    | |    | (gVA) |______|
>>            |            |    |            |    (gVA)                    =
     |    | |    |        |    |
>>            |            |    |            |______|______________________=
_____|    | |    |        |    |
>>            |            |    |--GuestOS----------|----------------------=
----------| |    |        |    |
>>            |            |    |             ______v______________________=
_____     | |    |        |    |
>>            |            | VM |            |                VFIO         =
     |    | |    |        |    |
>>            |   User     |    |   Kernel   |___________     _____________=
_____|    | |    |        |    |
>>            |            |    |            | vfio-pci  |   |             =
     |    | |    |        |    |
>>            |            |    |            |  (gIOVA)  |   | vfio_iommu_t=
ype1 |    | |    |        |    |
>> Software  |            |    |            |______|____|___|______________=
____|    | |    |        |    |
>>            |            |    |___________________|______________________=
__________| |    |        |    |
>>            |            |     ___________________|______________________=
__________  |    |        |    |
>>            |            |    |             ______v____     _____________=
_____     | |    |        v    v
>>            |            |    |            |virtio-NVME|   |             =
     |    | |    |        ______
>>            |            |    |            |  Instance |   |      vIOMMU =
     |    | |    |       |      |
>>            |            |    |   QEMU     |           |   |             =
   --|----|-|----|-----> |______|
>>            |            |    |            | vhost-vdpa|   |   (gIOVA-->g=
PA)  |    | |    | (gPA)  |    |
>>            |            |    |            |__(gIOVA)__|   |_____________=
_____|    | |    |        |    |
>>            |            |    |__________________|_______________________=
__________| |    |        |    |
>>            |            |_______________________|_______________________=
____________|    |        |    |
>>            |---HostOS---------------------------|-----------------------=
-----------------|        |    |
>>            |             _______________________|_______________________=
____________     |        |    |
>>            |            |                       |                       =
            |    |        |    |
>>            |            |                       |    vDPA               =
            |    |        |    |
>>            |   Kernel   |_______________________v_____     _____________=
____________|    |        |    |
>>            |            |                       |     |   |             =
            |    |        |    |
>>            |            |   vdpa-device         |     |   |             =
            |    |        |    |
>>            |            | (Virtual device)      |     |   |             =
            |    |        |    |
>>            |            |_______________________|_____|___|_____________=
____________|    |        |    |
>>            |____________________________________|_______________________=
_________________|        |    |
>> -----------------------------------------------|------------------------=
-------------------------|----|--------------
>>             ____________________________________v_____     _____________=
____________           ___v____v____________
>>            |       |    |                             |   |             =
            |         |  |      |           |
>> Hardware  |       |    |          DMA     (gIOVA)  --|---|->        IOMM=
U        --|---------|->|______|           |
>>            |       |    |_____________________________|   |      (gIOVA-=
->hPA)      |   (hPA) |   Physical Memory   |
>>            |  DPU  |                                  |   |_____________=
____________|         |_____________________|
>>            |       |        virtio-nvme-of            |
>>            |       |__________________________________|
>>            |                           |              |
>>            |___________________________|______________|
>> --------------------------------------|---------------------------------=
---------------------------------------------
>>                                        | TCP (RDMA, and so on)
>>                          ______________v__________
>>                         |                         |
>> Remote storage         |                         |
>>                         |     Network Storage     |
>>                         |                         |
>>                         |_________________________|
>>                        =20
>> ------------------------------------------------------------------------=
---------------------------------------------
>> Based on the vDPA framework, it supports live migration.
>=20
> The two diagrams are quite similar. Did you want to highlight a
> difference between the two approaches in the diagram?

I also wondered why virtio-nvme is exactly needed, and why one couldn't=20
write a different "backend" for an ordinary NVME device, that talks to=20
the vdpa-device.

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

