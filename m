Return-Path: virtio-comment-return-1787-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A503F986572
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Mar 2021 08:16:02 +0000 (UTC)
References: <20210322034717.35135-1-jasowang@redhat.com>
 <20210322034717.35135-2-jasowang@redhat.com>
 <YFnCpdO4F9zkTjd9@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <be5b2622-f676-ddf0-2261-837e348c8a96@redhat.com>
Date: Wed, 24 Mar 2021 16:15:55 +0800
MIME-Version: 1.0
In-Reply-To: <YFnCpdO4F9zkTjd9@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] [PATCH V2 1/2] virtio: introduce virtqueue state
 as basic facility
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


=E5=9C=A8 2021/3/23 =E4=B8=8B=E5=8D=886:27, Stefan Hajnoczi =E5=86=99=E9=81=
=93:
> On Mon, Mar 22, 2021 at 11:47:16AM +0800, Jason Wang wrote:
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
>> the virtqueue itself (the used index). For packed virtqueue, we need
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
>>  =20
>> +\section{Virtqueue State}\label{sec:Virtqueues / Virtqueue State}
>> +
>> +When VIRTIO_F_QUEUE_STATE is negotiated, the driver can set and
>> +get the device internal virtqueue state through the following
>> +fields. The way to access those fields is transport specific.
>> +
>> +\subsection{\field{Available State} Field}
>> +
>> +The availabe state field is two bytes virtqueue state that is used by
> s/availabe/available/
>
> s/bytes virtqueue state/bytes of virtqueue state/


Will fix all the above.


>
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
> Perhaps this field can be defined in more detail:
>
>    The \field{last_avail_idx} field is the free-running available ring
>    index where the device will read the next available head of a
>    descriptor chain.
>
>    See also \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / T=
he Virtqueue Available Ring}.


Good point.


>
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
> Similar wording as above can be used.


Yes.


>
>> +
>> +The \field{last_avail_wrap_counter} field is the last driver ring wrap
>> +counter that is observed by the device.
> s/is/was/?


Ok.


>
>> +
>> +See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Count=
ers}.
>> +
>> +\subsection{\field{Used State} Field}
>> +
>> +The availabe state field is two bytes virtqueue state that is used by
> s/availabe/used/


Exactly.


>
> s/bytes virtqueue state/bytes of virtqueue state/


Right.


>
>> +the device to make buffer used.
> s/to make buffer used/when marking a buffer used/


Ok.


>
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
> Similar as above. It should at least mention whether this is a
> free-running index or always less than queue size.


Yes, to be consistent, it should be free-running index.


>
>> +
>> +The \field{used_wrap_counter} field is the wrap counter that is used
>> +by the device.
>> +
>> +The used state is unnecessary when VIRTIO_RING_F_PACKED is not
>> +negotiated.
>> +
>> +See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Count=
ers}.
>> +
>> +\drivernormative{\subsection}{Virtqueue State}{Basic Facilities of a Vi=
rtio Device / Virtqueue State}
>> +
>> +If VIRTIO_F_QUEUE_STATE has been negotiated, a driver MUST set the
>> +state of each virtqueue after setting the FEATURE_OK status bit but
>> +before setting the DRIVER_OK status bit.
>> +
>> +If VIRTIO_F_QUEUE_STATE has been negotiated. a driver MUST reset the
> s/negotiated./negotiated,/
>
>> +device before getting the virtqueue state.
> Interesting approach, but it makes sense that the device must be stopped
> before we mess with the queue state :).
>
> I wonder whether requiring the device to keep state across reset will
> cause issues in the future or for testing/fuzzing.
>
> Another approach would have been to add a new status register bit for
> pausing the device. That reminds me of vhost.


That's the way I did here:=20
https://lists.oasis-open.org/archives/virtio-comment/202012/msg00027.html



>
>> +
>> +\devicenormative{\subsection}{Virtqueue State}{Basic Facilities of a Vi=
rtio Device / Virtqueue State}
>> +
>> +If VIRTIO_F_QUEUE_STATE has been negotiated, a device MUST NOT clear
>> +the queue state upon reset and MUST reset the queue state when the
>> +driver sets ACKNOWLEDGE status bit.
> I only see normative sections mentioning getting the virtqueue state but
> not setting it. Please explain how setting works.


You mean the device normative part? I think the description of avail=20
state and used state can explain itself. Or I miss something?

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

