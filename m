Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E91D1D4152
	for <virtio-comment@lists.linux.dev>; Tue,  5 Nov 2024 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823820; cv=fail; b=UX/u9LrF8QbM6r6E3PBNtXoOS2og3pya3+1wWjeZE6YymaJ4JXIp0rx1byvW2+1mK7ZMrN+1bHY6qU/fYoIFDM3blmAvVCw21U4VUCW1TVu8/BH2JnRe5SsKQPvH9znhVRGfOBEyYkpzWYJ+71GSwSAToAeTpv8H3QfJJhGZbik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823820; c=relaxed/simple;
	bh=tpiVeMnPLC3m+YSymTw51q4+2lIsEbI5WOQLCpwbO7o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=KQv2mokP7B9NLLsv4pTPBDT/hnNj2MuimB26/Gn1Kj2WELdSkos4TNAX/dtPQR7wtnrGwvnufVmoyQA8Trxli5siEOzzXQr0bnXN5oan8j7aIkRHx+/f1tdGoB4BkmKls8RpSUbJPNxEBBkvXqJksxDE0m6MXpE0oB5UjfNCSc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=h28pr65s reason="signature verification failed"; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="h28pr65s"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A57UV3n023618;
	Tue, 5 Nov 2024 08:23:31 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 42qf1e91jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:23:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6YKixE8FZMI9189DFdC41R6EiQWBX0TfuIj52k23jRltkPAKvtRZ8Lz4BhfM/Rab0rsT9ki6GUgtCgc/Ts+tAO2tr0xnWXOnNhFXeqndVRQLQkLGoRe0Ew+uCbjSA8n/dYnap39dEhdgkCd3+j1O9dDONTnwl3x9M2p0rrwSk6q6noBXm3N0Vl1ORwxCvHc5Yv9WEpCO0xVJwx7VhLBbmH6PXm2dJBSS1wFB+F8Mk6NwB9gdAcvoFPCZbCjQCvpto4iVM0mDMYmHfAluViDaz9uEBBe1nB4USg1LRXFeI+6zB5r6cl/LenKFx1IvmnKZXZfIvRuhSEfKBFKFJxGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFzLpXxBcKYPnKiAeK7UeKkkNYe+o26hQAaRT8j4FGU=;
 b=lAyTnZiv6f6hTrCztEsIh5I7C++PAcJFoKfJyt8MWKUlQedtLkMTnnVx6T/r/sIqf48Uy5VGRvvjOxTSoostMV34dwtr406EmTgWI6RpvjaGH/b0wQRKE5qng1ij4QQgVAJXO9snJ8JupuP+6RtnqfsSdRyaYuEKocbjzrTdOn8TAsLUQxkeTaUSopZXN4lzL7sdZjifB/KtFbqKdvUJUWiZPF+Xa2Rip+ItudpeFTPXgO/JV7Rq7CXGQtmXO5wHnafRdUhsbVYC37J3Kqj7IQl/qkQHVMyufcpaiuM0fIWF/ddvFNNAtrLJRhKDYf9r3/IoU8bF01VuXb6DztZNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFzLpXxBcKYPnKiAeK7UeKkkNYe+o26hQAaRT8j4FGU=;
 b=h28pr65s51MmfAHgCgSYqLC/kETImASq37AIq2J1KdtsODZw3LJk962Qt+4RMOzTVzPxF/47rMV87AhbNvr3ikLHnimwR0/cqIfouFosKw5NMJreEFT2yekdxOVYVbfl0YI8mhSWK7noxfxZ+XG5l6m4eallM2rmcEw2Kun35IQ=
