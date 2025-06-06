Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B3C1DC98B
	for <virtio-comment@lists.linux.dev>; Fri,  6 Jun 2025 05:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749189163; cv=fail; b=HPaSTvHWY6vEH8T9EYtKT2lSKV7WRnizsYm/7yA8JEq3VeOsN7htGdBLHW9rUKnEb9g9bhsN2C9ZJDNucd43DaetHDqUVu2qkz02gn5TpU8m+UXq9kte4TOWeWzjFD9Op5a19CBS9ywkW3Yx/7jZ2KTS+4uMH3wT+AOMHX53ovQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749189163; c=relaxed/simple;
	bh=eZb99IF71ikNK9GuqoCaS44caDPaIvHaP6cOIYOYHLU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UMPAROw8yLI2mU+DjM/p3VWOYlpTbz8BLS5Trw+HzSvkPz9yIHJB9/1SiZwguKAssCG8seOqTciIRN7LolkkaV/gCSgwuIv55LIZuranx7ZWRYTu21vOWJSVeUU58ra+nZVkeA3NV/+XKACgZsML1aaDeXGksRx3nBwd3ec69HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IiyUd4cO; arc=fail smtp.client-ip=40.107.102.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IiyUd4cO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNHTWksolGsPeggO7oQ5rlij7EER0pWfhJlDAvqMOIsYU5FYctzIzEjzrj6hh43uQYqv9tZTUgMibCvc1FAJzoieW9JwhkHHg3nNg6WlGmM6ZFlHRYdGxpFeyQg/kKElDVwbXmoETdSadHlmMwpWqO6lxDVIPgY/4MHpglOk/OE4cKVtneNBRGe6wADT/kia16nMgJ/wG6zLorFGi1FonGUjmth9RPPAcZOeCmtwVuMYD5qwTMqRQhjQL8ooYY7nj8E7tBg8KZm6J8FinUSp9+9gq6eNPHaATCQhNB2MO3IxRzerIULtKZf8QkUjUhT9oc2GaoFmfGm0kWrgy5Mh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+z5AAjCxFPux7QzgHYPk8oaMvRRlAHQJ21PjSWMAQY=;
 b=sq71FZoAq9rfnplvZibQbgN/Wql0ml9svBJS0BUbxGwo2JzNdgGH6clBzKwCooXwdMVWQ991p+J5/eCH7sGjeHisX/cVIUK0ndVP62rWZKfNIGQyU0T1JbMLdzh81qwkgR9scBrfXXiKpFoZhsiPoDGjqzTmvuAGM8QvbVoc0JmG3PcwR4CpO30187RPkXHCXplZsdBjO2a3iwH+s4bojHGeHkG/2BBjYoDfjSK3tq660aEuR+OSiPDfL9pzmEIy8eB9bOQoEGsEHFNgw8AZCqAIEAWKVnt/jAVhB9qTrXfe8VUjb6b/J9Jq+gjfmlZjztZFfQcvpaQPIABu6/Im0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+z5AAjCxFPux7QzgHYPk8oaMvRRlAHQJ21PjSWMAQY=;
 b=IiyUd4cON/1FFcE0xYOw4YtR3UUMcUSLPEZMG9oeoshoIxONkc+D1zbuRBZswNo41VdfOM9oFh3EC+1VYWSChAxCDwPk35jEduy5IH7n31WD5rhDNrYMPY+RiwXJ1HdRPqTnLUtVnyLbqJFOAQDIJZ3L9FRIroaO9ZcbNjaCgn7pPWBUgpFpzZflzb7iaZxbzCgtJ0hTAuQYZWfTiv8wCuZ6j3yrnweW/qaxk8KOwwJCoP/2ffhvSfYzAThspanE/gfwDDwvYsPkgCjUL/IPc++yA0TO2oeaqlCoatelXzcPOSFxbM55jjjtCWS5NjdmlL66UVWPyVpisMhoG36zJg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Fri, 6 Jun
 2025 05:52:35 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%5]) with mapi id 15.20.8792.033; Fri, 6 Jun 2025
 05:52:35 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: RE: [PATCH v2] virtio: introduce SUSPEND and RESUME feature
Thread-Topic: [PATCH v2] virtio: introduce SUSPEND and RESUME feature
Thread-Index: AQHb0HMnlr49j8ZC+U6fxbFjtRzqQbP1psYw
Date: Fri, 6 Jun 2025 05:52:16 +0000
Message-ID:
 <CY8PR12MB7195A87D14C87D52B8A03C79DC6EA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250529082355.86884-1-lingshan.zhu@amd.com>
