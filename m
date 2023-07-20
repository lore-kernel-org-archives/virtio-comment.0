Return-Path: <virtio-comment-return-6878-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE51EB64DD
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 15:25:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0F50E78DA2
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 15:25:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC4F3986820
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 15:25:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D858198681B; Thu, 20 Jul 2023 15:25:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C587498681A
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Jul 2023 15:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: BkeLTLHPNMOSCqjuOsyY-A-1
Date: Thu, 20 Jul 2023 11:19:17 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	hengqi@linux.alibaba.com, virtio@lists.oasis-open.org
Message-ID: <20230720151917.GB184015@fedora>
References: <20230702234410.47546-1-parav@nvidia.com>
 <20230702234410.47546-5-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZCMYoPUf7zWFA5mC"
Content-Disposition: inline
In-Reply-To: <20230702234410.47546-5-parav@nvidia.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [virtio-comment] Re: [virtio] [PATCH REQUIREMENTS v2 4/7] net-features: Add
 notification coalescing requirements

--ZCMYoPUf7zWFA5mC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 02:44:07AM +0300, Parav Pandit wrote:
> Add virtio net device notification coalescing improvements requirements.
>=20
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v0->v1:
> - updated the description
> ---
>  net-workstream/features-1.4.md | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4=
=2Emd
> index 3e8b5a4..a34556c 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -8,6 +8,7 @@ together is desired while updating the virtio net interfa=
ce.
>  # 2. Summary
>  1. Device counters visible to the driver
>  2. Low latency tx and rx virtqueues for PCI transport
> +3. Virtqueue notification coalescing re-arming support
> =20
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -157,3 +158,14 @@ struct vnet_rx_completion {
>     which can be recycled by the driver when the packets from the complet=
ed
>     page is fully consumed.
>  8. The device should be able to consume multiple pages for a receive GSO=
 stream.
> +
> +## 3.3 Virtqueue notification coalescing re-enable support

It's called "re-arming" above but "re-enable" here. Please choose one
term and use it consistently.

> +0. Design goal:
> +   a. Avoid constant notification from the device even in conditions when
> +      the driver may not have acted on the previous pending notification.
> +1. When Tx and Rx virtqueue notification coalescing is enabled, and when=
 such
> +   notification is reported by the device, device should be able to disa=
ble

"notification" -> "a notification"

", device" -> ", the device"

> +   further notifications until the driver finish reacting to the already

s/finish/finishes/

> +   generated notification.=20
> +2. When the driver enables the notification coalescing reporting, the de=
vice

"enables the notification coalescing reporting" ->
"enables notification coalescing reporting"

> +   to notify again if notification coalescing conditions are met.

I can't parse this sentence. Maybe "the device _has_ to notify again
=2E.."?

I find this text hard to understand. Is this a mechanism where the
device does not send further notifications on a virtqueue until the
driver has re-armed them?

How does this relate to EVENT_IDX, which can be used to achieve a
similar effect? I guess the downside to EVENT_IDX is that the device
must DMA repeatedly in order to detect changes from driver, whereas this
new re-arming mechanism involves a hardware register write?

Can this new mechanism be generic for any kind of virtqueue, not just
virtio-net rx/tx?

> --=20
> 2.26.2
>=20
>=20
> ---------------------------------------------------------------------
> To unsubscribe from this mail list, you must leave the OASIS TC that=20
> generates this mail.  Follow this link to all your TCs in OASIS at:
> https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php=20
>=20

--ZCMYoPUf7zWFA5mC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmS5UHUACgkQnKSrs4Gr
c8gv7gf/b/m2s2/qOs7IEO9Ulkzex8xFvkJ5glZgcZnIpR/UWx4h+BFXcl7xa4i4
RI36yG2kjE0/Y+mxeCNldvVpCQwKy1f7JHvclvxj9ciRJ838nvlJ8heRlkF7ub+J
IueWFHhUYfs1awmNIg9veZc0mFmBkwFD6QMwHr8a4uzZRkM9bzDpiUNTMdL/nB9j
vNwqzWmxEfDRQO+1l2H4vg0bFM6pK45GPri9AjqNm8Fbjb2AKEkisubXMpazLBRe
9hbAeeYewEPoPeflYZ4jaokJCF0yRZ/PAiq7KjqrWR9qPsqnAsaaSFlQUFhXUHIR
HIW0DfkSuhzjnlumn8JoTYdbtGHL8Q==
=R2nk
-----END PGP SIGNATURE-----

--ZCMYoPUf7zWFA5mC--

