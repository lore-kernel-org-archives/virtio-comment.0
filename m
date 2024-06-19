Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F74382495
	for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 18:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718820519; cv=fail; b=sMsysJL3Q1qZ2N/IuawWsAMnf4hMO2AeXOQRlXHe0jB5mm8/YIAsnwEFe/7+DRPQ79gLdhoNCtil8cjwSHDGbxr3Dcd5KiwNO1aecdW6lOcDw6EG0ppSids3cdWAV3IUMq4LkANc8dVsoDWxUy6kvfyOX0pm/jT9MQDm4JOAE9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718820519; c=relaxed/simple;
	bh=Z4n+IihuBeGhavZJRzxoey/D+cZscl17oQZnTiC9/I0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kBVbBqsFGIGcm4cS98gF7nQn94yRhP9flsrakckpqFd1qjn4dkRUPnSfj2lktQMV16HisixNBOTQIT8kzF6lMbDb27yRYBs0ncS8HwtRQxWhVpCemw+/N+mHLU3d7UYZL+3XHRiY/VWk7mMu8aJWCq3LNR+yqJHIjLf54RsQhSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ibt9tq4L; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ibt9tq4L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esVoVuYGGYsPobKuZoZYq6qpoaWqe63DbfzUW7zYufxZqu5eYhwhm4WlDz0GNWGTzsrchd852+P5esEQ7IWUrgeHRbIwAj3xQ88xanuEASV8fgq4cmOzEvxuDsXEqLOREOdFK1qnKc08GUUf1vwOUV54ZzsFldv9XxsiVyIOkq76UjxGdWepT8tHiBh3zSwNGOvDMCkLhhsChg9OCjthKq/Csf7ijbwTJ+FC4P0WWocbTGCROmCc7YCdmI5oitoOlVy5NNYsSUopoLpYHwF2ULlhzb2NB3KVjeVMswjkCUUJXE1JVAlzVZuq6WjSvHAv6WCx1yBISsglpg4BdEtO9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4n+IihuBeGhavZJRzxoey/D+cZscl17oQZnTiC9/I0=;
 b=by7QIFfLzbQqhlam+mnLd56hlwloFxhdueoKWO2ghlqsfKS8K38e1pVhZf58StJUTaO+YJdykQjbx3ZnJnNrjxIZMBFTb8b+mvf6NefQDb28jjtKjwzir/wBBwb67yZvJMCpB/KT/loXq5/k106jGcmd1wgSFiYPpqbhNoxNusH0guZhaaZm/LaEi6dIhGxaPNZnrPJe+RCDiJCj/m9TZBi2Qt94s2BloAXGIeHVVsyrteo5d+NBAwkRJg8C+yecOgenFByuE4A6Lmj2VJsOOib8ffsUFlFPhjLE+gEoJ4yv5muHUnmZRHp30/k5rlf5qtJ49fxAAC2uAONAucabAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4n+IihuBeGhavZJRzxoey/D+cZscl17oQZnTiC9/I0=;
 b=Ibt9tq4L3iO4X8f248bS/i0i74YXKwrswCv29OTH+GuJGaCg3/k7T1XJXipRJQLcGQVC7yUnLLeGjN86HoJf4uAaRWF4KubY/RlwK5k/6G6DjcOS14HSkWAs39LwnoUoc7sbJfOnrlpJnThOOeAtN5mHazM4ODYOEiA3Wxswj5+c2yVF22A4YA5qw++l+1vwX+/wJgm1zo9hDsgxOVV2ejp+uNdydweSbV7Ih+qdsPMz6YQOyLj+z7wHJpcVpXO//rLtbl/ULeHmWzpWcTVhNf8bhPOlEiq3dl1mVkv+dB2CKeb7J9+rBIxCMcji/kVRkJ/WzTS7oxj9FX2mvY2C+w==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.18; Wed, 19 Jun
 2024 18:08:28 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 18:08:28 +0000
From: Parav Pandit <parav@nvidia.com>
To: Vamsi Krishna Attunuru <vattunuru@marvell.com>,
	"lege.wang@jaguarmicro.com" <lege.wang@jaguarmicro.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AdrCV+QF0lFIwI3sT3qg+ZJv+Q1L8wAG6vtw
Date: Wed, 19 Jun 2024 18:08:28 +0000
Message-ID:
 <PH0PR12MB54810AA98716C6398A412342DCCF2@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <MW4PR18MB52448CB41784611E654333B3A6CF2@MW4PR18MB5244.namprd18.prod.outlook.com>
In-Reply-To:
 <MW4PR18MB52448CB41784611E654333B3A6CF2@MW4PR18MB5244.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW3PR12MB4361:EE_
