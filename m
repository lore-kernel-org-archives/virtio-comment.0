Return-Path: virtio-comment-return-1022-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 52668986036
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Jan 2020 06:55:14 +0000 (UTC)
Date: Thu, 23 Jan 2020 01:55:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200123014153-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB2067B366EB434CD282F6589BC5270@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20200120112311-mutt-send-email-mst@kernel.org>
 <BN6PR1801MB206708783E23525AE1CB1D5AC50C0@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB206708783E23525AE1CB1D5AC50C0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: [virtio-comment] Re: [EXT] Re: [virtio-comment] [PATCH] virtio-net: Add an optional
 device control over the receive buffers length
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jan 22, 2020 at 04:06:30PM +0000, Vitaly Mireyno wrote:
>=20
>=20
> >-----Original Message-----
> >From: Michael S. Tsirkin <mst@redhat.com>
> >Sent: Monday, 20 January, 2020 18:25
> >To: Vitaly Mireyno <vmireyno@marvell.com>
> >Cc: virtio-comment@lists.oasis-open.org; Jason Wang
> ><jasowang@redhat.com>
> >Subject: [EXT] Re: [virtio-comment] [PATCH] virtio-net: Add an optional =
device
> >control over the receive buffers length
> >
> >External Email
> >
> >----------------------------------------------------------------------
> >On Mon, Dec 30, 2019 at 01:59:17PM +0000, Vitaly Mireyno wrote:
> >> This patch gives devices some level of control over the receive buffer=
s
> >length.
> >> The driver declares the minimum receive buffer length, and the device
> >requests max/min buffer length ratio.
> >> This is a follow-up to the "[PATCH] virtio-net: Add equal-sized
> >> receive buffers feature" discussion:
> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oasis-2Do=
pe
> >> n.org_archives_virtio-
> >2Dcomment_201912_msg00007.html&d=3DDwIFAg&c=3DnKjWec
> >>
> >2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&
> >m=3DjrQgZ
> >> -
> >iN3QnvFqxQQkoPTmztJRTNCXTF2dz68TEV0cA&s=3DpDtISMJpw1N9ohot9fluo1N
> >j1X2s1
> >> J_sEVJGg2uwkZk&e=3D
> >>
> >>
> >> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> >> ---
> >>  content.tex | 41 +++++++++++++++++++++++++++++++++++++++--
> >>  1 file changed, 39 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/content.tex b/content.tex index d68cfaf..0a4cfba 100644
> >> --- a/content.tex
> >> +++ b/content.tex
> >> @@ -2815,6 +2815,13 @@ \subsection{Feature bits}\label{sec:Device
> >> Types / Network Device / Feature bits
> >\item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through
> >control
> >>      channel.
> >>
> >> +\item[VIRTIO_NET_F_RXBUF_LEN_RATIO(57)] Device requests to limit the
> >> +    maximum/minimum receive buffers length ratio.
> >> +
> >> +\item[VIRTIO_NET_F_RXBUF_MIN_LEN(58)] Device requests to know the
> >minimum
> >> +    receive buffers length. Driver declares the minimum receive buffe=
rs
> >> +    length.
> >> +
> >>  \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact
> >\field{hdr_len}
> >>      value. Device benefits from knowing the exact header length.
> >>
> >
> >So I am wondering, when we are switching from regular skbs to XDP, all
> >buffers become 4K. When we switch back, we get variability again.
> >All the while some old buffers can be outstanding.
> >
> >How will we handle this?
> >
>=20
> The feature limits the flexibility of the driver to set the descriptors l=
ength.
> It doesn't limit the actual buffer allocation size. So if XDP requires a =
larger headroom, I don't see a problem. Please excuse my ignorance, but wha=
t do you mean by "all buffers become 4K"?

So linux can switch between skb and XDP mode. In skb mode buffer size
varies, it works by merging multiple buffers. In XDP a single buffer
is made big enough to hold the whole packet. Length is fixed.

If we are in XDP mode but buffer was added while in skb mode,
or vice versa, we recover generally by copying data to
the correct buffer. This is a temporary slowdown -
better than dropping packets.

So let's assume the device ratio is 1.
I guess while in XDP mode, we'll write XDP buffer length into
this field. But in skb mode, we can make the buffer smaller.
This implies driver needs to change the min_rx_buf_len?



> >
> >> @@ -2861,8 +2868,8 @@ \subsubsection{Legacy Interface: Feature
> >> bits}\label{sec:Device Types / Network  \subsection{Device
> >> configuration layout}\label{sec:Device Types / Network Device / Device
> >> configuration layout}  \label{sec:Device Types / Block Device /
> >> Feature bits / Device configuration layout}
> >>
> >> -Three driver-read-only configuration fields are currently defined.
> >> The \field{mac} address field -always exists (though is only valid if
> >> VIRTIO_NET_F_MAC is set), and
> >> +The driver-read-only \field{mac} address field always exists (though
> >> +is only valid if VIRTIO_NET_F_MAC is set), and
> >>  \field{status} only exists if VIRTIO_NET_F_STATUS is set. Two
> >> read-only bits (for the driver) are currently defined for the status f=
ield:
> >>  VIRTIO_NET_S_LINK_UP and VIRTIO_NET_S_ANNOUNCE.
> >> @@ -2882,12 +2889,22 @@ \subsection{Device configuration
> >> layout}\label{sec:Device Types / Network Device  VIRTIO_NET_F_MTU is
> >> set. This field specifies the maximum MTU for the driver to  use.
> >>
> >> +The device-read-only field \field{min_rx_buf_len} only exists if
> >> +VIRTIO_NET_F_RXBUF_MIN_LEN is set. This field specifies the minimum
> >> +receive buffers length.
> >> +
> >> +The driver-read-only field \field{rx_buf_len_ratio} only exists if
> >> +VIRTIO_NET_F_RXBUF_LEN_RATIO is set. This field specifies the
> >> +maximum/minimum receive buffers length ratio.
> >> +

Config space access is from point of view of driver (it's part of device
so it does not make sense to talk about device reading it).
The point is driver is not supposed to read it, right?
So s/device-read-only/driver-write-only/ or better "write-only for
driver".

> >>  \begin{lstlisting}
> >>  struct virtio_net_config {
> >>          u8 mac[6];
> >>          le16 status;
> >>          le16 max_virtqueue_pairs;
> >>          le16 mtu;
> >> +        le32 min_rx_buf_len;
> >> +        le16 rx_buf_len_ratio;
> >>  };
> >>  \end{lstlisting}
> >>
> >> @@ -2916,6 +2933,15 @@ \subsection{Device configuration
> >> layout}\label{sec:Device Types / Network Device  If the driver
> >> negotiates the VIRTIO_NET_F_STANDBY feature, the device MAY act  as a
> >standby device for a primary device with the same MAC address.
> >>
> >> +A driver SHOULD accept the VIRTIO_NET_F_RXBUF_MIN_LEN feature if
> >offered.
> >> +
> >> +If VIRTIO_NET_F_RXBUF_MIN_LEN feature has been negotiated, the
> >driver
> >> +MUST set \field{min_rx_buf_len}.
> >> +
> >> +A driver MUST NOT modify \field{min_rx_buf_len} once it has been set.
> >> +
> >> +A driver SHOULD accept the VIRTIO_NET_F_RXBUF_LEN_RATIO feature if
> >offered.
> >> +
> >>  \drivernormative{\subsubsection}{Device configuration layout}{Device
> >> Types / Network Device / Device configuration layout}
> >>
> >>  A driver SHOULD negotiate VIRTIO_NET_F_MAC if the device offers it.
> >> @@ -3281,6 +3307,17 @@ \subsubsection{Setting Up Receive
> >> Buffers}\label{sec:Device Types / Network Devi  If VIRTIO_NET_F_MQ is
> >> negotiated, each of receiveq1\ldots receiveqN  that will be used SHOUL=
D be
> >populated with receive buffers.
> >>
> >> +If VIRTIO_NET_F_RXBUF_MIN_LEN feature has been negotiated, the
> >driver
> >> +MUST initialize all receive virtqueue descriptors \field{len} field
> >> +with the value greater than or equal to the value configured in the
> >> +\field{min_rx_buf_len} device configuration field, and allocate
> >> +receive buffers accordingly.
> >> +
> >> +If VIRTIO_NET_F_RXBUF_LEN_RATIO feature has been negotiated, the
> >> +driver MUST initialize all receive virtqueue descriptors \field{len}
> >> +field with the value less than or equal to (\field{min_rx_buf_len} *
> >> +\field{rx_buf_len_ratio}), and allocate receive buffers accordingly.
> >> +
> >>  \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types
> >> / Network Device / Device Operation / Setting Up Receive Buffers}
> >>
> >>  The device MUST set \field{num_buffers} to the number of descriptors
> >> used to
> >> --
> >>
> >> This publicly archived list offers a means to provide input to the
> >> OASIS Virtual I/O Device (VIRTIO) TC.
> >>
> >> In order to verify user consent to the Feedback License terms and to
> >> minimize spam in the list archive, subscription is required before
> >> posting.
> >>
> >> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >> List help: virtio-comment-help@lists.oasis-open.org
> >> List archive:
> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oasis-2Do=
pe
> >> n.org_archives_virtio-
> >2Dcomment_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3Dl
> >> DHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DjrQgZ-
> >iN3QnvFqxQQkoPTmztJ
> >> RTNCXTF2dz68TEV0cA&s=3DyHWSFWSoze0yJhs-
> >YBtijO34uqnnV0LoPfizi0miMNQ&e=3D
> >> Feedback License:
> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
> >2Dopen.
> >> org_who_ipr_feedback-
> >5Flicense.pdf&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r
> >> =3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DjrQgZ-
> >iN3QnvFqxQQkoPTmz
> >>
> >tJRTNCXTF2dz68TEV0cA&s=3D19yavBBd2Ai05CwKnyFOLRNlBnNAtmpKVsTMB6sI
> >TRE&e=3D
> >> List Guidelines:
> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
> >2Dopen.
> >> org_policies-2Dguidelines_mailing-
> >2Dlists&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz
> >> 7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DjrQgZ-
> >iN3QnvFqxQ
> >> QkoPTmztJRTNCXTF2dz68TEV0cA&s=3D3bbeWIoIuAK6RwARN2q-
> >t9hPTDAKbwOJ8fMRykpq
> >> ryk&e=3D
> >> Committee:
> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
> >2Dopen.
> >>
> >org_committees_virtio_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2F
> >W52oJ
> >> 3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DjrQgZ-
> >iN3QnvFqxQQkoPTmztJRTNCXTF2dz
> >> 68TEV0cA&s=3DU8z-sIxuNy_keXvWYnlIzloNziRKqC1pxOG-x3Hy6SY&e=3D
> >> Join OASIS:
> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
> >2Dopen.
> >>
> >org_join_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsAr
> >gFRdce
> >> vq01tbLQAw4A_NO7xgI&m=3DjrQgZ-
> >iN3QnvFqxQQkoPTmztJRTNCXTF2dz68TEV0cA&s=3DC4
> >> SQkiR2V1N3I_ri_7fwSiHmcVRNPp2FnVA4gR0-cgM&e=3D


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

