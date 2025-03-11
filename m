Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FCC1D555
	for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 04:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741665652; cv=fail; b=TN6Y1FYFJ+uj08QsVYsaGw8Z3xeCKQ2fGXwI5KZ9tug4ZRGC7oZqFvhM57MQJIOO4gzYuhN6jrJGP/YmLAMg4mjtBwFGD6OOcINEVZRCF9oukEWkfe/myyGkHZCR/kQ+EicTQiJeofTUtvekTR/cnUQiXrPT5OWiBaReVkqGhxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741665652; c=relaxed/simple;
	bh=LImwHobWT0knlnDHWlEk8xdZeMdTBCM3w73QiMa+k8E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mJ7PR+BBEE1Mk9wJY+MKTZZz4jBEKePh1dimSvsbOe6ZxEt1OFEc5vvzQccO/hxG78CI4JWJqLPDNFgOPLq7baBAtzwq1k4rx/J+s5idUApa7RuUWaJ8fG8+5vE4dAxMMMhbIPccIXYZrXeWIwKKKqGLTfqime1EMvDrBFWWR3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qcW257it; arc=fail smtp.client-ip=40.107.92.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qcW257it"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6iB21r0aaWaaVv6obI+5zQfYWfmUEeaghUzVHFwhjifgKNKnGr1fRzuGawvSkUvcYMsi8133WKd6lp73k284x9nIDz5mCpt2LyZyX4rNSYgRxZO0BI5cYza/lB/mLrEGRIeJE6J/cD1f54T7JKddChRBmPGIg6d4AczLaKxOFjCvOr9s9p+VihNfqHMomTemug5hAya436Iql1tit4j18xf0MTk+4F6MrdCgELLZuBJFNrDeCqBMmIiOvDkUnNshzFUJBFDBI7oOgxwRw5Vt3b84eceDbgd7qpAqMbHli4zvCzowMlGGR5iEjfqkjLYtUVxsrAB9g/qR35LZYWM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXGW09nQoUviMpdrfiG+X/mqBW2yr2iO3B8wUUwpXTU=;
 b=Es2hRu98TifN0ilh37H+DjLS8CpQNcsUodpfeJoJOxb3c/Um0jl5J4B5k1czOGYlqsFy+PARRhkQ32H6hfoqpSZknoO9Gez8s4UFjkRYQ+Vu39zX9X6Cz8bayML8ilzS1SmY0cQ7ofnbGQ9k8vi7TCJNWbVEpSXXsongBnSVI6ixB/sdPcmJczHOkFyLm3pw3Rh3uC1MrxlpiJTGXPtqcmdTNAlLGABfS4/ez+9RqVIZk33UaTDqQqIUfOQCOvmTubrejbpoam69ZcFaLEnYpKP/MERzWW6/M/4ZZvw2StqBuHuV1jYLhuIHvQ4XAasRpHkV/rFPjfCQOIBBgt5jdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXGW09nQoUviMpdrfiG+X/mqBW2yr2iO3B8wUUwpXTU=;
 b=qcW257itQJmY8g9uy84MwvmzMOCbeuxr4TezWztn7/fWZkAMey5qDmoc7Y9g4JIaTJjlknVr96AWcuRfqu8wFYG5WBU7Ghwub0PW7KqDQLPQ7PoADwX16a/JGbFGVttFViD8ueppgReObGbGmiGMi2bRBdTLDEjQU1vwrVEa0hAEalSmwZOu3CIfydiQZclWZ4xcjjjCZeNQcLIrRXdSLpjUirzPN+aK/nFjIChtHlozLMEaiX2rLrYpKMd09AARxcrfVPQQdefUM4mWsUeFZv+jYIiJ8b0rF6UgHcbaGURrhBjHPM4u5OKigx8Lv/EFQ3yTvVz/BZlitMsgUUMSNw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA1PR12MB7566.namprd12.prod.outlook.com (2603:10b6:208:42e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 04:00:45 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 04:00:45 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Zhang, Julia" <Julia.Zhang@amd.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Michael S . Tsirkin" <mst@redhat.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, "Zhu, Lingshan"
	<Lingshan.Zhu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, Matias Ezequiel
 Vara Larsen <mvaralar@redhat.com>
Subject: RE: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Thread-Topic: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Thread-Index:
 AQHbiDDvdx0hNqTsk0elfmK82iBGrrNZZ+iQgAr+CgCAASisMIAAMHuAgAYLvtCAAENTAIAAK3ywgAEhAgCAAAdoAA==
Date: Tue, 11 Mar 2025 04:00:44 +0000
Message-ID:
 <CY8PR12MB71950B845BB9E5C10D864F39DCD12@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250226092753.1082042-1-julia.zhang@amd.com>
 <CY8PR12MB71955656F340C5EAC2F1C925DCC22@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB65328A537B37ED3A091A8407F2CB2@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB7195EBEA5FBA0B13536B0289DCCA2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB65324C2D9E0FE9BCD192FA54F2CA2@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB7195D7401E120B34306AD4E5DCD62@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532E2CFEC070CFDF3D4E115F2D62@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB719585647964E525917BD761DCD62@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532B13A9BE99961E6D79722F2D12@IA1PR12MB6532.namprd12.prod.outlook.com>
In-Reply-To:
 <IA1PR12MB6532B13A9BE99961E6D79722F2D12@IA1PR12MB6532.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA1PR12MB7566:EE_
x-ms-office365-filtering-correlation-id: 583de8e3-acd3-4b90-dfd1-08dd60514ca1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?iUu5NIlD1p1ZAMr1nrsg3Pt5lAcdv9n2V+2fCWPRolvf4Cr/he4+YKUvD3/X?=
 =?us-ascii?Q?vbpDgm+cgbOBCUUm3Su5QgJqh6nUpIR+JSUYxOAO/KR1qeliYvWveVdY5dF1?=
 =?us-ascii?Q?Lo15NuwXn8lXHCG3lhR/hi22u5VaIazyj1H//WGeZFeJRiJCApNuL6k6EJMd?=
 =?us-ascii?Q?WN2Fel1FwqQeLyAwwZAQvE0fRwZ8haFXHaXKoIF6zZ8X37zCCUbJZtNyGGOd?=
 =?us-ascii?Q?6Sa3FvA7pEBm1cd3fPE1l3mXzgo+n5kLVVfuZRWyNtTXXwDsk3NInyHnfk9N?=
 =?us-ascii?Q?t3l+A6v/ata8nx9ekHFPZRsJDuV5p+qzKY7LbJh7oAVysSejn3a4IbE5Ueks?=
 =?us-ascii?Q?/ZgwiT8CnioEq5FCX3SLBJpuAHm6EXrAwpRQTYcq2mZDlq8hrkwq1hk5XGPt?=
 =?us-ascii?Q?a3iF9SiGMkq5gOemzcPPRsU1XtOlnt8Guws/3zQdDVs/oxwOMg1RI82ITDNs?=
 =?us-ascii?Q?sqF1wHTzdSo3Qf6N/HkATqbEuDXin5r2084jJslea1S1XqMeBdfzwlmbAKYf?=
 =?us-ascii?Q?aqvJUMteOR0COzJix0LdBomLFu9c4NZknPX2T4+RQBh2nlxJcbvT3fw24YYR?=
 =?us-ascii?Q?bZes+6UG6mYvZRZoCcRDQU+49zoQ1PJqi/yPxsIlx7ZRdz3+1yCKmUQnYfLY?=
 =?us-ascii?Q?+Ft+/7hxF+XQ7Rh6HqdYK+ZOGtx9cbXxgl0xaKM2MAFbkTqnZHgz/LI0bBAZ?=
 =?us-ascii?Q?2+Cop9uSIRfiY68VUWMRqlCgccktcCHuNvcTnWKd0y06Xz9nf6a9uuZK1HvK?=
 =?us-ascii?Q?l/uEcHRQgoHtMVi9vxyCShGf3NHbdqVMr6BmvjmZC2rMl7ppQQOkSZnB7oPx?=
 =?us-ascii?Q?al798kZkvRAa8EfOQFCqg6LpFWrEGPcj9v5geqSBAzewMj25FOWAwHgDGfyM?=
 =?us-ascii?Q?xeNuY7N2r8fxbdcdLj1i32ZWnZ6EGw4BB4kU8ljuDV0qtzxc+a+O8fGo74UW?=
 =?us-ascii?Q?d3WBRG/w0N5vbq17hd+Y5ItesXc3GWbiR8hv/H6KwrQ9GVdeKn7UjHTk0oAt?=
 =?us-ascii?Q?OdS9IHoRGHgJTMa0H/hcvA669jZFC0q/iJcBit5LsmTY6ZvHTB2QK0231cTP?=
 =?us-ascii?Q?yv6uAa+h9HEZNXgFr+Ba5X6BfeSmLyUfelmhshs7TKWK1LGhO+ZqIaoWrrMb?=
 =?us-ascii?Q?2kIPcMvBX1HeOcYy8pq49x2QGxE7EiA/5Ont0ws1m5gJcnorihG1V1sew6d7?=
 =?us-ascii?Q?O4BZ4x9EAXnv6Q+CGCkO3M+dLRtUCyFHHQ+t709J3O8oKiNuQoSD7+wjD7TJ?=
 =?us-ascii?Q?qCoLFgIVKipMIOpNzth8b4kyfPWm17Hd7GYN+HpqLKQ+ssFymqd+lSdNqoqu?=
 =?us-ascii?Q?jO8c+3cd6yT26G2wP56AVqWD2wcvUvrPgYutqc2pxv5kuVhfVNlC4TVDewsE?=
 =?us-ascii?Q?5MKWmaJESlHxqkKNY+VetPtDCnig63PDYTnNmooxSx5JgmxIgMoBnPINpR6f?=
 =?us-ascii?Q?Ic17u2lF9Kymzs4tGp7vYLXesU0atiJt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FGSIPBeGeikvkZn57oymcF8ReAv1jMhpctxbjkm7itNT198RenVsltFP5QBa?=
 =?us-ascii?Q?XDyHMDFkWvse8Rbqxa+zNsxZZPBlx8wV0SWEZyr0aHcGXMqQF4ynyirNxw5Q?=
 =?us-ascii?Q?q6LAE5STRRiUttufZIogNADyf7UrWgtWQXrD1jqkUyOFozFlHTRhCmB5h0dZ?=
 =?us-ascii?Q?CtIcyTbncOhhYdX+wm3SK0WXpGx3gsc4c9vDSDJbkdcxZI9gdsSWlYMXRD0Z?=
 =?us-ascii?Q?tp2w12IuSy5Idi4tj2LCMhi1+gWcBZzL8IN4vMT48jeM01E56tpuQD/rdyXG?=
 =?us-ascii?Q?WkAC3J98/ujd/KlBNt6SC5GhGv3lBfXFDiJ4tmjT/lSzi5v3RDi2hCp2+IYP?=
 =?us-ascii?Q?+aP/MIcnKBY4rGmxRfhfnGAM5Osi15y46We7lW6/akHi1M+nwLkTANpk7ybX?=
 =?us-ascii?Q?Qr5WZn78yrJweqVaBCJbdQVB0Cd/13W5Y3dhgswIqXVrqWgEGRuOiZ5dDn6S?=
 =?us-ascii?Q?GkqlRP2pldWoAs++2ghl/DWiXqVJsZZMI8bWhsOyqV4NLYi2DgLhm5oP59Hs?=
 =?us-ascii?Q?Oo7TyAjLOk338TycR77fa3Nazf85uCNGEhxxOrA8rMcY0FeN5rIRSG0tRGyx?=
 =?us-ascii?Q?56SfF5xXEDxnryxwCq1KUTU0UMlAgETWc4HtdFovEQAtfhUAMeZgP4HIVH4W?=
 =?us-ascii?Q?MQpFlKpblK0YU0oGF9ChJQnaBnWFl/zUkxgzqUt8ePZlFKBTwvI5soZPVAgW?=
 =?us-ascii?Q?heXONvr14avKRQfrm4foVUpRyVeDYgtL9odhhbCMW4FBhIVIHvUsie9LtPWV?=
 =?us-ascii?Q?Kcc2e4A1R0OuClMlHP86x6s8Cj7tUSkMeDmrzo/oL1sHhKqdhX2kvTM+tc4t?=
 =?us-ascii?Q?Em1RNw8wHSxpp1GgmQOFDNq/dhs7Ggafp/rLePl2mA/nv3t/p4K2IzarC2Re?=
 =?us-ascii?Q?bv3DlD+oM4Zk8NgU/exgbrAKTGCUdpuhU10dsmGfQR+eTBr06S25xkicLTF2?=
 =?us-ascii?Q?OS2gc8xbXFD4U383vknIqMjIsjevVLgMArtMEm1ANcpgOYqAO6ZYXXOW0bW2?=
 =?us-ascii?Q?ofgtb2TWBLkEWanBW+EnNWlb2YQRno6vGS2zAdsOn6YRReskDzEmRuvErRZT?=
 =?us-ascii?Q?hF6DkRIVJ+XYmY7g1C/tJSEQaiNxi772OubPRAvaOqN3lJQ5ztVgqa/JTnGG?=
 =?us-ascii?Q?O3Zay0SldKQn3Sb812mGtxsdqH0LQxd+qC80LHZ3AQGwucipL8zQOWG/9SU4?=
 =?us-ascii?Q?vhG1R5EbzZ1fkGFaSQRHwf+CpCWXRdyEnTsWBguVrHvaaL2dS6DrzvsvSys1?=
 =?us-ascii?Q?IYlow2U36dWmNMsA3DuZxELvB4oxMOOWPQDN+2PzcnNYtkfarpLQ3zf9MCZh?=
 =?us-ascii?Q?GQOSO0fwtIXbWHVeDLlz77ksulVOLJavTU0tgeujpJSEnIFBbCXVH7WMaepp?=
 =?us-ascii?Q?S9AsRH9zI0IKfWFPUvAGh4w30cEQ6CB1maIQbLs0/kfeju9CW5TIxNcz9Z7c?=
 =?us-ascii?Q?eUsff8Yfv/fvwWtfxscrBnC6Rmuo7MLStxM9jjej/bkz6vC349xmcWMJimO5?=
 =?us-ascii?Q?VMtp4iZweRkTGBGLDsBDPE+4XClz9kKFv0zT/Lb4SZAu6gHK/YkIMPHoYcKP?=
 =?us-ascii?Q?9bz6mKBYwXr0r3SNnu0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 583de8e3-acd3-4b90-dfd1-08dd60514ca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 04:00:45.0153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4RxAWEYodNmsJVZEFF7453w7Cijh84jdcpDfzroavmWwRZZgkbJwy2+JuxVHmvnLv3U5YtGOi32qzanC3snh/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7566



> From: Zhang, Julia <Julia.Zhang@amd.com>
> Sent: Tuesday, March 11, 2025 8:58 AM
>=20
> On 2025/3/10 18:18, Parav Pandit wrote:
> >
> >> From: Zhang, Julia <Julia.Zhang@amd.com>
> >> Sent: Monday, March 10, 2025 1:07 PM
> >>
> >> On 2025/3/10 11:48, Parav Pandit wrote:
> >>>
> >>>
> >>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>> Sent: Thursday, March 6, 2025 12:47 PM
> >>>>
> >>>> On 2025/3/6 12:29, Parav Pandit wrote:
> >>>>>> From: Zhang, Julia <Julia.Zhang@amd.com>
> >>>>>> Sent: Wednesday, March 5, 2025 4:12 PM
> >>>>>>
> >>>>>> On 2025/2/26 18:51, Parav Pandit wrote:
> >>>>>>>
> >>>>>>>> From: Julia Zhang <julia.zhang@amd.com>
> >>>>>>>> Sent: Wednesday, February 26, 2025 2:58 PM
> >>>>>>>> To: virtio-comment@lists.linux.dev
> >>>>>>>> Cc: Michael S . Tsirkin <mst@redhat.com>; Chen Jiqian
> >>>>>>>> <Jiqian.Chen@amd.com>; Zhu Lingshan <lingshan.zhu@amd.com>;
> >>>> Huang
> >>>>>> Rui
> >>>>>>>> <ray.huang@amd.com>; Julia Zhang <julia.zhang@amd.com>;
> Matias
> >>>>>>>> Ezequiel Vara Larsen <mvaralar@redhat.com>
> >>>>>>>> Subject: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
> >>>>>>>>
> >>>>>>>> PCI peer-to-peer DMA transaction may be used in guest for some
> >>>> scenes.
> >>>>>>>> For example, dGPU prime feature will let virtio-iGPU access to
> >>>>>>>> passthrough dGPU buffer.
> >>>>> Virtio specification does not describe dGPU and iGPU.
> >>>>> So either describe it in the description or please drop that and
> >>>>> explain the
> >>>> motivation without referring to those terms.
> >>>>
> >>>> OK I see.
> >>>>
> >>>>>
> >>>>>>>>
> >>>>>>>> To support P2P DMA transaction in guest, virtio-gpu needs to
> >>>>>>>> check the compatibility which is represented by p2pdma_distance.
> >>>>>>>> This defines a command VIRTIO_GPU_CMD_P2PDMA_DISTANCE to
> >> allow
> >>>> guest
> >>>>>> send
> >>>>>>>> virtual pci notation of two devices to host and get host
> >>>>>>>> physical p2pdma_distance of these two PCI devices.
> >>>>>>>>
> >>>>> [..]
> >>>>>>>> Ifsm1M5xIb37T9Tg%3D&reserved=3D0
> >>>>>>>> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> >>>>>>>> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> >>>>>>>> ---
> >>>>>>>> Hi all,
> >>>>>>>>
> >>>>>>>> We are trying to implement dGPU prime feature in guest which
> >>>>>>>> will let
> >>>>>>>> virtio- iGPU read rendered data of passthrough dGPU. Before
> >>>>>>>> that, virtio gpu driver needs to get p2pdma_distance to check
> >>>>>>>> if P2P DMA transaction is possible or not.
> >>>>>>>>
> >>>>>>>> To implement getting p2pdma_distance, QEMU needs to handle the
> >>>>>>>> command from guest with virtual pci notations of two PCI
> >>>>>>>> devices and send it to host kernel and return host physical
> >>>>>>>> distance back to
> >>>> guest.
> >>>>>>>>
> >>>>>>>> So this defines the new command follow the suggestion in https:
> >>>>>>>> //lore.kernel.org/all/20241207105537.542441-4-
> >> julia.zhang@amd.com
> >>>>>>>> /
> >>>>>>>>
> >>>>>>>> changes from v1:
> >>>>>>>>      - add issue link to commit msg
> >>>>>>>>
> >>>>>>>> Regards,
> >>>>>>>> Julia
> >>>>>>>> ---
> >>>>>>>>      device-types/gpu/description.tex | 29
> >>>>>> +++++++++++++++++++++++++++++
> >>>>>>>>      1 file changed, 29 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/device-types/gpu/description.tex b/device-
> >>>>>>>> types/gpu/description.tex index 4435248..9d0f30b 100644
> >>>>>>>> --- a/device-types/gpu/description.tex
> >>>>>>>> +++ b/device-types/gpu/description.tex
> >>>>>>>> @@ -223,6 +223,7 @@ \subsubsection{Device Operation: Request
> >>>>>>>> header}\label{sec:Device Types / GPU De
> >>>>>>>>              VIRTIO_GPU_CMD_SUBMIT_3D,
> >>>>>>>>              VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
> >>>>>>>>              VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
> >>>>>>>> +        VIRTIO_GPU_CMD_P2PDMA_DISTANCE,
> >>>>>>>>
> >>>>>>>>              /* cursor commands */
> >>>>>>>>              VIRTIO_GPU_CMD_UPDATE_CURSOR =3D 0x0300, @@ -236,6
> >>>> +237,7
> >>>>>> @@
> >>>>>>>> \subsubsection{Device Operation: Request
> >>>>>>>> header}\label{sec:Device Types / GPU De
> >>>>>>>>              VIRTIO_GPU_RESP_OK_EDID,
> >>>>>>>>              VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
> >>>>>>>>              VIRTIO_GPU_RESP_OK_MAP_INFO,
> >>>>>>>> +        VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE,
> >>>>>>>>
> >>>>>>>>              /* error responses */
> >>>>>>>>              VIRTIO_GPU_RESP_ERR_UNSPEC =3D 0x1200, @@ -791,6
> >>>>>>>> +793,33 @@ \subsubsection{Device Operation: controlq
> >>>>>>>> (3d)}\label{sec:Device Types / GPU Dev  };  \end{lstlisting}
> >>>>>>>>
> >>>>>>>> +\item[VIRTIO_GPU_CMD_P2PDMA_DISTANCE] calculates the
> >>>> cumulative
> >>>>>>>> +distance
> >>>>>>>> +  between two devices before Peer-to-Peer(P2P) transaction.
> >>>>>>>> +Request data
> >>>>>>>> +  is \field{struct virtio_gpu_device_p2pdma_distance}.
> >>>>>>>> +Response type is
> >>>>>>>> +  VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE. Response data is
> >>>>>>>> +  \field{virtio_gpu_resp_distance}.
> >>>>>>>> +
> >>>>>>>> +\begin{lstlisting}
> >>>>>>>> +struct virtio_gpu_device_p2pdma_distance {
> >>>>>>>> +        struct virtio_gpu_ctrl_hdr hdr;
> >>>>>>>> +        le32 provider_bus;
> >>>>>>>> +        le32 provider_slot;
> >>>>>>>> +        le32 provider_func;
> >>>>>>>> +        le32 client_bus;
> >>>>>>>> +        le32 client_slot;
> >>>>>>>> +        le32 client_func;
> >>>>>>>> +};
> >>>>> The requester device's PCI RID is anyway known to the responder.
> >>>>> So no
> >>>> need to pass it here.
> >>>>> It is unclear if its provider or the client.
> >>>>
> >>>> I don't think requester device's PCI RID is known to the responder,
> >>>> since the existing function pci_p2pdma_distance() also require
> >>>> provider and client information.
> >>>>
> >>> The existing function takes the provider pci device as input at C cod=
e level.
> >>> And proposed extension (without provider BDF) will also operate on
> >>> the
> >> provider device on which the request/response transaction is happening=
.
> >>
> >> Well at first, I just want virtio GPU to handle the command to get
> >> p2pdma_distance of two PCI devices(maybe none of them is virtio GPU).
> > Using virtio gpu to find the distance between two arbitrary devices whi=
ch
> are not virtio is certainly outside the scope and looks wrong.
> > It should be done at some PCI topology level who exposed this devices.
> For our use case, virtio GPU is the provider, we are using virtio GPU to
> calculate distance between virtio GPU and dGPU, which are not arbitrary
> devices.
The fact that in physical world this distance is calculated without involvi=
ng the individual provider and client EP PCI devices, in virtual world doin=
g this via virtual PCI EP devices does not look correct abstraction to me.
I tend to imagine that one needs to build a right virtual topology in QEMU =
or somewhere else who is providing these PCI devices such that guest kernel=
 can calculate it accurately without depending on the EP PCI devices.


> >
> >> So
> >> when guest needs to calculate distance of any two PCI devices, it can
> >> reuse this command. But indeed, we only have this one use case at
> >> this moment, I guess considering virtio GPU as provider and remove
> >> provider PCI RID of this struct is fine.
> > Right. A driver can issue the command to device without mentioning its =
own
> device identifier.
> Since calling function pci_p2pdma_distance() still needs to pass its own =
RID, I
> think at least QEMU has to tell host kernel the RID of virito GPU.
Probably yes, would be interesting to see this UAPI on the host kernel too,=
 (unrelated to this patch).

> >
> >>
> >> But there's another problem: how does host kernel get virtio GPU RID
> >> and calculate distance between virtio GPU and dGPU? If I remove
> >> provider information of this struct, then QEMU still needs to pass
> >> virtio GPU RID to host kernel side.
> > The device implementation side can get to know about this as it has plu=
gged
> in and built the topology.
> > The RID we are discussing are the vRID seen by the guest driver.
> > I probably missed to clarify this.
> But only getting the distance on the virtual PCI inside the guest is not =
enough
> to figure out if P2P is possible or not. We need to get the real distance=
 from
> host side. Please take a look at the discussion here:
> https://lore.kernel.org/all/bfe6a8b7-adcf-40e2-b7a2-4e64dc96862d@amd.com/

Finding out the distance between two PCI devices in physical world is role =
of the PCI bridge/switch topology builder.
So why should it change for the guest VM?
Why virtualized topology cannot be build in a way such that it matches to t=
he physical world to get the accurate distance?
At least to me, doing this in the pci RP domain (and not PCI EP domain) see=
ms the right way to go forward.

>=20
> Hi MST,
> We are talking about how to get the correct p2pdma_distance from host sid=
e
> and pass it to guest side. Do you have any suggestions?
>=20
> Julia
>=20
> >>
> >>>
> >>>> Do you mean that I should consider virtio GPU as provider by default=
?
> >>> Yes.
> >>>
> >>>> Then this command will only work for this specific use case instead
> >>>> of
> >> being
> >>>> used as a common function.
> >>>>
> >>> Linux kernel API is operating on the device. Similarly proposed
> >>> extension
> >> will also be on the device level.
> >>> If needed, an higher-level software will iterate over the
> >>> interesting PCI
> >> devices and invoke the pci_p2pdma_distance() API.
> >>
> >> The reason of passing this command from guest to host is that in our
> >> case, we need to calculate p2pdma_distance of virtio GPU and dGPU on
> >> host side. So my original design is quiet simple:
> >> 1. Pass rid of virtio GPU(provider) and dGPU(client) to host side 2.
> >> Host kernel calculate real p2pdma_distance of these devices.
> >> 3. Return p2pdma_distance to guest side.
> >>
> > The virtio GPU is asking information about some other non virtio device=
 in
> the system does not look correct to me.
> > I believe this is the PCIe topology level should be able to provide the=
 info
> without encapsulating this via some arbitrary device type like virtio gpu=
.
> >
> >> And I think the higher-level software should know the exact RID of
> >> two devices and then invoke pci_p2pdma_distance() to calculate distanc=
e.
> > Not sure. if this can be discovered in physical level, it can be discov=
ered at
> virtual guest VM level too as long as QEMU builds it in right way.
> >
> >> So
> >> I still think we should keep provider information in this struct and
> >> following the existing logic of getting p2pdma_distance.
> >>
> >> Regards,
> >> Julia
> >>
> >>>>>
> >>>>> You only need to supply the other device RID.
> >>>>> In PCI spec the RID is 16-bit. Considering other advancements, RID
> >>>>> of 32-
> >> bit
> >>>> would be ok too.
> >>>>>
> >>>>> So please remove client_*.
> >>>>> Replace provider_X with le32 other_device_pci_RID.
> >>>>>
> >>>>> Mention that other_device_RID follows PCI specification RID notatio=
n.
> >>>>
> >>>> OK I will modify it.
> >>>>
> >>>>>
> >>>>>>>> +
> >>>>>>> I assume above bdf information is what is visible to the guest?
> >>>>>>> Why cannot it see this distance in the guest VM itself?
> >>>>>>
> >>>>>> Guest can see virtual bdf information which is not the real bdf
> >>>>>> information of the host. So guest can't get the correct distance.
> >>>>>> That's why I need to implement a new command to get and pass the
> >> real
> >>>> distance.
> >>>>>>
> >>>>> [..]
> >>>>>
> >>>>>>
> >>>>>>>
> >>>>>>>> +struct virtio_gpu_resp_distance {
> >>>>>>>> +        struct virtio_gpu_ctrl_hdr hdr;
> >>>>>>>> +        le32 distance;
> >>>>>>>> +}
> >>>>>>>> +\end{lstlisting}
> >>>>>>> I am not gpu expert so didn't pay attention to details.
> >>>>>>> I believe you are missing basic information in the patch is what
> >>>>>>> is the unit of
> >>>>>> distance?
> >>>>>>> Can you please add?
> >>>>>>
> >>>>>> The definition of distance is explained in kernel file:
> >> driver/pci/p2pdma.c:
> >>>>>>
> >>>>> Description is good. Either it needs to be in the
> >>>>> include/Linux/uapi/foo.h
> >> file
> >>>> and refer to it here.
> >>>>> Or please add the description as part of this patch.
> >>>>> Reference to kernel internal files can change and hence cannot be
> >>>>> taken
> >> as
> >>>> reference for virtio net spec.
> >>>>>
> >>>>>> /*
> >>>>>>     * Calculate the P2PDMA mapping type and distance between two
> >>>>>> PCI devices.
> >>>>>>     *
> >>>>>>     * If the two devices are the same PCI function, return
> >>>>>>     * PCI_P2PDMA_MAP_BUS_ADDR and a distance of 0.
> >>>>>>     *
> >>>>>>     * If they are two functions of the same device, return
> >>>>>>     * PCI_P2PDMA_MAP_BUS_ADDR and a distance of 2 (one hop up
> to
> >> the
> >>>>>> bridge,
> >>>>>>     * then one hop back down to another function of the same devic=
e).
> >>>>>>     *
> >>>>>>     * In the case where two devices are connected to the same
> >>>>>> PCIe
> >> switch,
> >>>>>>     * return a distance of 4. This corresponds to the following PC=
I tree:
> >>>>>>     *
> >>>>>>     *     -+  Root Port
> >>>>>>     *      \+ Switch Upstream Port
> >>>>>>     *       +-+ Switch Downstream Port 0
> >>>>>>     *       + \- Device A
> >>>>>>     *       \-+ Switch Downstream Port 1
> >>>>>>     *         \- Device B
> >>>>>>     *
> >>>>>>     * The distance is 4 because we traverse from Device A to
> >>>>>> Downstream
> >>>> Port 0
> >>>>>>     * to the common Switch Upstream Port, back down to Downstream
> >> Port
> >>>>>> 1 and
> >>>>>>     * then to Device B. The mapping type returned depends on the A=
CS
> >>>>>>     * redirection setting of the ports along the path.
> >>>>>>     *
> >>>>>>     * If ACS redirect is set on any port in the path, traffic betw=
een the
> >>>>>>     * devices will go through the host bridge, so return
> >>>>>>     * PCI_P2PDMA_MAP_THRU_HOST_BRIDGE; otherwise return
> >>>>>>     * PCI_P2PDMA_MAP_BUS_ADDR.
> >>>>>>     *
> >>>>>>     * Any two devices that have a data path that goes through the
> >>>>>> host
> >> bridge
> >>>>>>     * will consult a whitelist. If the host bridge is in the white=
list, return
> >>>>>>     * PCI_P2PDMA_MAP_THRU_HOST_BRIDGE with the distance set to
> >> the
> >>>>>> number of
> >>>>>>     * ports per above. If the device is not in the whitelist, retu=
rn
> >>>>>>     * PCI_P2PDMA_MAP_NOT_SUPPORTED.
> >>>>>>     */
> >>>>>>
> >>>>>> I didn't change the unit, do you mean that I should add above
> >>>>>> information to this patch?
> >>>>>>
> >>>>> Yes. please see above.
> >>>>
> >>>> OK, will do.
> >>>>
> >>>> Julia
> >>>>
> >>>>>
> >>>>>> Regards,
> >>>>>> Julia
> >>>>>>
> >>>>>>>
> >>>>>>> Can you please wait for few days to raise the vote and sort out
> >>>>>>> this
> >> detail?
> >>>>>>>
> >>>>>>>> +
> >>>>>>>> +The request data contains guest virtual pci notations of
> >>>>>>>> +p2pdma provider and client. The response contains the distance
> >>>>>>>> +between provider and client, which represents the
> >>>>>>>> +compatibility of these two PCI
> >>>>>>>> devices.
> >>>>>>>> +
> >>>>>>>>      \end{description}
> >>>>>>>>
> >>>>>>>>      \subsubsection{Device Operation: cursorq}\label{sec:Device
> >>>>>>>> Types / GPU Device / Device Operation / Device Operation:
> >>>>>>>> cursorq}
> >>>>>>>> --
> >>>>>>>> 2.34.1
> >>>>>>>>
> >>>>>>>
