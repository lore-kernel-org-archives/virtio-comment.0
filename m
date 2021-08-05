Return-Path: <jasowang@redhat.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
References: <20210803032006.48881-1-jasowang@redhat.com>
 <YQpLP/NofUOMIsOA@stefanha-x1.localdomain>
 <67baffcb-1719-3909-9496-7eee1dde99af@redhat.com>
 <YQqNCMTwyubfNIkb@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d9cdd16a-43dd-4ae4-4423-8de333abb803@redhat.com>
Date: Thu, 5 Aug 2021 14:32:31 +0800
MIME-Version: 1.0
In-Reply-To: <YQqNCMTwyubfNIkb@stefanha-x1.localdomain>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com, Parav Pandit <parav@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>


在 2021/8/4 下午8:50, Stefan Hajnoczi 写道:
> On Wed, Aug 04, 2021 at 04:51:15PM +0800, Jason Wang wrote:
>> 在 2021/8/4 下午4:09, Stefan Hajnoczi 写道:
>>> On Tue, Aug 03, 2021 at 11:20:06AM +0800, Jason Wang wrote:
>>>> +for telling whether device MMU is enabled for the virtual device: 0
>>>> +means to enable and 1 means to disable.
>>>> +
>>>> +The VIRTIO_ADMIN_VQ_CTRL_MMU_ASID_SET is used to assign a device
>>>> +address space id to a virtqueue. The command-out-data is the queue
>>>> +index (\field{queue_index}) and the address space ID (\field{asid})
>>>> +assigned to it (as described in struct virtio_admin_ctrl_vdev_mmu_asid_set).
>>>> +
>>>> +The VIRTIO_ADMIN_VQ_CTRL_MMU_MAP is used to map the I/O Virtual
>>>> +Address range [\field{iova_start}, \field{iova_end}] to transport
>>>> +specific DMA address range [\field{dma_start}, \field{dma_start} +
>>>> + \field{iova_end} - \field{iova_start} + 1]. \field{flags} is used to
>>>> +specify the device access permission.
>>>> +
>>>> +The VIRTIO_ADMIN_VQ_CTRL_MMU_UNMAP is used to unmap all the mapped I/O
>>>> +Virtual Address ranges that are intersected with the range
>>>> +[\field{iova_start}, \field{iova_end}].
>>>> +
>>>> +There's no command-in-data for all the above four commands.
>>>> +
>>>> +The VIRTIO_ADMIN_VQ_CTRL_MMU_ERR_GET is used to get the error
>>>> +information of the device MMU. There's no command-out-data, the
>>>> +command-in-date is the queue index and its asid, the iova range and
>>>> +the access of the operation (as described in struct
>>>> +virtio_admin_ctrl_vdev_mmu_err).
>>>> +
>>>> +\devicenormative{Virtqueue Status}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Device MMU}
>>> Does the virtual device need to support running with the device MMU
>>> disabled?
>>
>> Yes, device MMU could be disabled.
> I'm a little surprised that there is no way to refuse to run without the
> device MMU because I got the impression using MMUs is required for
> security/isolation on modern systems.


Yes but only if the platform can't provide sub device isolation (e.g PASID).


>
> If I have a physical non-SR-IOV PCI management device, how does the
> virtual device access memory when the device MMU is disabled? Would its
> address space be identical to the management device's IOVA space?


Yes, it's the transport specific DMA address space.


> Maybe you can write a paragraph or two explaining how the address spaces
> of management and virtual devices are related?


Ok.


>
>>
>>>> +
>>>> +The management device MUST fail the device MMU command if \field{device_id} is
>>>> +zero.
>>>> +
>>>> +The management device MUST fail the VIRTIO_ADMIN_VQ_CTRL_MMU_MAP
>>>> +command if the iova range is intersected with a existing range.
>>>> +
>>>> +The management device MUST set both DEVICE_NEEDS_RESET and
>>>> +DEVICE_MMU_FAIL when the device MMU fails to do the translation for a
>>>> +virtual device.
>>>> +
>>>> +The device MMU for the virtual device MUST be disabled upon its reset.
>>>> +
>>>> +Upon reset, the virtual device must reset the Address Space ID for
>>>> +each virtqueue to 0.
>>>> +
>>>> +\drivernormative{Virtqueue Status}\label{sec:Virtio Transport Options
>>>> +  / Virtio Over Admin Virtqueue / Device MMU}
>>>> +
>>>> +The driver MAY choose to disable the device MMU but it MUST make sure
>>>> +the transport specific method could be used to provide a secure DMA
>>>> +context for each virtual device.
>>> What does this mean?
>>
>> It means when device MMU is disabled. The management driver must make sure a
>> platform specific feature like PASID capable IOMMU is used to isolate DMA
>> between the virtual devices.
> Ah, this is related to what I asked above. It's still not 100% clear to
> me.


