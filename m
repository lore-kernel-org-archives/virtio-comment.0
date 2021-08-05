Return-Path: <jasowang@redhat.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
References: <20210803032006.48881-1-jasowang@redhat.com>
 <892f7853-1d30-5435-2c19-ace9b1028c99@nvidia.com>
 <b750f804-9a8a-e37b-a0e7-40ecf291157a@redhat.com>
 <f2701248-10c1-aa4e-8cc8-419937b1ee8b@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <87f6dd9b-f2fb-e68e-0ec7-0fdbb1a2ccb2@redhat.com>
Date: Thu, 5 Aug 2021 09:36:40 +0800
MIME-Version: 1.0
In-Reply-To: <f2701248-10c1-aa4e-8cc8-419937b1ee8b@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Max Gurtovoy <mgurtovoy@nvidia.com>, virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, cohuck@redhat.com, stefanha@redhat.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


在 2021/8/4 下午6:20, Max Gurtovoy 写道:
>
> On 8/4/2021 4:37 AM, Jason Wang wrote:
>>
>> 在 2021/8/3 下午8:40, Max Gurtovoy 写道:
>>>>
>>>> +Sometimes it's hard to implement the device in a transport specific
>>>> +method. One example is that a physical device may try to present
>>>> +multiple virtual devices with a limited transport specific
>>>> +resources. Another example is to implement virtual devices which is
>>>> +transport independent. In those cases, the admin virtqueue 
>>>> provided by
>>>> +the management device could be used to replace the transport specific
>>>> +method to implement the virtual device. Then the presenting of the
>>>> +virtual device is done through the cooperation between the admin
>>>> +virtqueue and the driver.
>>>
>>> maybe it's me, but I can't understand how admin queue is a transport.
>>
>>
>> The transport is the method that provides basic facility. In this 
>> proposal, the admin virtqueue is used to provide basic facility for 
>> the virtual device. That is to say, it's the transport for virtual 
>> device.
>>
>>
>>>
>>> And how can I use admin queue transport to migrate VFs that are 
>>> controlled by virtio PCI PF.
>>
>>
>> This live migration support and the admin virtqueue transport are 
>> orthogonal. The main motivation of this proposal is used for 
>> implementing virtual device transport via admin virtqueue. It's not 
>> hard to add new commands for doing live migration for the virtual 
>> device, I don't do that since I believe it's expected to be addressed 
>> in your proposal.
>
> so why do you call it in the same name that I used in my RFC ? This is 
> confusing and causing problems.


Max,

I really think the game of "who comes first" is meaningless.

I've used the terminology like "admin virtqueue" sometime early this year:

https://lists.oasis-open.org/archives/virtio-comment/202101/msg00034.html

I start the work of the admin virtqueue as a transport since then and I 
think I don't say "you call it the same name that I used before".


>
> You are working on a parallel feature and reviewing my RFC as if it 
> was instead of your proposal.


Firstly, though they may have the same interface/commands, the two 
proposals serves for completely different goals.

Secondly, it's about how to justify your proposal in the community, and 
I think I don't get the convincing answers for the following two points:

1) I have said that your proposal of using admin virtqueue for doing 
live migration makes sense, but we need the per function interface for 
nested virt

2) I've pointed out that using the general vitqueue for carrying vendor 
specific command breaks the efforts of spec as a standard device

Lastly, this proposal is RFC, it's not perfect for sure. The most 
important thing for the current stage is not about how and when this can 
be merged but whether or not this approach can work. I post them now 
since a talk about the hyper scalability will be given at the KVM Forum 
then I need to post this as one of the approach before as a reference. 
There are vendors that are asking something like this as a reference for 
having better scalability than SR-IOV.


>
> IIUC, in your proposal a non SRIOV device parent will create admin 
> queue and using this admin queue you'll be able to create children 
> devices and their transport will be admin queue.
>
> That means that the configuration cycles will be trapped by the parent 
> device somehow.


That's the way for having better scalability. And this is also the 
approach that SIOV used.


>
> This also means we need to merge my RFC first to create infrastructure 
> for this RFC.


It doesn't matter which will be merged. We should guarantee:

1) The idea is justified by the community
2) The merged proposal is extensible for accepting new features and commands

For 2) I think both proposals can do that. And to me, it's not hard to 
switch to the similar interface as you invent.


>
> For admin management that you'll need probably virtio-cli tool from 
> user space.


What does virtio-cli do? We've already had vdpa that is integrated into 
iproute2.

And let me clarify the concept again: vDPA is a superset of virtio. That 
means virtio could be treated as one kind of vDPA.

In this sense, I don't see a value of re-inventing the wheels again in 
the virtio-cli.


>
> So this proposal is complementary to mine. Your management device will 
> negotiate "my" admin_queue feature and you'll need to add more 
> commands to this admin queue that are probably in transport specific 
> domain to create children.


I think we can go either:

1) Make two virtqueues separately

or

2) Using a single virtqueue

And I would like to co-operate if 2) makes more sense.


>
> You do need to handle the configuration cycles that this management 
> parent device will need to support.


My proposals have already supported basic management like device 
creation and destroy. And I think it's not hard to extend it to other.

To reduce the complexity, I've stripped out a lot of features from the 
first RFC. It's better to start from the minimal set.

Thanks


>
>
>>
>> For virtual device, it's a independent virtio device that could be 
>> assigned to secure DMA context/domain,  it is functional equivalent 
>> ADI or SF. The difference is that it can work with or without 
>> platform support (SIOV or PASID).
>>
>>
>>>
>>> And why the regular admin queue that is part of the device queues 
>>> can't fit to your needs ?
>>
>>
>> For "regular admin queue", did you mean your proposal. Actually, it's 
>> not conflict, we can unify the interface though the motivation is 
>> different.
>>
>>
>>>
>>> Can you explain your needs ? is it to create a vDPA device from some 
>>> SW interface ?
>>
>>
>> As stated in the patch, the needs are:
>>
>> - Presenting virtual devices with limited transport specific resources
>> - Presenting virtual devices without platform support (e.g SR-IOV or 
>> SIOV)
>>
>> We want virtio to have hyper-scalability via slicing at virtio level. 
>> It's not directly related to vDPA.
>>
>> For vDPA, vendor are freed to have their own technology to be hyper 
>> scalable (e.g SF, ADI or other stuffs).
>>
>> Thanks
>>
>>
>>>
>>> I don't follow. 
>>
>

