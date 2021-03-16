Return-Path: virtio-comment-return-1744-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F0C99864A4
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Mar 2021 06:08:19 +0000 (UTC)
References: <20210315025846.6539-1-jasowang@redhat.com>
 <CAJaqyWcLHpexgyD_bo2XrqyBZvXQ--203nY3s5EseW4zwH7RmA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8065a404-500b-fad5-00aa-799816bde91b@redhat.com>
Date: Tue, 16 Mar 2021 14:08:02 +0800
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcLHpexgyD_bo2XrqyBZvXQ--203nY3s5EseW4zwH7RmA@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH] virtio-pci: introduce VIRITO_F_QUEUE_STATE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>, virtio-comment@lists.oasis-open.org, Cindy Lu <lulu@redhat.com>, Rob Miller <rob.miller@broadcom.com>, Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


=E5=9C=A8 2021/3/15 =E4=B8=8B=E5=8D=888:24, Eugenio Perez Martin =E5=86=99=
=E9=81=93:
> On Mon, Mar 15, 2021 at 3:59 AM Jason Wang <jasowang@redhat.com> wrote:
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
> In my opinion it would be more clear to add an explicit le16 reserved[3] =
here.


Good point, but then we need to document those revserved dependency with=20
this feature?

Another solution is not using an "opaque" u64 here. Instead we could use:

le16 last_avail_idx;
le16 {
 =C2=A0=C2=A0=C2=A0 last_avail_idx : 15;
 =C2=A0=C2=A0=C2=A0 last_avail_wrap_counter : 1
};
le16 {
 =C2=A0=C2=A0=C2=A0 used_idx : 15;
 =C2=A0=C2=A0=C2=A0 used_wrap_counter : 1;
}

Is this better?

Thanks


>
>> +        le64 queue_state;               /* read-write */
>>   };
>>   \end{lstlisting}
>>
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
>> +
>>   \end{description}
>>
>>   \devicenormative{\paragraph}{Common configuration structure layout}{Vi=
rtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common c=
onfiguration structure layout}
>> @@ -964,6 +988,10 @@ \subsubsection{Common configuration structure layou=
t}\label{sec:Virtio Transport
>>   present either a value of 0 or a power of 2 in
>>   \field{queue_size}.
>>
>> +If VIRTIO_F_QUEUE_STATE has been negotiated, a device MUST NOT clear
>> +the queue state upon reset and MUST reset the queue state when
>> +ACKNOWLEDGE has been set through \field{device status} bit.
>> +
>>   \drivernormative{\paragraph}{Common configuration structure layout}{Vi=
rtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common c=
onfiguration structure layout}
>>
>>   The driver MUST NOT write to \field{device_feature}, \field{num_queues=
}, \field{config_generation}, \field{queue_notify_off} or \field{queue_noti=
fy_data}.
>> @@ -981,6 +1009,13 @@ \subsubsection{Common configuration structure layo=
ut}\label{sec:Virtio Transport
>>
>>   The driver MUST NOT write a 0 to \field{queue_enable}.
>>
>> +If VIRTIO_F_QUEUE_STATE has been negotiated, a driver SHOULD set the
>> +state of each virtqueue through \field{queue_state} before setting the
>> +DRIVER_OK \field{device status} bit and SHOULD NOT write to
>> +\field{queue_state} after setting the DRIVER_OK \field{device status}
>> +bit. If a driver want to get the virtqueue state, it MUST first reset
>> +the device then read state from \field{queue_state}.
>> +
>>   \subsubsection{Notification structure layout}\label{sec:Virtio Transpo=
rt Options / Virtio Over PCI Bus / PCI Device Layout / Notification capabil=
ity}
>>
>>   The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
>> @@ -6596,6 +6631,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved=
 Feature Bits}
>>     transport specific.
>>     For more details about driver notifications over PCI see \ref{sec:Vi=
rtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization =
And Device Operation / Available Buffer Notifications}.
>>
>> +\item[VIRTIO_F_QUEUE_STATE(40)] This feature indicates that the driver
>> +  can set and get the virtqueue state.
>> +
>>   \end{description}
>>
>>   \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bit=
s}
>> diff --git a/virtqueue-state-packed-le.c b/virtqueue-state-packed-le.c
>> new file mode 100644
>> index 0000000..f21f9c2
>> --- /dev/null
>> +++ b/virtqueue-state-packed-le.c
>> @@ -0,0 +1,7 @@
>> +le64 {
>> +       last_avail_idx : 15;
>> +       last_avail_wrap_counter : 1;
>> +       used_idx : 15;
>> +       used_wrap_counter : 1;
>> +       reserved : 32;
>> +};
>> diff --git a/virtqueue-state-split-le.c b/virtqueue-state-split-le.c
>> new file mode 100644
>> index 0000000..daeb4a3
>> --- /dev/null
>> +++ b/virtqueue-state-split-le.c
>> @@ -0,0 +1,4 @@
>> +le64 {
>> +       last_avail_idx : 16;
>> +       reserved: 48;
>> +};
>> --
>> 2.24.3 (Apple Git-128)
>>


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

