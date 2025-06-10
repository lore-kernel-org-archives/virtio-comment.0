Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086E28CF53
	for <virtio-comment@lists.linux.dev>; Tue, 10 Jun 2025 10:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551859; cv=fail; b=Y+0ZTq1IbWL+pXby5DUQI+hx0/7nN2wp/6Pe31V8yrThH/qwgLzAszAT53SjOOTgSKwSpbxgYWl92vnFH7vkFtDMk65S5WnZYU0uJrgFwUEk5p3+/B+8o24ZE0nmn8tvwpmUcn4OfsM+zJleOkXh7393Fhd8rGJLdEDGzrLdepY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551859; c=relaxed/simple;
	bh=VjWNt4x9N4yr99g1Naf9blgz9xvhwFhOrEn0IiUrV/E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qkl0dVpddOdmZ8aPnLQg6iULtj+6o8u0HT2g2dL7KMzUNXHQBaUzEYYLX5uuE8XZSI3h/zIz9fae8OfF3zqcxbn/5DwZADxZTCIP9oY3reo59xq9486v+i4tezltwKJuP1hovKzweDtGbaSxJzo8nl3d+h77RDDx1ygbQXXKEjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iJc4AiSZ; arc=fail smtp.client-ip=40.107.223.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iJc4AiSZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQTqTuSqhP8vXSiQ8d4UC4ti5xwdPFYF+xBMpm6rJOKj0N9Q2ahdcO9HuC8Hs8zR3zY2jIgv4JrNmQaafPET9ymkHk0DjQWW7yV8D+hWPWH5xKZPnAiG7Rvub5xX7ztMGoFBVbDep/xoaTqVycCSDulUli8608LZ9yqucXEP+SU14x9KSJvX8VQTf26yHhkul4VZZaM5oduE6WM71KbgdqUZnGMWCzEzKRRXHREoDIJffjpmlknXkLiTGynpc8db+DuDpzfliFLGBBTIa0IwG5f0fZga8Gir3sRVJyb5yhI9X3mwasmUGhe/Dqu4dLxQCk4R3t/BX+KQCEPblUcifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZ7GSS1NHKSf0N3HX4V4Og0aG27/ylg5f3ujA108VDw=;
 b=vk8zKG42lIlUZTJrzLUhgoG3MffZZy2nM7IH3EnAcdLyeOdPzPJWL+G9H9RII03VHqBSYILhLD9f6rnO7C3MCtfQNbUOunEhIaGDU/DJm9aAonCbxodSHyiLS+dJ3GU6E2S4PP3Ee05cv3VIIJb9wH6qsnLwRNu1fAdJY4WeQU8aO/GZc9p6bkJTbmYtc+8jIGivJj4J82aibEyhw60p5NarW/4e7LWbSUnWfYz4A8Y8MpVVKN+USMrQDNu1SQo+U7GjRDHd9dtuEqwwU+NJ9XVE4KKiHp7IZCOWvGAJKep4yCLNiVLPFSy9Q6F0I0b8UH3xP6+QRdp2vKaBh1q8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZ7GSS1NHKSf0N3HX4V4Og0aG27/ylg5f3ujA108VDw=;
 b=iJc4AiSZINV3A59RVYjb7FsgFB/2XbIDM5WlKMV+U+nG/1CCPCxlJyT6/qokILnV+JwLEMOeVwl3RKHgrtCAqq9/x89ScLraJcRoEGVqoEE8zKZesi2qd+QS8Mp2/9vPb8Qntn796tYKqNXHAmpGSAukU0CMfI26JGdL0qVrJJ49iX4RGGfuYw5A4paGlH1h4bczAjSmi2IoHE861i42ccWG6jtFvNi0fCwIzjrBJMKruKoEJzZNwJJmrMk47EtBt/Gvd6QY7yS8uQjLRdwX42ayjcOLwXNvNJnzv0YdnhAlJi4uKkiSaFTruhj92cIP3sn1VKwwDLZdMDs49L8bZQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Tue, 10 Jun
 2025 10:37:32 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%5]) with mapi id 15.20.8792.033; Tue, 10 Jun 2025
 10:37:32 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: RE: [PATCH v2] virtio: introduce SUSPEND and RESUME feature
