Return-Path: <lingshan.zhu@intel.com>
Message-ID: <1f82b84c-db9d-69c1-6a41-a4573036ce0c@intel.com>
Date: Tue, 9 Aug 2022 16:36:43 +0800
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH V3 RESEND 1/4] Introduce virito transport
 virtqueue
References: <20220805095343.486546-1-lingshan.zhu@intel.com>
 <20220805095343.486546-2-lingshan.zhu@intel.com>
 <CACGkMEt7uCOKrnxJMBMFbRtKicH42eHPBOuODao33XCEvRY=Ow@mail.gmail.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <CACGkMEt7uCOKrnxJMBMFbRtKicH42eHPBOuODao33XCEvRY=Ow@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: Jason Wang <jasowang@redhat.com>
Cc: mst <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, nrupal.jani@intel.com, "Uminski, Piotr" <Piotr.Uminski@intel.com>, hang.yuan@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>



On 8/8/2022 5:12 PM, Jason Wang wrote:
> On Fri, Aug 5, 2022 at 6:02 PM Zhu Lingshan <lingshan.zhu@intel.com> wrote:
>> This commit introduces transport virtqueue as a new transport
>> layer for virtio devices. And the format of the commands
>> through the transport virtqueue is defined as well.
>>
>> We also give examples for the management devices and the
>> managed devices.
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>> ---
>>   content.tex      | 81 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   introduction.tex |  3 ++
>>   2 files changed, 84 insertions(+)
>>
>> diff --git a/content.tex b/content.tex
>> index e863709..c747d21 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -2895,6 +2895,87 @@ \subsubsection{Resetting Devices}\label{sec:Virtio Transport Options / Virtio ov
>>   MAY also choose to verify reset completion by reading \field{device status} via
>>   CCW_CMD_READ_STATUS and checking whether it is 0 afterwards.
>>
>> +\section{Virtio Over Transport Virtqueue}\label{sec:Virtio Transport Options Virtio Over Transport Virtqueue}
>> +
>> +In some cases, it is challenging to implement a virtio device in a transport specific method.
>> +
>> +One example is that a physical device may try to present multiple managed (maybe virtual) devices
>> +with limited transport specific resources.
> We haven't introduced the concept of managed devices, so I'd suggest
> to simply say
>
> "try to present multiple virtio devices ..."
will fix it
>
>> +
>> +Another example is to implement managed devices which are transport independent.
> Ditto, we'd better not talk managed/management before we introduce the
> concept of them.
OK
>
>> +
>> +In those cases, a transport virtqueue could be used as the transport layer to
>> +implement virtio managed device.
> I'd suggest introducing the concept of management/managed device first.
this is the first paragraph, maybe too early to introduce management / 
managed devices before the feature bit,
I will avoid talking about management/managed devices before define 
them(right below this paragraph).
>
>> +
>> +\subsection{Basic Concepts}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Basic Concepts}
>> +
>> +Feature bit VIRTIO_F_TRANSPT_VQ indicates that a device offers a transport virtqueue,
>> +and the managed devices are created, destroyed and configured through the transport virtqueue.
>> +
>> +\subsubsection{The Management Device}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Basic Concepts / The Management Device}
>> +
>> +A device that offers feature bit VIRTIO_F_TRANSPT_VQ and a transport virtqueue is a management device.
>> +It processes the commands through the transport virtqueue commands.
> I think we need to be verbose here, e.g what did those transport
> virtqueue commands do? What's the relationship between management
> device and managed device?
I will add an overview of the transport virtqueue commands here, and a 
description of the relationship in the "managed device" section.
>
>> +
>> +For example, a PCIe device with a transport virtqueue is a management device.
>> +
>> +\devicenormative{\subsubsection}{The Management Device}{Virtio Transport Options / Virtio Over Transport Virtqueue / Basic Concepts / The management Device}
>> +
>> +The management device MUST offer feature bit VIRTIO_F_TRANSPT_VQ and a transport virtqueue as a device specific virtqueue.
> I don't get the meaning of this. Each type of virtqueue must be probed
> in a device specific way (e.g the virtqueues subsection in the spec)?
I will remove "as a device specific virtqueue."
>
>> +
>> +\subsubsection{The Managed Device}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Basic Concepts / The Managed Device}
>> +
>> +A managed device is a kind of device that is created through a transport virtqueue,
>> +and utilizes the transport virtqueue as its transport layer.
> Do we need to say e.g the relationship with the management device?
I will emphasize the relationship with the management device here, says
the managed device is created/destroyed/ and configured by the management
device through the transport vq
>
> And we need to define managed devices more accurately, E.g it should
> be isolated from other managed devices so it can be assigned to a
> guest independently. For isolation, it probably means
> interrupt/DMA/P2P (PCI example). Or maybe we can have an example of
> managed device that is implemented via PCI?
OK, we can add these in the device requirements of managed devices
>
> And spec said:
>
> "Virtio can use various different buses, thus the standard is split
> into virtio general and bus-specific sections."
>
> We need to tweak this to say virtio can use transport virtqueue at least?
I will add: virtio uses transport virtqueue to implement managed devices.
>
>> +
>> +An example of managed devices is a Scalable I/O Virtualization \hyperref[intro:SIOV]{[SIOV]} device which is created and managed
> Let's try to use SIOV terminology here, I guess it should be "VDEV"?
Yes, it is VDEV
>
>> +through a transport virtqueue of a management device.
>> +
>> +\subsubsection{Managed Devices Dscovery}\label{sec:Virtio Transport Options /Virtio Over Transport Virtqueue / Managed Devices Discovery}
>> +
>> +Managed devices are created and discovered through a transport virtqueue.
>> +
>> +\subsubsection{Managed Devices Interrupts}\label{sec:Virtio Transport Options /Virtio Over Transport Virtqueue / Managed Devices Interrupts}
>> +
>> +The managed devices utilize MSI (Message Signaled Interrupts) to send interrupts,
> We can remove "to send interrupts".
I think at least we need "for interrupts", or this is not a completed 
sentence.
>
>> there are no legacy interrupts.
>> +
>> +A MSI entry is  composed of a 32-bit data payload and a 64-bit address.
> We probably need to be more verbose here, what's the use of payload and address?
I think this is the MSI concept, do we need to explain it here? The 
concepts, e.g., payload initialization
can be architecture specific
>
>> +
>> +\devicenormative{\subsubsection}{The Managed Device}{sec:Virtio Transport Options /Virtio Over Transport Virtqueue / The Managed Device}
>> +
>> +The managed device MUST not share its MSI entries with another manged device or with the management device.
> Not sure why this is needed since this would be obvious in the
> subsection of MSI storage.
we did not describe this in the MSI commands section yet, we need this 
because the interrupt
source should be isolated, and SIOV spec says this.
>
>> +
>> +\subsection{Format of Commands through Transport Virtqueue}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Format of Commands through Transport Virtqueue}
>> +
>> +All transport virtqueue commands are of the following form:
>> +
>> +\begin{lstlisting}
>> +struct virtio_transportq_ctrl {
>> +        u64 device_id;
>> +        u16 class;
>> +        u16 command;
>> +        u8 command-out-data[];
>> +        u32 ack;
>> +        u8 command-in-data[];
>> +};
>> +
>> +/* ack values */
>> +#define VIRTIO_TRANSPTQ_OK     0
>> +#define VIRTIO_TRANSPTQ_ERR    255
> Any reason starting from 255?
actually it is ending with 255, remember we have other error codes like 
EINVAL and EAGAIN
between 0 and 255. I think we can define ERR as 1 since we have removed 
other codes.
>
>> +\end{lstlisting}
>> +
>> +The \field{device_id}, \field{class}, \field{command} and
>> +\field{command-out-data} are set by the management device driver,
>> +and the device sets \field{ack} and \field{command-in-data}.
> "management device" actually?
Not sure, it can be the managed device, so I only use "the device".
How about "the management device or the managed device"?
And replace "the management device driver" with "the management device 
driver or the managed device driver"
>
>> +
>> +\field{device_id} is a UUID to identify a virtio managed device,
> It's not a UUID actually, it would be sufficient to be unique among
> the managed devices which belong to a single management device.
Yes is should be a unique device ID, I think UUID is perfectly meet this
requirement so that we don't need to define the rules and concepts of 
the ID
>
>> +which defined in \hyperref[intro:rfc4122]{RFC4122}. The management device allocates this UUID,
>> +it should be unique in the management device context.
>> +
>> +The \field{device_id} value 0 is used to identify the management device itself.
>> +
>> +\field{class} is an identifier of a set of commands with similar  purposes.
>> +
>>   \chapter{Device Types}\label{sec:Device Types}
>>
>>   On top of the queues, config space and feature negotiation facilities
>> diff --git a/introduction.tex b/introduction.tex
>> index a9491cf..94a1b51 100644
>> --- a/introduction.tex
>> +++ b/introduction.tex
>> @@ -80,6 +80,9 @@ \section{Normative References}\label{sec:Normative References}
>>          \phantomsection\label{intro:SCMI}\textbf{[SCMI]} &
>>          Arm System Control and Management Interface, DEN0056,
>>          \newline\url{https://developer.arm.com/docs/den0056/c}, version C and any future revisions\\
>> +       \phantomsection\label{intro:SIOV}\textbf{[SIOV]} &
>> +       Scalable I/O Virtualization,
>> +       \newline\url{https://www.opencompute.org/documents/ocp-scalable-io-virtualization-technical-specification-revision-1-v1-2-pdf}\\
>>
>>   \end{longtable}
>>
>> --
>> 2.35.3
>>
>>
>> This publicly archived list offers a means to provide input to the
>> OASIS Virtual I/O Device (VIRTIO) TC.
>>
>> In order to verify user consent to the Feedback License terms and
>> to minimize spam in the list archive, subscription is required
>> before posting.
>>
>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> List help: virtio-comment-help@lists.oasis-open.org
>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>> Committee: https://www.oasis-open.org/committees/virtio/
>> Join OASIS: https://www.oasis-open.org/join/
>>

