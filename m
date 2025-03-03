Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6072AE89
	for <virtio-comment@lists.linux.dev>; Mon,  3 Mar 2025 03:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740973752; cv=fail; b=ZXH6CSmKruBpU1ieRfsnMF04hNTIT9hW2xF9G/8hp0u3GTYWrrxg+k0mPfext4IHaxiBbA+0t2rCqJrr0oVfmEC22xBGznEROvpwtNjeWxX2n5cY8xx3xrPHaMACJHtuc/V8ZJtk6CdyDp/38wKMIs3xI8YKMyrkhvGQ6+hFLpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740973752; c=relaxed/simple;
	bh=2XQusCPTib8y9c3DeosbbLRbRZ3Eu6d0kG7rraGhJXw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aPevk5c+d7hPsjjT8Gtg4EiSv5ysSyrKzmG+N5MTReN7j5gV0RR1pMjf99MyXBjlRVS7wKhTktq2AUIZaJFKWzKFh4Ksda+cOYZuCRbiGKbFQHAXHw1k9lbgSHtiTxPMCcdi7fz6I9i9l6lU0K/Kk9ZQny2BXBy1DrghjnIbm2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HFRjeBpT; arc=fail smtp.client-ip=40.107.236.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HFRjeBpT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcGi7/bP2yS7qRTcLOCaiaedbqLkK43QSKwDX752I2M6Dwzq/djL5odYScYs1BNZ8IaoZSyUYNhQSG5KtAHnuIlnCa+RdZfElVcsl6Mp3MTVPVH/7q9H3RZPjAEP4sLJ3YCWhU0Vw1UTQIZESCpcllPvrKqQdDj4R4dngEBsPRsds72g7evrYFgFXB7fUgJnilLOZIKaZ4t269faypjD1+AWNMFWS3vUA9z7YHpPCYXQDVWyUs8Uvte0zLpmVP2WjI3djSrrGUS/vkDa1hfbsHWIwaVmunWPs9mHsAPNLlykfppo5UFaN25k6VpjisgVKUyS6lilYPUkKfcnlATdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/p1gC/gMoMU8714IYuyS3GL0eG2iZ59PNAWeyAs07w=;
 b=I0p8hNB7PiMIgnitVfn3grmoaSIBPlKJlREZHlTAgtTC0VTswUl7spSG9SvKc1XBffFVoLEYcEebRfhGS4HHsZaJNm92Uej4QRl0je2fE44IYyW6gT2BNDQxk4pSMu0yaFU5BlFCinqez0+BSHryw5b2fHn0H0XSIDxMB8+fqQ6wj5uquiJ/386t6bxZXNzLlWYVMRXljFQrtyNljgC5Ch04On1moMlvBSC9yWCqYhBlishOL9pA0gc+32NvXpm9wLU1sAhRd3QWdnN4vRjjZsdKalA7c/FHZ/PZi9XdgwyduOL46mf7GvVpFt1l5BN1i6gj+xaImWcqmtj3Q4kacw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/p1gC/gMoMU8714IYuyS3GL0eG2iZ59PNAWeyAs07w=;
 b=HFRjeBpT8oi2rbJFonIUVwPChPy3w4KDN/GwznD9871doqoxRSVqRl5Alml72pnYkxcLi4OlQ6A/hC/HYiCVUxHGjuuiLENivuUejoZRb4geljkTqYpsD7qjjGWTqN29mhuGSwuAhTtTUsFlCvpxOO4vRK2PMCEHv61T3JCsBcOzShDJC9RCS4hQK4umcvbquWx2M0PbJfhBSaI+sAghl2ENyXDjzaPH1wCgNjWqMUPOtViBUs9pQLMo5vKISQ0vGBhR+Zrez1jDAcQUIIMs0C8yuU0l7QdVpUjl6FyuyZ0XzHhswtacFxBMxDNS/zd+3yy2cUvsaUHle4paSJ3A4g==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SA1PR12MB7365.namprd12.prod.outlook.com (2603:10b6:806:2ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 03:49:07 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8489.021; Mon, 3 Mar 2025
 03:49:07 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH v1] virtio-net: Rename selectors_limit to
 classifiers_limit
Thread-Topic: [PATCH v1] virtio-net: Rename selectors_limit to
 classifiers_limit
Thread-Index: AQHbf3CYV56sZrVinkyWGdLzAQxqwbNLm/eAgBVCvHA=
Date: Mon, 3 Mar 2025 03:49:07 +0000
Message-ID:
 <CY8PR12MB719566BBA6930FBBD7BA6577DCC92@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250215061158.21053-1-parav@nvidia.com>
 <Z7NQSyMUPunN5a+n@fedora>
