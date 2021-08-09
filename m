Return-Path: <jasowang@redhat.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
References: <20210803032006.48881-1-jasowang@redhat.com>
 <YQpLP/NofUOMIsOA@stefanha-x1.localdomain>
 <67baffcb-1719-3909-9496-7eee1dde99af@redhat.com>
 <YQqNCMTwyubfNIkb@stefanha-x1.localdomain>
 <d9cdd16a-43dd-4ae4-4423-8de333abb803@redhat.com>
 <YQvuqDPr/meoRJNB@stefanha-x1.localdomain>
 <20210805150748-mutt-send-email-mst@kernel.org>
 <916c6f89-9fdd-3271-9f5c-15f1d81316d8@redhat.com>
 <20210806044426-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a1b85391-d698-d234-6fbf-236ad81cbb58@redhat.com>
Date: Mon, 9 Aug 2021 11:10:45 +0800
MIME-Version: 1.0
In-Reply-To: <20210806044426-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, cohuck@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com, Parav Pandit <parav@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>


在 2021/8/6 下午4:47, Michael S. Tsirkin 写道:
> On Fri, Aug 06, 2021 at 10:39:48AM +0800, Jason Wang wrote:
>> 在 2021/8/6 上午3:19, Michael S. Tsirkin 写道:
>>> On Thu, Aug 05, 2021 at 02:59:04PM +0100, Stefan Hajnoczi wrote:
>>>> On Thu, Aug 05, 2021 at 02:32:31PM +0800, Jason Wang wrote:
>>>>> 在 2021/8/4 下午8:50, Stefan Hajnoczi 写道:
>>>>>> On Wed, Aug 04, 2021 at 04:51:15PM +0800, Jason Wang wrote:
>>>>>>> 在 2021/8/4 下午4:09, Stefan Hajnoczi 写道:
>>>>>>>> On Tue, Aug 03, 2021 at 11:20:06AM +0800, Jason Wang wrote:
>>>>>>>> I tried to imagine what the virtio-blk vdev creation parameters need to
>>>>>>>> look like. Here is what I came up with:
>>>>>>>>
>>>>>>>>       Virtual Device Creation Parameters for Block Devices
>>>>>>>>       ----------------------------------------------------
>>>>>>>>       The following creation parameters specify the details of a new virtual
>>>>>>>>       block device:
>>>>>>>>
>>>>>>>>       Field        Type   Meaning
>>>>>>>>       ----------------------------------------------------------------------
>>>>>>>>       blkdev_id    u64    Identifier of the underlying block device that
>>>>>>>>                           provides storage. The enumeration and creation of
>>>>>>>>                           underlying block devices is
>>>>>>>>                           implementation-specific.
>>>>>>>>       num_queues   u16    Number of request virtqueues.
>>>>>>>>       features_len u8     Number of elements in features[].
>>>>>>> For 'elements' do you mean the 'u32 elements'?
>>>>>> Yes, u32 array elements.
>>>>>>
>>>>>>>>       features[]   u32    Device feature bits to report.
>>>>>>>>
>>>>>>>>       Creation error codes are as follows:
>>>>>>>>
>>>>>>>>       Error               Meaning
>>>>>>>>       ----------------------------------------------------------------------
>>>>>>>>       INVALID_BLKDEV_ID   The underlying block device does not exist.
>>>>>>>>       BLKDEV_BUSY         The underlying block device is already in use.
>>>>>>>>       BLKDEV_READ_ONLY    The underlying block device is read-only.
>>>>>>>>       INVALID_NUM_QUEUES  The number of request queues was 0 or too large.
>>>>>>>>       UNSUPPORTED_FEATURE A feature bit was given that the device does not
>>>>>>>>                           support.
>>>>>>>>
>>>>>>>>       If the VIRTIO_BLK_F_RO bit is set in features[] then the underlying
>>>>>>>>       block device is made available for read-only access.
>>>>>>>>
>>>>>>>>       Creation MAY fail with BLKDEV_BUSY if a blkdev_id value that is
>>>>>>>>       already in use is given.
>>>>>>>>
>>>>>>>>       Creation MAY fail with BLKDEV_READ_ONLY if the underlying block device
>>>>>>>>       does not support writes and the VIRTIO_BLK_F_RO bit is not set in
>>>>>>>>       features[].
>>>>>>>>
>>>>>>>>       The configuration space parameters (see 5.2.4 Device configuration
>>>>>>>>       layout) are determined by the device based on the underlying block
>>>>>>>>       device capacity, block size, etc.
>>>>>>>>
>>>>>>>> Note that this doesn't allow overriding configuration space parameters
>>>>>>>> (e.g. block size). We probably need to support that in the future for
>>>>>>>> live migration compatibility.
>>>>>>> I wonder do we need those configuration to be self-descriptive? E.g how did
>>>>>>> the device know that the config contains the blk_size. (I guess it's not a
>>>>>>> good practice to infer this from the config len).
>>>>>> The device configuration space size and layout is determined by the
>>>>>> device feature bits.
>>>>> So blk_size doesn't belong to any feature. I guess it means we should start
>>>>> the support of blk_size from day 0.
>>>> The device creation parameters can either include a full configuration
>>>> space-sized blob:
>>>>
>>>>     Field        Type                      Meaning
>>>>     ----------------------------------------------------------------------
>>>>     init_config  struct virtio_blk_config  Initial contents of the
>>>>                                            configuration space.
>>>>
>>>> or they can include individual fields (basically
>>>> re-define them outside struct virtio_foo_config):
>>>>
>>>>     Field        Type        Meaning
>>>>     ----------------------------------------------------------------------
>>>>     blk_size     u32         Block size.
>>>>
>>>> Which approach to use depends on how much of the configuration space
>>>> should be settable at device creation time. If most of it will be
>>>> initialized by the device and isn't configurable, then embedding the
>>>> entire struct is not necessary.
>>>> Additionally, there must be a flags field in the device creation
>>>> parameters for indicating which configuration space fields or individual
>>>> fields described above to use. This allows you to accept the default
>>>> blk_size value instead of providing your own value:
>>>>
>>>>     Field       Type         Meaning
>>>>     ----------------------------------------------------------------------
>>>>     init_flags  u64          Use the corresponding field value to
>>>>                              initialize the device configuration space if
>>>> 			   the flag is set:
>>>>
>>>> 			     INIT_BLK_SIZE (1 << 0)
>>>>
>>>>> I had some discussion with Parav about this in the series that introduces
>>>>> the netlink extension for setting up the device.
>>>>>
>>>>> I guess this is what we want:
>>>>>
>>>>> struct virtio_config {
>>>>> attribute_X; //only exist when feature X existing
>>>>> attribute_Y; //only exist when feature Y existing
>>>>> ...
>>>>> };
>>>> That's more or less how configuration space layout works today. We don't
>>>> have explicit comments in the header file but when feature X is enabled
>>>> the driver may access virtio_config::attribute_X.
>>>>
>>>> Stefan
>>> Two things I know about network devices
>>> - some VF configuration isn't in config space at all
>>>     since config space describes guest visible fields.
>>>     E.g. a vlan tag to be attached to all packets.
>>
>> Yes, they are done via cvq. But we are discussing the way to implement the
>> virtual device provisioning. In this case we probably don't need to care
>> about vlan.
> Looks like I'm unclear. Host might want to attach a vlan to all packets
> going through a VF transparently to guest. This is not something that
> can be controlled through a cvq, that is guest visible.


I see, so I think we need to standardize them in the spec first. Then we 
can introduce the API for device provisioning.


>
>
>>> - some VF configuration is normally settable by PF without
>>>     destroying/recreating the VF.
>>>     E.g. the default MAC address.
>>
>> Right, it depends on the device features which should be contained in the
>> config blob. So if the device doesn't allow the mac to be changed, we can
>> fail the device creation.
> Again I am trying to make a distinction. Guest settable mac can be off but
> host can set mac almost universally. this is not something that is
> covered by features - features cover guest visible aspects.


Right, see above. I think we need to standardize the mac configuration 
as well.

Thanks


>>> Does blk have such configuration?
>>
>> I guess so. E.g the geometry and topology?
>>
>> Thanks
>>
>>
>>>
>>>