In-Reply-To: <20250529082355.86884-1-lingshan.zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MN0PR12MB5881:EE_
x-ms-office365-filtering-correlation-id: 1ef9312a-d049-4fd2-0daa-08dda4be4afd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xoeHD+vwfLEwuN5Lx9rlulX0K1jlGpcv8O4g62mwzpHkroEcx0wK/SHrjdeP?=
 =?us-ascii?Q?p2aEhU1dwCZACdVumCDEGA1pRWJCIGtNXf1drltBbVLoNkB2IJdW9UagLsJR?=
 =?us-ascii?Q?zq/KbsmaajySsWWLZVTZ+K5e2JFPztTmjXeVFY7rmscwPjYZeQi2k8BK278f?=
 =?us-ascii?Q?GmE4tJ+qXVOAF/5pc0bqHN+TNmjZ2LITSCj7pFWyAnIwD/dxsjDbKcdoDVoW?=
 =?us-ascii?Q?M0IpnimwKHG6qDy4x+dlen6KGRM99LBNbQGLTnUdd+aak0JVTxaYEFixjZd+?=
 =?us-ascii?Q?TH+I5kKZuI6RyyfK33aLPkrXyC0Mm0qyVJal7W7oPdxvradjF//B47tKw5rR?=
 =?us-ascii?Q?2v6GLfihWPOhVGPqJs/UhZ0KBNr2eHYwBIivb9TkBPjFrc1ccViCr7gYRn8S?=
 =?us-ascii?Q?+ceuU1cI/H5cT+lKththaBjdqlnlMIFBeTuO++u9cP4rU0Yybiq15vdvULnU?=
 =?us-ascii?Q?EJIf64NC24YdxEaDLvdCmgyffkvRBKGfnkMVBDl1aLYW9xnOCKWCFfLCOMi0?=
 =?us-ascii?Q?xrJF6PN1vZEUxoYBp7sMRmYjiPk+zkje5ZI4R6sUwIWziCpW75dEEOSmrZMt?=
 =?us-ascii?Q?FMLXYC3JVpyMVOkjdO0vnML7Oajl6VRrHYA1w7Q3iKgyorBGS1Q+aW7H/G6z?=
 =?us-ascii?Q?8whjBIpA+rLqBKDoDY3ngFCwDX5MgCFLI5chvBr02abwvv4wzHKUIIz6vmk3?=
 =?us-ascii?Q?GKH/23N+6cv1OBe1Beo6KgdZH9lR8y/oZwE4UJ9tbwWF5fPUdpe1Cp1GmJ/+?=
 =?us-ascii?Q?t4S69wnsSKqAnhduSzqAqptkMOuCdaSTxAY1fNYBfsCr+BSP3qGbiBpk4Gpf?=
 =?us-ascii?Q?ownG82O3/I2ZouqSc/O6drSHO+2p/2HR6ujohtQ+4xx4DWaTHJxRxAthe42D?=
 =?us-ascii?Q?mVKpJ6htlQ01O24W4SKV0JSE4y6spfd7ZIPlnewGk4wWWb0+OYVMTDP6hQzp?=
 =?us-ascii?Q?2C6nLj0kLEZC+P3l35j/QYgQqrx88kpxTanyn71l30fokrRIOL3WJ0V+Ly5L?=
 =?us-ascii?Q?o3ng7ESYCVyXeRA9Iv/A4eL+Cg30HAJ+j/9ctYSmlrHokT15Je0w6Y6z+6/T?=
 =?us-ascii?Q?KEOfs12LFgW4JObw9kbP+RzyLHpev2FxI23L3YCbf+U3Ml4aEss1CSK8yLSy?=
 =?us-ascii?Q?rl+ZeJ80qDLhuiseGhWI5TbXNywCFaIhY/tJObBPyie2fl6BgEmXcxZoZ+PS?=
 =?us-ascii?Q?QjKwbYm3q/OB2dOEbxzV/Px5q6agkR6BaU3Of5m0pZYe1ZEX4cgbyVbApNX+?=
 =?us-ascii?Q?b2zhxpT7HpgjRX8HnJICXRkONsysE/HD1ESZrdHOexP7oBaMZ4SwhY/RWCyj?=
 =?us-ascii?Q?1DwTXrHmm06n2Nnut6/pKTu2YDKxaDDlFcDMgBZhcbXXDqtmCRd5oxnpl10d?=
 =?us-ascii?Q?LaQK9McGveSlfXWiQz1RwLeBUl2dg6o8SthubXD6AlXRejzvC5nyVTlLm3bU?=
 =?us-ascii?Q?53XVtCu7LZ+QGUsjBXK6T5bXDMK1aK3yASGoETuk3u0QIot5voPcRafihsjR?=
 =?us-ascii?Q?p8N3sgf+lVYd70s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0Tt0W7uR6vp9B0f1gUVdBDrU7FaJb5pZl0FnKJu+w9jrPzeziVVS6hgoUTVd?=
 =?us-ascii?Q?E+WFrf2rT8UzSiUERM2VnHeZCwibzH3sSXjBczRL+hBnSVO8iy5YUUwEgAXj?=
 =?us-ascii?Q?elThp0KV0JcfAvXeKq+OWUdFCUc5XCLi9EQLGRW6ooCMRyfPD8qLITe5D6Le?=
 =?us-ascii?Q?lkoW199t/H6Ph2jg/bVTNk42N3rsoqmUFqHPuxgupOGzFHA5LiBTLBWU7Xhp?=
 =?us-ascii?Q?GUy0lxAOEJud69l32HgylCa0t3auVmDvj2giCDaPX6BvrKepKFrb+fV9F40K?=
 =?us-ascii?Q?djHJrlmAi/PxzO5JWCZMAaqnTIwg99ouhA9T+ab4VJTWq1GNRKesG6AgYxEE?=
 =?us-ascii?Q?w/kFxvyK9fVBzJRN/u9idysIefpisZ1pAFlMtBXfFOk37Cf3wgsoxfOVP09b?=
 =?us-ascii?Q?uy88RJlxaboMdTTtMl7Gb7+a71Y3I1SmG6yJXOtfUljrM16Uuw3G3VrbYNI/?=
 =?us-ascii?Q?N4ViD1DyyqrL/A69ew/X8dg42pohwXyr1w+aJEmAfimKfg9pRaKXJrIhNR8D?=
 =?us-ascii?Q?1XsxXDKB+sTIpUN6pNbbNW8mg2sK7PBecRd8CR9m0yNqYlkYFx0/LmETInBM?=
 =?us-ascii?Q?UibLQFUD5d8J3CwbvJQJxh6CK9eMMit+M+pseCLdBqwHOXMMto/IlylhMZrA?=
 =?us-ascii?Q?32UCn82ou5uqY9B/J7EqxI3bCVjBvhD/XMHJrbhF6WZDq5+ctvz2inmtO38L?=
 =?us-ascii?Q?9sZxAqKuI9BEC52HFZeQXFG2ygwtuIOmYLKE2ng8Fy1HW95uGTWYloRMxEiv?=
 =?us-ascii?Q?5N3tJgU+HjU+UZSj/szCBhNP0JCdBe42RB9z5t71/x4bT+zJxsg6msRJewp/?=
 =?us-ascii?Q?oj9pBKkQgSKcdzAH6IGe/5RU8F4fU/nORcYP3/eYYNYL+bm7EW2CgcuQZozz?=
 =?us-ascii?Q?QnvwI/WdpsdVh646zjIRp6d6nEu8Zs+hcBWJy+jG87owjGOFWnS0IRbfEO7z?=
 =?us-ascii?Q?5RqCNNgejI/7gKciOlmh6aUUuYkNsbJUttpV7F6XDuHdfnVQ/Tz476tShVxi?=
 =?us-ascii?Q?2gIPserWAvpKIJ3hs100VK16uie4piQ2Y/8OHnGUhijbvmUZXJoT0peOa0KQ?=
 =?us-ascii?Q?tr11IR5BpwcOiicKYhVTKM0s19r+gHCi+DlUMk6ij8xnZ0tIQ3drvIJH2yJv?=
 =?us-ascii?Q?hfXY3i+aAKTFDdr1m9vGfztO2Q+hUJgEknT+Wws1W+PQS1giBQAnL2f0CAB3?=
 =?us-ascii?Q?Ej/s9D7MLvSgGRZn8GwM5YOdQX7vOY+G/LzGZJx8VWySLKrGgq3yEhNQ9AZt?=
 =?us-ascii?Q?EiGjYPEQhmuetH38V0qyqe05mj4XIkqNTSmOC1zDo2xznscDQPdQJQAN018t?=
 =?us-ascii?Q?/cGlfshuhd5F+XmO1n7N3j78rO78w6qfKfCkL+3hB+Fll8rslfZUUj8pSB5c?=
 =?us-ascii?Q?K6cUuqd3SpMBJ63vTHRQsQCLC1ThgeIeMn9X6E5//xSAswY251X/e6KkKXYp?=
 =?us-ascii?Q?SswsD6z0g/QNaBVX/lM09t38BoqHQGwLfY+nRFODrkjvAsY4/GVKhUfNrk5k?=
 =?us-ascii?Q?jUuhKt+/OwQVRIR20IQh9TFi0sUP3pmSLmwTpYxssbzNrz/JnEx4IoyN+RQ+?=
 =?us-ascii?Q?78tY+izacQUCXlp/DNLyY6/DE25xdUMaYpUwZLHBWDw63UPsHuj+RdJWE4C2?=
 =?us-ascii?Q?OynPnv15FFXEUOoJj9jFH+MgRzo7hA15YBm6CYBqPR7n?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef9312a-d049-4fd2-0daa-08dda4be4afd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 05:52:16.4899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KcI0inMXZYFtqp1Le/ft/WI5vLPGcEoqpUd6OTP+JUXs5YjwpHK02ePpk9F9g1RJd4zyIFtNkema7cghej/s9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881

