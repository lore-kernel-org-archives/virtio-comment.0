Return-Path: <gerry@linux.alibaba.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [virtio-comment] [PATCH v2 0/1] introduce virtio-ism: internal
 shared memory device
From: Gerry Liu <gerry@linux.alibaba.com>
In-Reply-To: <58603f43-9165-eb0c-9ee6-114874681109@linux.ibm.com>
Date: Thu, 5 Jan 2023 22:51:29 +0800
Message-Id: <850DA034-9C41-4BCA-98B7-FA0B3AA53EE0@linux.alibaba.com>
References: <20221223081939.26506-1-xuanzhuo@linux.alibaba.com>
 <c572aa1f-e2a9-721e-5389-aec605fc439f@linux.ibm.com>
 <88bdae7b-4ee0-8da8-5bb7-473957002bbe@linux.ibm.com>
 <1672917622.6090338-1-xuanzhuo@linux.alibaba.com>
 <58603f43-9165-eb0c-9ee6-114874681109@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Alexandra Winter <wintera@linux.ibm.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, hans@linux.alibaba.com, herongguang@linux.alibaba.com, zmlcc@linux.alibaba.com, dust.li@linux.alibaba.com, tonylu@linux.alibaba.com, zhenzao@linux.alibaba.com, helinguo@linux.alibaba.com, mst@redhat.com, cohuck@redhat.com, jasowang@redhat.com, Jan Kiszka <jan.kiszka@siemens.com>, kgraul@linux.ibm.com, wenjia@linux.ibm.com, jaka@linux.ibm.com, hca@linux.ibm.com, twinkler@linux.ibm.com, raspl@linux.ibm.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>



> 2023=E5=B9=B41=E6=9C=885=E6=97=A5 22:29=EF=BC=8CAlexandra Winter <wintera=
@linux.ibm.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
>=20
> On 05.01.23 12:20, Xuan Zhuo wrote:
>> On Wed, 4 Jan 2023 14:52:10 +0100, Alexandra Winter <wintera@linux.ibm.c=
om> wrote:
>>>=20
>>>=20
>>>=20
>>> On 23.12.22 09:19, Xuan Zhuo wrote:
> [...]
>>>>=20
>>>> # Virtio ISM device
>>>>=20
>>>>    ISM devices provide the ability to share memory between different g=
uests on
>>>>    a host. A guest's memory got from ism device can be shared with mul=
tiple
>>>>    peers at the same time. This shared relationship can be dynamically=
 created
>>>>    and released.
>>>>>    The shared memory obtained from the device is divided into multipl=
e ism
>>>>    regions for share. ISM device provides a mechanism to notify other =
ism
>>>>    region referrers of content update events.
>>=20
>>=20
>> Thank you very much for your reply.
>>=20
>>>=20
>>> As this should work with SMC-D, let me point out some aspect of the ISM=
 devices we use today:
>>>=20
>>> 1) Owner-User
>>> For such a memory region one peer is the owner and the other peer is th=
e user.
>>> I don't see that in your diagram below. Maybe you could point that out =
more clearly.
>>=20
>> Indeed, we only emphasize the creator. After the creation, all the refer=
ences of
>> this region are similar.
>>=20
>> The user's management authority for region is reflected through permissi=
on, and
>> this permissions can be transferred to other users.
>>=20
>>=20
>>> I think the concept of user and owner simplifies device management (res=
et, recovery, etc..) and is
>>> useful for other scenarios that use ISM as well.
>>=20
>> Can you be more specific? What is the benefit of the concept of owner fo=
r
>> device management?
>>=20
>=20
> The owner/creator is responsible for the buffer/memory region. It decides=
 when
> the buffer should be freed. When it goes away, the buffer goes away.
> Otherwise you have to keep track who is the last user, or 2 users could t=
ry to
> free the buffer, etc.
>=20
>=20
>>> After reading the whole thread, it seems to me that you propose a 'sing=
le owner, multiple
>>> users' scenario, do I understand this correctly?
>>=20
>> Yes, we allow the scenes of multiple users.
>>=20
>>> Then SMC-D would use a subset of 'single owner-single user' which is fi=
ne.
>>>=20
>>>=20
>>> 2) unidirectional buffers (memory regions)
>>> For the ISM devices today only the user writes into the memory region a=
nd the owner only reads
>>> from this memory region. This suits the SMC-D usecase and probably maxi=
mises performance in
>>> other usecases as well.
>>> So for compatibility, I would ask that the virtio-ism spec does not man=
date to provide for
>>> bidirectional usage of the memory regions. It should suffice, if the us=
er can write and
>>> the owner can read.
>>=20
>> I think there will be bidirectional write or creator-write scenes.
>>=20
>> SMC-D can be set up based on permission to read only for creator.
>=20
> I agree.
>=20
>>=20
>>=20
>>>=20
>>> 3) Memory provided by the owner
>>> In your diagram it seems that the hipervisor provides the memory for th=
e buffers.
>>> That puts the burden of providing enough memory or the risk of OOM on t=
he Hipervisor
>>> which is kind of unfair. In case of memory shortage this results in a f=
irst-come-first-serve
>>> race.
>>> We thought it more suitable that the instances that use ISM
>>> (the owners of the buffers) provide for the memory. Then they can make =
the tradeoff
>>> of memory for performance and do not impact other connections.
>>=20
>>=20
>> Good Point.
>>=20
>> Indeed, it is a fair solution provided by creator.
>>=20
>> Our design considers that a user may maliciously occupys a region from o=
ther vm.
>>=20
>> When creator allocated a memory from the guest and it is attached by one
>> maliciously user, this user may not release the reference normally after=
 the