Received: from MW4PR18MB5244.namprd18.prod.outlook.com (2603:10b6:303:1e0::16)
 by MN0PR18MB6070.namprd18.prod.outlook.com (2603:10b6:208:4a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 16:23:25 +0000
Received: from MW4PR18MB5244.namprd18.prod.outlook.com
 ([fe80::52f3:9792:ee42:90b]) by MW4PR18MB5244.namprd18.prod.outlook.com
 ([fe80::52f3:9792:ee42:90b%6]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 16:23:25 +0000
From: Vamsi Krishna Attunuru <vattunuru@marvell.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
        Lege Wang
	<lege.wang@jaguarmicro.com>
CC: Jason Wang <jasowang@redhat.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>,
        Nithin Kumar Dabilpuram
	<ndabilpuram@marvell.com>,
        "parav@nvidia.com" <parav@nvidia.com>,
        Leo Liu
	<leo.liu@jaguarmicro.com>,
        Angus Chen <angus.chen@jaguarmicro.com>
Subject: RE: [EXTERNAL] Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new
 used buffer notification suppression mechanism
Thread-Topic: [EXTERNAL] Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new
 used buffer notification suppression mechanism
Thread-Index: AQHazoxhxQJz+J7qTka2/5VNWObx4LHnxbeAgMHaO0A=
Date: Tue, 5 Nov 2024 16:23:25 +0000
Message-ID:
 <MW4PR18MB52443417B7398C64244F838BA6522@MW4PR18MB5244.namprd18.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <SI2PR06MB5385346C86CF45806EC6E9F6FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240705035755-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240705035755-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR18MB5244:EE_|MN0PR18MB6070:EE_
x-ms-office365-filtering-correlation-id: b2729e67-1df6-442e-304e-08dcfdb62c9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K3B0dVpHTkRyN3NOeStDNERnbkVMQVh4eUtxdFdwdit6NWNWUTRmRERYZWhH?=
 =?utf-8?B?anZ5Yk9PYktLTWh0elkyNUhOdk5KT05SM1FjSmJ3bTN1QjNnQXZIek9RMGd4?=
 =?utf-8?B?aFlPYmFVbHJXZ2UrZW5kWFlEUHhBaTJlemp4MVJlOHBQa21lTit2RlNrM0l5?=
 =?utf-8?B?NU9jbHNoNU9yRzgyWVJETWtUcnlEUWpmT0t3eDYyWFlRbWlKMzczK1NaUWN5?=
 =?utf-8?B?Kys4R2RLNUpNWDlybzdreDJ5eENUZEVFN1ZSY1NCR2dBRG54eHd3czBUVTVw?=
 =?utf-8?B?aERjMmpHV1NJS0h3aGZOaUZaSEdJT0tBT1Z3MlVkbU0vb2J3ZXBKdWQyVkd0?=
 =?utf-8?B?THlXWVZCMlAzMzZVenduZFRvVGtObHUvVlM0OHhoVDROQkhScEZZQWphbVp5?=
 =?utf-8?B?QUJ5MnQ5cEwvM2lxWXZ3QWhobW1oeTlmMThLeTlDNjhlVTJwUGREUUVtR3E0?=
 =?utf-8?B?UGtBVVFscm8vVTd0L3dOTklONEU2MWhDOVhuQ2ZLTW4rNkJ5Z1NwaTFqQXhU?=
 =?utf-8?B?WUxsYmxPRjlKbVVRL0lYMmwvZGs5RVJMVDZiKy9mYkgwZEZXWnlQeVpWR1B1?=
 =?utf-8?B?TDhnNlJYczBuamtpNmZrU05BQVR6VE1NcEtiWjFEdHg1b05Hem5kRzVVZmZ5?=
 =?utf-8?B?OERpT1VHeVJCazcwbXFqNGtRYkNNOEI4R05VcWFaWGh1VFQzTkUxNnlieE00?=
 =?utf-8?B?ZU5vNC91WkhIanEzOTBYZU9aZER4eFZWdFBLQWNIakhyMjlKQUpGeW9SSkJP?=
 =?utf-8?B?S3R6MkdhSWVWRUo5VDIxcW84ZFRWbXpCaWV4ZWY2N1pndUFOY21Rci9ZTGVQ?=
 =?utf-8?B?WW5EdXMwaTNOdXByMVdFMTZsTXBka1NGWmMzaFA1WTBZRzdRc2R5bTVReWE0?=
 =?utf-8?B?SVE0WFRFWFhlNkxyMVFIYUp3bUlSTE5oSDNHdURKblB4OEg0RjBuRUtHSms3?=
 =?utf-8?B?S3RsMlMvYTk3ai80MFNaeHBzMUVWYkZrQWlEcEFiYktPUzRicHczdy9sV0lK?=
 =?utf-8?B?TWJLOFllVHphL3lMWlR0QVFDRmR6NUhWdFBkaHZyaFUzOU5Pc3Q4RVl1VE1p?=
 =?utf-8?B?MUNaRWZwZUFoaUlPWVpZcUtjMEJXaFRLaUlqbGUvM3JVYzNxMXAyT1NTZnVW?=
 =?utf-8?B?KzdZcmVBYjB6NUw1WmtYR1VERUpEL3ZEMHBWRG16SlpMeFFJdGd1RXN6YWNx?=
 =?utf-8?B?NWNTQ2krR0RKbmJZWElSL2pBYTR2S0s4ZVNDNm1pVisrUFE5b1h0WlBIUEFu?=
 =?utf-8?B?VTNiaU5JWkZhVEc5UXNpeWRzRjlIQjg5ZFQxSU9McU5QM3doVVBWRC9nNkk2?=
 =?utf-8?B?TDhlNDh3OVZmbTVDcnhXdzJvNElIZS9JVU43WmxmUVVydmoxaEpxL0JTNzRx?=
 =?utf-8?B?Y1EwbzV0VHB2eGgwQWdRQ3JHYzRNbkJWa0Eyb3FPdU5vdWdtdTlzVzBab2d1?=
 =?utf-8?B?dG1JNVhHamZPNGpsRy95N1UwYTRUazcyUHVCZzNHaHpDanloWkRITmk5NVYv?=
 =?utf-8?B?cm9LaEJhY0RLMlZ0eHZ6Vm1TV3NDNjN6WVh0UVdRZGtOR2FSaHBldGY1b1VF?=
 =?utf-8?B?eSsyME5rdy9PVXZxRkZOVWdSRlVCMXpUOTBDWkxLT1dDZVhyVmVodUxJMysr?=
 =?utf-8?B?d0xxOFRRTXFkd1pVb3NhOGdJM1JaS2lGcDRhaFdidmRFWXVBdm1jeXg4V1d0?=
 =?utf-8?B?VWR5SmMxWFdvc1gwWS9rTTYxejlxT2hZSUk3alFtMk9rdXErZExiM1BoajRI?=
 =?utf-8?Q?ZH5Y+KyOeenT9IghmPkA7xwJTA4LcJ8eGQvPQEa?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR18MB5244.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzU4UGdSWTE5U0w2RktyeFcxN3E1ZmxMU0xlTll4Vm1lNjVkLzFxaEVlM0RT?=
 =?utf-8?B?bDgzT2ovSGduTk4zeHZmRXRIM0gwVC9uVUREbk5ncUFFVjE0bUhNUm9aYzBF?=
 =?utf-8?B?VUlXOElpQkNHblNWelR2V3JWZEdNb0wzajlNcFFzZVI1d29WSXRLNzhST1NZ?=
 =?utf-8?B?R1ZiUVA2MWx4cWJtb2dMdlRYZlQ0REp0bTZ2NW9LT0hoQVRIUDU4NmJNa1o2?=
 =?utf-8?B?MkYxbWgzTmZwMVFJVWUrNVFVdVVVSEtnMS93a1VPclNwOFcwYUp0STB1N0pI?=
 =?utf-8?B?K2FOY0lOQ3ViWHpqT2lsOGVVeEthWnBPNTJiUDM1bERQcURhVHdqUmNMdUpY?=
 =?utf-8?B?VWFkc2xQL0tFdjFKVW5paDE5cWtxZklKUmVxRWVGVmtnUnZ6NUpZeDd1S08w?=
 =?utf-8?B?VnVmNGw5NVhJMzJUdlBRSWpWN1VJUWxTNHJGZGVabms4L1J2bXN3M29QVEpy?=
 =?utf-8?B?WFV4YlE4dHRxdzB5R3g4NndCcFFLTTJXdVhRZUNxK0VtblplM2Q1OHM3WGI3?=
 =?utf-8?B?M0p6SndwYzZLRkJ3Z0gwb3NiQU1INUZaU015QUNUUFZSM0lURHZUZ0M1ZEo1?=
 =?utf-8?B?YVUrVHZxVVArenB0KzgzMnVWYWJJWWZXS29uTlJUenFlZHBDbk4zSmJYakxl?=
 =?utf-8?B?R3BpT2JKemRYODRxRnZzWUxDNDVaMEdHdXk2ZDYxOHN4K2tEZkNxVW5kaGNa?=
 =?utf-8?B?NW1EN0wwV3NYYWk5MkpKMERHVlcwbWRwV2lpd3UweXdRc3hHeEFlb0hnZTFJ?=
 =?utf-8?B?eitNeHdja09kbWphTVZ5MUlzWklUSjc4Rnlnbk4xQzhKaW4weE9Id3piTity?=
 =?utf-8?B?R0pncU1Bb2U1R0xIUDk0a0ZXTFAwWUh2QXRTNXMyVjViWU1rRnBJRmRxc1A2?=
 =?utf-8?B?VWdvN0lUd1lLWm83bVdMeW9hak56ajNmdUZYTDFlRE12dlNtK2NmUXZSSUhm?=
 =?utf-8?B?MWI0TG9jRmk4akdvOWZrc2M5c3g1V0xOYWh5cFFBZUovQk9SbjJGelFPN3hs?=
 =?utf-8?B?MmVvYjdjUVdaRzJ0U3JXWHB3d3RkTmRSRzhPbWxhZkNlVldEVzJDdUxuNEN1?=
 =?utf-8?B?Ym9mM0xydUM0cmNDOXY1UFh4SUovQW5sRHlMczhNUmM5S2dWcXltRFRBMFhX?=
 =?utf-8?B?TjR5ZTB6YkVuVWtpaytkTFpZYk5lTDVHcmxCR0tGRklzdmhQdGpLQndMRzc0?=
 =?utf-8?B?K1RIMmxpNlg1N040YXFFNmtHRllGZHljTDZPeGxDRzBjelVaQWEwb3pFRzMv?=
 =?utf-8?B?bjdNTFdnbUFOUzR1bzEzV3ZVbEdXTVRuTksrajdWZjllT0NXVng1eXh5TVZ1?=
 =?utf-8?B?Um9EejRHb3ZDQkMyV0dlUnNsNGdqTUI3SVZCU25LQ0dzMVo3TXdWMUxYaEh5?=
 =?utf-8?B?WDBQZ1VZNGtmRWJCQnUvOW91VXE3bnoxVUgzajN0clVLck56YmtFZWVva2dK?=
 =?utf-8?B?RzZ6NFEvWjZiYzRiUVdjU1ZvZEFVK2lOVTlGK2pWVUp1a2c2QlpuVG8wbjBn?=
 =?utf-8?B?MFNZNkMzWXpzdlJ0aUwzREd4cDh0c2NjMklBNDdEb1J6WjRoZUM0dTUrVWlq?=
 =?utf-8?B?bzVjY1NYUS90UFBWV2swc0l0TVlBZ3FLV3VIWHBIaGkzUkUwNUFRY2pDc3VH?=
 =?utf-8?B?OHR4M1FzZU8yVjQxVjRtdHhlbmZQK1B0Zjgrb3pQdFlMelpxbjBtV3lZRWZO?=
 =?utf-8?B?SVRocTVSRjhSUVV4dmZqQXlFNVVCQ3pudGh2a0I2WW9kSnpMZnF2dk50N1Zk?=
 =?utf-8?B?KzJWYUppRmMrUVFvekRNZmoyZDNWbGxOcmxRQk9GYTVYNHU4T2FEbkppY3VN?=
 =?utf-8?B?RitGUVJMYnFQbFM4K1kreEx5N1VpbFBQdkNnWUxGVmhSSHl6b0tycEhpQmlm?=
 =?utf-8?B?R2RSVkJKUTZJZXRQeThlalE3Z3o4RWZBalFqQVd2SDhTa0cwRVMva1J6NVZB?=
 =?utf-8?B?dC9JYllXU054eWRrM1k1dEZKK05yUEFRV2xMTndFeUQvWnByZldMUGVuWFVR?=
 =?utf-8?B?aFFjTllvZ3FXSWRKNndEalVLTGU2NG9SSGlBZDhoSzBiem4zeXBwbVZyYXoz?=
 =?utf-8?B?azJrbkVpNGt2K2tLdE81TW1WNzBIdXpGRmk2cnFSOVoxUHloZ1RGS1piK3c1?=
 =?utf-8?Q?H11nUgACxzphUF/DOC3/pSaGE?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR18MB5244.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2729e67-1df6-442e-304e-08dcfdb62c9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 16:23:25.3355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hsai233EsnjCCEkIrX6qJ/Znv3DQgPtBNHyExcR/PfWljdaBXnZhHww+TnWwD3thtar3DGangwhMw0UawVDCgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR18MB6070
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 2PORjqzCERbt358_jWWEN7R8Uv86ZXf-
X-Proofpoint-ORIG-GUID: 2PORjqzCERbt358_jWWEN7R8Uv86ZXf-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Wang, Michael, Jason,

I wanted to follow up on the previous discussions regarding this new used b=
uffer notification suppression.

Since this proposal involves two changes, how about separating it out and e=
xplore the feasibilities to support interrupt coalescing with existing opti=
ons.?
1) Support pvirtq_event_suppress/virtq_avail in PCI bar
2) Support used buffer notification coalescing