Hi,

> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: Thursday, May 29, 2025 1:54 PM
>=20
> This commit allows the driver to suspend the device through a new device
> status bit SUSPEND and resume the device running by re-setting DRIVER_OK
> bit in device status.
>=20
> This commit re-orders the device status bits.
>
I overall like this proposal. Few small comments to fix more below.
It is lot cleaner as it eliminates the previous bit flipping complexities.

Can you please add one or two line on a use case/motivation,

For example,=20

Presently when an OS is suspended, the driver must fully stop and reset the=
 device, and on resume the driver must re-initialize the device.
This can be time consuming task to recreate large number of VQs.

Instead, extend the specification to allow drivers to suspend and resume th=
e device, without recreating all the resources.
...

=20
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  content.tex | 74 ++++++++++++++++++++++++++++++++++++++++++++++-----
> --
>  1 file changed, 65 insertions(+), 9 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index d3fc6a4..caef5d0 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic
> Facilities of a Virtio Dev
>      this bit.  For example, under Linux, drivers can be loadable modules=
.
>    \end{note}
>=20
> -\item[FAILED (128)] Indicates that something went wrong in the guest,
> -  and it has given up on the device. This could be an internal
> -  error, or the driver didn't like the device for some reason, or
> -  even a fatal error during device operation.
> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> +  drive the device.
> +
> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that
> +the
> +  device has been suspended by the driver.
>=20
>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all th=
e
>    features it understands, and feature negotiation is complete.
>=20
> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> -  drive the device.
> -
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
> +
> +\item[FAILED (128)] Indicates that something went wrong in the guest,
> +  and it has given up on the device. This could be an internal
> +  error, or the driver didn't like the device for some reason, or
> +  even a fatal error during device operation.
>  \end{description}
>=20
A new bit SUSPEND introduction should be done at the end without re-organiz=
ing rest of the bits.
Please add at the end.

