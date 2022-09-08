Return-Path: <virtio-comment-return-3440-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BC29D986538
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Sep 2022 06:44:20 +0000 (UTC)
Message-ID: <7738dac6-d8ee-92d4-697c-5e8de7b47c06@intel.com>
Date: Thu, 8 Sep 2022 14:44:05 +0800
MIME-Version: 1.0
References: <20220826100034.200432-1-lingshan.zhu@intel.com>
 <20220826100034.200432-2-lingshan.zhu@intel.com>
 <1b89ee30-463e-23ae-9616-746f48ec6fa4@redhat.com>
 <20220908013614-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20220908013614-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] Re: [PATCH V4 1/4] Introduce virito transport
 virtqueue
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>



On 9/8/2022 1:38 PM, Michael S. Tsirkin wrote:
> On Thu, Sep 08, 2022 at 11:18:10AM +0800, Jason Wang wrote:
>> =E5=9C=A8 2022/8/26 18:00, Zhu Lingshan =E5=86=99=E9=81=93:
>>> This commit introduces transport virtqueue as a new transport
>>> layer for virtio devices. And the format of the commands
>>> through the transport virtqueue is defined as well.
>>>
>>> We also give examples for the management devices and the
>>> managed devices.
>>>
>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>> ---
>>>    content.tex      | 113 +++++++++++++++++++++++++++++++++++++++++++++=
++
>>>    introduction.tex |   3 ++
>>>    2 files changed, 116 insertions(+)
>>>
>>> diff --git a/content.tex b/content.tex
>>> index e863709..0f2dee4 100644
>>> --- a/content.tex
>>> +++ b/content.tex
>>> @@ -2895,6 +2895,119 @@ \subsubsection{Resetting Devices}\label{sec:Vir=
tio Transport Options / Virtio ov
>>>    MAY also choose to verify reset completion by reading \field{device =
status} via
>>>    CCW_CMD_READ_STATUS and checking whether it is 0 afterwards.
>>> +\section{Virtio Over Transport Virtqueue}\label{sec:Virtio Transport O=
ptions Virtio Over Transport Virtqueue}
>>> +
>>> +In some cases, it is challenging to implement a virtio device in a tra=
nsport specific method.
>>> +
>>> +One example is that a physical device may try to present multiple virt=
io (maybe virtual) devices
>>> +with limited transport specific resources.
>>> +
>>> +Another example is to implement transport-independent virtio devices.
>>> +In those cases, a transport virtqueue could be used as the transport l=
ayer to
>>> +implement virtio managed device.
>>> +
>>> +\subsection{Basic Concepts}\label{sec:Virtio Transport Options / Virti=
o over Transport Virtqueue / Basic Concepts}
>>> +
>>> +Feature bit VIRTIO_F_TRANSPT_VQ indicates that a device offers a trans=
port virtqueue.
>>> +
>>> +\subsubsection{The Management Device}\label{sec:Virtio Transport Optio=
ns / Virtio over Transport Virtqueue / Basic Concepts / The Management Devi=
ce}
>>> +
>>> +A device that offers feature bit VIRTIO_F_TRANSPT_VQ and a transport v=
irtqueue is a management device.
>>> +
>>> +For example, a PCIe device with a transport virtqueue and offers VIRTI=
O_F_TRANSPT_VQ is a management device.
>>> +
>>> +A set of management commands with a format defined in section \ref{sec=
:Virtio Transport Options / Virtio over Transport Virtqueue / Format of Com=
mands through Transport Virtqueue}
>>> +is processed over the transport virtqueue.
>>> +
>>> +\devicenormative{\subsubsection}{The Management Device}{Virtio Transpo=
rt Options / Virtio Over Transport Virtqueue / Basic Concepts / The managem=
ent Device}
>>> +
>>> +The management device MUST offer feature bit VIRTIO_F_TRANSPT_VQ and a=
 transport virtqueue.
>>> +
>>> +\subsubsection{The Managed Device}\label{sec:Virtio Transport Options =
/ Virtio over Transport Virtqueue / Basic Concepts / The Managed Device}
>>> +
>>> +A managed device is a kind of device that is created, destroyed and co=
nfigured through a transport virtqueue,
>>> +it utilizes the transport virtqueue as its transport layer.
>>> +
>>> +Virtio can use the transport virtqueue to implement managed devices
>>> +
>>> +An example of managed devices is a Scalable I/O Virtualization \hyperr=
ef[intro:SIOV]{[SIOV]} VDEV which is created and managed
>>> +through a transport virtqueue of a management device.
>>> +
>>> +A managed device and its management device work in a sub-device and pa=
rent-device topology.
>>> +
>>> +\devicenormative{\subsubsection}{The Managed Device}{Virtio Transport =
Options / Virtio Over Transport Virtqueue / Basic Concepts / The Managed De=
vice}
>>> +
>>> +A managed device should be isolated from other managed devices on DMA =
and interrupts.
>>
>> I'd suggest to say
>>
>> "Managed devices are isolated from each other and from the management
>> device."
>>
>> Since DMA and interrupts which is only available on some transport are n=
ot a
>> must for a virtio device to work.
>
> Guys, have you looked at the RFC I posted at all?
>
> I'm disappointed this is still going in its own direction
> ignoring the obvious similarities between the two concepts.
> How many versions of managed/management parent/child
> etc can we have?
>
> Can the wording I posted be reused? I certainly made the effort.
>
> I imagine that the virtio transport can become just
> 1- a new group type
I can re-factor the transport vq as:
introduce device group under the transport vq, so the management device=20
can be the group owner and the manage devices are group member, I can=20
take your words in the last posted RFC series.
> 2- a feature bit
I think the feature bit VIRTIO_F_TRANSPT_VQ in this patch may be enough.
> 3- a set of commands for managing scalable IOV enabled with said bit
These commands are done in this series.
>
>
> I can add (1) to my patchset if you like.
I am not sure whether it means transport vq will be merged to or rebased=20
on admin vq. I am still not totally
agree on the design of admin vq as we have discussed in other threads.
And I think transport vq focuses on a new transport, not control something.

Thanks
>
> Jason I thought you agreed this made sense?
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

