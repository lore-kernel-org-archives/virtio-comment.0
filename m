Return-Path: <jasowang@redhat.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
References: <20210803032006.48881-1-jasowang@redhat.com>
 <892f7853-1d30-5435-2c19-ace9b1028c99@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b750f804-9a8a-e37b-a0e7-40ecf291157a@redhat.com>
Date: Wed, 4 Aug 2021 09:37:25 +0800
MIME-Version: 1.0
In-Reply-To: <892f7853-1d30-5435-2c19-ace9b1028c99@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Max Gurtovoy <mgurtovoy@nvidia.com>, virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, cohuck@redhat.com, stefanha@redhat.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


在 2021/8/3 下午8:40, Max Gurtovoy 写道:
>>
>> +Sometimes it's hard to implement the device in a transport specific
>> +method. One example is that a physical device may try to present
>> +multiple virtual devices with a limited transport specific
>> +resources. Another example is to implement virtual devices which is
>> +transport independent. In those cases, the admin virtqueue provided by
>> +the management device could be used to replace the transport specific
>> +method to implement the virtual device. Then the presenting of the
>> +virtual device is done through the cooperation between the admin
>> +virtqueue and the driver.
>
> maybe it's me, but I can't understand how admin queue is a transport.


The transport is the method that provides basic facility. In this 
proposal, the admin virtqueue is used to provide basic facility for the 
virtual device. That is to say, it's the transport for virtual device.


>
> And how can I use admin queue transport to migrate VFs that are 
> controlled by virtio PCI PF.


This live migration support and the admin virtqueue transport are 
orthogonal. The main motivation of this proposal is used for 
implementing virtual device transport via admin virtqueue. It's not hard 
to add new commands for doing live migration for the virtual device, I 
don't do that since I believe it's expected to be addressed in your 
proposal.

For virtual device, it's a independent virtio device that could be 
assigned to secure DMA context/domain,  it is functional equivalent ADI 
or SF. The difference is that it can work with or without platform 
support (SIOV or PASID).


>
> And why the regular admin queue that is part of the device queues 
> can't fit to your needs ?


For "regular admin queue", did you mean your proposal. Actually, it's 
not conflict, we can unify the interface though the motivation is different.


>
> Can you explain your needs ? is it to create a vDPA device from some 
> SW interface ?


As stated in the patch, the needs are:

- Presenting virtual devices with limited transport specific resources
- Presenting virtual devices without platform support (e.g SR-IOV or SIOV)

We want virtio to have hyper-scalability via slicing at virtio level. 
It's not directly related to vDPA.

For vDPA, vendor are freed to have their own technology to be hyper 
scalable (e.g SF, ADI or other stuffs).

Thanks


>
> I don't follow. 

