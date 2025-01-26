Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9204964F
	for <virtio-comment@lists.linux.dev>; Sun, 26 Jan 2025 16:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737909896; cv=fail; b=uMfmLJobyF6YsCH5gzaF4l4c6S+T6DYRWKod1JaVwyQGBjazcBbPzsUbiNZL7xxJCPtooddYJdL43StL/cLELKdXWa3j0rbxBNX9gnCpL1P2mCq0CLhEnrRaNZwfJLj9rplrkNFGAeL5sGMlumyY+qa7GU4G+rY4/wPAFzCCQbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737909896; c=relaxed/simple;
	bh=iR1HdvRFpshAlRjfhkRXkoHhVbYl7+hUulv2RA2jCio=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sB6B1+PPZ4rczfRe+aMjvpNGIp+NrmzlzWTi1VwO31ynK8g9e/LVVrAbOS19E4aMKsLuk3mBqAFMQSzdbI1fnnUKZhQUL2tWSTi44MNHlVvJKUaxGGxDO23/c/5jRfS9jiO3iI7qkZ8RZP3XRgLEVrbQ52u1/CJn/I6nrmsdm2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PVV8ck92; arc=fail smtp.client-ip=40.107.223.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PVV8ck92"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjYu2qIuCqnoVkHLZVVLzRogZrpqYYkIv83rISjOzYCuvq6K+v4+g1uRN5Zlp+6rUPXjwREoCqhRxFOqvkgY6oD+VAPA8mqUaU/fxSSTqdxYmw52COuOGHoWAfR2GynkfJpI/XDmHTnR9Nlx/9EwSD/s9wLpT1qcLqgDWfdTWE+53ruhJ/6W+sB4yMqCfjWJSW2eZb0I04m0MdRk58ftXzs/M/1BLVRmaIpd/IWLTCUfzwbpVWC4QSKNEgZBI0amcw6kdysiM2ECSh6efe54rgwUJwEVSC1gzcawAxSNFGWDXN1poJZ+M+PIlsWc5NgNaw5ZpQifE+ErjMl5F1XRYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unp5ZlcVB2B8liCZgSg2a7KAVdD46Ycw8UJ+p7LMrLE=;
 b=as2uDX/EfQnWaIVo7Ut9VTF+LIwZzmAjcutdriho2q2b1HTZBjCYH5gLSoPmm2xdJMIdn1QNFPy/6uBr8o0w10o6z11EKw7lAi5mLL6H6sYtABlUSnyYuIGCYk5azfREJEKKK4k4101LOJ4pfOcF3OJvACEWFd0rE48LBQzEiDpa9kl5+REeYnESkZXwHRX4qzcl5shIqRG2UEr3bfStuCGoPxXkjbuPTtU7kYVfupezH2Itt2Un2SDNXPtlqY1trZ/spYLZx+2WNaiv8kEJ5Bh9z59jUIDej9kbjI1xUBzVFzl3KUgxqnCkO3YYG1sQO5YkTdVhS+E8RajqjQkfhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unp5ZlcVB2B8liCZgSg2a7KAVdD46Ycw8UJ+p7LMrLE=;
 b=PVV8ck92Ahky18jeKVmhwxYXfkmIhwyE8D0cVcOSwMrP8TGWq3IQESMaYyjiIqrV2oX52fBuf6yUSjikDrQxXjz9ViMM+pnRj5yA5af/hJgwqJueS8MqmMuxwnUakdha16Pv0uy6/+VdImDEAlxSnze2WImOy96V7LmT0zMIOIQLsTXZ/nyyTGdh3mMw2Bths5DlLQl0O01QiFcRE18kkzYb7OANDdyNt6FAGPzBF34PZR0LRBFcyeGfO2lMAEiUM3U/0TF56spR9/SvWEnpx1bHFERsbRW0LDMSikNLTaF1bmiskZhfJeBH+wQ2lokXlsKsGEKxNdYb8cj8eEMtpQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Sun, 26 Jan
 2025 16:44:51 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 16:44:51 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Thread-Topic: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Thread-Index: AQHbb7qQTK1IFlk3mUyW0rZK+XznHbMox2mAgAB7UaA=