Is the intention to rearrange the fields in ascending order of the bit numb=
er?
If yes, its good change too but than it missed re-arranging FEATURE_OK.

If you want to re-arrange, please have the pre-patch in this series.

Either way is ok to me,
1. Either as pre-patch for re-arrangement + addition of SUSPEND in middle.
Or
2. adding SUSPEND bit definition at the end=20

#1 is better to see in ascending order.

>  The \field{device status} field starts out as 0, and is reinitialized to=
 0 by @@ -
> 99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a V=
irtio
> Device / Feature B  \begin{description}
>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>=20
> -\item[24 to 41] Feature bits reserved for extensions to the queue and
> +\item[24 to 43] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>=20
Only one feature bit is used by this proposal.
So it should be 24 to 42 and use bit 42.

Did you use bit 43 due to existence of VIRTIO_NET_F_GUEST_RSC6?

> -\item[42 to 49, and 128 and above] Feature bits reserved for future
> extensions.
> +\item[44 to 49, and 128 and above] Feature bits reserved for future
> extensions.
>  \end{description}
>=20
>  \begin{note}
> @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
> Initialization And Device Operation /
>=20
>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) befor=
e
> removing exposed buffers.
>=20
> +\section{Device Suspend}\label{sec:General Initialization And Device
> +Operation / Device Suspend}
> +
> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
> device by setting the SUSPEND bit in \field{device status} to 1, and the =
device
> SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
> +
This is not a normative section so please avoid using SHOULD.
Better to word it as informative theory of operation text.
Such as,

