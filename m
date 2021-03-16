Return-Path: virtio-comment-return-1742-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C34859864A3
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Mar 2021 02:53:55 +0000 (UTC)
References: <20210315025846.6539-1-jasowang@redhat.com>
 <20210315162432.14f5476a.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0bd20def-b7fe-0bb7-a660-e5745b727289@redhat.com>
Date: Tue, 16 Mar 2021 10:53:37 +0800
MIME-Version: 1.0
In-Reply-To: <20210315162432.14f5476a.cohuck@redhat.com>
Subject: Re: [virtio-comment] Re: [PATCH] virtio-pci: introduce
 VIRITO_F_QUEUE_STATE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: mst@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, lulu@redhat.com, rob.miller@broadcom.com, stefanha@redhat.com, pasic@linux.ibm.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


=E5=9C=A8 2021/3/15 =E4=B8=8B=E5=8D=8811:24, Cornelia Huck =E5=86=99=E9=81=
=93:
> On Mon, 15 Mar 2021 10:58:46 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
>> This patch adds the ability to save and restore virtqueue state via a
>> new field in the common configuration infrastructure.
>>
>> To simply the implementation, no new device status is introduced. For
>> device, the requirements is not to forget the queue state after
>> virtio reset and clear the virtqueue state upon ACKNOWLEDGE. For
>> driver, it must set the virtqueue state before setting DRIVER_OK.
>>
>> To save a virtqueue state, the driver then need:
>>
>> 1) reset device
>> 2) read virtqueue statue
>>
>> To restore a virtqueue state, the driver need:
>>
>> 1) reset device
>> 2) perform necessary setups (e.g features negotiation)
>> 3) write virtqueue state
>> 4) set DRIVER_OK
>>
>> The main user should be live migration.
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   content.tex                 | 38 +++++++++++++++++++++++++++++++++++++
>>   virtqueue-state-packed-le.c |  7 +++++++
>>   virtqueue-state-split-le.c  |  4 ++++
>>   3 files changed, 49 insertions(+)
>>   create mode 100644 virtqueue-state-packed-le.c
>>   create mode 100644 virtqueue-state-split-le.c
>>
>> diff --git a/content.tex b/content.tex
>> index 620c0e2..d7bff25 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -837,6 +837,7 @@ \subsubsection{Common configuration structure layout=
}\label{sec:Virtio Transport
>>           le64 queue_driver;              /* read-write */
>>           le64 queue_device;              /* read-write */
>>           le16 queue_notify_data;         /* read-only for driver */
>> +        le64 queue_state;               /* read-write */
>>   };
>>   \end{lstlisting}
>>  =20
>> @@ -916,6 +917,29 @@ \subsubsection{Common configuration structure layou=
t}\label{sec:Virtio Transport
>>           may benefit from providing another value, for example an inter=
nal virtqueue
>>           identifier, or an internal offset related to the virtqueue num=
ber.
>>           \end{note}
>> +
>> +\item[\field{queue_state}]
>> +        This field exists only if VIRTIO_F_QUEUE_STATE has been
>> +        negotiated. The driver will use this field to get or set the
>> +        virtqueue state by reading or writing the 64bit from the
>> +        field.
>> +        When VIRTIO_F_RING_PACKED has not been negotiated, the driver
>> +        can set and get the following states:
>> +        \lstinputlisting{virtqueue-state-split-le.c}
>> +        The field \field{last_avail_idx} is the location where the
>> +        device read for next index from the available ring.
>> +        When VIRTIO_F_RING_PACKED has been negotiated, the driver can
>> +        set and get the following states:
>> +        \lstinputlisting{virtqueue-state-packed-le.c}
>> +        The field \field{last_avail_idx} is the next location where
>> +        device read for the next descriptor from the descriptor
>> +        ring. The field \field{last_avail_wrap_counter} is the last
>> +        driver ring wrap counter that is observed by the device. The
>> +        field \field{used_idx} is the next location where device write
>> +        used descriptor do descriptor ring. The field
>> +        \field{used_wrap_counter} is the wrap counter that is used by
>> +        the device. See also \ref{sec:Packed Virtqueues / Driver and De=
vice Ring Wrap Counters}.
> While queue_state is a pci-specific field, I don't think any of this is
> transport-specific. I think the description of the layout for the queue
> state should move into a generic section, and this part only reference
> it.


Yes, will move it, probably "basic facility" part.


>
>> +
>>   \end{description}
>>  =20
>>   \devicenormative{\paragraph}{Common configuration structure layout}{Vi=
rtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common c=
onfiguration structure layout}
>> @@ -964,6 +988,10 @@ \subsubsection{Common configuration structure layou=
t}\label{sec:Virtio Transport
>>   present either a value of 0 or a power of 2 in
>>   \field{queue_size}.
>>  =20
>> +If VIRTIO_F_QUEUE_STATE has been negotiated, a device MUST NOT clear
>> +the queue state upon reset and MUST reset the queue state when
>> +ACKNOWLEDGE has been set through \field{device status} bit.
> What happens if a driver tries to read the queue status outside of this
> window? Should it get zeroes? Unpredictable values?


I'm not sure having normative like this can help. Can we leave it to=20
device? I had a driver normative to clarify when should driver read or=20
write to the value.


>
>> +
>>   \drivernormative{\paragraph}{Common configuration structure layout}{Vi=
rtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common c=
onfiguration structure layout}
>>  =20
>>   The driver MUST NOT write to \field{device_feature}, \field{num_queues=
}, \field{config_generation}, \field{queue_notify_off} or \field{queue_noti=
fy_data}.
>> @@ -981,6 +1009,13 @@ \subsubsection{Common configuration structure layo=
ut}\label{sec:Virtio Transport
>>  =20
>>   The driver MUST NOT write a 0 to \field{queue_enable}.
>>  =20
>> +If VIRTIO_F_QUEUE_STATE has been negotiated, a driver SHOULD set the
>> +state of each virtqueue through \field{queue_state} before setting the
>> +DRIVER_OK \field{device status} bit and SHOULD NOT write to
>> +\field{queue_state} after setting the DRIVER_OK \field{device status}
>> +bit. If a driver want to get the virtqueue state, it MUST first reset
>> +the device then read state from \field{queue_state}.
> What should the driver do with a 'fresh' device? Does it need to start
> out with a reset, read the (zero) state, and then write it back?


If 'fresh' means a normal probe procedure, in this case we don't need to=20
get the virtqueue state. What we need is to set a proper state.=C2=A0 For=
=20
split virtqueue, the driver should write 0 (as last_avail_idx). For=20
packed virtqueue, the driver shoudl write:

{.last_avail_idx =3D 0, .last_avail_wrap_counter=3D1, .used_idx=3D0,=20
used_wrap_counter=3D1}.

If 'fresh' means start device after migration, we need to set the=20
virtqueue state to what source gives us:

in src:

1) reset device
2) read virtqueue states
3) pass virtqueue states to dst

