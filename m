Return-Path: virtio-comment-return-1568-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0B3DF9865AB
	for <virtio-comment@lists.oasis-open.org>; Fri, 18 Dec 2020 03:16:48 +0000 (UTC)
References: <20201204054615.26124-1-jasowang@redhat.com>
 <20201217152811.GA24632@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1683d9e0-daa3-e424-c50d-2c1c26a38612@redhat.com>
Date: Fri, 18 Dec 2020 11:16:37 +0800
MIME-Version: 1.0
In-Reply-To: <20201217152811.GA24632@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] [RFC PATCH] virtio-pci: introduce device state
 capability
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/12/17 =E4=B8=8B=E5=8D=8811:28, Stefan Hajnoczi wrote:
> On Fri, Dec 04, 2020 at 01:46:15PM +0800, Jason Wang wrote:
>> @@ -1247,6 +1249,55 @@ \subsubsection{PCI configuration access capabilit=
y}\label{sec:Virtio Transport O
>>   specified by some other Virtio Structure PCI Capability
>>   of type other than \field{VIRTIO_PCI_CAP_PCI_CFG}.
>>  =20
>> +\subsubsection{Device State capability}\label{sec:Virtio Transport Opti=
ons / Virtio Over PCI Bus / PCI Device Layout / Device state capability}
>> +
>> +The device state structure is found at the \field{bar} and \field{offse=
t} within the VIRTIO_PCI_CAP_DEVICE_STATE_CFG capability; its layout is bel=
ow.
>> +
>> +\begin{lstlisting}
>> +struct virtio_pci_device_state {
>> +        /* About a specific virtqueue. */
>> +        le16 queue_select;              /* read-write */
>> +        le16 last_avail_idx;            /* read-write */
>> +        u8 queue_status;                /* read-write */
> Starting/stopping queues is useful for managing multiqueue across CPU
> hotplug. Perhaps the queue_status functionality should be generic and
> not related to device state save/load?


That's fine, actually, I was considering reusing queue_enable which=20
forbids to be write with 0 now. My idea is to allow zero to be wrote if=20
some features is negotiated.


>
>> +};
>> +\end{lstlisting}
>> +
>> +\begin{description}
>> +\item[\field{queue_select}]
>> +        Queue Select. The driver selects which virtqueue the following
>> +        fields refer to.
>> +
>> +\item[\field{last_avail_idx}]
>> +        Last avail index for this virtqueue that is used by the device.
> This is only sufficient to save/load devices where all device state is
> visible to the driver (I would call them "stateless"). virtio-gpu,
> virtio-crypto, and virtio-fs are "stateful" devices in the sense that
> devices contain internal state that is not directly visible to the
> driver but is needed to save/load the device.


Right, this is the support at generic device level.

For stateful device, it needs device specific extension which I think is=20
hard to be generalized.


>
> If we want to save/load stateful devices then an additional interface is
> needed for this data. It can be large in size (e.g. imagine graphics
> buffers or many thousands of inodes) and should therefore probably
> support iterative saving.


Yes, this needs more consideration. But we can solve the generic=20
virtqueue level first.


>
>> +\item[\field{queue_status}]
>> +        The driver uses this to stop the executing request for this vir=
tqueue.
>> +        1 - running; 0 - stopped.
>> +\end{description}
> A per-virtqueue stopped state is not enough to stop a device because
> some devices have global behavior like config change events. It must be
> possible to completely stop the device to prevent further activity
> (VIRTIO config space changes, interrupts, etc).
>
> Maybe a Device Status register bit can be added for that?


I've considered such case, one of the idea is to introduce a new device=20
status to achieve which seems more generic. Then we need to define a=20
state machine carefully.


>
>> +
>> +\devicenormative{\paragraph}{PCI Device State capability}{Virtio Transp=
ort Options / Virtio Over PCI Bus / PCI Device Layout / PCI Device State ca=
pability}
>> +
>> +The device MUST present a 0 in \field{queue_status} on reset.
>> +
>> +The device MUST present a 1 in \field{queue_status} upon writing 1
>> +to \field{queue_enable} from common configuration structure by driver.
>> +
>> +The device MUST complete all inflight requests before presenting a 0
>> +in \field{queue_status}.
> Is there a definition of "inflight requests"? I think the precise
> meaning here is avail requests that the device is processing. It does
> not include avail requests that the device has not yet started
> processing.


Right.


>
> Is there any notification when the queue_status bit transitions from 1
> to 0? If not, then drivers must poll the register to detect completion.


To be simple, this draft requires the driver to poll for the status.


>
> Is it possible to resume a virtqueue that is in the process of stopping
> (for example, if the guest driver decides a timeout has been reached and
> it no longer wishes to stop the virtqueue)?


I think the answer is yes, we can clarify this in the spec.

Thanks



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