If X is not negotiated, the....
And the device sets the DRIVER_OK bit to 0 once it has been suspend.

> +If the device has been suspended, the driver can resume the device runni=
ng
> by setting the DRIVER_OK bit in \field{device status} to 1, and the devic=
e
> should set the SUSPEND bit to 0 once it resumes running.
> +
The device sets the SUSPEND bit to 0 once the device is running.

> +\drivernormative{\subsection}{Device Suspend}{General Initialization
> +And Device Operation / Device Suspend}
> +
> +The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or
> VIRTIO_F_SUSPEND is not negotiated.
> +
> +Once the driver sets SUSPEND bit in \field{device status} to 1:
> +\begin{itemize}
> +\item The driver MUST verify whether the device has been suspended by
> re-reading \field{device status}, examining whether the SUSPEND bit is se=
t to
> 1 and the DRIVER_OK bit is set to 0.
> +\item The driver MUST NOT make any more buffers available to the device.
> +\item The driver MUST NOT send notifications for any virtqueues.
> +\item The driver MUST NOT make any changes to Device Configuration
> Space except for \field{device status} if it is part of the Configuration=
 Space.
> +\end{itemize}
> +
> +\devicenormative{\subsection}{Device Suspend}{General Initialization
> +And Device Operation / Device Suspend}
> +
> +The device MUST ignore any operations on the SUSPEND bit from the
> +driver if the device has not been completely initialized by the
> +procedures in \ref{sec:General Initialization And Device Operation /
> +Device Initialization}
> +
> +The device SHOULD ignore any write access to its Configuration Space
> +while suspended, except for \field{device status} if it is part of the
> Configuration Space.
> +
> +A device MUST NOT send any notifications for any virtqueues, access any
> +virtqueues, or modify any fields in its Configuration Space while
> +suspended.
> +
> +If changes occur in the Configuration Space during suspended period,
> +the device MUST NOT send any configuration change notifications.
> +Instead, the device MUST send the notification when it resumes running.
> +
> +If the driver sets the SUSPEND bit in \field{device status} to 1, the
> +device MUST either suspend itself or set the DEVICE_NEEDS_RESET bit in
> \field{device status} to 1 when it fails to suspend.
> +
Even though you have the driver normative, it is good to have device normat=
ive for suspend and resume operation:

Something like,

When the suspend operation completes in the device, the device MUST set
SUSPEND bit to 1 and DRIVERK_OK to 0.

When the suspended device is resumed, the device MUST set SUSPEND bit to 0 =
and DRIVER_OK to 1.


> +If the device has been suspended and the driver resumes the device
> +running by setting the DRIVER_OK bit in \field{device status} to 1, the
> device MUST either resume normal operation or set the
> DEVICE_NEEDS_RESET bit in \field{device status} to 1 when it fails to res=
ume.
> +
> +When the driver sets the SUSPEND bit to 1, the device SHOULD perform
It should be MUST.
Otherwise it can crash the system accessing memory that may not be any more=
 accessible.

> +the following actions before presenting the SUSPEND bit as 1 and
> DRIVER_OK bit as 0 in the \field{device status}:
> +
> +\begin{itemize}
> +\item Stop consuming more buffers of any virtqueues.
> +\item Wait until all buffers that are being processed have been used.
> +\item Send used buffer notifications to the driver.
> +\end{itemize}


> +
>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>=20
>  Virtio can use various different buses, thus the standard is split @@ -8=
72,6
> +923,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature
> Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits=
}
> for
>  	handling features reserved for future use.
>=20
> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
> +   suspend the device by set the SUSPEND bit to 1.
> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Fiel=
d}.
> +
> +
>  \end{description}
>=20
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> --
> 2.49.0
>=20

Apart from these small comments, please add the line in v3 commit log:

https://github.com/oasis-tcs/virtio-spec/issues/<issue_number>

This will help to link the two sides.
