Return-Path: <virtio-comment-return-2932-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 541909864EF
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Apr 2022 14:13:22 +0000 (UTC)
Date: Tue, 12 Apr 2022 16:13:11 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20220412141311.xv7iov3wo5orxwl7@sgarzare-redhat>
References: <20220404134931.28697-1-lauralg@amazon.com>
 <20220407120338.z5sohqlkh73bopnu@sgarzare-redhat>
 <7f37e56c-7d49-da5f-922e-f96b7247ae7f@amazon.com>
MIME-Version: 1.0
In-Reply-To: <7f37e56c-7d49-da5f-922e-f96b7247ae7f@amazon.com>
Subject: Re: [virtio-comment] [PATCH] virtio-vsock: add max payload size
 config field
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: Laura Loghin <lauralg@amazon.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Apr 08, 2022 at 12:57:19PM +0300, Laura Loghin wrote:
>On 4/7/22 15:03, Stefano Garzarella wrote:
>>CAUTION: This email originated from outside of the organization. Do=20
>>not click links or open attachments unless you can confirm the=20
>>sender and know the content is safe.
>>
>>
>>
>>On Mon, Apr 04, 2022 at 04:49:31PM +0300, Laura Loghin wrote:
>>>Added a new field to the vsock device config space that
>>>is limiting the size of the packet payload. This way
>>>the driver is not allowed to allocate huge buffers, and
>>>potentially fill up the entire memory.
>>>Also defined a new feature bit for this, VIRTIO_VSOCK_F_SIZE_MAX,
>>>in order to keep backwards compatibility.
>>>
>>>Signed-off-by: Laura Loghin <lauralg@amazon.com>
>>>---
>>>virtio-vsock.tex | 34 ++++++++++++++++++++++++++++++++++
>>>1 file changed, 34 insertions(+)
>>>
>>>diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>>>index d79984d..a6950cc 100644
>>>--- a/virtio-vsock.tex
>>>+++ b/virtio-vsock.tex
>>>@@ -23,6 +23,10 @@ \subsection{Feature bits}\label{sec:Device=20
>>>Types / Socket Device / Feature bits}
>>>\begin{description}
>>>\item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
>>>\item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>>>+\item[VIRTIO_VSOCK_F_SIZE_MAX (2)] Maximum size of the packet=20
>>>payload is in
>>>+=A0=A0=A0=A0=A0 \field{data_max_size}. If offered by the device, device=
=20
>>>advises driver
>>>+=A0=A0=A0=A0=A0 about the value of its maximum payload size. If negotia=
ted,=20
>>>the driver uses
>>>+=A0=A0=A0=A0=A0 \field{data_max_size} as the maximum packet payload siz=
e value.
>>>\end{description}
>>>
>>>\subsection{Device configuration layout}\label{sec:Device Types /=20
>>>Socket Device / Device configuration layout}
>>>@@ -32,6 +36,7 @@ \subsection{Device configuration=20
>>>layout}\label{sec:Device Types / Socket Device
>>>\begin{lstlisting}
>>>struct virtio_vsock_config {
>>>=A0=A0=A0=A0=A0 le64 guest_cid;
>>>+=A0=A0=A0=A0=A0 le32 data_max_size;
>>>};
>>>\end{lstlisting}
>>>
>>>@@ -57,6 +62,35 @@ \subsection{Device configuration=20
>>>layout}\label{sec:Device Types / Socket Device
>>>\hline
>>>\end{tabular}
>>>
>>>+The following driver-read-only field, \field{data_max_size} only=20
>>>exists if
>>>+VIRTIO_VSOCK_F_SIZE_MAX is set. This field specifies the maximum=20
>>>packet payload
>>>+size for the driver to use.
>>
>>Should we also define the maximum payload size when the feature is not
>>negotiated?
>>We never defined it, but the current implementation does not use
>>payloads larger than 64k.
>
>Hmm I don't know exactly how the spec applies to the vsock. So do we
>consider the linux implementation as the "standard" one? In case the=20

For the driver, I suppose the linux could be the "standard".

>driver/device
>implementation accepted payloads larger than 64k before, then they will be

I'm not sure, IIRC we were limited to 4K, then we increased to 64K for=20
the TX:
0038ff357f05 vsock/virtio: change the maximum packet size allowed
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D0038ff357f05fee242aa4e5ec5e75f83fa1ed28c

>forced now to negotiate `data_max_size` because of the fixed default value=
?
>Or that implementation was considered as not being compliant to the spec?
>I'm not exactly sure how backwards compatibility works here.

Yes, I think we can avoid that. When the flag is not negotiated, the=20
driver sets the buffer it wants.

>>
>>>+
>>>+\devicenormative{\subsubsection}{Device configuration=20
>>>layout}{Device Types / Socket Device / Device configuration=20
>>>layout}
>>>+
>>>+The device MUST set \field{data_max_size} to between 0 and 65536
>>
>>IIUC, this value is the maximum the device can manage, but then the
>>driver can always allocate smaller buffers both for TX and RX, so maybe
>>we could not put a limit, at the end the device can say what it wants,
>>the driver must only avoid to exceed that value.
>True, I was thinking that a hard limit might be useful here, but I=20
>don't have
>a strong preference. I can remove this.
>>
>>>inclusive, if
>>>+it offers VIRTIO_VSOCK_F_SIZE_MAX.
>>>+
>>>+The device MUST NOT modify \field{data_max_size} once it has been set.
>>>+
>>>+The device MUST NOT pass received packets that exceed=20
>>>\field{data_max_size}
>>>+(plus header length) size after VIRTIO_VSOCK_F_SIZE_MAX has been=20
>>>successfully
>>>+negotiated.
>>
>>For the device the limit is anyway the buffer (allocated by the driver)
>>it finds in RX, so I don't know if this sentence is useful.
>>
>Yes, I don't think this sentence is needed, I'll remove it.
>>>+
>>>+The device MUST forward transmitted packets of up to=20
>>>\field{data_max_size}
>>>+(plus header length) size after VIRTIO_VSOCK_F_SIZE_MAX has been=20
>>>successfully
>>>+negotiated.
>>>+
>>>+\drivernormative{\subsubsection}{Device configuration=20
>>>layout}{Device Types / Socket Device / Device configuration=20
>>>layout}
>>>+
>>>+A driver SHOULD negotiate VIRTIO_VSOCK_F_SIZE_MAX if the device=20
>>>offers it.
>>>+
>>>+If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUST supply=20
>>>receive
>>>+buffers that don't exceed the size \field{data_max_size} (plus=20
>>>header length).
>>>+
>>>+If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUST=A0 NOT=20
>>>transmit packets
>>>+of size exceeding the value of \field{data_max_size} (plus header=20
>>>length).
>>>+
>>>\subsection{Device Initialization}\label{sec:Device Types / Socket=20
>>>Device / Device Initialization}
>>>
>>>\begin{enumerate}
>>>-- 2.17.1
>>
>>I don't know if it is useful to define also a minimum size for the RX
>>buffers.
>
>The reason for that would be to not work with a large number of
>descriptor chains for a packet?

Yes, exactly. I don't know if it makes sense to have it in the=20
configuration, though.

Thanks,
Stefano


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

