Return-Path: <virtio-comment-return-2215-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 364619863B9
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Aug 2021 09:11:28 +0000 (UTC)
References: <DM4PR12MB504062CEF6BEDABE6F76DEC2DEF99@DM4PR12MB5040.namprd12.prod.outlook.com>
 <62bd1c8d-c56e-fc98-f833-61d9c999f814@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <cc7e769a-fee6-2940-74a7-03dbc98a109f@nvidia.com>
Date: Tue, 17 Aug 2021 12:11:07 +0300
MIME-Version: 1.0
In-Reply-To: <62bd1c8d-c56e-fc98-f833-61d9c999f814@redhat.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/17/2021 11:51 AM, Jason Wang wrote:
>
> =E5=9C=A8 2021/8/12 =E4=B8=8B=E5=8D=888:08, Max Gurtovoy =E5=86=99=E9=81=
=93:
>>
>> Hi all,
>>
>> Live migration is one of the most important features of=20
>> virtualization and virtio devices are oftenly found in virtual=20
>> environments.
>>
>> The migration process is managed by a migration SW that is running on=20
>> the hypervisor and the VM is not aware of the process at all.
>>
>> Unlike the vDPA case, a real pci Virtual Function state resides in=20
>> the HW.
>>
>
> vDPA doesn't prevent you from having HW states. Actually from the view=20
> of the VMM(Qemu), it doesn't care whether or not a state is stored in=20
> the software or hardware. A well designed VMM should be able to hide=20
> the virtio device implementation from the migration layer, that is how=20
> Qemu is wrote who doesn't care about whether or not it's a software=20
> virtio/vDPA device or not.
>
>
>> In our vision, in order to fulfil the Live migration requirements for=20
>> virtual functions, each physical function device must implement=20
>> migration operations. Using these operations, it will be able to=20
>> master the migration process for the virtual function devices. Each=20
>> capable physical function device has a supervisor permissions to=20
>> change the virtual function operational states, save/restore its=20
>> internal state and start/stop dirty pages tracking.
>>
>
> For "supervisor permissions", is this from the software point of view?=20
> Maybe it's better to give an example for this.

A permission to a PF device for quiesce and freeze a VF device for example.

>
>
>> An example of this approach can be seen in the way NVIDIA performs=20
>> live migration of a ConnectX NIC function:
>>
>> https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci=20
>> <https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci>
>>
>> NVIDIAs SNAP technology enables hardware-accelerated software defined=20
>> PCIe devices. virtio-blk/virtio-net/virtio-fs SNAP used for storage=20
>> and networking solutions. The host OS/hypervisor uses its standard=20
>> drivers that are implemented according to a well-known VIRTIO=20
>> specifications.
>>
>> In order to implement Live Migration for these virtual function=20
>> devices, that use a standard drivers as mentioned, the specification=20
>> should define how HW vendor should build their devices and for SW=20
>> developers to adjust the drivers.
>>
>> This will enable specification compliant vendor agnostic solution.
>>
>> This is exactly how we built the migration driver for ConnectX=20
>> (internal HW design doc) and I guess that this is the way other=20
>> vendors work.
>>
>> For that, I would like to know if the approach of =E2=80=9CPF that contr=
ols=20
>> the VF live migration process=E2=80=9D is acceptable by the VIRTIO techn=
ical=20
>> group ?
>>
>
> I'm not sure but I think it's better to start from the general=20
> facility for all transports, then develop features for a specific=20
> transport.

a general facility for all transports can be a generic admin queue ?


>
> Thanks
>
>
>> Cheers,
>>
>> -Max.
>>
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

