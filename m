Return-Path: virtio-comment-return-1651-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B6E0B986056
	for <virtio-comment@lists.oasis-open.org>; Wed, 20 Jan 2021 03:13:48 +0000 (UTC)
References: <20210118163804.437098-1-cohuck@redhat.com>
 <20210118164132.GC9899@work-vm> <20210119034008.735f80ad.pasic@linux.ibm.com>
 <20210119184506.3bd7061d.cohuck@redhat.com>
 <20210119195252.595870b1.pasic@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7f4fdfd2-edf2-d291-180a-41ffc3c3955e@redhat.com>
Date: Wed, 20 Jan 2021 11:13:37 +0800
MIME-Version: 1.0
In-Reply-To: <20210119195252.595870b1.pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH RFC v2] clarify device reset
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


On 2021/1/20 =E4=B8=8A=E5=8D=882:52, Halil Pasic wrote:
> On Tue, 19 Jan 2021 18:45:06 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
>
>> On Tue, 19 Jan 2021 03:40:08 +0100
>> Halil Pasic <pasic@linux.ibm.com> wrote:
>>
>>> On Mon, 18 Jan 2021 16:41:32 +0000
>>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>>>   =20
>>>> * Cornelia Huck (cohuck@redhat.com) wrote:
>>>>> Properly specify that the method for the driver to request a
>>>>> device reset is transport specific, and some action the device
>>>>> has to take.
>>>>>
>>>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>>>> ---
>>>>>
>>>>> RFC -> RFC v2:
>>>>>    - moved reset spec to basic facilities
>>>>>
>>>>> ---
>>>>>   conformance.tex |  1 +
>>>>>   content.tex     | 13 +++++++++++++
>>>>>   2 files changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/conformance.tex b/conformance.tex
>>>>> index eb3324053080..3be499ae3c5e 100644
>>>>> --- a/conformance.tex
>>>>> +++ b/conformance.tex
>>>>> @@ -271,6 +271,7 @@ \section{Conformance Targets}\label{sec:Conforman=
ce / Conformance Targets}
>>>>>   \begin{itemize}
>>>>>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / De=
vice Status Field}
>>>>>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / Fe=
ature Bits}
>>>>> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Dev=
ice Reset}
>>>>>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / De=
vice Configuration Space}
>>>>>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / Me=
ssage Framing}
>>>>>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / Vi=
rtqueues / The Virtqueue Descriptor Table}
>>>>> diff --git a/content.tex b/content.tex
>>>>> index 620c0e28c9a7..782ddf3ed78d 100644
>>>>> --- a/content.tex
>>>>> +++ b/content.tex
>>>>> @@ -193,6 +193,19 @@ \section{Notifications}\label{sec:Basic Faciliti=
es of a Virtio Device
>>>>>   terminology. Occasionally, the term event is used to refer to
>>>>>   a notification or a receipt of a notification.
>>>>>  =20
>>>>> +\section{Device Reset}\label{sec:Basic Facilities of a Virtio Device=
 / Device Reset}
>>>>> +
>>>>> +The driver may initiate a device reset at various times; notably, du=
ring
>>>>> +device initialization and device cleanup.
>>>>> +
>>>>> +The mechanism used by the driver to initiate the reset is transport =
specific.
>>>>> +
>>>>> +\devicenormative{\subsection}{Device Reset}{Basic Facilities of a Vi=
rtio Device / Device Reset}
>>>>> +
>>>>> +A device MUST reinitialize device status to 0 after receiving a rese=
t.
>>>>> +
>>>>> +A device MUST NOT send notifications after receiving a reset.
>>>>> +
>>> s/after receiving a reset/after presenting a 0 status, that indicates
>>> the reset is done/
>> "A device MUST NOT send notifications after indicating completion of
>> the reset by reinitializing the device status to 0."
>>
>> ?
> Works with me. I tried to align my wording with the pci wording.
>
>>>> This feels like a bit of a race in the description;  a Device may have
>>>> just sent a notification at the point that it receives a reset.
>>>> When a driver initiates a reset, how does the driver know that the
>>>> device has received it?
>>> I agree, but with the proposed modification not any more.
>>>
>>> To answer your question: PCI has the following driver normative (which =
I
>>> believe needs to be generalized so we have something similar for each
>>> transport, and thus the same semantics):
>>> "After writing 0 to device_status, the driver MUST wait for a read of
>>> device_status to return 0 before reinitializing the device."
>>> (4.1.4.3.2 Driver Requirements: Common configuration structure layout,
>>> https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.ht=
ml#x1-1090004)
>>>
>>> In general, after asking for a reset, the driver should/must ensure tha=
t
>>> the reset was performed by the device by reading a 0 status. If the
>>> status is non-zero, the reset at the device may still be in progress.
>>> IMHO we need another driver normative for that.
>> "After the driver has initiated a reset of the device, it MUST NOT
>> consider the reset to be completed if the device status is not 0."
>>
>> ?
> ", before it reads status 0."
>
> My point is, that usually when I do an assignment to a memory location
> with a single instruction, and the instruction completes successfully,
> for me (on my CPU), that memory location is 0.
>
> PCI is however not like this: the device can delay or reject the write,
> apparently. Jason taught me that. So I think we should insist on the
> read.


Yes. For PCI the status is implemented via registers, there's no=20
guarantee a read is 0 after write 0 to that.


>
>> Maybe without the double negation.
>>
>> (We could consider the reset for ccw devices done once we get final
>> status for the reset ccw. Would save the round trip for a read status
>> ccw, but would also be different from the other transports.)


I think it's probably not a problem since we don't care about the=20
performance of reset.

Thanks


> We could work around that by making a positive statement. Not telling,
> when the driver MUST NOT consider the reset completed, but tell when the
> driver SHOULD consider the reset completed.
>
> The MUST NOT does not buy much to the driver. It knows, what is
> certainly wrong, but it still does not know what is right. What the
> driver needs is a criterion when the reset is certainly completed (so
> it can free up resources for example).
>
> Regards,
> Halil
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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