Thread-Topic: [PATCH v2] virtio: introduce SUSPEND and RESUME feature
Thread-Index: AQHb0HMnlr49j8ZC+U6fxbFjtRzqQbP1psYwgABUcICAAQF1sIADi5eAgAG7IrA=
Date: Tue, 10 Jun 2025 10:37:32 +0000
Message-ID:
 <CY8PR12MB71957FB8A0337FB62A1CDB41DC6AA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250529082355.86884-1-lingshan.zhu@amd.com>
 <CY8PR12MB7195A87D14C87D52B8A03C79DC6EA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <45bd7572-9672-49ad-b09e-f57ed6d5480b@amd.com>
 <CY8PR12MB71950056CD7393AADA44EFCBDC69A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <3b27c481-45b6-49de-a660-ea79063cc9d7@amd.com>
In-Reply-To: <3b27c481-45b6-49de-a660-ea79063cc9d7@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS0PR12MB8317:EE_
x-ms-office365-filtering-correlation-id: c6de342f-f192-45d0-5701-08dda80ace62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?+5D/Ueg4HAcY/PO2u/ETby+XQuhya7NldVIF4xqpQn8Qz2E+ehhy1462cpPj?=
 =?us-ascii?Q?LmQWVqybgZ+wdnwn9SnKG/Gj8Op2nCYwelfVKH8a5x6ggvLVTlr3zOm4Bx+X?=
 =?us-ascii?Q?NF/GDL2oDyzciyNTf0bZIhjldcHDlQWrEo+M3X06HaJ9A0+MI7D0krT9zG8G?=
 =?us-ascii?Q?tASqcf5cMCORpzaCOOtKLaEepjPyNAKHk5rneVb5b0svD+ds6A1xzoRlh5uT?=
 =?us-ascii?Q?DRlJYnpCYLD8+Jl166KFrtvbZN/mIktsvGTQ09vlhkQbhmnm4/TvZfmDH+5K?=
 =?us-ascii?Q?xafvtn5SrX0PoG5uXAu4shrF6gCyjwsYguG2QkuZbYWv/IcFCe5m+f9TvMdT?=
 =?us-ascii?Q?gkORWqDJ51cb7LcacN5yYr/UBmr+b/m8KIBn007kgPo1owj/C1eSiFMsoeq0?=
 =?us-ascii?Q?PXTmR7XEUgejhjt/TKNYUhIbRArIvmfYTw4molkTZHwMKenc6APgElHRxwn1?=
 =?us-ascii?Q?XgzBadWrqGw9Uk29ae250iFojw6mQT5Go5L6LbiJSYDrXvAFgHmWeSIIdGPG?=
 =?us-ascii?Q?x74/kSVZkOlu9qa1OATkzUcDDgPOlCAu4lQ7lG/G0rrTtMc9xB508X3PIayu?=
 =?us-ascii?Q?NCTXcGEpZEmP7VMd8VB6Nq7ya5FCVwhLRkn+OGPRVFTw5sCvUdHNIne6uigx?=
 =?us-ascii?Q?EhuvBRc7zYT0PWkYxHv9Z687dvRZs45UQjMrB9I8M54ugvQmQccPG5Ojc7xP?=
 =?us-ascii?Q?IhGoAUO1W+430Hf9bPwAyU1Ou5vJMhftm2HANpVX6W5UYiEZgExCRk9EnhEY?=
 =?us-ascii?Q?d4dLMM9Q5KbqwEDJHXdcYOEqXD+GSW8eYQOM6RvX9AnifWpjQNLG5TU+Ager?=
 =?us-ascii?Q?2UB3KYk9GLSw5mgZmdQLJzEnVF2MsQbt+Nlt39w6XIKJFGH6CMuP0z12L12/?=
 =?us-ascii?Q?mh6yhl+TaK890Kb6KUCSd/vhC48X2B+F45Lgz8m4jltxgjhMzlBu/PCcZ7BH?=
 =?us-ascii?Q?30O8HtcKoBJwzGGLkiutPq5STEjNnARwQg/vcqCKvrRBXbQ76RkjB88tTBa0?=
 =?us-ascii?Q?QQBmwCMvcSGZy2aRwrm9U2XA+SwbAU0p+9MGDgY2N4AhNkVI6L6l/UARDmvw?=
 =?us-ascii?Q?Yl3As63ZOQwak6u9NQP+0zp0zTwbMvu9iSfx/k4ywkt8D//d6ME+eVD+Bq0f?=
 =?us-ascii?Q?jW8CAl3inNkO/pVMCkk+2293XbvhMxljBGf44SG804ZDv+OAvE8aiZe1c4Yq?=
 =?us-ascii?Q?VUe68PnScMv77dgNbfdFajPIeJlprV0fxkZHHhOKApIlJoa+vkdVY6WR0Boe?=
 =?us-ascii?Q?w6XBgVOwdbzG/O+cDj5UJmCwd11kS3/vt0k9LaxrV16oa951b6adSyjuavNH?=
 =?us-ascii?Q?N1kIHquvqcRYTdo27a+Edka23iDH9cklyz+Z/I/s07sk6RrFnxvA/R4oWWlL?=
 =?us-ascii?Q?Wr7yJaNlhBX3XG9fJUFLlsgLcxiCGuutpamxRCuk5XUZRgsGuaEZaqWYLEDX?=
 =?us-ascii?Q?1Y836j4RDyDBD8Vq1VF97eJ59tzwlY6X+R1iFaoEoGmsgb3oHBIu9xZ3xeh+?=
 =?us-ascii?Q?aL5XpPLKBiGuCY8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Dkk6lFly1VvXDuqiIfEUD82JC9fhffiOjvD9iUMom9wN5DBR6LXDWhWeiJH4?=
 =?us-ascii?Q?65b0Q12qrvhzDY7uCFM3TuIf+9ZMx3JNw6BR5DqAQ2NkYBZ+QixJhTqhHZBF?=
 =?us-ascii?Q?Qa1UdciAfoQ0Q6il4v8Ww1iyAD6cWmAkdwvg65QNibioefGIvgCy5H/P8FjI?=
 =?us-ascii?Q?v3+wdytNtGuWlJP1q7O1mAV7NllvnIlK+sQq2HtDHnkA568ladi7H4D+ij9+?=
 =?us-ascii?Q?yaySbSLGIX+RV0fEgNXrX50QJJ/jNSsipiuYXZqUhONDB6nCM8htj0b+5vUM?=
 =?us-ascii?Q?H1MzJ8aWBWOOgKXRS9Lprlfoj+XZDQBcj0OBVtpLOpDmx6tdMyeeXxS6EgUb?=
 =?us-ascii?Q?QVULBynAYHe56/yDv5fj+qMMX7wT2bGELptgCAXS/4TytLIMDg8JcgtIZlAp?=
 =?us-ascii?Q?J91eaBwcJgTokCULdtYwjVO3YIrKJYfRcq8fx+5ivAUSrJOqxlNdfJHGncqS?=
 =?us-ascii?Q?aax/clw34OaJRokmRTcguNT7u7ux6zH6uDSKCmS1Q1BDA00MY5Lup3tWngLB?=
 =?us-ascii?Q?GCs+CiL2HTxK8Oqtj4NHE5cwRSYCETyGe0rtLL/+1d9ZGXxePfjwFY/+w7rw?=
 =?us-ascii?Q?fdMJ1UQl15CuaON/y7X4VeDBbq2wXpMOERwNzzt0b1xDMKKcQSVrSX6kEAgZ?=
 =?us-ascii?Q?MGkL+67bm31gSv/HyaANG3QMJFopoLyi4CSMleWz82FMXvEqxzhr4kQU7JZk?=
 =?us-ascii?Q?GGxt1LHl8Q/Qpx3SJTVZpUwsGMoBLGm0o7/FXvSKjIczyambGeUvHVO88kRF?=
 =?us-ascii?Q?+mUDUqWov7Sp2u9YZ/ACFEnmTCdsJxTYgUYApbRSJW1hcRILx/Oy4VfFSEwq?=
 =?us-ascii?Q?C+j2dUoZPoOHKOorXuty09op+eBcDhmKCEf9ok1W11654N9PKvO6KRDmC1Tk?=
 =?us-ascii?Q?//Y5sQe7IKisKtW6vWmqPP0pRH7eHIpWfXZN936kySKY9xNUKMUELRJXsV1F?=
 =?us-ascii?Q?TeI3yH9ElmdIfwQVfbTxBWg8GuSM+nMsZpnTOn7mQMlJ5TcqFAQkUzKm+Vww?=
 =?us-ascii?Q?uPTZH1UfM/YWWeiYdff2/PI5CNttk3NM562bj/j6ZrTiG7pEkfzKKlhzCw5e?=
 =?us-ascii?Q?FL439TWtjWWZGaMH61mwOfmNgmE8u2FsT99qRgurniyMTnOg42L6XuWl2TQS?=
 =?us-ascii?Q?nXwBDk5zFyBUNTb6/BDoOMBTqmunr3VYSeDqDTfugOPgFdBL8AfBJV2Mb7Mp?=
 =?us-ascii?Q?+VhRLCEVixjZvZlo31iXaCN0VNgub8k/C6tGvx87NIGCZagzpi5hiSYI/F17?=
 =?us-ascii?Q?CNx3ypFvLTdHanWmhsW653zU5SudSStlSpY6I0UUf1sPieT5kjioY0prjYgU?=
 =?us-ascii?Q?Yz9FJMboZVoWzS0sqsciA1AdJu4q8EixLaHmauOeRjjzpDD1hdUfaFssMUFH?=
 =?us-ascii?Q?LApZBcM61cY4uZZO5pvl6eVUceLlkA57/sFybmo9MXQpO0Kr0txj/HYV+nzC?=
 =?us-ascii?Q?5dhKykxhFmeDLO+zxlNCoEeC0aZz/HzGHLWZgsy0Uids8XFs7LZ31O2GMjyn?=
 =?us-ascii?Q?6gnV/lRemb10Y7/AeTpyPYhElg4my7jb88ckOb5bEQHP4lzQ0quCFdpDhaHA?=
 =?us-ascii?Q?RNbzTj4+AO8IUgOWJdCt8LzrWscDM9tln6MRvtMS0MbHRgmBcWbE8YrL01Kf?=
 =?us-ascii?Q?a9Mi88vN+zH1eqoUfYX8AQs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c6de342f-f192-45d0-5701-08dda80ace62
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 10:37:32.1764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OfjV6CkK9IZ98VA6TEr4IWbycs8dhD+2bqTtL3anv9DTZFB9bk5WvRDfT0dOtKW66TJ1Gn6dnzu+z3mOx6Xm9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8317



> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: Monday, June 9, 2025 1:31 PM
>=20
> On 6/7/2025 10:11 AM, Parav Pandit wrote:
> >
> >> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Sent: Friday, June 6, 2025 4:01 PM
> >>
> >> On 6/6/2025 1:52 PM, Parav Pandit wrote:
> >>> Hi,
> >>>
> >>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>> Sent: Thursday, May 29, 2025 1:54 PM
> >>>>
> >>>> This commit allows the driver to suspend the device through a new
> >>>> device status bit SUSPEND and resume the device running by
> >>>> re-setting DRIVER_OK bit in device status.
> >>>>
> >>>> This commit re-orders the device status bits.
> >>>>
> >>> I overall like this proposal. Few small comments to fix more below.
> >>> It is lot cleaner as it eliminates the previous bit flipping complexi=
ties.
> >>>
> >>> Can you please add one or two line on a use case/motivation,
> >>>
> >>> For example,
> >>>
> >>> Presently when an OS is suspended, the driver must fully stop and
> >>> reset the
> >> device, and on resume the driver must re-initialize the device.
> >>> This can be time consuming task to recreate large number of VQs.
> >>>
> >>> Instead, extend the specification to allow drivers to suspend and
> >>> resume
> >> the device, without recreating all the resources.
> >>> ...
> >> Hello Parav
> >>
> >> Here I think the spec provides mechanisms, not a policy. The user may
> >> employ this feature for other tasks other than live migration which
> >> requires OS suspending.
> >>
> > Its not about some policy.
> > Sure user may use the feature in N different use cases.
> >
> > The intent is very simple. For the reviewers to review the patch, why
> something is needed should be presented.
> > So motivation/usecase/need is worth the entry.
> > Some reviewers do rely on the commit logs to understand the design inte=
nt
> behind it.
> >
> > Without the need of the patch, I am not sure why would even one write
> and review the spec patch.
> > Please add known use cases. I am familiar with one that I suggested abo=
ve.
>=20
> we can add these descriptions in the cover letter.