x-ms-office365-filtering-correlation-id: dc0f06a2-c2cd-4e83-aaff-08dc908ad21e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Z1YGPbgW4uahmwRrBZ0gcO6vwSeQkAPwFU1zvYGPvhJTwuidNUZWhFn4jU78?=
 =?us-ascii?Q?vnLTa84J6Hs+3lWYjLdM9wEH79iwNeFDge3NrVHrcR0I2yWV2VHaLhqt3nAk?=
 =?us-ascii?Q?Lpo7TG8ieZlbATpA9JoX2PGR04fsRK2kVBvqcj6zIEcOwEqam4Gi3Cg28XFw?=
 =?us-ascii?Q?ThMIe052Vz3FLwOZzD0ANgOP8fYO8XvYAGePdXjb5MW/G1/vom0k/bAAc4vJ?=
 =?us-ascii?Q?CgBWiBvIyqPrz7uy3QPlChQ0UDLs4hL/JkafGaRSC6Z/vJ3wIN4Bw4TS5nw1?=
 =?us-ascii?Q?uVNSSsgCt+tbAqLJhnhqNwGdIw+CK8gxAgBLT7dW8HwT4wh7eRxb/gULXoFa?=
 =?us-ascii?Q?Tj9KnlBlGpmRyz/7mmCvj5TJK3DxcLWgjmy6gx+hTGimkD4GlOskX3Kr3GW2?=
 =?us-ascii?Q?DNFA6exqozmW33xu4GZpx85skja7nkhpbRjji3jyMbv73sZFLUMiP3fWiVMq?=
 =?us-ascii?Q?Ojf3z6Fqoa7ivrNd/K6PGkIooXGJt6SpitkM5g7rSMRk2HRLaKWHFoqOqT2X?=
 =?us-ascii?Q?bLpqq5IT1coxDyHjiJQ599rFCAEIpdgni1ViMksbcJv8ugW0MGBXKegWj6Eq?=
 =?us-ascii?Q?PWPrX6eS1/I3qQV20brQRR4aFRfHw+/eMZd88MY8tm1EdQBgalYrqXDd7g4h?=
 =?us-ascii?Q?5OBeloKAB++emeMp9OUc3ZhwscJCy2P4OowgNP+W3Y1eJOZzTzkD1qHojk1Y?=
 =?us-ascii?Q?7jwa3nH5fIiLQRVDOJxxOVXm71amUAwKrg/JbY+K0m+IPI5/4eVFRCxzXmoa?=
 =?us-ascii?Q?DYcf6co9Qf55aN5bi4r/6F8ulyaqDUZAl8eJ+ivsJxZiRCOrfxDqx/Eb9JzZ?=
 =?us-ascii?Q?A1QFpY7WmNaeQ3407AgcV1suxTpMlrWkMuBcGi3eBB3FO/xe1zijeSb7C7EF?=
 =?us-ascii?Q?9zKCrOVbXXkr4lfL17TtkNjNw5vkQjryL+fShyc4JxmqB0R8Fcm6hMOpnOAx?=
 =?us-ascii?Q?sv+71tc2tPEIT56E739dHWcKWOXRd4/qjBg5u7ILVAsAV7ymWb7SmEjZc6EC?=
 =?us-ascii?Q?rPrdqdvnZduDanbj0SQp85CaUiYxpUBolOSkN6RRQCg7/RMgP5H+rSuChlu1?=
 =?us-ascii?Q?ArbElHEZUTZcauirV8gjrTyU6T2HcOFpA5nOUNrEAgKgjlSEHq9gxLDkx6Xy?=
 =?us-ascii?Q?mNcQbQOd14e3OFjfrzCPXfC3ar+LQQqZPxCwFci0YoSDThKvk7RjYDokZSFh?=
 =?us-ascii?Q?k0g3e/HE27XtjahNaZspVWspI7KnVXsccyiBctVwFv+8RMqcOHs8EdBk6FJ0?=
 =?us-ascii?Q?Plff1TF7akQfntVL7qQSH7IrgaXUgtjeTxBC2ZWX/bN/TFmBApczxDXb1PoW?=
 =?us-ascii?Q?J5Wj8tE6qJgqA2FJBWZsmGiB7+Oq73r0qyakRaTR499oD5B6xWkkirC22P2J?=
 =?us-ascii?Q?Hi/dwMA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?F7b3QYZnK95hjQQrKAMdMxKIwjkNkoMOi43GC7kcRVOaZ2VWyE2EmEjAppOE?=
 =?us-ascii?Q?rOoTTBuEvevBB7pIzIlP8aW+C1XqUqoIfeyxgFOl+DONzCHna7oMJYO/Z3qp?=
 =?us-ascii?Q?8qjD/N8BP4S7Rwcdi2s7nR/FmVGeknlEUMQz21X9OgsxPXO4DFumuH/nyNh0?=
 =?us-ascii?Q?M7RAH395GdgrOoSYj0b7KRYIOx/ln3cL9evWpKh/PgycNrIouRflm1zIRx9Y?=
 =?us-ascii?Q?1ljDO7L8vw7Za70u1M5QtOu1OPvbt54IYtZ+Jk0+oczGRVUtC1l6kcPL0/zX?=
 =?us-ascii?Q?OvvWM94vjNmGFC3EBPU9z1KpVGOMGXfOLSsC1iJVXiA6NywH1+JzgUfRh1Zd?=
 =?us-ascii?Q?jq5lgGHKvoL4/VjRIG5IPYL7zxUBl5xv2fvQJyaMhBnc5ngtWrFfeNgTerv9?=
 =?us-ascii?Q?JCHDaXSWR2tnad5BhsppCG/Smg0QeSTVa6vvhuaoeKNpACn3pLBMd2QyRfSQ?=
 =?us-ascii?Q?4pAJri0I8urz+GoY2poDOfU+TRDZw/lxxbX4KLTRDL0eZIu0IJWAKiS8/l2x?=
 =?us-ascii?Q?HfQSypTksDNsOShut69gzhXn4uYIRUGEBFCoB+ibBcGKkxhlZojZilTONJQj?=
 =?us-ascii?Q?DrEenI4EsjEVOKWBsvA5hwL/V+yWxYHQekFpQ96Wgkr4eweoqSayfYuJk9xF?=
 =?us-ascii?Q?wIHWyTqFtiv8o3mUkUtcKixBOj98KzYYKls+SkfZaf/HjDKWYIQqDmWt2s55?=
 =?us-ascii?Q?x4cYm/yYFHe1olvAY/B62c50JL1VV1tJ0OQp7FE+zz4P/ydx11fiESCtu28y?=
 =?us-ascii?Q?ICY/mpZmWareoyelFSS9e0ePQSqNDCyulzZoEOUtWSaUqrinAQ1fYU5CI5Je?=
 =?us-ascii?Q?h5OAgyPyvuIkIhk86wK1WPGEKPWpZ7VNP4ct0HKt/Eg9I5z5e8lvG7ZxK8eU?=
 =?us-ascii?Q?XK9C9sGToEiiZ9HVGxTmaw3cc4Guwei0nQEQkY9AxlqRlDtNe1anjzrQwkZT?=
 =?us-ascii?Q?G2q7llRWxul4nxU0K6fsbRCiF67NyD3VEa4MiDErFeEjtOh/SJF83CmCUIyx?=
 =?us-ascii?Q?ZvY8cXSQbcXynGYaOGWxfxiq0uGMBf08QTK0XDPHgFfo+1yFIlEh0qtOxr/g?=
 =?us-ascii?Q?QqRzFnXTYd5Od30RXVkVEvQUlMd0UrqMUofAaDWfhy7ETeQWarp23qB5xTNf?=
 =?us-ascii?Q?r1tz/ZoSbUKDzKiPAlq0O4KLLni8BN9ltZ5/eJHy80qs/mJigMmUdTUWCRvb?=
 =?us-ascii?Q?aR6yo/zwG+5mbzlWHFqRh3ZQPOWAE4jTT28isRVrwWY3E7ytBUjicW8Ewu16?=
 =?us-ascii?Q?/9biFgtt8AMzwa8jHTrxlC2bT27Ws/+ZLYX1Wqz9aNuEp6jnfs32eZYEej4N?=
 =?us-ascii?Q?OoXxblrybS79OQhGtT/JWr4735qe5nq8I1ih+XmvgjDzEzIBDxEtxCCTowXs?=
 =?us-ascii?Q?+1UTSklTAGY2GAGcUT4rD2/RUGVoo8MkfI16j79Rbk56nCibbABjf7t/TDbI?=
 =?us-ascii?Q?+BqSB7CSJMnPS08uEQHz3qndcMjkkHGPf3emUGAHleRcyQXuPguriOnLFFab?=
 =?us-ascii?Q?qZdtARcHLW4T/eicm2UqdLi70n3QEOwgE+5lxWdkI6TSukTeCowDMchjYuZ5?=
 =?us-ascii?Q?uHDV6UINdNwYK2Lt+Wo=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0f06a2-c2cd-4e83-aaff-08dc908ad21e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 18:08:28.4348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vVWoryeD/pY2P8UXhGAUw5E4XMZEokcxPgfD9VagPd5550PeR+gb758wP0un6A2hMhAs8q240lpzQa+gkp44ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361


> From: Vamsi Krishna Attunuru <vattunuru@marvell.com>
> Sent: Wednesday, June 19, 2024 8:49 PM
>=20
> Hi Lege.wang
>=20
> Thank you for proposing this new feature. This capability is very much us=
eful
> with PCI transport on newer hardwares.
>=20
> May I know the current status of this proposal, is V1 already planned and
> prepared for the review.?, I would like to collaborate on refining the pr=
oposal
> and the required changes in the spec.
>=20
> Regards
> Vamsi
>=20
>=20
>=20
Removed old dead mailing list.
Added the recent mailing list.
