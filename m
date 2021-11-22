Return-Path: <virtio-comment-return-2368-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E7F03986277
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Nov 2021 03:45:06 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
From: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
In-Reply-To: <20211115074152.43427-1-helei.sig11@bytedance.com>
Date: Mon, 22 Nov 2021 11:44:31 +0800
Message-Id: <6336CF50-A7E4-4D5C-9709-AA8A1150CCC0@bytedance.com>
References: <20211115074152.43427-1-helei.sig11@bytedance.com>
Subject: [virtio-comment] PING: [V2 PATCH 0/1] Introduce virtio asymmetric crypto service
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: pizhenwei@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

Ping

> On Nov 15, 2021, at 3:41 PM, Lei He <helei.sig11@bytedance.com> wrote:
>=20
> V1 -> V2:
> - Rename the 'ASYM service' to 'AKCIPHER service'.
> - Added stateless mode for AKCIPHER service.
> - Added hyperlinks to the corresponding RFC documents for the terms
> ASN.1, DER, and some details involved in the RSA and ECDSA.
> - Fixed several grammatical and format errors.
> - Roll back irrelevant changes in V1.
>=20
> V1:
> - Introduced ASYM service type.
>=20
> Lei He (1):
>  virtio-crypto: introduce akcipher service
>=20
> virtio-crypto.tex | 310 +++++++++++++++++++++++++++++++++++++++++++++++++=
++++-
> 1 file changed, 305 insertions(+), 5 deletions(-)
>=20
> --=20
> 2.11.0
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