Yes, cover letter covers for the series as you will have 3 patches and comm=
it log of individual patch will have one two sentences would be good.

>=20
> >
> >>>
> >>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >>>> ---
> >>>>  content.tex | 74
> ++++++++++++++++++++++++++++++++++++++++++++++-
> >> ----
> >>>> --
> >>>>  1 file changed, 65 insertions(+), 9 deletions(-)
> >>>>
> >>>> diff --git a/content.tex b/content.tex index d3fc6a4..caef5d0
> >>>> 100644
> >>>> --- a/content.tex
> >>>> +++ b/content.tex
> >>>> @@ -36,19 +36,22 @@ \section{\field{Device Status}
> >>>> Field}\label{sec:Basic Facilities of a Virtio Dev
> >>>>      this bit.  For example, under Linux, drivers can be loadable mo=
dules.
> >>>>    \end{note}
> >>>>
> >>>> -\item[FAILED (128)] Indicates that something went wrong in the
> >>>> guest,
> >>>> -  and it has given up on the device. This could be an internal
> >>>> -  error, or the driver didn't like the device for some reason, or
> >>>> -  even a fatal error during device operation.
> >>>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready
> >>>> +to
> >>>> +  drive the device.
> >>>> +
> >>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated,
> indicates
> >>>> +that the
> >>>> +  device has been suspended by the driver.
> >>>>
> >>>>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged
> >>>> all
> >> the
> >>>>    features it understands, and feature negotiation is complete.
> >>>>
> >>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready
> >>>> to
> >>>> -  drive the device.
> >>>> -
> >>>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has
> >> experienced
> >>>>    an error from which it can't recover.
> >>>> +
> >>>> +\item[FAILED (128)] Indicates that something went wrong in the
> >>>> +guest,
> >>>> +  and it has given up on the device. This could be an internal
> >>>> +  error, or the driver didn't like the device for some reason, or
> >>>> +  even a fatal error during device operation.
> >>>>  \end{description}
> >>>>
> >>> A new bit SUSPEND introduction should be done at the end without re-
> >> organizing rest of the bits.
> >>> Please add at the end.
> >>>
> >>> Is the intention to rearrange the fields in ascending order of the
> >>> bit
> >> number?
> >>> If yes, its good change too but than it missed re-arranging FEATURE_O=
K.
> >> oh yes, good catch, will fix
> >>
> >>> If you want to re-arrange, please have the pre-patch in this series.
> >>>
> >>> Either way is ok to me,
> >>> 1. Either as pre-patch for re-arrangement + addition of SUSPEND in
> middle.
> >>> Or
> >>> 2. adding SUSPEND bit definition at the end
> >>>
> >>> #1 is better to see in ascending order.
> >> I was required to re-arrange these status bits, but this is a trivial
> >> change, so lets keep them in a single patch for easier review
> > Having logically separate patches are always good. Re-arrangement is pu=
re
> cosmetic vs this one that adds new functionality.
>=20
> ok, we can split this patch into a series if this is preferred.
>=20
Sounds good.

> >
> >>>>  The \field{device status} field starts out as 0, and is
> >>>> reinitialized to 0 by @@ -
> >>>> 99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities
> >>>> of a Virtio Device / Feature B  \begin{description}
> >>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific device
> >>>> type
> >>>>
> >>>> -\item[24 to 41] Feature bits reserved for extensions to the queue
> >>>> and
> >>>> +\item[24 to 43] Feature bits reserved for extensions to the queue
> >>>> +and
> >>>>    feature negotiation mechanisms, see \ref{sec:Reserved Feature
> >>>> Bits}
> >>>>
> >>> Only one feature bit is used by this proposal.
> >>> So it should be 24 to 42 and use bit 42.
> >>>
> >>> Did you use bit 43 due to existence of VIRTIO_NET_F_GUEST_RSC6?
> >> Yes, bit 42 is taken for VIRTIO_NET_F_GUEST_RSC6.
> > So the current spec wordings  is incorrect 0 to 23, and 50 to 127
> > Feature bits for the specific device type
>=20
> current spec missed documenting bit 42.
>=20
> >
> > We need to says,
> >
> > 0 to 23, 41 to 42 and 50 to 127 Feature bits for the specific device
> > type This should also be pre-patch, so that it can be backported to mas=
ter
> branch.
> > Another reason for the small patch to be separate.
> >
> > If you want me to write up this pre-patch, please let me know.
> > You can include in the series.
>=20
> There could a a separate patch in a series says:
> 41 to 42 Feature bits reserved for extensions to the queue and feature
> negotiation mechanisms
> 43 to 49, and 128 and above Feature bits reserved for future extensions.
>
41-42 are used by the device specific types. So they are not reserved.
They are in_use by device specific type. It should be worded accordingly.


> which fixes commit 9438414
>=20
> >
> >>>> -\item[42 to 49, and 128 and above] Feature bits reserved for
> >>>> future extensions.
> >>>> +\item[44 to 49, and 128 and above] Feature bits reserved for
> >>>> +future
> >>>> extensions.
> >>>>  \end{description}
> >>>>
> >>>>  \begin{note}
> >>>> @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
> >>>> Initialization And Device Operation /
> >>>>
> >>>>  Thus a driver MUST ensure a virtqueue isn't live (by device reset)
> >>>> before removing exposed buffers.
> >>>>
> >>>> +\section{Device Suspend}\label{sec:General Initialization And
> >>>> +Device Operation / Device Suspend}
> >>>> +
> >>>> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to
> >>>> +suspend the
> >>>> device by setting the SUSPEND bit in \field{device status} to 1,
> >>>> and the device SHOULD set the DRIVER_OK bit to 0 once it has been
> >> suspended.
> >>>> +
> >>> This is not a normative section so please avoid using SHOULD.
> >>> Better to word it as informative theory of operation text.
> >>> Such as,
> >> why "SHOULD" can only be used in normative sections?
> >>
> > Because:
> >
> > 1. To clarify the intent:
> > These keywords carry precise semantic weight. When a spec says MUST, it
> means compliance is not optional. Using such terms in general or explanat=
ory
> text risks misinterpreting guidance as a requirement.
> >
> > 2. Avoiding Ambiguity:
> > If normative language is used in non-normative (informative) sections, =
it
> becomes unclear whether the reader is required to follow it or if it's ju=
st
> background or suggestion.
> >
> > 3. Informative sections explain context, rationale, or examples. Normat=
ive
> sections define rules. Mixing the two muddies the structure and weakens t=
he
> authority of the normative part.
>=20
> There are no such rules.
>
It is not about the rule.
It is the way virtio spec is structured today.
What I explained above : is what happens when one writes theory of operatio=
n as normative tone.
Description/theory of operation etc sections are written with simple presen=
t declarative tone.
And requirements are written as normative language tone following the RFC 1=
.3.
=20
So please avoid normative wordings in description.

> In the spec section 1.3 Terminology, it says:
>=20
> The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
> "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED",
> "MAY", and "OPTIONAL" in this document are to be interpreted as described
> in [RFC2119] and [RFC8174] when, and only when, they appear in all capita=
ls,
> as shown here.
>=20
> RFC 2119 says:
>=20
> SHOULD This word, or the adjective "RECOMMENDED", mean that there
>    may exist valid reasons in particular circumstances to ignore a
>    particular item, but the full implications must be understood and
>    carefully weighed before choosing a different course.
>=20
>=20
> Here this "SHOULD" exactly conforms to the definition.
>=20
> "SHOULD" has already been used in non-normative sections, for example:
> 2.5.4 Legacy Interfaces: when using the legacy interface, drivers SHOULD =
read
> these fields multiple times until two reads generate a consistent result.
>=20
> The spec does not say: "SHOULD" can only be used in driver or device
> requirements section.
>=20
It follows the style to not have normative words in descriptions as I expla=
ined above.

> >
> >>> If X is not negotiated, the....
> >>> And the device sets the DRIVER_OK bit to 0 once it has been suspend.
> >>>
> >>>> +If the device has been suspended, the driver can resume the device
> >>>> +running
> >>>> by setting the DRIVER_OK bit in \field{device status} to 1, and the
> >>>> device should set the SUSPEND bit to 0 once it resumes running.
> >>>> +
> >>> The device sets the SUSPEND bit to 0 once the device is running.
> >> What is the difference in semantic?
> >>
> > "resumes running" does not read correct.
> > And normative "should" is used...
> > Hence the suggestion to re-word it.
>=20
> Looking into a dictionary
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .merriam-
> webster.com%2Fdictionary%2Fresume&data=3D05%7C02%7Cparav%40nvidia.c
> om%7C2676f0bbbacd46d2944608dda72bc149%7C43083d15727340c1b7db3
> 9efd9ccc17a%7C0%7C0%7C638850528606897234%7CUnknown%7CTWFpbG
> Zsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiI
> sIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DFftxcTQOXxj
> hvCNeIs3%2FHzphS5Q1DVUn2VjLJAt75oA%3D&reserved=3D0
> There is quite a lot of examples of resume + noun.
>
Running is not a good noun in this context.
It can be worded better which clarifies things more crisply as proposed.
=20
> And here, "SHOULD" still conforms to RFC 2119.
>=20
It does not belong in descriptive section. It belongs to requirements secti=
on.

> >
> >>>> +\drivernormative{\subsection}{Device Suspend}{General
> >>>> +Initialization And Device Operation / Device Suspend}
> >>>> +
> >>>> +The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or
> >>>> VIRTIO_F_SUSPEND is not negotiated.
> >>>> +
> >>>> +Once the driver sets SUSPEND bit in \field{device status} to 1:
> >>>> +\begin{itemize}
> >>>> +\item The driver MUST verify whether the device has been suspended
> >>>> +by
> >>>> re-reading \field{device status}, examining whether the SUSPEND bit
> >>>> is set to
> >>>> 1 and the DRIVER_OK bit is set to 0.
> >>>> +\item The driver MUST NOT make any more buffers available to the
> >> device.
> >>>> +\item The driver MUST NOT send notifications for any virtqueues.
> >>>> +\item The driver MUST NOT make any changes to Device Configuration
> >>>> Space except for \field{device status} if it is part of the
> >>>> Configuration
> >> Space.
> >>>> +\end{itemize}
> >>>> +
> >>>> +\devicenormative{\subsection}{Device Suspend}{General
> >>>> +Initialization And Device Operation / Device Suspend}
> >>>> +
> >>>> +The device MUST ignore any operations on the SUSPEND bit from the
> >>>> +driver if the device has not been completely initialized by the
> >>>> +procedures in \ref{sec:General Initialization And Device Operation
> >>>> +/ Device Initialization}
> >>>> +
> >>>> +The device SHOULD ignore any write access to its Configuration
> >>>> +Space while suspended, except for \field{device status} if it is
> >>>> +part of the
> >>>> Configuration Space.
> >>>> +
> >>>> +A device MUST NOT send any notifications for any virtqueues,
> >>>> +access any virtqueues, or modify any fields in its Configuration
> >>>> +Space while suspended.
> >>>> +
> >>>> +If changes occur in the Configuration Space during suspended
> >>>> +period, the device MUST NOT send any configuration change
> notifications.
> >>>> +Instead, the device MUST send the notification when it resumes
> running.
> >>>> +
> >>>> +If the driver sets the SUSPEND bit in \field{device status} to 1,
> >>>> +the device MUST either suspend itself or set the
> >>>> +DEVICE_NEEDS_RESET bit in
> >>>> \field{device status} to 1 when it fails to suspend.
> >>>> +
> >>> Even though you have the driver normative, it is good to have device
> >> normative for suspend and resume operation:
> >>> Something like,
> >>>
> >>> When the suspend operation completes in the device, the device MUST
> >>> set SUSPEND bit to 1 and DRIVERK_OK to 0.
> >>>
> >>> When the suspended device is resumed, the device MUST set SUSPEND
> >>> bit
> >> to 0 and DRIVER_OK to 1.
> >>
> >> I think we already have similar descriptions in the beginning of this
> >> section
> >>
> > I didn't find it in the normative device section.
>=20
> +\section{Device Suspend}\label{sec:General Initialization And Device
> +Operation / Device Suspend}
> +
> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend
> +the device by setting the SUSPEND bit in \field{device status} to 1,
> +and the device SHOULD set the DRIVER_OK b
> it to 0 once it has been suspended.
> +
> +If the device has been suspended, the driver can resume the device runni=
ng
> by setting the DRIVER_OK bit in \field{device status} to 1, and the devic=
e
> SHOULD set the SUSPEND bit to 0 once it resumes running.
>
As I explained, it is not the requirements section of the device. It is the=
 description/theory of operation section.
And you gave the good example that creates this confusion of mixing the nor=
mative tone in description.
:)