Regards
Vamsi =20

>-----Original Message-----
>From: Michael S. Tsirkin <mst@redhat.com>
>Sent: Friday, July 5, 2024 1:31 PM
>To: Lege Wang <lege.wang@jaguarmicro.com>
>Cc: Jason Wang <jasowang@redhat.com>; virtio-comment@lists.linux.dev;
>Vamsi Krishna Attunuru <vattunuru@marvell.com>; Nithin Kumar Dabilpuram
><ndabilpuram@marvell.com>; parav@nvidia.com; Leo Liu
><leo.liu@jaguarmicro.com>; Angus Chen <angus.chen@jaguarmicro.com>
>Subject: [EXTERNAL] Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
>add new used buffer notification suppression mechanism
>
>On Fri, Jul 05, 2024 at 03:=E2=80=8A35:=E2=80=8A17AM +0000, Lege Wang wrot=
e: > hi > > Thanks for
>your comments in previous discussions. > I'd like to confirm that do you
>understand this proposal's idea now. If yes, > I may start to prepare a mo=
re
>
>On Fri, Jul 05, 2024 at 03:35:17AM +0000, Lege Wang wrote:
>> hi
>>
>> Thanks for your comments in previous discussions.
>> I'd like to confirm that do you understand this proposal's idea now.
>> If yes, I may start to prepare a more formal V2.
>>
>> Regards,
>> Xiaoguang Wang
>
>It's not that I don't understand the proposal, it's that I don't think it'=
s a good
>proposal. It seems to rely on timeouts to solve race conditions, which are=
 all
>hidden outside of spec.
>We should explain how things are supposed to work.
>
>--
>MST