Date: Sun, 26 Jan 2025 16:44:51 +0000
Message-ID:
 <CY8PR12MB71954013A3A3E5F81E03CD9CDCED2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250126062058.13695-1-parav@nvidia.com>
 <20250126041732-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250126041732-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SN7PR12MB6909:EE_
x-ms-office365-filtering-correlation-id: 57a14058-800b-44bc-a14e-08dd3e28c0ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?y4wxTZ2VrpoV/pNge0m0gf6TM2cnoCe0rY9IZz0EHZ9UujC4HEeGuP53gQ+9?=
 =?us-ascii?Q?09zrO6XQrYIZLtagdhxxMhEbuCLMOeLEXz4FvUp/xLyg5DwmUcqyoblUmu/j?=
 =?us-ascii?Q?5LGgT8PWSrrLRuQyNqr39nUvpk4l24UEFDkPwV90XYTrmftMPRNnAfI5O1kp?=
 =?us-ascii?Q?2YxobIr6g1vWyR2ZVoWhVtV5swS+6mwICqK7uzzbGm62TGwPY2LnbyOKrKaX?=
 =?us-ascii?Q?TqS5d4rvcuY0gSTg8lw93tHUkDk3weARLXe7RQAFvHzx9yBMZ+qhSTxX7zUl?=
 =?us-ascii?Q?PVNBJIj9bkE6+moIxB9MSkovUSUN3/VIKdgC56M4i8GycvthzjGM9+M4o7u1?=
 =?us-ascii?Q?jQhikxUo2lvZdwt3ZgJuAWQih1tVGko/L1IPs5nmQ4JKzGQgatVqos0WdZ3D?=
 =?us-ascii?Q?N5eIjgSQvufLomO/CECzv2Qr9sA5YrYxTEY9Av7DazYiOz4PVoZMaAoivoiv?=
 =?us-ascii?Q?p5jIkgvUnsw7t4zs1aRH9C6vuyRlQ72Gf81PtTEot5zfuLqQbEnfcuq5hTjt?=
 =?us-ascii?Q?EdiPQrTyWmFxFdxTM1IsKcb61jU9Wt4CP/V+GcyFHRmcoIY8eHBsZl+Cv67d?=
 =?us-ascii?Q?AdNg86aHmTLbkTEMHDOu4Cv3cRTY0OGjnaVZNezo5o0UmySuNOBmSTafCzFI?=
 =?us-ascii?Q?kp9Bn71GMBS3Vu4pGlMnSoxK25N9otuTF/cUXac6XTisRP0R4WbEzphH6Nxo?=
 =?us-ascii?Q?m0L9/n4NfxvRR70OKd+uHXBgY1kCNMR5uGOT9EePxHnCd1RIRJutWkXLmGDK?=
 =?us-ascii?Q?TW/IIvvzR/UEctBdBGSv5jVNO0pku1q0r95XQrk6KCyN0jno07KK6Q0fxiuB?=
 =?us-ascii?Q?4qAqxZJ09fZ7e0K59ixapfNcvhCeg5T67WrR+qUpWsgzguEe2aoy19rXTXdS?=
 =?us-ascii?Q?FK3zCJ4NCMloOjTQC+jusyvbMXVDVu0Bv83VhrWHuuHHa4Wb8VlDbNapcpvD?=
 =?us-ascii?Q?vMUlrfTyYXeTFKPEzhqxTpS2mtFe/w2lZcPmOx+KGLwdaXsAmMBH3vWb6+8r?=
 =?us-ascii?Q?N9GAsD7THv5uvzHEuRdXjwl059i61AHlUQqFfUkgEolNYX1nckZpu3pHb6rn?=
 =?us-ascii?Q?p6D083Ly9SoCEF8ZKSeHmOcrypF7j8QJMFZVYcDMXkwjapVva7tKN3uG3ef8?=
 =?us-ascii?Q?OOQJ2Mba7iDhwH4d4akyTgniUnc8fPbjbv3r7QteCaW40cfBq3zZsqSe0A0I?=
 =?us-ascii?Q?wOQA+epdYr9CUQSeg+3NiNnoWfwbjlcwe/nNcKSna1z/bw2504JE0jaaM78d?=
 =?us-ascii?Q?JOR9VP/Jhn4kk5XAAcbuMqDaV9FtZnVPptsZMahu1sLLbfKxTU5Ei3+qL8az?=
 =?us-ascii?Q?w4FxPKPU8NAmwrY2TCOahkL/brS7AIIjZPKmO9k4vB4Y30rGbg8JRN5HSC1e?=
 =?us-ascii?Q?zxpFXFmDxTMJNa8JmfH3F//Uu8zdp/bUx5u9jmTwUQeJoH69Pwd8CjUN68I9?=
 =?us-ascii?Q?TcxoLKfrxb8OnhnAC5GT9X3Yh74JkdzE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LYAmvz7MfjVkqDiSZp/GWuGUqTtfdFzxy84B2Ixm7miZE7UOYFTGiebL++aI?=
 =?us-ascii?Q?q0Venpf09gniHsEWDVzc8REAEu7DQd2eIwxvQ69BprYDbcxivaVlRQRn9uMZ?=
 =?us-ascii?Q?njt6QTFPwxv9qtNPw3nfGZ4ODksJpAlQbyjXxwHIpwh087dkQDAqIA9V37o3?=
 =?us-ascii?Q?Jklpjrcx5u5bBKHJwELxcgmnRDVKFLQpeE3bhgKrryhtCfHfc/5KKMCwLVAX?=
 =?us-ascii?Q?osX9LLf6G6UFXxFwiQcrKMZ62cvq13XmnDSxpIKWx/QOeJaZ1LXD5CB0Pj3e?=
 =?us-ascii?Q?p8dNvzC2LKkSXUOeSBjjq2HxkPJ493sQKYuLGMvkTK28MPtSYdjSNiMhPNKN?=
 =?us-ascii?Q?5Py88qi6wU6uTsEvxczNUHZrW1svxqTdO8NwXpj20pPMtP1z1O347porp/+x?=
 =?us-ascii?Q?lThqnn8kRcS3UH7eggzastw8f1ljXO0cTw2v5XsxxcqROA+8IVGvRg+flNUj?=
 =?us-ascii?Q?zkMCkSVufn9z7I+Srvryt0uJRrXJpBT4rKn2RcZE+EJzD+KSAqWXr54zx8me?=
 =?us-ascii?Q?NI1wQh0DkBnW0uSo3MriKDTCDkUABJEllNoGM8B0Tsb7DqCHdekZquVuehJ+?=
 =?us-ascii?Q?g88x/hR2ePWa8N/XyDx9kcRiY8TjjsDXOocJl2CkgVn+qjcMvtpq1vCB09ZJ?=
 =?us-ascii?Q?2P/DpB8SZtCIui7hof4Tw3PUHtadMNDkYxRtONRGBySi7+n197xq7US1xmGM?=
 =?us-ascii?Q?KW6Q1TXCBQqkB0Hb3plZ7uLYbXljCcDKN9IODAEm9BVyfG4uuCKbYr6oE2lg?=
 =?us-ascii?Q?yNmlnAGL2VqVhLJZqHMW2n8ciwxHBcGdIsf7cw7PChg12tIqucDvFwBM4SuY?=
 =?us-ascii?Q?gp+V7OiSFws+eyVATTjG3q31+uH73+/u774Z/hQkk8QPo7tfSYy3vpQCfE91?=
 =?us-ascii?Q?oH3gh7/AeB49oOgymx0fBabXssTWyXv6nKWUSyrQoE0I3FB55EhX7DSXfk9A?=
 =?us-ascii?Q?E2eSe0/0sDhuTf1ap/2g+M60ZDF4ZGTd5QR7bucSQ7T9T7HNPAJZBOLHbdv2?=
 =?us-ascii?Q?pUPGUARQvMotA8AGRdU2D8b3mCGF0nb9zOG0l0U5pDeNbaghF9gdGfE+Shzd?=
 =?us-ascii?Q?kXPiBOA12gDkxy3jSyDR1BUIaxkLikapVNrLizX568StafUFNG+/ZwuUQU3P?=
 =?us-ascii?Q?d9Bg+xsuRrf2W48i7aZn+WGNktRmO7oAPt8Qfas5CVgQGHMwWA6qyBUZu5F3?=
 =?us-ascii?Q?gXwm2hVxjNz8mN8NdYL38UI0jEfyegEoKnk3FvsEzTEfqJtdTqhT5cW/wEaw?=
 =?us-ascii?Q?XeNoA+mtjpMgm5Zo0HjZ56bAOddgTUqCF2RtgXsEF/xy8gsv24anZ+A3Jhy0?=
 =?us-ascii?Q?xKwkFAw1d+COGbl6otw0iaZkeDa8UXB89cmiGZhtyQBbSyJ7RBUE6b9p5kgM?=
 =?us-ascii?Q?g64IgRfr1mcJaeugCQO1/EbfkmkbPDts/jFr7x8NFs92St3xkPu58mSSeJVo?=
 =?us-ascii?Q?1PunneAsMqsa3PW/RDvvNObEmgbKU08VQyoOetP2GMJaiRa7ormUPPKXhb0O?=
 =?us-ascii?Q?zTUrGd/BtRbohD78J4kB9OdYuoDQH54cSM3p38iqjx5JnFzwcjrV3W20lNaP?=
 =?us-ascii?Q?EsttWEx/r/rs6VhcYcE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a14058-800b-44bc-a14e-08dd3e28c0ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2025 16:44:51.0543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u5e9yrnn5bWWKzWmq62MkknxTqONQXwKT9J0Rn0UdqpT2XJ5KnF2TwPoMvBsZiAs5HTXUD4cB58+cMgH2tGWNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Sunday, January 26, 2025 2:50 PM
