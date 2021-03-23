Return-Path: virtio-comment-return-1773-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C5DEA986085
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Mar 2021 02:54:15 +0000 (UTC)
References: <20210322034717.35135-1-jasowang@redhat.com>
 <20210322034717.35135-2-jasowang@redhat.com>
 <CAJaqyWcO+W91bZJ42imLniKyoex268n1mONps2=hvXZ7n4RTtg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cdadc765-2ede-8eb6-2aff-3defd6e161e5@redhat.com>
Date: Tue, 23 Mar 2021 10:54:09 +0800
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcO+W91bZJ42imLniKyoex268n1mONps2=hvXZ7n4RTtg@mail.gmail.com>
Subject: Re: [virtio-comment] Re: [PATCH V2 1/2] virtio: introduce virtqueue
 state as basic facility
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


=E5=9C=A8 2021/3/22 =E4=B8=8B=E5=8D=884:19, Eugenio Perez Martin =E5=86=99=
=E9=81=93:
> On Mon, Mar 22, 2021 at 4:47 AM Jason Wang <jasowang@redhat.com> wrote:
>> This patch adds new device facility to save and restore virtqueue
>> state. The virtqueue state is split into two parts:
>>
>> - The available state: The state that is used for read the next
>>    available buffer.
>> - The used state: The state that is used for make buffer used.
>>
>> This will simply the transport specific method implemention. E.g two
>> le16 could be used instead of a single le32). For split virtqueue, we
>> only need the available state since the used state is implemented in
>> the virtqueue itself (the used index).
>> For packed virtqueue, we need
>> both the available state and the used state.
>>
>> Those states are required to implement live migration support for
>> virtio device.
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   content.tex | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
>> diff --git a/content.tex b/content.tex
>> index 620c0e2..af39111 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -385,6 +385,83 @@ \section{Exporting Objects}\label{sec:Basic Facilit=
ies of a Virtio Device / Expo
>>   types. It is RECOMMENDED that devices generate version 4
>>   UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
>>
>> +\section{Virtqueue State}\label{sec:Virtqueues / Virtqueue State}
>> +
>> +When VIRTIO_F_QUEUE_STATE is negotiated, the driver can set and
>> +get the device internal virtqueue state through the following
>> +fields. The way to access those fields is transport specific.
>> +
>> +\subsection{\field{Available State} Field}
>> +
>> +The availabe state field is two bytes virtqueue state that is used by
>> +the device to read for the next available buffer.
>> +
>> +When VIRTIO_RING_F_PACKED is not negotiated, it contains:
>> +
>> +\begin{lstlisting}
>> +le16 last_avail_idx;
>> +\end{lstlisting}
>> +
>> +The \field{last_avail_idx} field is the location where the device read
>> +for the next index from the virtqueue available ring.
>> +
>> +When VIRTIO_RING_F_PACKED is negotiated, it contains:
>> +
>> +\begin{lstlisting}
>> +le16 {
>> +  last_avail_idx : 15;
>> +  last_avail_wrap_counter : 1;
>> +};
>> +\end{lstlisting}
>> +
>> +The \field{last_avail_idx} field is the location where the device read
>> +for the next descriptor from the virtqueue descriptor ring.
>> +
>> +The \field{last_avail_wrap_counter} field is the last driver ring wrap
>> +counter that is observed by the device.
>> +
>> +See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Count=
ers}.
>> +
>> +\subsection{\field{Used State} Field}
>> +
>> +The availabe state field is two bytes virtqueue state that is used by
>> +the device to make buffer used.
>> +
>> +When VIRTIO_RING_F_PACKED is negotiated, the used state contains:
>> +
>> +\begin{lstlisting}
>> +le16 {
>> +  used_idx : 15;
>> +  used_wrap_counter : 1;
>> +};
>> +\end{lstlisting}
>> +
>> +The \field{used_idx} field is the location where the device write next
>> +used descriptor to the descriptor ring.
>> +
>> +The \field{used_wrap_counter} field is the wrap counter that is used
>> +by the device.
>> +
>> +The used state is unnecessary when VIRTIO_RING_F_PACKED is not
>> +negotiated.
> Maybe we could be more specific with "unnecessary"? Either to say:
> 1) "For split virtqueue the device/driver must ignore this field at
> start/recover state and use used_idx in the used ring.", so use of
> this field is totally unspecified.


RIght, this could be added as normative part.

An interesting part is the timing of the read, the current semantics=20
depends on reset command to stop the device (to avoid introduing new=20
status).

So in order to get the state, driver needs:

1) reset the device
2) read the avail and used states

Technically, after step 1, driver doesn't know whether nor not it's a=20
split virtqueue.

For write, it should be fine since we mandate it can only be done after=20
FEATURE_OK so driver know it's a split or not.

So how about something like in the driver normative:

To get the virtqueue state, the driver MUST remember the queue format=20
that is used and read the virtqueue state accordingly after resetting=20
the device. E.g if the split virtqueue is used before resetting the=20
device, the driver MUST NOT acces used state after restting the device.

To write the virtqueue state, the driver MUST NOT write to the used=20
state if VIRTIO_F_RING_PACKED is not negotiated.

Thanks


> 2) "For split virtqueue, the device/driver must prefer to get/set
> state from virtqueue's used ring in case of discrepancy with this
> value".
>
> I prefer the former so there is only one place to set/retrieve it, but
> something like this would avoid confusion in my opinion. I find it
> equally convenient to prefer the virtqueue memory or the
> transport-specific used state field, though.


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

