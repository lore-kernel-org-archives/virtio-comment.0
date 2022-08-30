Return-Path: <virtio-comment-return-3420-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6704D98642E
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Aug 2022 11:07:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <2054028663.18021.1661854125834.JavaMail.zimbra@kalray.eu>
References: <20220825121807.348-1-cgermond@kalray.eu>
 <87a67nfifz.fsf@redhat.com>
 <2054028663.18021.1661854125834.JavaMail.zimbra@kalray.eu>
Date: Tue, 30 Aug 2022 13:07:04 +0200
Message-ID: <87sfledm7b.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] Fix virtio_net_hdr struct size when
 VIRTIO_NET_F_HASH_REPORT is negociated.
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Cyril Germond <cgermond@kalray.eu>
Cc: virtio-comment <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Aug 30 2022, Cyril Germond <cgermond@kalray.eu> wrote:

>>> diff --git a/content.tex b/content.tex
>>> index e863709..b900f35 100644
>>> --- a/content.tex
>>> +++ b/content.tex
>>> @@ -3620,8 +3620,7 @@ \subsubsection{Setting Up Receive
>>> Buffers}\label{sec:Device Types / Network Devi
>>>  features are used, the maximum incoming packet
>>>  will be to 65550 bytes long (the maximum size of a
>>>  TCP or UDP packet, plus the 14 byte ethernet header), otherwise
>>> -1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
>>> -making for 65562 or 1526 bytes.
>>> +1514 bytes.  The struct virtio_net_hdr (which length depends on
>>> VIRTIO_NET_F_HASH_REPORT feature negotiation) is prepended to this.
>>=20
>> The normative statement right below also cites the 65562/1526 numbers; I
>> assume that we want to adjust them as well? In that case, I don't think
>> we can get around mentioning concrete numbers for all four cases
>> (with/without offloads x with/without HASH_REPORT).
>>=20
>> Any other opinions?
> I agree this parts needs update. Amongst the  3 alternate proposals for u=
pdating the normative statements of 5.1.6.3.1 (in the case VIRTIO_NET_F_MRG=
_RXBUF is not negotiated), which one would suit better (or eventually anoth=
er one) ?
>
> 1/
> -If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6 or VIRTIO_NET_F_GUES=
T_UFO are negotiated, the driver SHOULD populate the receive queue(s) with =
buffers of at least 65570 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, =
65562 bytes otherwise.
> =E2=80=93 Otherwise, the driver SHOULD populate the receive queue(s) with=
 buffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, =
1526 bytes otherwise.
>
> 2/
> -If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6 or VIRTIO_NET_F_GUES=
T_UFO are negotiated, the driver SHOULD populate the receive queue(s) with =
buffers of at least :
>       - 65570 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated
>       - 65562 bytes otherwise.
> =E2=80=93 Otherwise, the driver SHOULD populate the receive queue(s) with=
 buffers of at least=20
>       - 1534 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated
>       - 1526 bytes otherwise.
>
> 3/
> =E2=80=93 If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6 or VIRTIO_N=
ET_F_GUEST_UFO are negotiated, the driver SHOULD populate the receive queue=
(s) with buffers of at least 65550 bytes plus the size of the struct virtio=
_net_hdr.
> =E2=80=93 Otherwise, the driver SHOULD populate the receive queue(s) with=
 buffers of at least 1514 bytes plus the size of the struct virtio_net_hdr.

I'd probably go with option 1, if we do not expect more
header-size-changing features in the foreseeable future, option 2
otherwise (IMHO, 1 is easier to read, while 2 is easier to extend.)

I'll let the virtio-net folks decide on that one.


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