in dst:

1) receivce virtqueue states from src
2) reset device
3) perform necesssary setup ( feature neogitaion etc.)
4) set the virtqueue states we received from src.

Btw, it looks to me we need to clearify that "The driver MUST write to=20
queue_state after FEATURE_OK but before DRIVER_OK)

Thanks


>
>> +
>>   \subsubsection{Notification structure layout}\label{sec:Virtio Transpo=
rt Options / Virtio Over PCI Bus / PCI Device Layout / Notification capabil=
ity}
>>  =20
>>   The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
>> @@ -6596,6 +6631,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved=
 Feature Bits}
>>     transport specific.
>>     For more details about driver notifications over PCI see \ref{sec:Vi=
rtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization =
And Device Operation / Available Buffer Notifications}.
>>  =20
>> +\item[VIRTIO_F_QUEUE_STATE(40)] This feature indicates that the driver
>> +  can set and get the virtqueue state.
> Here is probably the best place to put the layout description from the
> pci section above, and to refer to the pci-specific implementation
> (just as it is done for the driver notifications right above.)
>
>> +
>>   \end{description}
>>  =20
>>   \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bit=
s}
>> diff --git a/virtqueue-state-packed-le.c b/virtqueue-state-packed-le.c
>> new file mode 100644
>> index 0000000..f21f9c2
>> --- /dev/null
>> +++ b/virtqueue-state-packed-le.c
>> @@ -0,0 +1,7 @@
>> +le64 {
>> +=09last_avail_idx : 15;
>> +=09last_avail_wrap_counter : 1;
>> +=09used_idx : 15;
>> +=09used_wrap_counter : 1;
>> +=09reserved : 32;
>> +};
>> diff --git a/virtqueue-state-split-le.c b/virtqueue-state-split-le.c
>> new file mode 100644
>> index 0000000..daeb4a3
>> --- /dev/null
>> +++ b/virtqueue-state-split-le.c
>> @@ -0,0 +1,4 @@
>> +le64 {
>> +=09last_avail_idx : 16;
>> +=09reserved: 48;
>> +};
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