> >
> >>>
> >>>> +If the device has been suspended and the driver resumes the device
> >>>> +running by setting the DRIVER_OK bit in \field{device status} to
> >>>> +1, the
> >>>> device MUST either resume normal operation or set the
> >>>> DEVICE_NEEDS_RESET bit in \field{device status} to 1 when it fails
> >>>> to
> >> resume.
> >>>> +
> >>>> +When the driver sets the SUSPEND bit to 1, the device SHOULD
> >>>> +perform
> >>> It should be MUST.
> >>> Otherwise it can crash the system accessing memory that may not be
> >>> any
> >> more accessible.
> >>
> >> Not sure how this can crash system memory, but "MUST" is OK
> >>
> > Ok.
> >>>> +the following actions before presenting the SUSPEND bit as 1 and
> >>>> DRIVER_OK bit as 0 in the \field{device status}:
> >>>> +
> >>>> +\begin{itemize}
> >>>> +\item Stop consuming more buffers of any virtqueues.
> >>>> +\item Wait until all buffers that are being processed have been use=
d.
> >>>> +\item Send used buffer notifications to the driver.
> >>>> +\end{itemize}
> >>>> +
> >>>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
> >>>> Options}
> >>>>
> >>>>  Virtio can use various different buses, thus the standard is split
> >>>> @@ -872,6
> >>>> +923,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> >>>> +Feature
> >>>> Bits}
> >>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device /
> >>>> Feature Bits} for
> >>>>  	handling features reserved for future use.
> >>>>
> >>>> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the drive=
r
> can
> >>>> +   suspend the device by set the SUSPEND bit to 1.
> >>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status=
 Field}.