>> connection (may not smc connection) is closed.
>=20
> The creator should be able to free the memory in any case. Attached users=
 should
> be notified.
>=20
>>=20
>> If the region is provided by hypervisor, other user (including creator) =
can
>> directly detach the region. And if one vm takes up too much regions, hyp=
ervisor
>> can prevent this VM from alloc/attach new region.
>>=20
>> Thanks.
>>=20
>=20
> Especially in a cloud scenario memory is often a scarce resource and ther=
e may be
> Class A guests with a lot of memory and Class B with less. If the hipervi=
sor hands
> out these virtio-ism buffers for free, that puts the bill on the hipervis=
or.
>=20
> How is the hipervisor to decide how many regions are too much for a speci=
fic guest?
> That requires an algorithm and/or additional configuration controls.=20
> If otoh you bill the regions to the creator's memory, you can fine-tune i=
nside each
> guest how much it should spend on ism-buffers. e.g by defining a maximum =
size and
> number of regions.
>=20
> Imagine a scenario, where a guest runs into the problem, that it cannot g=
et the
> regions it wants. In my experience an admin is happy if such an issue can=
 be fixed=20
> by changing the settings inside the guest.=20
> When regions are handed out by the hipervisor, then the admin has to chan=
ge a
> hipervisor setting. And most probably needs to either reduce the setting =
for another
> guest, or increase Hipervisor memory (who pays for that?)
>=20
> Also now the problems in one guest may be caused by activtiy in another g=
uest.
> Of course this happens a lot in real life, when guests are sharing resour=
ces, but
> users are still complaining about it and want to minimize this as much as=
 possible
> (SLAs, etc..)=20
>=20
> Of course there are always multiple ways to manage fairness and billing b=
etween guests,
> and people have different preferences on usability. This is just my POV b=
ased on my own
> experience and many customer stories from the typically highly virtualize=
d
> IBM Z environment.
> Maybe others want to chime in.

Hi Winter,
That depends on how we abstract the device and related resource.
One way is to abstract the virtio-ism devices as NIC like devices, which us=
e memory allocated from guest for communication.
Another way is to abstract the vritio-ism as devices with shared memory, an=
d clients will permission can allocate shared memory from the device.

In case of resource charging, we can also charge the Virtio-ism devices ind=
ependently in cloud environments.
Thanks,
Gerry
=20
>=20
>>=20
>>>=20
>>>>=20
>>>> ## Design
>>>>=20
>>>>    This is a structure diagram based on ism sharing between two vms.
>>>>=20
>>>>    |------------------------------------------------------------------=
-------------------------------------------|
>>>>    | |------------------------------------------------|       |-------=
-----------------------------------------| |
>>>>    | | Guest                                          |       | Guest =
                                         | |
>>>>    | |                                                |       |       =
                                         | |
>>>>    | |   ----------------                             |       |   ----=
------------                             | |
>>>>    | |   |    driver    |     [M1]   [M2]   [M3]      |       |   |   =
 driver    |             [M2]   [M3]     | |
>>>>    | |   ----------------       |      |      |       |       |   ----=
------------               |      |      | |
>>>>    | |    |cq|                  |map   |map   |map    |       |    |cq=
|                          |map   |map   | |
>>>>    | |    |  |                  |      |      |       |       |    |  =
|                          |      |      | |
>>>>    | |    |  |                -------------------     |       |    |  =
|                --------------------    | |
>>>>    | |----|--|----------------|  device memory  |-----|       |----|--=
|----------------|  device memory   |----| |
>>>>    | |    |  |                -------------------     |       |    |  =
|                --------------------    | |
>>>>    | |                                |               |       |       =
                        |                | |
>>>>    | |                                |               |       |       =
                        |                | |
>>>>    | | Qemu                           |               |       | Qemu  =
                        |                | |
>>>>    | |--------------------------------+---------------|       |-------=
------------------------+----------------| |
>>>>    |                                  |                               =
                        |                  |
>>>>    |                                  |                               =
                        |                  |
>>>>    |                                  |------------------------------+=
------------------------|                  |
>>>>    |                                                                 |=
                                           |
>>>>    |                                                                 |=
                                           |
>>>>    |                                                   ---------------=
-----------                                |
>>>>    |                                                    | M1 |   | M2 =
|   | M3 |                                 |
>>>>    |                                                   ---------------=
-----------                                |
>>>>    |                                                                  =
                                           |
>>>>    | HOST                                                             =
                                           |
>>>>    -------------------------------------------------------------------=
--------------------------------------------
> [...]

