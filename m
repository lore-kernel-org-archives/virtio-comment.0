Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF1B23E235
	for <virtio-comment@lists.linux.dev>; Wed, 12 Mar 2025 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741774325; cv=fail; b=ELxh2l0Z6RpCsuU63HLSePMUNVXXxjZOuPtKwnXRVU14p1kyuirqzrVhA8pUtQjEyQUXuUDGZZEMjL+JWDMQxgTe/iEPiuQ2uKUGa6WTING3g7bBNObJOjgdwUNNosCs3nfMfjjaKhLsmnqpVRGZz15qaYnglYrgxjt08je2bhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741774325; c=relaxed/simple;
	bh=DxqYG3SuHXJTesR7K97ishr0+4I6NYFLZFoJCaDwB04=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oLFpa5pXUWpvKvNvspKPUQk03cSGi/y4P6K1+3SqAE3ucdZtd7/RwJPiA9zTRiuMfN7YcEWPOCpJZrsrGf8Os0w2eTwUCV6pYoVi2Qvj5CRj76sdQOXIkfDRLh8+xnO0aJVQLRL4NjNQtVUcPZNBA6ImkQOExBuje7KGdN+Dm2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jNWGAV3Y; arc=fail smtp.client-ip=40.107.236.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jNWGAV3Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8ispnTMfJWaw3MLXcJhDzzGQQiPNj2r4e8gynuA/2e7zX7arsrzfvOomD1x5YSJPgt9PpY0b+KFMztWDBRhjock8qFZ7Y+kW23a4TWaOaDGlv4jvLOTJ2L5RgEM1XqBlYAqdvz9pH8RL57EzSIOSPuSIR8rW52GUNwWT8tARZ5kN5MU7+xaDWGccNT/c1LUtniK8vqc1RjG3B62DFwYfXX+gPSuzco3ZTxkHaTTBsT8eShs3PbO/luI4txQfZGVONv5krtXNA+JIOkq4jx1Bpb0yk5akBipoJNGV3yZYsKajkCjDYvaeS6Z3+h+ku4bVNhVHdOeD6WKbIicFBSHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFkUBQCgNa1yy+ukxIgi1/wWFBUh0CtXm9zqBKQjYXo=;
 b=wZPZh4ml6W3TohVq2tqzzzfNe6MHHkmnLwj6iKpftoTpTF2gKSgWdjuWs50AMWkdxDKYuP6Z9FN9OaUpOsH80YabCsaZAwEtYTkpHzpwHedx1M2BlF7t1MyvVGwJ+zu3bBxDsurA1CzQ6UpHVLLQncOQ4y2au0olU4VUpPPzWTAtkw0m19AFo6mJWow4jGTdJsEtSMEm4uBi/rPoB4iIYzNOduSL3qc8NWoov5v1PIQkueK6yak2uU9kv21YyXPpKUwTtkOQWwZ4hsfIRxME8hWs7DI1N1FJna6kxm3avDrtXhuKwSinlHCikrCgBISoAWuAQIBQnQ0ZRFAB12pfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFkUBQCgNa1yy+ukxIgi1/wWFBUh0CtXm9zqBKQjYXo=;
 b=jNWGAV3YshcvTsVWcvf9slv3ObfWoKYuq00ekcLRveuRG1HFo9CRH6xgRcfI+kdNxpJimio13E3QJnM61cCr0PUC6KsF7dZrLc1XWiNHYelnLQKrYXg78U1qUCzB1g5WjnTpHurNAHMUtG5J3efeUwPAnDT54K6xR0wbaEwM2gNqGkzyd5jZeYb/127SWT2wRKkxp0ShFwyO2zXzreO+ISjJWqLtrNvD8W63lPCcx2ot5TrfMn3RIMViThbaC05n1kRySsz6f02TiOTDeukBOxnXLHNA7wFtchY2ykfSR1NCucekPLVegH+qUqhlvZmDbfauwh2HL/GGuNZgsAzCLA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 10:11:59 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 10:11:56 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Zhang, Julia" <Julia.Zhang@amd.com>, "Michael S . Tsirkin"
	<mst@redhat.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, "Zhu, Lingshan"
	<Lingshan.Zhu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, Matias Ezequiel
 Vara Larsen <mvaralar@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Thread-Topic: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Thread-Index:
 AQHbiDDvdx0hNqTsk0elfmK82iBGrrNZZ+iQgAr+CgCAASisMIAAMHuAgAYLvtCAAENTAIAAK3ywgAEhAgCAAAdoAIAAPDSAgACAObCAAP7BgIAAP0BQ
