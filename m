Return-Path: <jasowang@redhat.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
References: <20210803032006.48881-1-jasowang@redhat.com>
 <YQlX4XCJ+dVA/zFR@stefanha-x1.localdomain>
 <6cc4603e-2c82-4ff5-fb0a-fbfaaac25663@redhat.com>
 <YQo2LmjnfW/fa2eT@stefanha-x1.localdomain>
 <ff1d8d47-390a-1428-532d-8a7349f0e664@redhat.com>
 <YQqOaA6/PHNmfFV+@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cd3a78d6-9490-9c15-f3b9-d4d1c7c71dd5@redhat.com>
Date: Thu, 5 Aug 2021 14:33:27 +0800
MIME-Version: 1.0
In-Reply-To: <YQqOaA6/PHNmfFV+@stefanha-x1.localdomain>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


在 2021/8/4 下午8:56, Stefan Hajnoczi 写道:
> On Wed, Aug 04, 2021 at 04:39:24PM +0800, Jason Wang wrote:
>> 在 2021/8/4 下午2:39, Stefan Hajnoczi 写道:
>>> On Wed, Aug 04, 2021 at 11:01:39AM +0800, Jason Wang wrote:
>>>> 在 2021/8/3 下午10:51, Stefan Hajnoczi 写道:
>>>>> On Tue, Aug 03, 2021 at 11:20:06AM +0800, Jason Wang wrote:
>>>>>> +\subsection{Admin Virtqueue Capabilities}\label{sec:Virtio Transport Options / Virtio Over Admin Virtqueue / Admin Virtqueue Capabilities}
>>>>>> +
>>>>>> +The capabilites that are supported by the admin virtqueue could be
>>>>>> +fetched through the following commands:
>>>>>> +
>>>>>> +\begin{lstlisting}
>>>>>> +#define VIRTIO_ADMIN_CTRL_CAP    0
>>>>>> + #define VIRTIO_ADMIN_CTRL_CAP_GET        0
>>>>>> +\end{lstlisting}
>>>>>> +
>>>>>> +The VIRTIO_ADMIN_CTRL_CAP_GET is used to get the capabilites that are
>>>>>> +supported by the admin virtqueue through a u64 which is a bit mask of
>>>>>> +the capabilies in command-in-data. There's no command-out-data.
>>>>> I'm not sure what this paragraph is describing. Is VIRTIO_ADMIN_CTRL_CAP
>>>>> a struct virtio_admin_ctrl::command value?
>>>> VIRTIO_ADMIN_CTRL_CAP is the class, VIRTIO_ADMIN_CTRL_CAP_GET is the
>>>> command.
>>> Okay. I found the admin virtqueue command descriptions hard to read, not
>>> just because the class/command definitions weren't obvious to me, but
>>> also because the command/response layout is described in English instead
>>> of a table or C-like notation.
>>>
>>> I think something like this would make the commands easier to
>>> understand:
>>>
>>>     Capabilities supported by the admin virtqueue are fetched as follows:
>>>
>>>     Driver->Device:
>>>     Field       Value                          Type
>>>     -----------------------------------------------
>>>     device_id   0                              u64
>>>     class       VIRTIO_ADMIN_CTRL_CAP (0)      u16
>>>     command     VIRTIO_ADMIN_CTRL_CAP_GET (0)  u16
>>>
>>>     Device->Driver:
>>>     Field         Value                        Type
>>>     -----------------------------------------------
>>>     ack           VIRTIO_ADMIN_OK (0)          u8
>>>     capabilities  <supported capability bits>  u64
>>
>> I just follows styles that is used in virtio-net control vq:
>>
>>
>> \begin{lstlisting}
>> #define VIRTIO_NET_CTRL_MQ    4
>>   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0 (for automatic receive
>> steering)
>>   #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1 (for configurable receive
>> steering)
>>   #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2 (for configurable hash
>> calculation)
>> \end{lstlisting}
>>
>> ...
>>
>> Do you suggest to change that as well?
> My preference is to change it because I think describing inputs/outputs
> in English makes it hard to understand the exact binary layout.


Ok.


>
>>
>>>>> Another question: I wonder why there is an admin virtqueue feature bit
>>>>> instead of a new VIRTIO device ID for the management device? Does this
>>>>> mean regular virtio-net, virtio-blk, etc devices can have an admin queue
>>>>> in addition to their normal role?
>>>> I think so, I just follow the normal networking PF role which is usually a
>>>> network device which allows some kind of remote management.
>>>>
>>>> But it doesn't forbid us to create the management device.
>>>>
>>>> I think it's better to not mandate the management device for now, or is
>>>> there any reason for doing that?
>>> Since the admin virtqueue is generic infrastructure (not specific to
>>> vdev management) I think it makes sense to use a feature bit and not a
>>> separate management device. This wasn't obvious to me from this
>>> document, maybe the text can be tweaked to clearly separate the
>>> (generic) admin virtqueue from vdev management.
>>
>> Maybe adding a device normative like
>>
>> "
>>
>> The management device MUST offer the admin virtqueue is a device specific
>> virtqueue.
>>
>> "
> Yes, with
> s/is/as/


Right.

Thanks


