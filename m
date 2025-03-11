Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C5D2405F9
	for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741706100; cv=fail; b=dgktr5DDoy/WSxtUA8jHoKXIGfvaIcLwZIHFQig5CQfEsORH4+o43QtW0TqEDRPh1lupfUojdoM0MYuI/5psszU5nab+N4j38Xqq+a0a+JGrGWlV2FxBuqeVnTRXi9GHgk/rIc0iemoZF9Nhb9UpGTADzXJJ0gcHBCKYjgKeOBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741706100; c=relaxed/simple;
	bh=hWXm1+d940OSH5z5/E4jSj+2EKu1QErZ2GR69KbGOgw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nFTbWeu2XNVy+HEpkRdvqRS5MP1YYWhT8edWhEVm215nGnsd+WYRTwfR1mKLcFtHk1qyakyzBlgkstZ4eriFDp/e5U5HTPSw/cYtmZd2C5soDGizUoAmofgcJKTgOfd8OnRk3gCJDSNU8ImEnp2j6KW+hVvi+NV/6/1h5oAl/ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dD2vxKGd; arc=fail smtp.client-ip=40.107.92.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dD2vxKGd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJYsKtMDApdRRGC0rCbWGRmFIejX829OChsZ4u29rbk9Ub7wzLbIDKtHjZEbwoHmDkyKVcX4hdeUUMQDS+z7Z4EZFv1H2iNDu/FZso+d6jvDlL0I1R+Hd30pdtmGDszmE179FJjNUz2I96cLyn4V+qzwQnxoN+zbnBfvds7G1h153qdBrG8ijO4ne9iiPjTfNXQDsEO/MBi7S7+NnNEpdjbi9G61NFKJ52090cMw0mB/JtHJryhi487HGmvbU0o/Yt2btAnoXGH8RV3FtF0ekROcmYKQQz4NCX4zmFdkq9grfxQxAmOR2U9N0iszsn7bl0ciNlfL4HRARvOXzdu3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkuPHqSD552LH8KYRkO9slAt5HifGWamrJsqd9Xh1Jo=;
 b=SxB5wguA0+9Pos2zzooUCYUUvMHW170jRgeRsRcX0T9/MiG8mOYJz1eb1VQF4BmXkDN99hsZpRku+BwhqH7Ikb7+OxmGKiI9nTxtXPLxlStiNjTjbl7h1vqybOHshcLxruy3/PRjktyLp22S4fQeqyn9sTxwJD6SwSMybI3fgTR8As7tdnmoGnYopip7nxC7V/tH/svDLcTyAT07QknUtHeT0hUIKCCcquhVkUM2e7AhArsPLMUs1rZrcP31VaGT5J7Ocmr42Qt42rA2ZLXNgI738kBiST8+0nhg12sW4NR4SXjG2iri9lRrBBV7f9bSQfE3DAIuRsve+qNTgo8ZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkuPHqSD552LH8KYRkO9slAt5HifGWamrJsqd9Xh1Jo=;
 b=dD2vxKGdcQxGB6LyFDa0EEblQ0mAD10xnDpAI8z8SlLo0W3nAPl/jUCvitlVPtL1uUlosmcNFxG8Rqj+Egh6CN0OD651xEs5YPqyTaWNHsoMHGrO/9X86Je4PtoJZaXMCrru2ETKlHYER5phebSja5mmrAnpmSLYamkLzzy/AmrJdPwIzZnlbQ+TX6pEMSFtj7rTi3jKmZ1VInkTgjxe53RozWCZCuTkU6PoK5XxtwREnwtkwBPEKMuzayQf7jcIS5FMJB/WsJjaS+YOAtxlRUC3BCFbwGFWEPqn1e0B3bNpQn0CC8Z4tj/9QYCkzcrwwZkI4N69zhFG9PuSqNqrCA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SJ1PR12MB6100.namprd12.prod.outlook.com (2603:10b6:a03:45d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 15:14:49 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 15:14:49 +0000
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
 AQHbiDDvdx0hNqTsk0elfmK82iBGrrNZZ+iQgAr+CgCAASisMIAAMHuAgAYLvtCAAENTAIAAK3ywgAEhAgCAAAdoAIAAPDSAgACAObA=
Date: Tue, 11 Mar 2025 15:14:49 +0000
Message-ID:
 <CY8PR12MB71956575D93118AF3C425B51DCD12@CY8PR12MB7195.namprd12.prod.outlook.com>
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
In-Reply-To:
 <IA1PR12MB6532DB3DD088B6F11351C645F2D12@IA1PR12MB6532.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SJ1PR12MB6100:EE_
x-ms-office365-filtering-correlation-id: bb811e7c-481b-4f09-c3e2-08dd60af7738
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?13/SJFaF1M0RdC5lPp31Xy5t5mQAng4tlq25sI6T+O4sxQA4cC1dXz9v08Eo?=
 =?us-ascii?Q?SWVJGyewiAZ4VRJea/ESDvHfS/Iw68q+84Si4ZL6vhbWFq35d1o8qZ8YPVQM?=
 =?us-ascii?Q?GTPWkaurlbxi1fiOy9eIK746uO9/F1IQyjIMYwkgNNq438Rk1Rho0xu+gBlg?=
 =?us-ascii?Q?a3u/YkzscL0mrPUAvqcJ3Hy/Vu7sC6uPZgWSXmv8s7XzA15a01KwYKqgxGEz?=
 =?us-ascii?Q?az87j+nt9ubNXEcG4oyXREubi8tj8SY6F20HZhBAPOtD+4AVFLEzIdjqkrXz?=
 =?us-ascii?Q?tsMOSgUG70JP71TaU8WlXo/ZZCPzG266ZceFowCkxShgQ2BWFVTXjJLoFXm5?=
 =?us-ascii?Q?ZsqS/noBEcfCylWwbTOrOGVIlWvgi0exKrE7yPZCYBkeavglt6G1f6Txh6En?=
 =?us-ascii?Q?vVbH63bYFH4uqhIbXwHn9/sIqE40a6X9lF0hzTDZOrE07Urqyr2jQdcb4pa9?=
 =?us-ascii?Q?SsbmtadNp60/ia8mgPTh29UsRlL3rjps6wREFiDX8IGWeXddpush9hXq1OTD?=
 =?us-ascii?Q?JN4lJwSIYfvTlMP6Nj2FVNDu9nfSqoC9edLvm4WY/yAZJdH1PFiWt5LfEZlJ?=
 =?us-ascii?Q?sdu46dHfLhWP1WBd0/liKIOAxgN3UiqWISXhPpENYthMRIDCEOkxXcauXKEu?=
 =?us-ascii?Q?+PfqnlrAgcqubnq3JsSb5LZTJ+162pcKRoGYm+V55BBOo/eUuovBMtNYbi1H?=
 =?us-ascii?Q?95i/WYIAinZ5HIR9YunjLZgZRbap+E8n6XwoseFPbXxKX6cJ6L4w59fYOd+9?=
 =?us-ascii?Q?FbgS4rN71gg50wfv52Yev73Zis1wjW4K5LJ3sOh3AznNGguMV23BusuE0kna?=
 =?us-ascii?Q?WiWVnmEKXsLzJce4Wev1lj2cM4HkkqeC3XFx+W0drC3tdiHkD4oOc1YSfUzB?=
 =?us-ascii?Q?O/5Yvm4sx685WLNadlBpdHhrEAubXMoCcjT7iIDzeScUoip7xxlMBWKYWF/r?=
 =?us-ascii?Q?56EKKZ7q4c6aVv0OkZEtch8CeV4povTUd3obpxLveFeXzZPXbntxLB476IK/?=
 =?us-ascii?Q?/KcpdQOGsqaXI9VSGowqtRgEh7ce2gmpUV5sDQeirjOpy8RuAfPTIW7e/4l3?=
 =?us-ascii?Q?71QRxPMAxXdFWGzoHEo7k+ZlS/+eGMzkb1ozjDWo0FMK5eY6BDSH0LA/qFWw?=
 =?us-ascii?Q?Cg9kRgfH+decfox5KRvfWyQRt1agmcFFL0zbDuFWvcQjmI/DQotH7hW7BcPb?=
 =?us-ascii?Q?Btun9IuvxaL0LI6WyIYPIoWmf04yh+FeQm3tcOyadF/u3rn5ZPnXOMiMkqAR?=
 =?us-ascii?Q?4dhxJ1nxVyHmR/vs8tvzvsPszhuIsIEiWsvFurbOqW4IStD8+fKGZ9eX5EbD?=
 =?us-ascii?Q?iALXInVPPD0bi5khScT6NxPd7tRV/3qRK8+MV1JKYkmiS9H9543KGoTYVgUp?=
 =?us-ascii?Q?V1H+JFgkybMGjK7CfLkoEXhPs5LmqY8Dd7iTOXho+7bgcH+3UjdRRqw08Q9y?=
 =?us-ascii?Q?kw6GBj1BeyPNo2ZEnXygNTOCk+LZNa3U?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?G0rF0hX5/WrNOXIrgfEwpmILHL1TQ7gkWZ6sVM01IPxWyQ6nvBb2OsD8ohDG?=
 =?us-ascii?Q?PN4fGoypPRZwkynocksRb//B0SEdATrzLFh8727WMJwL21GjjutzDqwfAt8Z?=
 =?us-ascii?Q?pg4+C6b5QyWEqN6+DignPbiTd8ecCxFHiRA1ebDnly+jCFYb4fEXUuQi/tyo?=
 =?us-ascii?Q?nLf5W7bVzO7FTUPOy+p8N7oU7999RHfALayCUghDSUPQ93z4y0Y02AWpSD0K?=
 =?us-ascii?Q?L3ZmWZSahlwj56vkHLp/JyN78d1ZU8kDbMQkv0DeOjm39xvJVZWveOD3pMIv?=
 =?us-ascii?Q?HH9ywYiH6ciSTiP5Npq+HXOa36ts3rhMkTRWaqunGjkF3kxj/TydOTsUcPPL?=
 =?us-ascii?Q?n2jHchC/LojTr+b5ht+0mLRUUCTKqWWw21yw7msM0NgwOCw+pjJwn94VdUot?=
 =?us-ascii?Q?PpbWL+mcMN9hpAJ16fd94vuNsZIQNtiECKJR7aCuvUEcUBHug22FGKfOny48?=
 =?us-ascii?Q?uFrayiTR5J7M7Nwhg/lDHXNunQIO0AEUTo7pU9JyjGYgQAXIsVORick4ovGx?=
 =?us-ascii?Q?uqv8hTi9abH0bAkIdyySwcGSN66JOaYY0Q2zZkeEPeUQGvWGJT8UqRXphVsi?=
 =?us-ascii?Q?lX9XsDu/Zt6KZ72Gfaak0QUR072dvYap8bEk98irQZWChOzQiCwGN0WGJ/09?=
 =?us-ascii?Q?QrvuncrXmZPQoG+7seJSAQqbyuTsGA1iQEWx5Wri/6zGGr/QOJmRimKLxMnA?=
 =?us-ascii?Q?XT8LLR56L/yV2eVCtBTYb5qB5nX51LggyS56O0ZHLyk+DJIaSgds5awK/pY7?=
 =?us-ascii?Q?VCceVl8Sp3GZiY4fqueUI2j/7ZtB/mno/vu6kTcDsHCyUvfP0gxKro6VB3Cr?=
 =?us-ascii?Q?/eFRbuqDLfb4MGn3qXPN+iVzGDJdA6EQ5kj9QhUVM/IWMnKFlLmm7u5h0kJO?=
 =?us-ascii?Q?S3HKEAlZG2gLHMS9jwre0CCTpXSB6ybZ1oXXRZ4GPU2nUS4l4JSdM03RyP/N?=
 =?us-ascii?Q?lTVECy7wnGyeQDwObYGACXrGCU/K5eMVS/EYKCpJY9JF/n0Pdfs8dxgeaW1c?=
 =?us-ascii?Q?SYOFQpDxAPAg5nHSi2OMhQvvymQ2kPhijmxHCU8+knPl0ViPvfH02n2m0flG?=
 =?us-ascii?Q?qe8LXggit7oIXAwUPkqcn/DlRQI9T923apcy6egvEf9lIaW4BewqDhm44WZK?=
 =?us-ascii?Q?Av8UvjKjSIRMLQHBfWKC9wAnIY9cF95JFk1wggc6jKaERQz913NDaCflbIlq?=
 =?us-ascii?Q?wGR+OX7OiY8ZfCzQEw0Nl4/2SI/1zFzqBWK0ddDVHLLGDdkCSLC/rUhxImRg?=
 =?us-ascii?Q?vcW88SYipe3IxOmXvfKDvvasVGWrMCI581ZBl53eTxMcObbYTQQheQ8vWeUT?=
 =?us-ascii?Q?yUxj5smznVS/EY5l666na4ze+sNKJVUKvZZoIOVvURDuk3W9+8fcWxs6umVm?=
 =?us-ascii?Q?UcatiQA4zUKVPxfST9S5KV+ztCdvrTExzPEtjZq8udGqncYIK3YWyWrY7cjl?=
 =?us-ascii?Q?YXp38KXOIhGnzLceSJaNJeUbgqlMHIhr9oT9Lz0xuTGZWK+mu6YhXlKR5rrF?=
 =?us-ascii?Q?yRtPRq7VI1w5V4xN+gNEC0XYqhpibnBhOzC/cZtX/6kwWo2M0XACOtQBg40T?=
 =?us-ascii?Q?mK+Gfd3uonQueWndue0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bb811e7c-481b-4f09-c3e2-08dd60af7738
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 15:14:49.2004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M8LsVp8Xv9Koy9gnok4x2AxISWXjuI0CfWI39S4iOXkcCVMFkLEbrVovOi5dhIKpLbCSM7AD67aYEMwgQl3OZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6100


> From: Zhang, Julia <Julia.Zhang@amd.com>
> Sent: Tuesday, March 11, 2025 12:59 PM
>=20
> On 2025/3/11 12:00, Parav Pandit wrote:
> >
> >
> >> From: Zhang, Julia <Julia.Zhang@amd.com>
> >> Sent: Tuesday, March 11, 2025 8:58 AM
> >>
> >> On 2025/3/10 18:18, Parav Pandit wrote:
> >>>
> >>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>> Sent: Monday, March 10, 2025 1:07 PM
> >>>>
> >>>> On 2025/3/10 11:48, Parav Pandit wrote:
> >>>>>
> >>>>>
> >>>>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>>>> Sent: Thursday, March 6, 2025 12:47 PM
> >>>>>>
> >>>>>> On 2025/3/6 12:29, Parav Pandit wrote:
> >>>>>>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>>>>>> Sent: Wednesday, March 5, 2025 4:12 PM
> >>>>>>>>
> >>>>>>>> On 2025/2/26 18:51, Parav Pandit wrote:
> >>>>>>>>>
> >>>>>>>>>> From: Julia Zhang <julia.zhang@amd.com>
> >>>>>>>>>> Sent: Wednesday, February 26, 2025 2:58 PM
> >>>>>>>>>> To: virtio-comment@lists.linux.dev
> >>>>>>>>>> Cc: Michael S . Tsirkin <mst@redhat.com>; Chen Jiqian
> >>>>>>>>>> <Jiqian.Chen@amd.com>; Zhu Lingshan
> <lingshan.zhu@amd.com>;
> >>>>>> Huang
> >>>>>>>> Rui
> >>>>>>>>>> <ray.huang@amd.com>; Julia Zhang <julia.zhang@amd.com>;
> >> Matias
> >>>>>>>>>> Ezequiel Vara Larsen <mvaralar@redhat.com>
> >>>>>>>>>> Subject: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
> >>>>>>>>>>
> >>>>>>>>>> PCI peer-to-peer DMA transaction may be used in guest for
> >>>>>>>>>> some
> >>>>>> scenes.
> >>>>>>>>>> For example, dGPU prime feature will let virtio-iGPU access
> >>>>>>>>>> to passthrough dGPU buffer.
> >>>>>>> Virtio specification does not describe dGPU and iGPU.
> >>>>>>> So either describe it in the description or please drop that and
> >>>>>>> explain the
> >>>>>> motivation without referring to those terms.
> >>>>>>
> >>>>>> OK I see.
> >>>>>>
> >>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> To support P2P DMA transaction in guest, virtio-gpu needs to
> >>>>>>>>>> check the compatibility which is represented by
> p2pdma_distance.
> >>>>>>>>>> This defines a command VIRTIO_GPU_CMD_P2PDMA_DISTANCE
> to
> >>>> allow
> >>>>>> guest
> >>>>>>>> send
> >>>>>>>>>> virtual pci notation of two devices to host and get host
> >>>>>>>>>> physical p2pdma_distance of these two PCI devices.
> >>>>>>>>>>
> >>>>>>> [..]
> >>>>>>>>>> Ifsm1M5xIb37T9Tg%3D&reserved=3D0
> >>>>>>>>>> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> >>>>>>>>>> Reviewed-by: Matias Ezequiel Vara Larsen
> >>>>>>>>>> <mvaralar@redhat.com>
> >>>>>>>>>> ---
> >>>>>>>>>> Hi all,
> >>>>>>>>>>
> >>>>>>>>>> We are trying to implement dGPU prime feature in guest which
> >>>>>>>>>> will let
> >>>>>>>>>> virtio- iGPU read rendered data of passthrough dGPU. Before
> >>>>>>>>>> that, virtio gpu driver needs to get p2pdma_distance to check
> >>>>>>>>>> if P2P DMA transaction is possible or not.
> >>>>>>>>>>
> >>>>>>>>>> To implement getting p2pdma_distance, QEMU needs to handle
> >>>>>>>>>> the command from guest with virtual pci notations of two PCI
> >>>>>>>>>> devices and send it to host kernel and return host physical
> >>>>>>>>>> distance back to
> >>>>>> guest.
> >>>>>>>>>>
> >>>>>>>>>> So this defines the new command follow the suggestion in https=
:
> >>>>>>>>>> //lore.kernel.org/all/20241207105537.542441-4-
> >>>> julia.zhang@amd.com
> >>>>>>>>>> /
> >>>>>>>>>>
> >>>>>>>>>> changes from v1:
> >>>>>>>>>>       - add issue link to commit msg
> >>>>>>>>>>
> >>>>>>>>>> Regards,
> >>>>>>>>>> Julia
> >>>>>>>>>> ---
> >>>>>>>>>>       device-types/gpu/description.tex | 29
> >>>>>>>> +++++++++++++++++++++++++++++
> >>>>>>>>>>       1 file changed, 29 insertions(+)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/device-types/gpu/description.tex b/device-
> >>>>>>>>>> types/gpu/description.tex index 4435248..9d0f30b 100644
> >>>>>>>>>> --- a/device-types/gpu/description.tex
> >>>>>>>>>> +++ b/device-types/gpu/description.tex
> >>>>>>>>>> @@ -223,6 +223,7 @@ \subsubsection{Device Operation:
> Request
> >>>>>>>>>> header}\label{sec:Device Types / GPU De
> >>>>>>>>>>               VIRTIO_GPU_CMD_SUBMIT_3D,
> >>>>>>>>>>               VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
> >>>>>>>>>>               VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
> >>>>>>>>>> +        VIRTIO_GPU_CMD_P2PDMA_DISTANCE,
> >>>>>>>>>>
> >>>>>>>>>>               /* cursor commands */
> >>>>>>>>>>               VIRTIO_GPU_CMD_UPDATE_CURSOR =3D 0x0300, @@
> >>>>>>>>>> -236,6
> >>>>>> +237,7
> >>>>>>>> @@
> >>>>>>>>>> \subsubsection{Device Operation: Request
> >>>>>>>>>> header}\label{sec:Device Types / GPU De
> >>>>>>>>>>               VIRTIO_GPU_RESP_OK_EDID,
> >>>>>>>>>>               VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
> >>>>>>>>>>               VIRTIO_GPU_RESP_OK_MAP_INFO,
> >>>>>>>>>> +        VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE,
> >>>>>>>>>>
> >>>>>>>>>>               /* error responses */
> >>>>>>>>>>               VIRTIO_GPU_RESP_ERR_UNSPEC =3D 0x1200, @@ -791,6
> >>>>>>>>>> +793,33 @@ \subsubsection{Device Operation: controlq
> >>>>>>>>>> (3d)}\label{sec:Device Types / GPU Dev  };  \end{lstlisting}
> >>>>>>>>>>
> >>>>>>>>>> +\item[VIRTIO_GPU_CMD_P2PDMA_DISTANCE] calculates the
> >>>>>> cumulative
> >>>>>>>>>> +distance
> >>>>>>>>>> +  between two devices before Peer-to-Peer(P2P) transaction.
> >>>>>>>>>> +Request data
> >>>>>>>>>> +  is \field{struct virtio_gpu_device_p2pdma_distance}.
> >>>>>>>>>> +Response type is
> >>>>>>>>>> +  VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE. Response data is
> >>>>>>>>>> +  \field{virtio_gpu_resp_distance}.
> >>>>>>>>>> +
> >>>>>>>>>> +\begin{lstlisting}
> >>>>>>>>>> +struct virtio_gpu_device_p2pdma_distance {
> >>>>>>>>>> +        struct virtio_gpu_ctrl_hdr hdr;
> >>>>>>>>>> +        le32 provider_bus;
> >>>>>>>>>> +        le32 provider_slot;
> >>>>>>>>>> +        le32 provider_func;
> >>>>>>>>>> +        le32 client_bus;
> >>>>>>>>>> +        le32 client_slot;
> >>>>>>>>>> +        le32 client_func;
> >>>>>>>>>> +};
> >>>>>>> The requester device's PCI RID is anyway known to the responder.
> >>>>>>> So no
> >>>>>> need to pass it here.
> >>>>>>> It is unclear if its provider or the client.
> >>>>>>
> >>>>>> I don't think requester device's PCI RID is known to the
> >>>>>> responder, since the existing function pci_p2pdma_distance() also
> >>>>>> require provider and client information.
> >>>>>>
> >>>>> The existing function takes the provider pci device as input at C c=
ode
> level.
> >>>>> And proposed extension (without provider BDF) will also operate on
> >>>>> the
> >>>> provider device on which the request/response transaction is
> happening.
> >>>>
> >>>> Well at first, I just want virtio GPU to handle the command to get
> >>>> p2pdma_distance of two PCI devices(maybe none of them is virtio
> GPU).
> >>> Using virtio gpu to find the distance between two arbitrary devices
> >>> which
> >> are not virtio is certainly outside the scope and looks wrong.
> >>> It should be done at some PCI topology level who exposed this devices=
.
> >> For our use case, virtio GPU is the provider, we are using virtio GPU
> >> to calculate distance between virtio GPU and dGPU, which are not
> >> arbitrary devices.
> > The fact that in physical world this distance is calculated without inv=
olving
> the individual provider and client EP PCI devices, in virtual world doing=
 this via
> virtual PCI EP devices does not look correct abstraction to me.
>=20
> In physical world, this distance is calculated by calling existing functi=
on
> pci_p2pdma_distance(), which will pass the the provider and client. I
> understand that you mean virtio GPU should be provider by default, but my
> point is that when I call pci_p2pdma_distance() to calculate distance bet=
ween
> virtio GPU and dGPU, I still need to pass the RID of them to host kernel =
side.
> And because host kernel doesn't know which one GPU is the virtio GPU, thi=
s
> struct still needs to include provider information.
>=20
> > I tend to imagine that one needs to build a right virtual topology in Q=
EMU
> or somewhere else who is providing these PCI devices such that guest kern=
el
> can calculate it accurately without depending on the EP PCI devices.
>=20
> But the virtio GPU BDF in guest is different from host side, guest kernel=
 cannot
> calculate the correct physical distance from guest side.
Sure virtio GPU BDF is likely vRID.
Guest should request the right distance calculator entity, possibly the one=
 that is providing the connectivity (and distance), which likely is pci RC/=
bridge/switch etc.

Imagine a virtio PCI driver asking to to the virtio PCI device, how far is =
it from the vCPU for NUMA awareness.
It seems wrong to me.
Because it is unable to follow the same flow between virtual and physical w=
orld.

> >
> >
> >>>
> >>>> So
> >>>> when guest needs to calculate distance of any two PCI devices, it
> >>>> can reuse this command. But indeed, we only have this one use case
> >>>> at this moment, I guess considering virtio GPU as provider and
> >>>> remove provider PCI RID of this struct is fine.
> >>> Right. A driver can issue the command to device without mentioning
> >>> its own
> >> device identifier.
> >> Since calling function pci_p2pdma_distance() still needs to pass its
> >> own RID, I think at least QEMU has to tell host kernel the RID of viri=
to GPU.
> > Probably yes, would be interesting to see this UAPI on the host kernel =
too,
> (unrelated to this patch).
> >
> >>>
> >>>>
> >>>> But there's another problem: how does host kernel get virtio GPU
> >>>> RID and calculate distance between virtio GPU and dGPU? If I remove
> >>>> provider information of this struct, then QEMU still needs to pass
> >>>> virtio GPU RID to host kernel side.
> >>> The device implementation side can get to know about this as it has
> >>> plugged
> >> in and built the topology.
> >>> The RID we are discussing are the vRID seen by the guest driver.
> >>> I probably missed to clarify this.
> >> But only getting the distance on the virtual PCI inside the guest is
> >> not enough to figure out if P2P is possible or not. We need to get
> >> the real distance from host side. Please take a look at the discussion=
 here:
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flo=
r
> >> e.kernel.org%2Fall%2Fbfe6a8b7-adcf-40e2-b7a2-
> 4e64dc96862d%40amd.com%2
> >>
> F&data=3D05%7C02%7Cparav%40nvidia.com%7Ccf5112991dc145cd786508dd60
> 6e772
> >>
> 9%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638772749796637
> 911%7CU
> >>
> nknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
> MCIsIlAi
> >>
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> 7wrTh
> >> 4PogFwvK6YzRgBQi2GeOus0CarX0%2Bu5DerCQWs%3D&reserved=3D0
> >
> > Finding out the distance between two PCI devices in physical world is r=
ole of
> the PCI bridge/switch topology builder.
> > So why should it change for the guest VM?
>=20
> Because as discussed in above link, before letting virtio GPU and dGPU do
> P2P, we have to check if these two devices can communicate with each othe=
r
> by calculating the distance in physical world.
Ok, so that distance should be provided by the same way in physical and vir=
tual world.
The hypercall should be in PCI RC subsystem, not in virtio arbitrary device=
.

> It's not just the role of PCI bridge/switch topology builder.=20
Well, I think it is. Because this is how the physical world able to provide=
.

> Checking this
> distance is a necessary step before P2P like amdgpu does:
> amdgpu_dma_buf_attach
> ->pci_p2pdma_distance
>=20
> > Why virtualized topology cannot be build in a way such that it matches =
to
> the physical world to get the accurate distance?
> > At least to me, doing this in the pci RP domain (and not PCI EP domain)
> seems the right way to go forward.
>=20
> Because the BDF of virtio GPU and passthrough dGPU on virtual PCI bridge =
is
> different from the physical world, which makes guest kernel cannot get th=
e
> accurate distance.
I suggested one option is QEMU to build right topology as that of the physi=
cal world so that physical and virtual systems can run same code.

>=20
> Julia
> >
> >>
> >> Hi MST,
> >> We are talking about how to get the correct p2pdma_distance from host
> >> side and pass it to guest side. Do you have any suggestions?
> >>
> >> Julia
> >>
> >>>>
> >>>>>
> >>>>>> Do you mean that I should consider virtio GPU as provider by defau=
lt?
> >>>>> Yes.
> >>>>>
> >>>>>> Then this command will only work for this specific use case
> >>>>>> instead of
> >>>> being
> >>>>>> used as a common function.
> >>>>>>
> >>>>> Linux kernel API is operating on the device. Similarly proposed
> >>>>> extension
> >>>> will also be on the device level.
> >>>>> If needed, an higher-level software will iterate over the
> >>>>> interesting PCI
> >>>> devices and invoke the pci_p2pdma_distance() API.
> >>>>
> >>>> The reason of passing this command from guest to host is that in
> >>>> our case, we need to calculate p2pdma_distance of virtio GPU and
> >>>> dGPU on host side. So my original design is quiet simple:
> >>>> 1. Pass rid of virtio GPU(provider) and dGPU(client) to host side 2.
> >>>> Host kernel calculate real p2pdma_distance of these devices.
> >>>> 3. Return p2pdma_distance to guest side.
> >>>>
> >>> The virtio GPU is asking information about some other non virtio
> >>> device in
> >> the system does not look correct to me.
> >>> I believe this is the PCIe topology level should be able to provide
> >>> the info
> >> without encapsulating this via some arbitrary device type like virtio =
gpu.
> >>>
> >>>> And I think the higher-level software should know the exact RID of
> >>>> two devices and then invoke pci_p2pdma_distance() to calculate
> distance.
> >>> Not sure. if this can be discovered in physical level, it can be
> >>> discovered at
> >> virtual guest VM level too as long as QEMU builds it in right way.
> >>>
> >>>> So
> >>>> I still think we should keep provider information in this struct
> >>>> and following the existing logic of getting p2pdma_distance.
> >>>>
> >>>> Regards,
> >>>> Julia
> >>>>
> >>>>>>>
> >>>>>>> You only need to supply the other device RID.
> >>>>>>> In PCI spec the RID is 16-bit. Considering other advancements,
> >>>>>>> RID of 32-
> >>>> bit
> >>>>>> would be ok too.
> >>>>>>>
> >>>>>>> So please remove client_*.
> >>>>>>> Replace provider_X with le32 other_device_pci_RID.
> >>>>>>>
> >>>>>>> Mention that other_device_RID follows PCI specification RID
> notation.
> >>>>>>
> >>>>>> OK I will modify it.
> >>>>>>
> >>>>>>>
> >>>>>>>>>> +
> >>>>>>>>> I assume above bdf information is what is visible to the guest?
> >>>>>>>>> Why cannot it see this distance in the guest VM itself?
> >>>>>>>>
> >>>>>>>> Guest can see virtual bdf information which is not the real bdf
> >>>>>>>> information of the host. So guest can't get the correct distance=
.
> >>>>>>>> That's why I need to implement a new command to get and pass
> >>>>>>>> the
> >>>> real
> >>>>>> distance.
> >>>>>>>>
> >>>>>>> [..]
> >>>>>>>
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>>> +struct virtio_gpu_resp_distance {
> >>>>>>>>>> +        struct virtio_gpu_ctrl_hdr hdr;
> >>>>>>>>>> +        le32 distance;
> >>>>>>>>>> +}
> >>>>>>>>>> +\end{lstlisting}
> >>>>>>>>> I am not gpu expert so didn't pay attention to details.
> >>>>>>>>> I believe you are missing basic information in the patch is
> >>>>>>>>> what is the unit of
> >>>>>>>> distance?
> >>>>>>>>> Can you please add?
> >>>>>>>>
> >>>>>>>> The definition of distance is explained in kernel file:
> >>>> driver/pci/p2pdma.c:
> >>>>>>>>
> >>>>>>> Description is good. Either it needs to be in the
> >>>>>>> include/Linux/uapi/foo.h
> >>>> file
> >>>>>> and refer to it here.
> >>>>>>> Or please add the description as part of this patch.
> >>>>>>> Reference to kernel internal files can change and hence cannot
> >>>>>>> be taken
> >>>> as
> >>>>>> reference for virtio net spec.
> >>>>>>>
> >>>>>>>> /*
> >>>>>>>>      * Calculate the P2PDMA mapping type and distance between
> >>>>>>>> two PCI devices.
> >>>>>>>>      *
> >>>>>>>>      * If the two devices are the same PCI function, return
> >>>>>>>>      * PCI_P2PDMA_MAP_BUS_ADDR and a distance of 0.
> >>>>>>>>      *
> >>>>>>>>      * If they are two functions of the same device, return
> >>>>>>>>      * PCI_P2PDMA_MAP_BUS_ADDR and a distance of 2 (one hop
> up
> >> to
> >>>> the
> >>>>>>>> bridge,
> >>>>>>>>      * then one hop back down to another function of the same
> device).
> >>>>>>>>      *
> >>>>>>>>      * In the case where two devices are connected to the same
> >>>>>>>> PCIe
> >>>> switch,
> >>>>>>>>      * return a distance of 4. This corresponds to the following=
 PCI
> tree:
> >>>>>>>>      *
> >>>>>>>>      *     -+  Root Port
> >>>>>>>>      *      \+ Switch Upstream Port
> >>>>>>>>      *       +-+ Switch Downstream Port 0
> >>>>>>>>      *       + \- Device A
> >>>>>>>>      *       \-+ Switch Downstream Port 1
> >>>>>>>>      *         \- Device B
> >>>>>>>>      *
> >>>>>>>>      * The distance is 4 because we traverse from Device A to
> >>>>>>>> Downstream
> >>>>>> Port 0
> >>>>>>>>      * to the common Switch Upstream Port, back down to
> >>>>>>>> Downstream
> >>>> Port
> >>>>>>>> 1 and
> >>>>>>>>      * then to Device B. The mapping type returned depends on th=
e
> ACS
> >>>>>>>>      * redirection setting of the ports along the path.
> >>>>>>>>      *
> >>>>>>>>      * If ACS redirect is set on any port in the path, traffic b=
etween
> the
> >>>>>>>>      * devices will go through the host bridge, so return
> >>>>>>>>      * PCI_P2PDMA_MAP_THRU_HOST_BRIDGE; otherwise return
> >>>>>>>>      * PCI_P2PDMA_MAP_BUS_ADDR.
> >>>>>>>>      *
> >>>>>>>>      * Any two devices that have a data path that goes through
> >>>>>>>> the host
> >>>> bridge
> >>>>>>>>      * will consult a whitelist. If the host bridge is in the wh=
itelist,
> return
> >>>>>>>>      * PCI_P2PDMA_MAP_THRU_HOST_BRIDGE with the distance set
> to
> >>>> the
> >>>>>>>> number of
> >>>>>>>>      * ports per above. If the device is not in the whitelist, r=
eturn
> >>>>>>>>      * PCI_P2PDMA_MAP_NOT_SUPPORTED.
> >>>>>>>>      */
> >>>>>>>>
> >>>>>>>> I didn't change the unit, do you mean that I should add above
> >>>>>>>> information to this patch?
> >>>>>>>>
> >>>>>>> Yes. please see above.
> >>>>>>
> >>>>>> OK, will do.
> >>>>>>
> >>>>>> Julia
> >>>>>>
> >>>>>>>
> >>>>>>>> Regards,
> >>>>>>>> Julia
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Can you please wait for few days to raise the vote and sort
> >>>>>>>>> out this
> >>>> detail?
> >>>>>>>>>
> >>>>>>>>>> +
> >>>>>>>>>> +The request data contains guest virtual pci notations of
> >>>>>>>>>> +p2pdma provider and client. The response contains the
> >>>>>>>>>> +distance between provider and client, which represents the
> >>>>>>>>>> +compatibility of these two PCI
> >>>>>>>>>> devices.
> >>>>>>>>>> +
> >>>>>>>>>>       \end{description}
> >>>>>>>>>>
> >>>>>>>>>>       \subsubsection{Device Operation:
> >>>>>>>>>> cursorq}\label{sec:Device Types / GPU Device / Device Operatio=
n
> / Device Operation:
> >>>>>>>>>> cursorq}
> >>>>>>>>>> --
> >>>>>>>>>> 2.34.1
> >>>>>>>>>>
> >>>>>>>>>