Date: Wed, 12 Mar 2025 10:11:56 +0000
Message-ID:
 <CY8PR12MB7195003C2A8F7C8FE289EEDEDCD02@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250226092753.1082042-1-julia.zhang@amd.com>
 <CY8PR12MB71955656F340C5EAC2F1C925DCC22@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB65328A537B37ED3A091A8407F2CB2@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB7195EBEA5FBA0B13536B0289DCCA2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB65324C2D9E0FE9BCD192FA54F2CA2@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB7195D7401E120B34306AD4E5DCD62@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532E2CFEC070CFDF3D4E115F2D62@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB719585647964E525917BD761DCD62@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532B13A9BE99961E6D79722F2D12@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB71950B845BB9E5C10D864F39DCD12@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532DB3DD088B6F11351C645F2D12@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB71956575D93118AF3C425B51DCD12@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532768F74BE1198A9F7D100F2D02@IA1PR12MB6532.namprd12.prod.outlook.com>
In-Reply-To:
 <IA1PR12MB6532768F74BE1198A9F7D100F2D02@IA1PR12MB6532.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA0PR12MB8349:EE_
x-ms-office365-filtering-correlation-id: ef72c710-7587-46d5-115e-08dd614e51cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5iW9yESqfGjY15DXZOgkLvIEt7L1C6g78R4hBgCVR8jn8RyHxFtNiy3w7a0r?=
 =?us-ascii?Q?i5Klp0H/F5KWiYrEqA3k4IQSi2cxRFJFMyKmXztO2CpBh1bZ2nPH+wisB4OZ?=
 =?us-ascii?Q?znnRgY60MdNs5YdzNthlMZumKfzTcOV7LMuMhCqN+QkK3EAeLKaQdeaChh6P?=
 =?us-ascii?Q?eFKEsOtMuN3dG8mjANR37wAd8AzD8r4JogHZwcXMtjnD0BIGHp01MOBmOLcd?=
 =?us-ascii?Q?CahQGZf9UTsoJ1hvHRollx1YWfrXfAmqrbKujKF1ctx8NEgjzp/2H/2L9Xrd?=
 =?us-ascii?Q?DXjNX51z9eP/X+WfrJjcpV2GYxkmTN10HYz5WWaWXflU/KvJqa26ujxGB2rp?=
 =?us-ascii?Q?1dRZArirZ56bVXEmG//x9ORv1JbMhdNjQspIfR0xO97C+C+rF9ddYty5GAuJ?=
 =?us-ascii?Q?pGg/+6ZCt4lYcKEwhUWqjs/siofR3EG/AKX71pIpMYphpdjC9qZcEVSxPrEF?=
 =?us-ascii?Q?FW2CiE16iHKxoIOg2SVjcVUG0gM4FrGEDYe3hbk9PV/ApvbtCywxLVhDEYAg?=
 =?us-ascii?Q?Pf4U/gtHEU7tSW8QvTBjtXYJB8uVEuF9mbRq+TpE7z/ebCW9vjFYPZQu0JWu?=
 =?us-ascii?Q?xc8bvGADGI1jX79xsVIIDzkFmQptKDxdPBQI3ftO8rlZMQUOXPDJTt0i0rA6?=
 =?us-ascii?Q?It8HBameASasIUR3ZFiehNkkZMfapFsL9VdEhhkgz0LtT2/ZRC+YZT8Y2CTY?=
 =?us-ascii?Q?UddqBxTu/67p7ESvnwv9VfsA4GTswoI4g1NX4RSGgJO7wTrZXhV/RoJB7hhh?=
 =?us-ascii?Q?mYwjWS92gjkTmjBYA6rdz/lfENuasxlB9FbKHfJ3qyjn0eXil7PHITJPb7nH?=
 =?us-ascii?Q?u39Z6cmQmYGwB4S6X5FwGtvFYoYrdswEGHvCgYHKGYBgB3q7lp9IwBSa6POS?=
 =?us-ascii?Q?19kHqjKJPLBclgaf6dT5fytk2Y1zmcvyLBe5beF9aiQJ3ZnUyCjCge+WTgRO?=
 =?us-ascii?Q?DA4unpe89a64y1SmPGsM7U77ocHc4lPNdiyOYgpTjWSItMeuu7zBwgGNNKpi?=
 =?us-ascii?Q?TyU/4zMAXcOvHuw96A9ihP9GhS8Rr7/KNInozdKglp6OlR/Y/Kk5MXpT2Bkh?=
 =?us-ascii?Q?MNTGgwBdAT3RDk5hbbnTOIlmn9afG3tsKsHAnQpC9XDwhfI1ozDlvrc/gUva?=
 =?us-ascii?Q?y3lDaI20xRLo7Oc18M6qcqJOJLwqDG7lo+ejXi4FqdXsfYB3DYWgGC4K+PW2?=
 =?us-ascii?Q?KrhlWG/fsjh/jSbZaJfUN2cjHRKuV7sViJIti/xbG/wnHlB0VKOhFzhnoxhI?=
 =?us-ascii?Q?E0oIYoQhNA/Oq3GLReU9Np/jl5iUBAYavjVyVSpHA+C+EmX9H35Mfv+YBwEx?=
 =?us-ascii?Q?UZ9coeA5I3Cty0nUf5kkIEViV+3Z5NJFMMOoFyfGRjOuyw8x7FHwDsmfwWEm?=
 =?us-ascii?Q?lUrykMLvRm615M1QM/FlDZLY4ihHwXQqz6QoDo84Cp1hRxb18sDRIrdOgbD3?=
 =?us-ascii?Q?hfbBNxOoMc41Vp4xlPVrRwp4QjM5+FJF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YL5l58uFXChBC4qpEWAynyxZNQ8ERX25GYCN8WRa4Cyg6yRvz6Q1yyHndD30?=
 =?us-ascii?Q?fKXfWOHh7ZmdHJVOPebbaVuQdYxCycI0UHzSVLaWZJ7XJWx/u1aN/Pe8mqpC?=
 =?us-ascii?Q?tjM0+1L4EgUz+x71xpda2cMBS+XU0U6Xlo2wubKtN4cK2+aaxQ0vYNPb+Mn8?=
 =?us-ascii?Q?zYBUhIS5KWimNa4YDosDxQfDJNBqawAErvzBk2AhkhfKiSI29PmMMouZc+jF?=
 =?us-ascii?Q?pcDbyOTdwJuDUohBA3zhW4lDOXN3la1Ie1t2uOibEq+DsqpWMebLp3Q7jIV6?=
 =?us-ascii?Q?cWqTTvVgtOkK0BTxwKLB5zbObVWDBxZcnyU5VEzu6LYAzfnelzcgn9JmnhIO?=
 =?us-ascii?Q?qHOAJ8HbMYNUXgDNg1cqtIyuASOYFUaGPHgqqUmwjT0Yc92L2EhGLsCtayLD?=
 =?us-ascii?Q?Qa2ETRcBcfgKKGXukIabFNJMZBtUF17W7yMsoWcHl/bYOebOxY4vZMAwpdsk?=
 =?us-ascii?Q?awaoT//3tOm4SFRIa+JELnuRtCb7llI6LsVPj0NientK5Ge+iAevt469rkMd?=
 =?us-ascii?Q?Un8EnMcKIxI77mQliX+MS53Lzu+gr4DmljU35OTv+IHIEc4GPWQkg+n9rYAm?=
 =?us-ascii?Q?QRtADr7ONsoKBxbqhhZ2yoM14sM64oIHwgc4dqd1V41fDJ10Psqm6dM7IkT8?=
 =?us-ascii?Q?/U5p3npPc8fLhBMwTSdpitMvBOdDorLmcuYqAy7ds/82JJzsxBz5EjCQ9exy?=
 =?us-ascii?Q?gYfSdMfl0bNwTxuR7+eJYOKnfOG8Y3eOAekFAW4iowDysrOCAzzqKB+soj4y?=
 =?us-ascii?Q?IiIKWdT6rXf5vtKtH/EQDjzH4RiRoxJ9Sa7bByU2wM9Q7dQflOIetckOZ5Fd?=
 =?us-ascii?Q?b3wVWwJ+AKqEo9eZKSaERuKXCA4aQjG0hTw7Q1hFdBfqENAOxyzuZe2wE8lr?=
 =?us-ascii?Q?Hs94HaCESakYI52vCwXPktclEmvl51kH4UC3YRhng7el7O6TtGSRzbOjPgy2?=
 =?us-ascii?Q?hN6ofnbSFM4RXGqNU2joxXMwVVh4kGqvCrE8YBJjLFk+FxvDll9r6hylmlvc?=
 =?us-ascii?Q?tWvoycpo8CiH04b5UQXv9I5wpJi4oeLcPYHDb2X6xqjjyjr+YhGPxte/hInz?=
 =?us-ascii?Q?3tQltJQ+AVZHmjrYg0drUKbYCO29TH2wGBD1y6VOa4y+6GelMsbBNqFgcrS+?=
 =?us-ascii?Q?I2TQV7fZHf2pi8hXjmiW09Cn3Gpb5rnRNT7FSK5gxiahx6LJNfvzeq1B4Xw2?=
 =?us-ascii?Q?4aUZ1zonvtvY4XlDZxpZWZOQU50Z42aTHVplZcxYS6F3l/XsPH329NIV6a/i?=
 =?us-ascii?Q?/21aHUNr4G7L3kPNNGaTc1f4Vh7XuZ4FIuxE000PzAng8lzzePiam4/wq0Na?=
 =?us-ascii?Q?yFlYYsDqjqU9o5OvTUUgNwXtFZ+2/RoIJEkYrZhKwiN+nOtmWkMZ519YJO94?=
 =?us-ascii?Q?o6Asr+mVzjSLLO2BPPXd/Y2B2vtfyep1HTSxMoGJlZvZ/v8/L3PHxHqNalP+?=
 =?us-ascii?Q?2AbqNlEJZf3b8GPQBRI03EzQ+GNdYdM7M6LW/dXCF4JXhZl5BsgE0EaGrEXK?=
 =?us-ascii?Q?PmW+rL/d3RjB4SaJcMeVIbfEcnB0z5m2vGl3BxQcGGdv8srxygYKK/LPXe99?=
 =?us-ascii?Q?DrhswHvPyQuqlnYmgYQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ef72c710-7587-46d5-115e-08dd614e51cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 10:11:56.3567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQFKhEgYV4nL+lpiQUoWhXeP0nO47TIGTzM6RYP1ivBYawVZ93l8dgZxJNz2bICwk/Vhh3RHF/P4+Jy57BiTmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349


