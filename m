Return-Path: <cgermond@kalray.eu>
Date: Tue, 30 Aug 2022 12:08:45 +0200 (CEST)
From: Cyril Germond <cgermond@kalray.eu>
Message-ID: <2054028663.18021.1661854125834.JavaMail.zimbra@kalray.eu>
In-Reply-To: <87a67nfifz.fsf@redhat.com>
References: <20220825121807.348-1-cgermond@kalray.eu>
 <87a67nfifz.fsf@redhat.com>
Subject: Re: [virtio-comment] [PATCH] Fix virtio_net_hdr struct size when
 VIRTIO_NET_F_HASH_REPORT is negociated.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

----- Original Message -----
> From: "Cornelia Huck" <cohuck@redhat.com>
> To: "cgermond" <cgermond@kalray.eu>, "virtio-comment" <virtio-comment@lis=
ts.oasis-open.org>
> Cc: "cgermond" <cgermond@kalray.eu>
> Sent: Monday, August 29, 2022 12:33:04 PM
> Subject: Re: [virtio-comment] [PATCH] Fix virtio_net_hdr struct size when=
 VIRTIO_NET_F_HASH_REPORT is negociated.

> On Thu, Aug 25 2022, Cyril Germond <cgermond@kalray.eu> wrote:
>=20
>> Hard-coded references to the size of virtio_net_hdr strut are wrong when
>> VIRTIO_NET_HASH_REPORT feature is negociated.
>=20
> s/negociated/negotiated/ (here and in the subject)
>

Agree

=20
> Also, please keep an empty line before the s-o-b.
>

OK

=20
>> Signed-off-by: Cyril Germond <cgermond@kalray.eu>
>> ---
>>  content.tex    | 3 +--
>>  split-ring.tex | 2 +-
>>  2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index e863709..b900f35 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -3620,8 +3620,7 @@ \subsubsection{Setting Up Receive
>> Buffers}\label{sec:Device Types / Network Devi
>>  features are used, the maximum incoming packet
>>  will be to 65550 bytes long (the maximum size of a
>>  TCP or UDP packet, plus the 14 byte ethernet header), otherwise
>> -1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
>> -making for 65562 or 1526 bytes.
>> +1514 bytes.  The struct virtio_net_hdr (which length depends on
>> VIRTIO_NET_F_HASH_REPORT feature negotiation) is prepended to this.
>=20
> The normative statement right below also cites the 65562/1526 numbers; I
> assume that we want to adjust them as well? In that case, I don't think
> we can get around mentioning concrete numbers for all four cases
> (with/without offloads x with/without HASH_REPORT).
>=20
> Any other opinions?
I agree this parts needs update. Amongst the  3 alternate proposals for upd=
ating the normative statements of 5.1.6.3.1 (in the case VIRTIO_NET_F_MRG_R=
XBUF is not negotiated), which one would suit better (or eventually another=
 one) ?

1/
-If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6 or VIRTIO_NET_F_GUEST_=
UFO are negotiated, the driver SHOULD populate the receive queue(s) with bu=
ffers of at least 65570 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, 65=
562 bytes otherwise.
=E2=80=93 Otherwise, the driver SHOULD populate the receive queue(s) with b=
uffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, 15=
26 bytes otherwise.

2/
-If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6 or VIRTIO_NET_F_GUEST_=
UFO are negotiated, the driver SHOULD populate the receive queue(s) with bu=
ffers of at least :
      - 65570 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated
      - 65562 bytes otherwise.
=E2=80=93 Otherwise, the driver SHOULD populate the receive queue(s) with b=
uffers of at least=20
      - 1534 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated
      - 1526 bytes otherwise.

3/
=E2=80=93 If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6 or VIRTIO_NET=
_F_GUEST_UFO are negotiated, the driver SHOULD populate the receive queue(s=
) with buffers of at least 65550 bytes plus the size of the struct virtio_n=
et_hdr.
=E2=80=93 Otherwise, the driver SHOULD populate the receive queue(s) with b=
uffers of at least 1514 bytes plus the size of the struct virtio_net_hdr.

>=20
>> =20
>>  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types /=
 Network
>>  Device / Device Operation / Setting Up Receive Buffers}
>> =20
>> diff --git a/split-ring.tex b/split-ring.tex
>> index de94038..9487918 100644
>> --- a/split-ring.tex
>> +++ b/split-ring.tex
>> @@ -127,7 +127,7 @@ \subsection{Legacy Interfaces: A Note on Virtqueue
>> Endianness}\label{sec:Basic F
>> =20
>>  \subsection{Message Framing}\label{sec:Basic Facilities of a Virtio Dev=
ice /
>>  Virtqueues / Message Framing}
>>  The framing of messages with descriptors is
>> -independent of the contents of the buffers. For example, a network
>> +independent of the contents of the buffers. For example, if
>> VIRTIO_NET_F_HASH_REPORT has not been negotiated, a network
>=20
> This looks good, but personally I'd prefer to keep more-or-less to the
> existing line length, even though that doesn't affect the generated
> document.
>=20

OK

>>  transmit buffer consists of a 12 byte header followed by the network
>>  packet. This could be most simply placed in the descriptor table as a
>>  12 byte output descriptor followed by a 1514 byte output descriptor,
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>=20
>=20
>=20
> To declare a filtering error, please use the following link :
> https://www.security-mail.net/reporter.php?mid=3D1682.630c95e7.12a14.0&r=
=3Dcgermond%40kalray.eu&s=3Dvirtio-comment-return-3416-cgermond%3Dkalray.eu=
%40lists.oasis-open.org&o=3DRe%3A+%5Bvirtio-comment%5D+%5BPATCH%5D+Fix+virt=
io_net_hdr+struct+size+when+VIRTIO_NET_F_HASH_REPORT+is+negociated.&verdict=
=3DC&c=3D202f75f2c0c528203a5d4ddf74c13752d049a85d




