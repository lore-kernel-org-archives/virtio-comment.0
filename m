Return-Path: virtio-comment-return-1079-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DC5E6985EF2
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Feb 2020 08:10:52 +0000 (UTC)
Date: Thu, 20 Feb 2020 03:10:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200220024832-mutt-send-email-mst@kernel.org>
References: <20200219075337.23191-1-yuri.benditovich@daynix.com>
 <20200219075337.23191-2-yuri.benditovich@daynix.com>
 <86420fd1-cbb4-0105-4114-ca2d6cb3b8ff@redhat.com>
 <20200219092244-mutt-send-email-mst@kernel.org>
 <623f76be-bf87-c473-350e-87fe53b41261@redhat.com>
 <893990295.7352578.1582184463424.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
In-Reply-To: <893990295.7352578.1582184463424.JavaMail.zimbra@redhat.com>
Subject: Re: [virtio-comment] [PATCH v4 1/1] virtio-net: Define per-packet
 hash reporting feature
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Yuri Benditovich <ybendito@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Feb 20, 2020 at 02:41:03AM -0500, Yuri Benditovich wrote:
>=20
>=20
> =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81
>=20
>     From: "Jason Wang" <jasowang@redhat.com>
>     To: "Michael S. Tsirkin" <mst@redhat.com>
>     Cc: "Yuri Benditovich" <yuri.benditovich@daynix.com>,
>     virtio-comment@lists.oasis-open.org
>     Sent: Thursday, February 20, 2020 8:38:50 AM
>     Subject: Re: [virtio-comment] [PATCH v4 1/1] virtio-net: Define per-p=
acket
>     hash reporting feature
>=20
>=20
>     On 2020/2/19 =E4=B8=8B=E5=8D=8810:23, Michael S. Tsirkin wrote:
>     > On Wed, Feb 19, 2020 at 08:27:10PM +0800, Jason Wang wrote:
>     >> On 2020/2/19 =E4=B8=8B=E5=8D=883:53, Yuri Benditovich wrote:
>     >>>    The device MUST set \field{rss_max_indirection_table_length} t=
o at
>     least 128, if it offers
>     >>>    VIRTIO_NET_F_RSS.
>     >>> @@ -3195,6 +3180,8 @@ \subsection{Device Operation}\label{sec:Dev=
ice
>     Types / Network Device / Device O
>     >>>            le16 csum_start;
>     >>>            le16 csum_offset;
>     >>>            le16 num_buffers;
>     >>> +        le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT negot=
iated)
>     >>> +        le16 hash_type;  (Only if VIRTIO_NET_F_HASH_REPORT negot=
iated)
>     >>>    };
>     >>>    \end{lstlisting}
>     >> A question here:
>     >>
>     >> Consider we introduce VIRTIO_NET_F_FEATURE_INFORMATION in the futu=
re:
>     >>
>     >> le32 hash_type; // VIRTIO_NET_F_HASH_REPORT
>     >> le32 feature_information; // VIRTIO_NET_F_FEATURE_INFORMATION
>     >>
>     >> What happens if HASH_REPORT is not negotiated, I believe we expect=
 a
>     stable
>     >> ABI(offset) here for feature_information?
>     >>
>     >> Thanks
>     >>
>     > We'll have to decide at that point ... any better ideas?
>=20
>=20
>     Not sure but something that is self descriptive? (which could be an
>     overkill for fields that only need few bytes).
>=20
> The problem is that the driver typically wants to know the header size fr=
om the
> beginning to configure SG table.
> So any self-descriptive layout seems good but in practice not so usable, =
IMO.

We should also look at packing things more tightly down the road.




>=20
>=20
>     Thanks
>=20
>=20
>     This publicly archived list offers a means to provide input to the
>     OASIS Virtual I/O Device (VIRTIO) TC.
>=20
>     In order to verify user consent to the Feedback License terms and
>     to minimize spam in the list archive, subscription is required
>     before posting.
>=20
>     Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>     Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>     List help: virtio-comment-help@lists.oasis-open.org
>     List archive: https://lists.oasis-open.org/archives/virtio-comment/
>     Feedback License: https://www.oasis-open.org/who/ipr/feedback_license=
.pdf
>     List Guidelines: https://www.oasis-open.org/policies-guidelines/
>     mailing-lists
>     Committee: https://www.oasis-open.org/committees/virtio/
>     Join OASIS: https://www.oasis-open.org/join/
>=20
>=20
>=20


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

