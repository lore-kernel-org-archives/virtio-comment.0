Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
References: <20210803032006.48881-1-jasowang@redhat.com>
 <892f7853-1d30-5435-2c19-ace9b1028c99@nvidia.com>
 <b750f804-9a8a-e37b-a0e7-40ecf291157a@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <f2701248-10c1-aa4e-8cc8-419937b1ee8b@nvidia.com>
Date: Wed, 4 Aug 2021 13:20:21 +0300
MIME-Version: 1.0
In-Reply-To: <b750f804-9a8a-e37b-a0e7-40ecf291157a@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, cohuck@redhat.com, stefanha@redhat.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/4/2021 4:37 AM, Jason Wang wrote:
>
> =E5=9C=A8 2021/8/3 =E4=B8=8B=E5=8D=888:40, Max Gurtovoy =E5=86=99=E9=81=
=93:
>>>
>>> +Sometimes it's hard to implement the device in a transport specific
>>> +method. One example is that a physical device may try to present
>>> +multiple virtual devices with a limited transport specific
>>> +resources. Another example is to implement virtual devices which is
>>> +transport independent. In those cases, the admin virtqueue provided by
>>> +the management device could be used to replace the transport specific
>>> +method to implement the virtual device. Then the presenting of the
>>> +virtual device is done through the cooperation between the admin
>>> +virtqueue and the driver.
>>
>> maybe it's me, but I can't understand how admin queue is a transport.
>
>
> The transport is the method that provides basic facility. In this=20
> proposal, the admin virtqueue is used to provide basic facility for=20
> the virtual device. That is to say, it's the transport for virtual=20
> device.
>
>
>>
>> And how can I use admin queue transport to migrate VFs that are=20
>> controlled by virtio PCI PF.
>
>
> This live migration support and the admin virtqueue transport are=20
> orthogonal. The main motivation of this proposal is used for=20
> implementing virtual device transport via admin virtqueue. It's not=20
> hard to add new commands for doing live migration for the virtual=20
> device, I don't do that since I believe it's expected to be addressed=20
> in your proposal.

so why do you call it in the same name that I used in my RFC ? This is=20
confusing and causing problems.

You are working on a parallel feature and reviewing my RFC as if it was=20
instead of your proposal.

IIUC, in your proposal a non SRIOV device parent will create admin queue=20
and using this admin queue you'll be able to create children devices and=20
their transport will be admin queue.

That means that the configuration cycles will be trapped by the parent=20
device somehow.

This also means we need to merge my RFC first to create infrastructure=20
for this RFC.

For admin management that you'll need probably virtio-cli tool from user=20
space.

So this proposal is complementary to mine. Your management device will=20
negotiate "my" admin_queue feature and you'll need to add more commands=20
to this admin queue that are probably in transport specific domain to=20
create children.

You do need to handle the configuration cycles that this management=20
parent device will need to support.


>
> For virtual device, it's a independent virtio device that could be=20
> assigned to secure DMA context/domain,=C2=A0 it is functional equivalent=
=20
> ADI or SF. The difference is that it can work with or without platform=20
> support (SIOV or PASID).
>
>
>>
>> And why the regular admin queue that is part of the device queues=20
>> can't fit to your needs ?
>
>
> For "regular admin queue", did you mean your proposal. Actually, it's=20
> not conflict, we can unify the interface though the motivation is=20
> different.
>
>
>>
>> Can you explain your needs ? is it to create a vDPA device from some=20
>> SW interface ?
>
>
> As stated in the patch, the needs are:
>
> - Presenting virtual devices with limited transport specific resources
> - Presenting virtual devices without platform support (e.g SR-IOV or=20
> SIOV)
>
> We want virtio to have hyper-scalability via slicing at virtio level.=20
> It's not directly related to vDPA.
>
> For vDPA, vendor are freed to have their own technology to be hyper=20
> scalable (e.g SF, ADI or other stuffs).
>
> Thanks
>
>
>>
>> I don't follow.=20
>

