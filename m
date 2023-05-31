Return-Path: <virtio-comment-return-6054-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10425C7EE23
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 17:11:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 33EC8C610A
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 17:11:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1DEAA9865E2
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 17:11:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1514498640C; Wed, 31 May 2023 17:11:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0405E986531
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 May 2023 17:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0v6JAMSyPqq1u0FI9K4fHQ-1
Date: Wed, 31 May 2023 13:11:38 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230531171138.GI1248296@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-8-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wd0T5fRYHzeCmBJg"
Content-Disposition: inline
In-Reply-To: <20230504081910.238585-8-pizhenwei@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [virtio-comment] Re: [PATCH v2 07/11] transport-fabrics: introduce opcodes

--wd0T5fRYHzeCmBJg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 04:19:06PM +0800, zhenwei pi wrote:
> Define opcode with this rule:
> The Virtio-oF transport layer commands use 0x0000-0x0fff, and the
> device layer commands use 0x1000-0xffff. get/set status/feature/
> config use consecutive number.
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  transport-fabrics.tex | 134 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)

I will continue reviewing this later because I have run out of time.
Feel free to iterate this series in the meantime.

Stefan

--wd0T5fRYHzeCmBJg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR3f8oACgkQnKSrs4Gr
c8gwkAf8DqHDLgJW/YeDA7QY4NdH7+JQgrpsWJMO/TwjD7rokSysENnJ6J33gZ4l
0q3mjI+3xRGc0t9O3Ydfcy2gCPKxl1KPasHiuYK32hAJqGsxyZnI/MjMchTWXjed
aaQ//WWfVvspJf4+ak+24AauDpYpEA8AqpTCHoRxmUTQT1zkWEtSH4rgMeLYBwy3
HReGQFRRhacZnUz3XY9brondJ/5zQxW7mm/4w/uoBLMKaXiailfBNQaY8WZD5AWJ
3KZ7CmEAeFjUE1KRJREu8+Xw/NEyEf/+S3tdrmVKf9/FR9KkwIUNzA0MCV0vkPrq
JC+KPVHvuG2FXM32BiW7srV2kT6DpA==
=UUmu
-----END PGP SIGNATURE-----

--wd0T5fRYHzeCmBJg--