>=20
> On Sun, Jan 26, 2025 at 08:20:58AM +0200, Parav Pandit wrote:
> > Listed patches in the fixes tag, incorrectly used the reserved feature =
bits.
> > Fix them to use the well defined device specific range.
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/212
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/213
> > Fixes: 8cd457d8aa82 ("virtio-net: define UDP tunnel segmentation
> > offload feature")
> > Fixes: 3fea589bd7c6 ("virtio-net: define UDP tunnel checksum offload
> > feature")
>=20
>=20
> Well the hashes will be wrong I think.
I pulled the patches from the mailing list to local repo using b4.
Once the new fix is voted, I will merge both the series together so that ha=
shes stays the same.

> So, we can do the ballot for this fixup, and wait with applying the patch=
es
> until that new ballot completes.
Yes. The small fix is reviewed by Paolo and Cornelia, so if it looks ok, we=
 can wait for this week for any additional review comments.
And merge by Feb-10 or so after new ballot completes.

> Or we can do a completely new ballot.
>=20
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> >
> > ---
> > changelog:
> > v0->v1:
> > - added Cornelia's reviewed-by
> > - added github issue number
> > - skipped Paolo's suggestion to modify 'le64 offloads' as its only 64-b=
its
> >   and new feature bits are in > 64 bits range
> > ---
> >  device-types/net/description.tex | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index efb543f..b546cd7 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -88,18 +88,6 @@ \subsection{Feature bits}\label{sec:Device Types /
> > Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> Set MAC address through control
> >      channel.
> >
> > -\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can receive
> GSO
> > packets
> > -  carried by a UDP tunnel.
> > -
> > -\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (47)] Driver
> handles
> > packets
> > -  carried by a UDP tunnel with partial csum for the outer header.
> > -
> > -\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can receive
> GSO
> > packets
> > -  carried by a UDP tunnel.
> > -
> > -\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (49)] Device
> handles
> > packets
> > -  carried by a UDP tunnel with partial csum for the outer header.
> > -
> >  \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level
> statistics
> >      to the driver through the control virtqueue.
> >
> > @@ -136,6 +124,18 @@ \subsection{Feature bits}\label{sec:Device Types
> > / Network Device / Feature bits  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)]
> Device reports speed and duplex.
> >
> >  \item[VIRTIO_NET_F_RSS_CONTEXT(64)] Device supports multiple RSS
> contexts.
> > +
> > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (65)] Driver can receive
> GSO
> > +packets
> > +  carried by a UDP tunnel.
> > +
> > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (66)] Driver
> handles
> > +packets
> > +  carried by a UDP tunnel with partial csum for the outer header.
> > +
> > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (67)] Device can receive
> GSO
> > +packets
> > +  carried by a UDP tunnel.
> > +
> > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device
> handles
> > +packets
> > +  carried by a UDP tunnel with partial csum for the outer header.
> >  \end{description}
> >
> >  \subsubsection{Feature bit requirements}\label{sec:Device Types /
> > Network Device / Feature bits / Feature bit requirements}
> > --
> > 2.34.1