> From: Zhang, Julia <Julia.Zhang@amd.com>
> Sent: Wednesday, March 12, 2025 11:50 AM
>=20
> On 2025/3/11 23:14, Parav Pandit wrote:
> >
> >> From: Zhang, Julia <Julia.Zhang@amd.com>
> >> Sent: Tuesday, March 11, 2025 12:59 PM
> >>
> >> On 2025/3/11 12:00, Parav Pandit wrote:
> >>>
> >>>
> >>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>> Sent: Tuesday, March 11, 2025 8:58 AM
> >>>>
> >>>> On 2025/3/10 18:18, Parav Pandit wrote:
> >>>>>
> >>>>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>>>> Sent: Monday, March 10, 2025 1:07 PM
> >>>>>>
> >>>>>> On 2025/3/10 11:48, Parav Pandit wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>>>>>> Sent: Thursday, March 6, 2025 12:47 PM
> >>>>>>>>
> >>>>>>>> On 2025/3/6 12:29, Parav Pandit wrote:
> >>>>>>>>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>>>>>>>> Sent: Wednesday, March 5, 2025 4:12 PM
> >>>>>>>>>>
> >>>>>>>>>> On 2025/2/26 18:51, Parav Pandit wrote:
> >>>>>>>>>>>
> >>>>>>>>>>>> From: Julia Zhang <julia.zhang@amd.com>
> >>>>>>>>>>>> Sent: Wednesday, February 26, 2025 2:58 PM
> >>>>>>>>>>>> To: virtio-comment@lists.linux.dev
> >>>>>>>>>>>> Cc: Michael S . Tsirkin <mst@redhat.com>; Chen Jiqian
> >>>>>>>>>>>> <Jiqian.Chen@amd.com>; Zhu Lingshan
> >> <lingshan.zhu@amd.com>;
> >>>>>>>> Huang
> >>>>>>>>>> Rui
> >>>>>>>>>>>> <ray.huang@amd.com>; Julia Zhang <julia.zhang@amd.com>;
> >>>> Matias
> >>>>>>>>>>>> Ezequiel Vara Larsen <mvaralar@redhat.com>
> >>>>>>>>>>>> Subject: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
> >>>>>>>>>>>>
> >>>>>>>>>>>> PCI peer-to-peer DMA transaction may be used in guest for
> >>>>>>>>>>>> some
> >>>>>>>> scenes.
> >>>>>>>>>>>> For example, dGPU prime feature will let virtio-iGPU access
> >>>>>>>>>>>> to passthrough dGPU buffer.
> >>>>>>>>> Virtio specification does not describe dGPU and iGPU.
> >>>>>>>>> So either describe it in the description or please drop that
> >>>>>>>>> and explain the
> >>>>>>>> motivation without referring to those terms.
> >>>>>>>>
> >>>>>>>> OK I see.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> To support P2P DMA transaction in guest, virtio-gpu needs
> >>>>>>>>>>>> to check the compatibility which is represented by
> >> p2pdma_distance.
> >>>>>>>>>>>> This defines a command
> VIRTIO_GPU_CMD_P2PDMA_DISTANCE
> >> to
> >>>>>> allow
> >>>>>>>> guest
> >>>>>>>>>> send
> >>>>>>>>>>>> virtual pci notation of two devices to host and get host
> >>>>>>>>>>>> physical p2pdma_distance of these two PCI devices.
> >>>>>>>>>>>>
> >>>>>>>>> [..]
> >>>>>>>>>>>> Ifsm1M5xIb37T9Tg%3D&reserved=3D0
> >>>>>>>>>>>> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> >>>>>>>>>>>> Reviewed-by: Matias Ezequiel Vara Larsen
> >>>>>>>>>>>> <mvaralar@redhat.com>
> >>>>>>>>>>>> ---
> >>>>>>>>>>>> Hi all,
> >>>>>>>>>>>>
> >>>>>>>>>>>> We are trying to implement dGPU prime feature in guest
> >>>>>>>>>>>> which will let
> >>>>>>>>>>>> virtio- iGPU read rendered data of passthrough dGPU. Before
> >>>>>>>>>>>> that, virtio gpu driver needs to get p2pdma_distance to
> >>>>>>>>>>>> check if P2P DMA transaction is possible or not.
> >>>>>>>>>>>>
> >>>>>>>>>>>> To implement getting p2pdma_distance, QEMU needs to
> handle
> >>>>>>>>>>>> the command from guest with virtual pci notations of two
> >>>>>>>>>>>> PCI devices and send it to host kernel and return host
> >>>>>>>>>>>> physical distance back to
> >>>>>>>> guest.
> >>>>>>>>>>>>
> >>>>>>>>>>>> So this defines the new command follow the suggestion in
> https:
> >>>>>>>>>>>> //lore.kernel.org/all/20241207105537.542441-4-
> >>>>>> julia.zhang@amd.com
> >>>>>>>>>>>> /
> >>>>>>>>>>>>
> >>>>>>>>>>>> changes from v1:
> >>>>>>>>>>>>        - add issue link to commit msg
> >>>>>>>>>>>>
> >>>>>>>>>>>> Regards,
> >>>>>>>>>>>> Julia
> >>>>>>>>>>>> ---
> >>>>>>>>>>>>        device-types/gpu/description.tex | 29
> >>>>>>>>>> +++++++++++++++++++++++++++++
> >>>>>>>>>>>>        1 file changed, 29 insertions(+)
> >>>>>>>>>>>>
> >>>>>>>>>>>> diff --git a/device-types/gpu/description.tex b/device-
> >>>>>>>>>>>> types/gpu/description.tex index 4435248..9d0f30b 100644
> >>>>>>>>>>>> --- a/device-types/gpu/description.tex
> >>>>>>>>>>>> +++ b/device-types/gpu/description.tex
> >>>>>>>>>>>> @@ -223,6 +223,7 @@ \subsubsection{Device Operation:
> >> Request
> >>>>>>>>>>>> header}\label{sec:Device Types / GPU De
> >>>>>>>>>>>>                VIRTIO_GPU_CMD_SUBMIT_3D,
> >>>>>>>>>>>>                VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
> >>>>>>>>>>>>                VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
> >>>>>>>>>>>> +        VIRTIO_GPU_CMD_P2PDMA_DISTANCE,
> >>>>>>>>>>>>
> >>>>>>>>>>>>                /* cursor commands */
> >>>>>>>>>>>>                VIRTIO_GPU_CMD_UPDATE_CURSOR =3D 0x0300, @@
> >>>>>>>>>>>> -236,6
> >>>>>>>> +237,7
> >>>>>>>>>> @@
> >>>>>>>>>>>> \subsubsection{Device Operation: Request
> >>>>>>>>>>>> header}\label{sec:Device Types / GPU De
> >>>>>>>>>>>>                VIRTIO_GPU_RESP_OK_EDID,
> >>>>>>>>>>>>                VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
> >>>>>>>>>>>>                VIRTIO_GPU_RESP_OK_MAP_INFO,
> >>>>>>>>>>>> +        VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE,
> >>>>>>>>>>>>
> >>>>>>>>>>>>                /* error responses */
> >>>>>>>>>>>>                VIRTIO_GPU_RESP_ERR_UNSPEC =3D 0x1200, @@
> >>>>>>>>>>>> -791,6
> >>>>>>>>>>>> +793,33 @@ \subsubsection{Device Operation: controlq
> >>>>>>>>>>>> (3d)}\label{sec:Device Types / GPU Dev  };
> >>>>>>>>>>>> \end{lstlisting}
> >>>>>>>>>>>>
> >>>>>>>>>>>> +\item[VIRTIO_GPU_CMD_P2PDMA_DISTANCE] calculates the
> >>>>>>>> cumulative
> >>>>>>>>>>>> +distance
> >>>>>>>>>>>> +  between two devices before Peer-to-Peer(P2P) transaction.
> >>>>>>>>>>>> +Request data
> >>>>>>>>>>>> +  is \field{struct virtio_gpu_device_p2pdma_distance}.
> >>>>>>>>>>>> +Response type is
> >>>>>>>>>>>> +  VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE. Response data
> is
> >>>>>>>>>>>> +  \field{virtio_gpu_resp_distance}.
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +\begin{lstlisting}
> >>>>>>>>>>>> +struct virtio_gpu_device_p2pdma_distance {
> >>>>>>>>>>>> +        struct virtio_gpu_ctrl_hdr hdr;
> >>>>>>>>>>>> +        le32 provider_bus;
> >>>>>>>>>>>> +        le32 provider_slot;
> >>>>>>>>>>>> +        le32 provider_func;
> >>>>>>>>>>>> +        le32 client_bus;
> >>>>>>>>>>>> +        le32 client_slot;
> >>>>>>>>>>>> +        le32 client_func;
> >>>>>>>>>>>> +};
> >>>>>>>>> The requester device's PCI RID is anyway known to the responder=
.
> >>>>>>>>> So no
> >>>>>>>> need to pass it here.
> >>>>>>>>> It is unclear if its provider or the client.
> >>>>>>>>
> >>>>>>>> I don't think requester device's PCI RID is known to the
> >>>>>>>> responder, since the existing function pci_p2pdma_distance()
> >>>>>>>> also require provider and client information.
> >>>>>>>>
> >>>>>>> The existing function takes the provider pci device as input at
> >>>>>>> C code
> >> level.
> >>>>>>> And proposed extension (without provider BDF) will also operate
> >>>>>>> on the
> >>>>>> provider device on which the request/response transaction is
> >> happening.
> >>>>>>
> >>>>>> Well at first, I just want virtio GPU to handle the command to
> >>>>>> get p2pdma_distance of two PCI devices(maybe none of them is
> >>>>>> virtio
> >> GPU).
> >>>>> Using virtio gpu to find the distance between two arbitrary
> >>>>> devices which
> >>>> are not virtio is certainly outside the scope and looks wrong.
> >>>>> It should be done at some PCI topology level who exposed this
> devices.
> >>>> For our use case, virtio GPU is the provider, we are using virtio
> >>>> GPU to calculate distance between virtio GPU and dGPU, which are
> >>>> not arbitrary devices.
> >>> The fact that in physical world this distance is calculated without
> >>> involving
> >> the individual provider and client EP PCI devices, in virtual world
> >> doing this via virtual PCI EP devices does not look correct abstractio=
n to
> me.
> >>
> >> In physical world, this distance is calculated by calling existing
> >> function pci_p2pdma_distance(), which will pass the the provider and
> >> client. I understand that you mean virtio GPU should be provider by
> >> default, but my point is that when I call pci_p2pdma_distance() to
> >> calculate distance between virtio GPU and dGPU, I still need to pass t=
he
> RID of them to host kernel side.
> >> And because host kernel doesn't know which one GPU is the virtio GPU,
> >> this struct still needs to include provider information.
> >>
> >>> I tend to imagine that one needs to build a right virtual topology
> >>> in QEMU
> >> or somewhere else who is providing these PCI devices such that guest
> >> kernel can calculate it accurately without depending on the EP PCI dev=
ices.
> >>
> >> But the virtio GPU BDF in guest is different from host side, guest
> >> kernel cannot calculate the correct physical distance from guest side.
> > Sure virtio GPU BDF is likely vRID.
> > Guest should request the right distance calculator entity, possibly the=
 one
> that is providing the connectivity (and distance), which likely is pci
> RC/bridge/switch etc.
>=20
> Yeah, the problem here is pci RC/bridge/switch of guest is emulated, whic=
h is
> not going to provide the exact same connectivity as host does.
>=20
It is the role of the emulated entity to provide topology such that guest P=
CI driver can discover that (and not arbitrary virtio gpu driver).

> >
> > Imagine a virtio PCI driver asking to to the virtio PCI device, how far=
 is it
> from the vCPU for NUMA awareness.
> > It seems wrong to me.
>=20
> It's not asking virtio PCI device to calculate the distance, it's asking =
virtio PCI
> device to pass the command.=20
Pass the command is same thing as virtio driver asking virtio pci device.
How virtio pci device implements is internal details not specific to the sp=
ec.

> Calculating the distance is still going to request
> the right calculator entity, which is host PCI RC/bridge/switch.
Ok. so please have such hypercall in the PCI RC/bridge/switch domain. Not i=
n the PCIe EP domain.

>=20
> > Because it is unable to follow the same flow between virtual and physic=
al
> world.
> >
> >>>
> >>>
> >>>>>
> >>>>>> So
> >>>>>> when guest needs to calculate distance of any two PCI devices, it
> >>>>>> can reuse this command. But indeed, we only have this one use
> >>>>>> case at this moment, I guess considering virtio GPU as provider
> >>>>>> and remove provider PCI RID of this struct is fine.
> >>>>> Right. A driver can issue the command to device without mentioning
> >>>>> its own
> >>>> device identifier.
> >>>> Since calling function pci_p2pdma_distance() still needs to pass
> >>>> its own RID, I think at least QEMU has to tell host kernel the RID o=
f virito
> GPU.
> >>> Probably yes, would be interesting to see this UAPI on the host
> >>> kernel too,
> >> (unrelated to this patch).
> >>>
> >>>>>
> >>>>>>
> >>>>>> But there's another problem: how does host kernel get virtio GPU
> >>>>>> RID and calculate distance between virtio GPU and dGPU? If I
> >>>>>> remove provider information of this struct, then QEMU still needs
> >>>>>> to pass virtio GPU RID to host kernel side.
> >>>>> The device implementation side can get to know about this as it
> >>>>> has plugged
> >>>> in and built the topology.
> >>>>> The RID we are discussing are the vRID seen by the guest driver.
> >>>>> I probably missed to clarify this.
> >>>> But only getting the distance on the virtual PCI inside the guest
> >>>> is not enough to figure out if P2P is possible or not. We need to
> >>>> get the real distance from host side. Please take a look at the disc=
ussion
> here:
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
l
> >>>>
> or%2F&data=3D05%7C02%7Cparav%40nvidia.com%7C9538a40c4599428537590
> 8dd6
> >>>>
> 12df4ca%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6387735722
> 4449
> >>>>
> 6025%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwL
> jAuMD
> >>>>
> AwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C
> %7C
> >>>>
> &sdata=3D10ypT8BuukdQ1cGF6OY77wPdOo4H3owSPHoATgCX1lw%3D&reserve
> d=3D0
> >>>> e.kernel.org%2Fall%2Fbfe6a8b7-adcf-40e2-b7a2-
> >> 4e64dc96862d%40amd.com%2
> >>>>
> >>
> F&data=3D05%7C02%7Cparav%40nvidia.com%7Ccf5112991dc145cd786508dd60
> >> 6e772
> >>>>
> >>
> 9%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638772749796637
> >> 911%7CU
> >>>>
> >>
> nknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
> >> MCIsIlAi
> >>>>
> >>
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> >> 7wrTh
> >>>> 4PogFwvK6YzRgBQi2GeOus0CarX0%2Bu5DerCQWs%3D&reserved=3D0
> >>>
> >>> Finding out the distance between two PCI devices in physical world
> >>> is role of
> >> the PCI bridge/switch topology builder.
> >>> So why should it change for the guest VM?
> >>
> >> Because as discussed in above link, before letting virtio GPU and
> >> dGPU do P2P, we have to check if these two devices can communicate
> >> with each other by calculating the distance in physical world.
> > Ok, so that distance should be provided by the same way in physical and
> virtual world.
> > The hypercall should be in PCI RC subsystem, not in virtio arbitrary de=
vice.
> >
> >> It's not just the role of PCI bridge/switch topology builder.
> > Well, I think it is. Because this is how the physical world able to pro=
vide.
> >
> >> Checking this
> >> distance is a necessary step before P2P like amdgpu does:
> >> amdgpu_dma_buf_attach
> >> ->pci_p2pdma_distance
> >>
> >>> Why virtualized topology cannot be build in a way such that it
> >>> matches to
> >> the physical world to get the accurate distance?
> >>> At least to me, doing this in the pci RP domain (and not PCI EP
> >>> domain)
> >> seems the right way to go forward.
> >>
> >> Because the BDF of virtio GPU and passthrough dGPU on virtual PCI
> >> bridge is different from the physical world, which makes guest kernel
> >> cannot get the accurate distance.
> > I suggested one option is QEMU to build right topology as that of the
> physical world so that physical and virtual systems can run same code.
>=20
> Changing the way QEMU emulate PCI topology doesn't make any sense.=20
Why not? If the QEMU is enabling P2P communication, it needs to enable gues=
t to discover the way PCI driver (not virtio) discovers in physical world.
When guest access the vCPUs the hypercall is in the vCPU domain. Vcpu's inf=
ormation does not come from virtio device.
Similarly, PCI topology info in my view should come from the PCI RC/Bridge/=
switch emulation side.
I probably repeated myself here, by providing more examples of drawing the =
parallels between physical and virtual world.