It means, e.g the transport or platform support PASID. The management 
driver can choose to disable device MMU but use PASID for DMA isolation.


>
>>
>>> During which stages of the virtual device's lifecycle (ACKNOWLEDGE,
>>> DRIVER, FEATURES_OK, DRIVER_OK) may the management driver enable/disable
>>> the device MMU?
>>
>> My understanding is that it doesn't matter which stage. E.g it should be
>> safe to be enabled before DRIVER_OK since it doesn't have any virtqueue
>> operations.
>>
>> The driver just need to make sure:
>>
>> - device MMU is enabled before DRIVER_OK
>> - when device MMU is disabled, the transport/platform DMA hardware has been
>> setup
> Thanks, please include that information.


Ok.


>
>>> I tried to imagine what the virtio-blk vdev creation parameters need to
>>> look like. Here is what I came up with:
>>>
>>>     Virtual Device Creation Parameters for Block Devices
>>>     ----------------------------------------------------
>>>     The following creation parameters specify the details of a new virtual
>>>     block device:
>>>
>>>     Field        Type   Meaning
>>>     ----------------------------------------------------------------------
>>>     blkdev_id    u64    Identifier of the underlying block device that
>>>                         provides storage. The enumeration and creation of
>>>                         underlying block devices is
>>>                         implementation-specific.
>>>     num_queues   u16    Number of request virtqueues.
>>>     features_len u8     Number of elements in features[].
>>
>> For 'elements' do you mean the 'u32 elements'?
> Yes, u32 array elements.
>
>>>     features[]   u32    Device feature bits to report.
>>>
>>>     Creation error codes are as follows:
>>>
>>>     Error               Meaning
>>>     ----------------------------------------------------------------------
>>>     INVALID_BLKDEV_ID   The underlying block device does not exist.
>>>     BLKDEV_BUSY         The underlying block device is already in use.
>>>     BLKDEV_READ_ONLY    The underlying block device is read-only.
>>>     INVALID_NUM_QUEUES  The number of request queues was 0 or too large.
>>>     UNSUPPORTED_FEATURE A feature bit was given that the device does not
>>>                         support.
>>>
>>>     If the VIRTIO_BLK_F_RO bit is set in features[] then the underlying
>>>     block device is made available for read-only access.
>>>
>>>     Creation MAY fail with BLKDEV_BUSY if a blkdev_id value that is
>>>     already in use is given.
>>>
>>>     Creation MAY fail with BLKDEV_READ_ONLY if the underlying block device
>>>     does not support writes and the VIRTIO_BLK_F_RO bit is not set in
>>>     features[].
>>>
>>>     The configuration space parameters (see 5.2.4 Device configuration
>>>     layout) are determined by the device based on the underlying block
>>>     device capacity, block size, etc.
>>>
>>> Note that this doesn't allow overriding configuration space parameters
>>> (e.g. block size). We probably need to support that in the future for
>>> live migration compatibility.
>>
>> I wonder do we need those configuration to be self-descriptive? E.g how did
>> the device know that the config contains the blk_size. (I guess it's not a
>> good practice to infer this from the config len).
> The device configuration space size and layout is determined by the
> device feature bits.


So blk_size doesn't belong to any feature. I guess it means we should 
start the support of blk_size from day 0.

I had some discussion with Parav about this in the series that 
introduces the netlink extension for setting up the device.

I guess this is what we want:

struct virtio_config {
attribute_X; //only exist when feature X existing
attribute_Y; //only exist when feature Y existing
...
};

Thanks


>
> Stefan

