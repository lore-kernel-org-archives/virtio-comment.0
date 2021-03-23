Return-Path: virtio-comment-return-1777-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6B6E6986088
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Mar 2021 09:28:38 +0000 (UTC)
MIME-Version: 1.0
References: <20210322034717.35135-1-jasowang@redhat.com> <20210322034717.35135-2-jasowang@redhat.com>
 <CAJaqyWcO+W91bZJ42imLniKyoex268n1mONps2=hvXZ7n4RTtg@mail.gmail.com> <cdadc765-2ede-8eb6-2aff-3defd6e161e5@redhat.com>
In-Reply-To: <cdadc765-2ede-8eb6-2aff-3defd6e161e5@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 23 Mar 2021 10:27:58 +0100
Message-ID: <CAJaqyWeWwAtQPF23XU0pVjtdjSjQ=SeBeB43-G6qge4s8rOnhA@mail.gmail.com>
Subject: Re: [virtio-comment] Re: [PATCH V2 1/2] virtio: introduce virtqueue
 state as basic facility
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Mar 23, 2021 at 3:54 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/22 =E4=B8=8B=E5=8D=884:19, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > On Mon, Mar 22, 2021 at 4:47 AM Jason Wang <jasowang@redhat.com> wrote:
> >> This patch adds new device facility to save and restore virtqueue
> >> state. The virtqueue state is split into two parts:
> >>
> >> - The available state: The state that is used for read the next
> >>    available buffer.
> >> - The used state: The state that is used for make buffer used.
> >>
> >> This will simply the transport specific method implemention. E.g two
> >> le16 could be used instead of a single le32). For split virtqueue, we
> >> only need the available state since the used state is implemented in
> >> the virtqueue itself (the used index).
> >> For packed virtqueue, we need
> >> both the available state and the used state.
> >>
> >> Those states are required to implement live migration support for
> >> virtio device.
> >>
> >> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >> ---
> >>   content.tex | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++=
++
> >>   1 file changed, 81 insertions(+)
> >>
> >> diff --git a/content.tex b/content.tex
> >> index 620c0e2..af39111 100644
> >> --- a/content.tex
> >> +++ b/content.tex
> >> @@ -385,6 +385,83 @@ \section{Exporting Objects}\label{sec:Basic Facil=
ities of a Virtio Device / Expo
> >>   types. It is RECOMMENDED that devices generate version 4
> >>   UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
> >>
> >> +\section{Virtqueue State}\label{sec:Virtqueues / Virtqueue State}
> >> +
> >> +When VIRTIO_F_QUEUE_STATE is negotiated, the driver can set and
> >> +get the device internal virtqueue state through the following
> >> +fields. The way to access those fields is transport specific.
> >> +
> >> +\subsection{\field{Available State} Field}
> >> +
> >> +The availabe state field is two bytes virtqueue state that is used by
> >> +the device to read for the next available buffer.
> >> +
> >> +When VIRTIO_RING_F_PACKED is not negotiated, it contains:
> >> +
> >> +\begin{lstlisting}
> >> +le16 last_avail_idx;
> >> +\end{lstlisting}
> >> +
> >> +The \field{last_avail_idx} field is the location where the device rea=
d
> >> +for the next index from the virtqueue available ring.
> >> +
> >> +When VIRTIO_RING_F_PACKED is negotiated, it contains:
> >> +
> >> +\begin{lstlisting}
> >> +le16 {
> >> +  last_avail_idx : 15;
> >> +  last_avail_wrap_counter : 1;
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +The \field{last_avail_idx} field is the location where the device rea=
d
> >> +for the next descriptor from the virtqueue descriptor ring.
> >> +
> >> +The \field{last_avail_wrap_counter} field is the last driver ring wra=
p
> >> +counter that is observed by the device.
> >> +
> >> +See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Cou=
nters}.
> >> +
> >> +\subsection{\field{Used State} Field}
> >> +
> >> +The availabe state field is two bytes virtqueue state that is used by
> >> +the device to make buffer used.
> >> +
> >> +When VIRTIO_RING_F_PACKED is negotiated, the used state contains:
> >> +
> >> +\begin{lstlisting}
> >> +le16 {
> >> +  used_idx : 15;
> >> +  used_wrap_counter : 1;
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +The \field{used_idx} field is the location where the device write nex=
t
> >> +used descriptor to the descriptor ring.
> >> +
> >> +The \field{used_wrap_counter} field is the wrap counter that is used
> >> +by the device.
> >> +
> >> +The used state is unnecessary when VIRTIO_RING_F_PACKED is not
> >> +negotiated.
> > Maybe we could be more specific with "unnecessary"? Either to say:
> > 1) "For split virtqueue the device/driver must ignore this field at
> > start/recover state and use used_idx in the used ring.", so use of
> > this field is totally unspecified.
>
>
> RIght, this could be added as normative part.
>
> An interesting part is the timing of the read, the current semantics
> depends on reset command to stop the device (to avoid introduing new
> status).
>
> So in order to get the state, driver needs:
>
> 1) reset the device
> 2) read the avail and used states
>
> Technically, after step 1, driver doesn't know whether nor not it's a
> split virtqueue.
>
> For write, it should be fine since we mandate it can only be done after
> FEATURE_OK so driver know it's a split or not.
>
> So how about something like in the driver normative:
>
> To get the virtqueue state, the driver MUST remember the queue format
> that is used and read the virtqueue state accordingly after resetting
> the device. E.g if the split virtqueue is used before resetting the
> device, the driver MUST NOT acces used state after restting the device.
>
> To write the virtqueue state, the driver MUST NOT write to the used
> state if VIRTIO_F_RING_PACKED is not negotiated.
>

Right, I'm not sure if it will have a use case in the future but I
find it better to explicitly state that.

Thanks!

> Thanks
>
>
> > 2) "For split virtqueue, the device/driver must prefer to get/set
> > state from virtqueue's used ring in case of discrepancy with this
> > value".
> >
> > I prefer the former so there is only one place to set/retrieve it, but
> > something like this would avoid confusion in my opinion. I find it
> > equally convenient to prefer the virtqueue memory or the
> > transport-specific used state field, though.
>
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


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