> >>>> +
> >>>> +
> >>>>  \end{description}
> >>>>
> >>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
> >>>> Bits}
> >>>> --
> >>>> 2.49.0
> >>>>
> >>> Apart from these small comments, please add the line in v3 commit log=
:
> >>>
> >>>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi
> >>>
> th%2F&data=3D05%7C02%7Cparav%40nvidia.com%7C2676f0bbbacd46d29446
> 08dda7
> >>>
> 2bc149%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6388505286
> 069551
> >>>
> 99%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjA
> uMDAwM
> >>>
> CIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&
> sda
> >>>
> ta=3DJM7RqfmpPNS3eVrlq0ky93nh6NGLhKsm97QZkSCnq%2B4%3D&reserved=3D
> 0
> >>> ub.com%2Foasis-tcs%2Fvirtio-
> >> spec%2Fissues%2F&data=3D05%7C02%7Cparav%40nv
> >>
> idia.com%7C0ef2b01694d942339bb308dda4e5365c%7C43083d15727340c1b
> >> 7db39ef
> >>
> d9ccc17a%7C0%7C0%7C638848026619639978%7CUnknown%7CTWFpbGZsb
> >> 3d8eyJFbXB0
> >>
> eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpb
> >> CIsIl
> >>
> dUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D0st2osYsAxascHHmHj0RgSyYAn9l
> >> yQRKqxOl
> >>> aIjE8dk%3D&reserved=3D0<issue_number>
> >>>
> >>> This will help to link the two sides.
> >> sure
> >>
> > Thanks.
>=20

Please send v3 with these short fixes and 2 pre-patch.
For fixing feature bits if you want me to write up the patch, please let me=
 know.