In-Reply-To: <Z7NQSyMUPunN5a+n@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SA1PR12MB7365:EE_
x-ms-office365-filtering-correlation-id: 3d03c450-8c44-4dfb-e071-08dd5a065962
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?a1hsakxzMR68l31rXZX+EFP7h6I0pqLor4iIB+hP7XbUPr9ky77j3SYLUXlX?=
 =?us-ascii?Q?LIqeFpf39Du//U/nlS7Ay/YasQolmh/uGbcPBM0/pBSjwi3gyIiZv9mlr/jH?=
 =?us-ascii?Q?zCaI/yWB6BniCXXoGHBe2juj03Mx2c2v3mY3Om7a4aWVX/4TFPnqdXVZG4Av?=
 =?us-ascii?Q?ZFme11u/oyoueJ1psEdgvS7/KMJWEJAtjQAOmbGE4Vn1KNKmciN0Hng3PNEO?=
 =?us-ascii?Q?2SgkZf3XOg8Co+4JWbcqiRn13Epax9uAOyziJ27nMddvZeA9vdDOO7slcxoA?=
 =?us-ascii?Q?TJTN24CRDD4hhMSGkBRthoDl0xu0Zu/Us5v7piSctZnnbEXdgjgtixWvL/C9?=
 =?us-ascii?Q?u9C47tJDX54YmC/dZudmitVNu7yIeYyd4oZ0c6QcBinH6Zr4Mcw/9uM68+0V?=
 =?us-ascii?Q?KlzFFDAhD/Oies/enIEjVi6ldOrreFUQIDF0UUvLlD/IgpQAyQqSPi6AVJfM?=
 =?us-ascii?Q?HWcrXJW0G2gvaIwMjInxFEq90TPY+n3U/6GYIIyOEnJWDSPahwZTMwWJ4nKy?=
 =?us-ascii?Q?xYv8IJEweofQlmiprMxhNzrk0oQHrl7JTFyJ4j4uKWWiTs/QhFq23ljopA5m?=
 =?us-ascii?Q?Qi0iwXcAW3+Cq3f+w+Va+cXEvz4CqDYi0zrXzjKAW2mgPeS/5ebd3yWKjdk9?=
 =?us-ascii?Q?zxzuyux4DpYZznt7jhW4l94TD8roBblqdZm8Gs+tgyQXqnszVXs5kgRUwUHR?=
 =?us-ascii?Q?Tc/lw04aOBHPHN6tBt732uy00aotXMbfrtLoHKsQ1nlb5gMq1Uichi0Q8bjg?=
 =?us-ascii?Q?tn80HLGePMjCHPVTLM6RzXlxuIdcNfWlGNavGS6iO0pipLZaop0LMCtanoMT?=
 =?us-ascii?Q?gV5qL91XYq6tfLHHOClGh8srIfymF0n82U8EPub+rbfqGuDcM6RHNQTyXKCe?=
 =?us-ascii?Q?xezlLtqbrDYkI73XnkbgHfyj1Lpb1jRgyS6MEeTVkBPVSMcnqleP04A8Zc7/?=
 =?us-ascii?Q?hf9bqQ3QYDqElEmBKH19/CcnmLFzP8XgBQggZRXmKmvhpyuTaSPb5Nlgfvl9?=
 =?us-ascii?Q?FR3bzJTTdQXbAd23WR6dBTw486MGn1P9zeZzaJn+YFnVeeYzwhldPIfUuQPI?=
 =?us-ascii?Q?FcWjBnLnF2LS7FD7Qa7EQURD1IireipZif5NLdNMg8Di2VQGTQ4yQxt2qtDV?=
 =?us-ascii?Q?sGN8TClryYLRvbb+CtV0ONCUJvD//lBkx7hMaJk+1KU/V7lxjnKmedMGYKiS?=
 =?us-ascii?Q?m54TLwTw86S8bmvQuSq0Q5t1t2Y0G0NKk+uplsNLl7Z5jrSJ1gJIY87jRSQX?=
 =?us-ascii?Q?4XnXBYBrGjuUfR14NartM/FHhzgez5cosFxSXH6gCD7VY5aipH+TTEaBgERm?=
 =?us-ascii?Q?DUWmibk8+bHukFzdZ/qj436vnVG53/vfhqIaS82Iym4DwK9QMIlaXXqYsLKW?=
 =?us-ascii?Q?Ua+p1CQyAnDCSuqg2qo0cwQwTlOEFRL8zYYdqPXuAfOQ7Fbu3A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KhHNcIz4pj+gAkwsJ3VrRGaX8U8xaTdurx8iLY+sHvhTYmRnsGfG5+XFgdp3?=
 =?us-ascii?Q?+2XmuZHdACuhLWSoCTBM6zkHY2fw42axfjnWKICkIoY6RHfrDktQE6g3KyzC?=
 =?us-ascii?Q?l4qWW3HUyYCs40O1S7YLLvLb7vAI7ZjStQVYVMAaIu+2QZETZBB826LCdR7+?=
 =?us-ascii?Q?dJ6RMwhI/wlYnO/Pqdg68G8AB5PZcd+a2h2ZRwWaQLxLS8kRkEvuwf8TdgVN?=
 =?us-ascii?Q?i8aDkpeOAPUZwWfuzedaMtS7iizKAPNEoGfU8SQasaYyoyO/KauodKAnnGmA?=
 =?us-ascii?Q?N/X5YDtlYWqHGi4dl5QBSe4E0Ibo8Nm2piA/gztbcOrIS37Xlz7U3tFj1gFf?=
 =?us-ascii?Q?RIlZM07NQS/xoIl7XUE1In+CBh/ZiNigDj8R96tKrRLW8thxMZcKH39bmlys?=
 =?us-ascii?Q?9ecjziewxfavFOc8BHshDNfyaAfWqY3I2nRb5fvcQljyI1U5HDvQkt3UgRjp?=
 =?us-ascii?Q?qKDpkqyhQ7l6H6DS4fYODZlQOlG4kYZqj64MvWMBfjkvrEuiy0U+Gd5gtd92?=
 =?us-ascii?Q?xe5AKQ/Z51M5/XjAexRShv3NdyrIiaPuwt+JwhpJhvLjJkT8SkborzPVD5DB?=
 =?us-ascii?Q?3dMlg+bCYnlXc7mRBvlY7HOApFv4ub3pVl8cyPldJgYUq7kKgemnCEmaJ40A?=
 =?us-ascii?Q?J4ENNRALo4WDvkIS8Jncccgvz4o9Z16jNJI1aFV7HYYHTlOg9D4Id1anNGxu?=
 =?us-ascii?Q?psawJJ5ZInKgIBoBYJkKIihUqhm2iEDra1aN/vxvMKBfn6KaTtQbwIYqS4um?=
 =?us-ascii?Q?gcBBvDse/EEnzqVX6sZJX7sCdcEywBQi7Jv+k+TDYH5qvvpEJ0nVn81kljTL?=
 =?us-ascii?Q?63aCzRZjOsaeRtNH3u+fA34x5VhzjKhTnNjVnWoTOS8cnIiWpbB59rXPROfN?=
 =?us-ascii?Q?IH3DH+fFf47SNSdzBQz7d3iyd481MklVBbb8W0hGupibkrKWT2tKjfIHDwUv?=
 =?us-ascii?Q?9mmChXuKFcQd00eKHbQdTKcZHEb4HgZFiIh0017+goEYmyCgjSAYePQ75rGj?=
 =?us-ascii?Q?RoXsNznsI+ESqTStCIgjqx/LYNcdlUC9nlQ3/QClZHSXAJVw67ggXfIKaqOj?=
 =?us-ascii?Q?rlDaRunqC+JDXEcfn2iNJrki4PQydYifHzd0+r+LDs9SO4t7IBtVoiwxTJNm?=
 =?us-ascii?Q?FeBKoiuL60d9tJ+Lwny68XaKHbhiZ0isXUbDgCNINhTZrvE5wTWvfuTeYWPz?=
 =?us-ascii?Q?hmfDREg/6T6bi3B1zuQhDPE8u4PFoWKKY/34xGQiMcbI5h/hT2iut3QTizdz?=
 =?us-ascii?Q?HIjvMfYX9g0It+fTPsqXfBJGI3BML/vJ9eSmEZBUkjbKOPvdTHXu2NVfyR3e?=
 =?us-ascii?Q?07D/zMzeY33Rrl5dK4w/AETmkusiwP85TnuXRHlA1U4qEmNAgKBMJv8rEu6D?=
 =?us-ascii?Q?kjLXN9WFxxgDg9NGjC2j+qPf9SFSigq0RR1yilCrL5pDQ+qUT9g8s12K3fHC?=
 =?us-ascii?Q?gBiCe218yLb9AB3hwWsuV88LifuyL1+2iuNUzjiCV8BKLYWC+d65rPA8fNKk?=
 =?us-ascii?Q?hKCdY/Zr41uJEfk4Fssz9rPsAPtIoTCcwDZgY9jcOCr01hnL7aXIHmbkuonT?=
 =?us-ascii?Q?Vs1ZU6JUoaYcJFnUaSs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d03c450-8c44-4dfb-e071-08dd5a065962
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 03:49:07.1923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZpQynwHF/PbySHuCncAWXz6TpNnubWtylt72YoNEt01bmjIWDaY7GYTVJokqt7DuK5ZzLJHjNVXurgmnN344A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7365

Hi,

> From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Sent: Monday, February 17, 2025 8:36 PM
>=20
> On Sat, Feb 15, 2025 at 08:11:58AM +0200, Parav Pandit wrote:
> > A classifier object consists of one or more selectors. The number of
> > selectors per classifier object is already annotated in the field
> > selectors_per_classifier_limit.
> >
> > The field selectors_limit is intended to reflect the limit of
> > classifier objects. Hence, rename it to classifiers_limit.
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/215
> > Fixes: 3b7b7371dbed ("virtio-net: Add flow filter device and driver
> > requirements")
> > Fixes: 899bb0ca24d8 ("virtio-net: Add flow filter capability")
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> > changelog:
> > v0->v1:
> > - fixed to replace description of selectors to classifiers
> > ---
> >  device-types/net/description.tex | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
>=20
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

Can you please open a voting ballot for this change?
The github link is: https://github.com/oasis-tcs/virtio-spec/issues/215
Fix link: https://lore.kernel.org/virtio-comment/Z7NQSyMUPunN5a+n@fedora/T/=
#m9645510b9ce09e47c8b7b2812024e6e0c71fb061
