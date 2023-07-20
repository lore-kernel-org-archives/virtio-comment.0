Return-Path: <virtio-comment-return-6879-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB58EB64DD
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 15:29:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ACD1AEEA16
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 15:29:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A8C2798681E
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 15:29:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A1056986818; Thu, 20 Jul 2023 15:29:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 90E0898681A
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Jul 2023 15:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: iOhS881pMXmA_SkitTryyg-1
Date: Thu, 20 Jul 2023 11:28:27 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	hengqi@linux.alibaba.com, virtio@lists.oasis-open.org
Message-ID: <20230720152827.GC184015@fedora>
References: <20230702234410.47546-1-parav@nvidia.com>
 <20230702234410.47546-3-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3VkRKs6yI8ois8xV"
Content-Disposition: inline
In-Reply-To: <20230702234410.47546-3-parav@nvidia.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [virtio-comment] Re: [virtio] [PATCH REQUIREMENTS v2 2/7] net-features: Add low
 latency transmit queue requirements

--3VkRKs6yI8ois8xV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 02:44:05AM +0300, Parav Pandit wrote:
> Add requirements for the low latency transmit queue.
>=20
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> chagelog:
> v0->v1:
> - added design goals for which requirements are added
> ---
>  net-workstream/features-1.4.md | 81 ++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>=20
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4=
=2Emd
> index 4c3797b..0c3202c 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -7,6 +7,7 @@ together is desired while updating the virtio net interfa=
ce.
> =20
>  # 2. Summary
>  1. Device counters visible to the driver
> +2. Low latency tx virtqueue for PCI transport
> =20
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -33,3 +34,83 @@ together is desired while updating the virtio net inte=
rface.
>  ### 3.1.2 Per transmit queue counters
>  1. le64 tx_gso_pkts: Packets send as transmit GSO sequence
>  2. le64 tx_pkts: Total packets send by the device
> +
> +## 3.2 Low PCI latency virtqueues
> +### 3.2.1 Low PCI latency tx virtqueue
> +0. Design goal
> +   a. Reduce PCI access latency in packet transmit flow
> +   b. Avoid O(N) descriptor parser to detect a packet stream to simplify=
 device
> +      logic
> +   c. Reduce number of PCI transmit completion transactions and have uni=
fied
> +      completion flow with/without transmit timestamping
> +   d. Avoid partial cache line writes on transmit completions
> +
> +1. Packet transmit descriptor should contain data descriptors count with=
out any
> +   indirection and without any O(N) search to find the end of a packet s=
tream.
> +   For example, a packet transmit descriptor (called vnet_tx_hdr_desc
> +   subsequently) to contain a field num_next_desc for the packet stream
> +   indicating that a packet is located N data descriptors.
> +
> +2. Packet transmit descriptor should contain segmentation offload-relate=
d fields
> +   without any indirection. For example, packet transmit descriptor to c=
ontain
> +   gso_type, gso_size/mss, header length, csum placement byte offset, and
> +   csum start.
> +
> +3. Packet transmit descriptor should be able to place a small size packe=
t that
> +   does not have any L4 data after the vnet_tx_hdr_desc in the virtqueue=
 memory.

Please make this a generic virtqueue-level feature. It sounds like the
idea is to vary the vring descriptor length per device type and per
virtqueue so that headers and small payloads can be embedded directly
into the vring.

> +   For example a TCP ack only packet can fit in a descriptor memory which
> +   otherwise consume more than 25% of metadata to describe the packet.
> +
> +4. Packet transmit descriptor should be able to place a full GSO header =
(L2 to
> +   L4) after header descriptor and before data descriptors. For example,=
 the
> +   GSO header is placed after struct vnet_tx_hdr_desc in the virtqueue m=
emory.
> +   When such a GSO header is positioned adjacent to the packet transmit
> +   descriptor, and when the GSO header is not aligned to 16B, the follow=
ing
> +   data descriptor to start on the 8B aligned boundary.
> +
> +5. An example of the above requirements at high level is:
> +
> +```
> +struct vitio_packed_q_desc {
> +   /* current desc for reference */
> +   u64 address;
> +   u32 len;
> +   u16 id;
> +   u16 flags;
> +};
> +
> +/* Constant size header descriptor for tx packets */
> +struct vnet_tx_hdr_desc {
> +   u16 flags; /* indicate how to parse next fields */
> +   u16 id; /* desc id to come back in completion */
> +   u8 num_next_desc; /* indicates the number of the next 16B data desc f=
or this
> +		      * buffer.
> +		      */
> +   u8 gso_type;
> +   le16 gso_hdr_len;
> +   le16 gso_size;
> +   le16 csum_start;
> +   le16 csum_offset;
> +   u8 inline_pkt_len; /* indicates the length of the inline packet after=
 this
> +		       * desc
> +		       */
> +   u8 reserved;
> +   u8 padding[];
> +};
> +
> +/* Example of a short packet or GSO header placed in the desc section of=
 the vq
> + */
> +struct vnet_tx_small_pkt_desc {
> +   u8 raw_pkt[128];
> +};
> +
> +/* Example of header followed by data descriptor */
> +struct vnet_tx_hdr_desc hdr_desc;
> +struct vnet_data_desc desc[2];
> +
> +```
> +6. Ability to zero pad the transmit completion when the transmit complet=
ion is
> +   shorter than the CPU cache line size.
> +
> +7. Ability to place all transmit completion together with it per packet =
stream
> +   transmit timestamp using single PCIe transcation.
> --=20
> 2.26.2
>=20
>=20
> ---------------------------------------------------------------------
> To unsubscribe from this mail list, you must leave the OASIS TC that=20
> generates this mail.  Follow this link to all your TCs in OASIS at:
> https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php=20
>=20

--3VkRKs6yI8ois8xV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmS5UpsACgkQnKSrs4Gr
c8jRSwf/ehN6WOlCcqfnlCXY9YGGfAWFqnaBPt9qoVSKvPKMosdyjIBGiFtEFibu
vG8TT1gmfS73livUZ3tEgq2GzzvNdpfMSddAO87VXu9oTjGjCUzPNijuV564bVKc
QZY5wwDhPhhLfIdAndqSgIOEjL2sGhlFcTwWOkgRf5LGTdEkB3OkRrjS9+9+bLbC
Xvus0Xv1uWhJHhthigDjJpnTrIity0AHxmS07Y9U6leuIBoz+VGkSPIuZ9zqokFl
4wbEIGQWctqGe6cdyTZlupoQ5vyvYQwYmerIpUPSejg4v1PNEAhl7WPLi4+3lgAW
B411AsAdbinVHd9oPR3+CASuTNaQKw==
=XPO4
-----END PGP SIGNATURE-----

--3VkRKs6yI8ois8xV--

