Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B634F218
	for <virtio-comment@lists.linux.dev>; Thu, 13 Feb 2025 14:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739457649; cv=fail; b=aK3FnUM2PyN92GrkejP3KAalTfg8YvHqhiHmTpIGyb8FyXkmL+fmx39shVO5rJk0uqSNAxzC+Hh/hye6VT17Hn4zAmTndmyd5Qs42n67NvHShnAqEWv/puO0XMuBOKE8CH2TRj+GT4+mCAH66X/LdSyWhL6L1AFR1xN0S93dzGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739457649; c=relaxed/simple;
	bh=ITGpYEes74MqB8JJxxSKkjl0fUkZXQHpcQp90vcor5I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=pGgeOgybeGbyQOHkW4bXLR5PnihUzYH6s4XNoAiQPAD7bxFZUUjxRaADvug96WEKmye68Ao1YcqF9XuQDkJy2PC2cJ5HTaJ7e4Bsk32LLxB91G0O1R38LTFyzRxPrBAWO4/OHn/8spcBqDQjcJHvTbvd7qx+ng3sp4vDaEOtRyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=FxiUHvJC reason="signature verification failed"; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="FxiUHvJC"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D0Ngsx007544;
	Thu, 13 Feb 2025 06:40:39 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44s65fhe8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 06:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PC6wKCo3qoN/bqt73PAusO/IPCPevCG8Z4UpMlzkQ+GF+mLa45y1aCFNH/WYQrMfG36rCwVZLDW0iTi0AkMA7INFceVAMnGWwdam6Usca6O/egXRL8bKCb1NeVoW4EfekG+TbgN+L+3x4CX/Xa2/edYNkUq0LkOfrscMNIYzQpVEUA63pZRzhNIY/ijZwD0VhpI57Z/aF7EvuYL2etu49ne/Xbp+YN+7zTeyCEEjTO1Y70kTHK2/OuAgzj22cXBIYexMjKSfh29TBitNq1eWZRW6bUFL7FrUA+Hg2L5raiaELNk1DyZhPeeNHky+jVJK+zsY0Y7JoRtza3uBC3vZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+eaST5cR+Np7LXT53bkrLd5uaD0GYnYvmFwTrIyPTs=;
 b=I/8WZh6MXX96bOG/3Aft1X8p4zqpqanzSLwR2E5uUOV4sZO8e+H4wNQs78q/EEWrMmABlijiCyDdcwiIIqLTDymCgQvP9AR70bJXwtyxtyLIwVwQDGgborfsNR0E8Q6O5Y9YKyIlOiZNj5yiMfHS3wFJJtM4nFeJ1s9Ls2KYlYKKpTdrlVr0IgGnV9+NA46jFQQKEwYm5yovtJzuySB8Xf182n7OiZm2/ON0Vt0aY4OGKy2xWjCZ/0E1qrrya7qD5SX9zNPE8ja4a8CL/1lSXgowL32a5ElVd7GX3ikm/7VBjMvtb+wVeepq7lZyIoUSj0n6cLdr5EjbTst+vQLzPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+eaST5cR+Np7LXT53bkrLd5uaD0GYnYvmFwTrIyPTs=;
 b=FxiUHvJCWf8g4LYvphMizuI/pCN6wkjC5P9QoJengFm3NSzOnBbCnmdIP79UidvXIFYKeFC99T+2EyC0vCyz1sh0aMqlBUlIAYdaD1Rn18VuGkrw/+fQPHOtFQ4pzvQ6J/sUSQktR8w7ffnSE64KkaA64RtZNnfAlT0Htdiw2jI=
Received: from PH7SPRMB0130.namprd18.prod.outlook.com (2603:10b6:510:2fb::20)
 by SA1PR18MB6035.namprd18.prod.outlook.com (2603:10b6:806:3eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Thu, 13 Feb
 2025 14:35:35 +0000
Received: from PH7SPRMB0130.namprd18.prod.outlook.com
 ([fe80::a379:1374:8d7:5990]) by PH7SPRMB0130.namprd18.prod.outlook.com
 ([fe80::a379:1374:8d7:5990%7]) with mapi id 15.20.8422.010; Thu, 13 Feb 2025
 14:35:35 +0000
From: Srujana Challa <schalla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com"
	<cohuck@redhat.com>,
        "mvaralar@redhat.com" <mvaralar@redhat.com>,
        Satananda
 Burla <sburla@marvell.com>,
        Nithin Kumar Dabilpuram
	<ndabilpuram@marvell.com>,
        Jerin Jacob <jerinj@marvell.com>, Anoob Joseph
	<anoobj@marvell.com>
Subject: RE: [PATCH RFC v3 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Topic: [PATCH RFC v3 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Index: AQHbbJVA3e6/c76de0OAGCrvtYDeDbNBD+oAgAIyLLA=
Date: Thu, 13 Feb 2025 14:35:35 +0000
Message-ID:
 <PH7SPRMB0130F8B80EAA835D74D84803A0FF2@PH7SPRMB0130.namprd18.prod.outlook.com>
References: <20250122061644.266560-1-schalla@marvell.com>
 <20250122061644.266560-3-schalla@marvell.com>
 <CY8PR12MB71951C75DE4B72B480A64F42DCF22@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB71951C75DE4B72B480A64F42DCF22@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7SPRMB0130:EE_|SA1PR18MB6035:EE_
x-ms-office365-filtering-correlation-id: bcc5556a-e49d-414e-3e91-08dd4c3bad5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?clM1NVJEQnZiSlpkbWtqcnRncHdubG5CSThIYktlS0JWeUhpK3l6NVNkbmx0?=
 =?utf-8?B?YjZnQktGaEwyWVpFbDNzREVaVktiQVlNd0F0bmN0TXdZUVRoRkM3M3JFSVY4?=
 =?utf-8?B?YVNReHArb1RYekd0YWQySlZZMU1nWXJuUzRKR3J0dHVLN0VQaENwN0dJaXdF?=
 =?utf-8?B?RGZwVmxGUEtHU2VRTjhMU1EwMWRTcmVwZ3lOb1VRcUlTeGp1Mk5iQmhFS1Fq?=
 =?utf-8?B?ZmVDYzZmTlp2WEZWKzlVaFRzc3Bzb05mcUgrZUEyY0VDaW9sQXF1N2w2Z3Zo?=
 =?utf-8?B?UmhndWJDSTUxRDBKVmhOemdkY3JLTmwydWgrOVNhdXBZUW1XWXp0OHFkZG55?=
 =?utf-8?B?WGpESitZaVFVY3ZoSjlpR2VhM2lNUWJndUw3dWZaMUNUa014eE1LWWxRWjFx?=
 =?utf-8?B?K1paZSt2NHlJeHdTOUJwK21CdTdqSGM5SkZtYnl4NzZDbjA3VERIWExPNDd0?=
 =?utf-8?B?V0VwUVFNZVFIMHR4c2Z1K0VqNTFHSmMrZ3V1TEtTVDZ2UDluMEhIdFcrZytL?=
 =?utf-8?B?NzRIT0JGSkFOd2p5UzlnSjNWMWxiaSszMElmSVJ2NnBJMW14UzVEcC9sUGl1?=
 =?utf-8?B?WUtVOTlQTEtyTTVRVTFyUldlTlV0ekZKei96eGc2WStudmMxdDRHM0xOdWU4?=
 =?utf-8?B?THFvNFpiYThEMW9uWDZ0TXlMRmxRU1hCdEphN0ZQQ1BpWTQxN0ZseENsSUNQ?=
 =?utf-8?B?ME1JZVRWaDIxRFlGakFpV3B4TUd5MXl2NnlMN3VzOWVYek1wWmhiMmNOR3dp?=
 =?utf-8?B?M05kTlVTU1dZc0FFRUZ2RmxYZ1V2disycjRBSm9ZSzNuNVhBUXlHNmgvOGVL?=
 =?utf-8?B?c2Y5ci9oZk1Jd1owQ1lJZWEyMVdpUUZnSXlFM0xoWUtETFFPbm5KY2NSeFRT?=
 =?utf-8?B?SkxCYk54VzFFZ3pES3NMZllGK3dZZ01tZUEzb2RMSWp5S0VxSWJNOUNUL2Vi?=
 =?utf-8?B?S1FqdXY1OGZrZ001WWd5Y3Y0dXBLTkN5enJkNk1rUXJyakZWOUIwWkVuRllS?=
 =?utf-8?B?R2Z3QjJVeTJJcWp6Z29HR3IxWWpWVTdFbERuZWt6U1IyQ0t3dVdMV0J4cFBI?=
 =?utf-8?B?YUNPU0h0S0ZiendNb0pKU2Irc2xYWWMxTlRRSUJCcUhibWxxdThxM01XcHBu?=
 =?utf-8?B?SEttU3RUazlYd2xPYUsxaWczcWcxczFUakt3andRTzdOM2NTM1kxUUdhOFZu?=
 =?utf-8?B?WUdMQmFmV2IwclAxR3p3VU5zbi9rTEhSN3Z0a1pHQlZXa29hNVZOYnd1T0xP?=
 =?utf-8?B?VXZ1MklLbkFZOWtFcG5xbk9wcW1HdGdjMGwwczB3NWd4cTg5c29lZGNGeGhR?=
 =?utf-8?B?OWNXVS90dWZEbEhSVDRIL1gweEkxVmNFUnpJK2U5YVMrM1RzSFNNWmJPQXBN?=
 =?utf-8?B?QzFGVDF4bFBzQjcydVRkQmNNd2RGMTliTzROazJaT01lRytTak9RQ2xYSjNF?=
 =?utf-8?B?OXFQMWhOQ3ZGRXVabDR4VmVLVWp1Z2xEclBmLzE4OGI2UzNhRklUUERTLzVy?=
 =?utf-8?B?aFJmUXM3Tkx2bm5PWkJGZ2UzZzZlTFFJa2RSQ0VIVW9tOUxoZkJ3bmpoYytP?=
 =?utf-8?B?d21BOU5xeFhYbTFJK0d6a1F6Rk1wN1N1bDM3dmFQZWNJUFJnc1BYSFRTbmVK?=
 =?utf-8?B?SVYzVkZ1V1FZM2FGVkhwV3hZVFF5MHlDdjNxYzdqSTNuQnphVERRdnI3VVMx?=
 =?utf-8?B?bnlIajZ4QkxOQU1SRTlGS012TU9iNnRKaVJSdURBeWdUZFVFTVVZVHNYd0l5?=
 =?utf-8?B?NEhRY3RmZkJlYjIwbUM4bDdCRXZsdUdlMlZBZlV5cVkzbXJIeDE1dnlwdDlz?=
 =?utf-8?B?SFlwK0tVOW9xa1EzVHVvMFNkd0dkQ3NjK3NiR0lSLzBFTVV3WDdoRnJYRjdL?=
 =?utf-8?B?NG5qQXc3RERxU2JubklHZUxQb3lDMmV1S1JzVXdWcWoyNEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7SPRMB0130.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjBibnhwZzlmZC9JazhROHpRSWtEUEkwSWRhMDhXREdVTFczc1F3cDNNeFhV?=
 =?utf-8?B?WGUrdStiTkNGRC93WTVueVYwMm9xZGpRcUZIa3N5ZndJVUFqNi9LU1FCS2Nl?=
 =?utf-8?B?U3BEYXlGR1B0ZjR1M1ZGUlE2SU90NlkwU09aR1IzSkx0cGVMUk1Vd2pWcjJ0?=
 =?utf-8?B?RzAxY3lwd2phejlORzEzWGlmTThGdjNMWm5JS2RseUNyYitxNno2R3BmL2s4?=
 =?utf-8?B?Rng5Skx5T0ozUHNjUmRVRWlvY0MrTG1rdXBKSm11N3Y3WE5YalprSWZpWk9p?=
 =?utf-8?B?cS9TL25UWGMwY0VySldXOW9DM2xsWG1xOVVCb25aSHJqMEVoNllDTzBRNjFn?=
 =?utf-8?B?NXhiaDhrZXlZMXlqcEJlcGJXSE9scXYwNkdjczVwYUtFcWY1eUw4OTRWSVVh?=
 =?utf-8?B?WDZBZ3BtanBaMkFaNGhNTkJ0Q3I4MDBjOE5meHcybC9RdjluZ3V1R0IzWGx4?=
 =?utf-8?B?RkFrbkFaZnBOZ1VsdGREQU1sZjA1dG1JdnJaSVpXaVYySktZeHdvNDFzbHNZ?=
 =?utf-8?B?Z2w3SXNaS1NwM2N0bWxvTUppb1U3K1dHemxPVHNCOGhuVFh0ZzcwbGxPT0RT?=
 =?utf-8?B?WERHUUN6NGlDOGJxdzRCY3N2TnV1TGYvYytOeE9tR1RkOFdhQnNwNzBIWnlZ?=
 =?utf-8?B?bUpDSm1uOTkzV0VKWDZxZzZrajNSdURLTU5KNFJPZVFkdVdMa2IzN0NvTmxq?=
 =?utf-8?B?Z2xKdi84cnNFQm8ycWNtYW5mOTVGVEVPdEZUSmlEZUFMb0MzOFZhcHM1S3Ar?=
 =?utf-8?B?bEtVb1Nod0xQVE8rdzBPNW04TW9kNE8wVlp5NjVTMmFETjNwTDZCS1BuemZ4?=
 =?utf-8?B?Q09FVXp5S3ZZQUtQakJIWW1Va2N3akZQM05rTlBYUEMwM0VVMWxlYjA2Sitp?=
 =?utf-8?B?R2lvWUszUGxQVkF4UkFvYzdYY1BUQ3pSSXdZdWM5eHV3WTN5THVycFZmbUhV?=
 =?utf-8?B?VGlaNDJnWUdIbEEvUnlEVFJHb2s1cjJpZmNYbnloYUJkNjE1L09ndHFvSmw5?=
 =?utf-8?B?dFFHNHpzbEFMMzNYMWthNlZjbE5hN2ZKZHlONWVrNGw2YXNtSnZsRmJ0SERG?=
 =?utf-8?B?WUxaeTJhRksvWUY2NTljaW5uMnVnY2hXNndValdlMk5McEdyZTlmVk5RT2ky?=
 =?utf-8?B?d3Z0eGhHb1huQXFNajIwMkNURWpONjRpaXl5bDc2NWVCYUNyQ2pFT0V4bjN3?=
 =?utf-8?B?ZTRXT2JJSlk0d3BjaVV3RjVZcFFobmgzcUFzeGQyUDlIdWNVV1dKclBJYnZH?=
 =?utf-8?B?NThsRHBWS2h3enV2Yk80QWoybmNtdjdxbWp4T0p5dnp6UXVDNGFtSFRHWEdB?=
 =?utf-8?B?eE9xemF0bXNtWDJDdHB1YmFtLzRWZUZaWjFxbVMzTUdDSWljbXRoOWUzVnYx?=
 =?utf-8?B?K1JtbTZJTzJOYy81UmlCSU1qTGN0SUpKaWNncVBsT1VEdEI1Qi9UV1Y1Q1Nt?=
 =?utf-8?B?RU9oSEFuWis0OGV6dFB2SC9aZTl5M1VOeFhpRjN1RWxDQVoyeXp5MnlwTksv?=
 =?utf-8?B?OE1kSFpYV3VjajR5SC8vYUFsUFlPcFBWMTg1NHAxd2YvN1JYRmtSUUZWM2VJ?=
 =?utf-8?B?em1tVHFDTXE4RUowQnhsbkhJZW42YjNaWms3aWt3S05rUW9wckxicStjWmxZ?=
 =?utf-8?B?UnBySGtMdDg1NGpSUUFRcUxRcEVJTkNpMnZLb0FIWGxYOUYzMXlFS2tmQ0M5?=
 =?utf-8?B?UlpIbzJlbVh3R3dENGhQS0lGQXU5bGdnZ1l1b0tkNVlMRXYrZ2REbmVMZG84?=
 =?utf-8?B?U2hIYTJsTE5TV1g4cm5FR05rMXdzR3h1NmxZczc1eDNvVjU0YzN2OFE2amM1?=
 =?utf-8?B?cGRja0NhYkpsM0VweW1PVldXSXZTSkRDWjloQmsrdmZCSm1aeEgrZXRxUkQw?=
 =?utf-8?B?Q1MrRWJGOXhNaGN3b3BFRDRibGsxQ0toZTM4NDVock15MlZWQ1pnbXFoQ0h6?=
 =?utf-8?B?V3VndXYvUzUwbGVTbHZjcFZUTG5salFOamFYTEV4QVFzczUwVnAvOXFxd3Y2?=
 =?utf-8?B?YzZ3bEk2dndDcXpLaThRakNVSDBDK0lLdjBMcEkvVEhoMlZlbEJDQ2l5d09a?=
 =?utf-8?B?VXBydFJaYWtPak56Mkd4YXl5OUwzblp5YUMxVldEQVl4eFlqZ2MzVnZWd01y?=
 =?utf-8?Q?mZmQ=3D?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0130.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc5556a-e49d-414e-3e91-08dd4c3bad5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 14:35:35.1667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZmncmzoS2A029ryIMMIn1D2Hl1vj/y7OFMYqP2zalUZ2mtYsS38ElNL4txlIrZGYOj96nFwHAFZEG0NGX4Mvyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB6035
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: R0wvNXrtyZRndtMtOt04i3snd4TZLj4-
X-Proofpoint-GUID: R0wvNXrtyZRndtMtOt04i3snd4TZLj4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_06,2025-02-13_01,2024-11-22_01

> Subject: [EXTERNAL] RE: [PATCH RFC v3 2/4] virtio-crypto: Add resource
> objects for IPsec outbound and inbound SAs
>=20
> > From: Srujana Challa <schalla@=E2=80=8Amarvell.=E2=80=8Acom> > Sent: We=
dnesday,
> > January 22, 2025 11:=E2=80=8A47 AM > > This commit introduces resource =
objects
> > to enable the driver/device to create > IPsec Security Associations
> > (SAs) for both inbound
>=20
>=20
>=20
> > From: Srujana Challa <schalla@marvell.com>
> > Sent: Wednesday, January 22, 2025 11:47 AM
> >
> > This commit introduces resource objects to enable the driver/device to
> > create IPsec Security Associations (SAs) for both inbound and outbound
> directions.
> >
> > The IPsec SA objects include essential parameters required for packet
> > outbound and inbound processing, such as SPI, tunnel headers, IPsec
> > mode, IPsec options and cipher/authentication specific data.
> >
> > Signed-off-by: Srujana Challa <schalla@marvell.com>
> > ---
> >  device-types/crypto/description.tex | 145
> > ++++++++++++++++++++++++++++
> >  1 file changed, 145 insertions(+)
> >
> > diff --git a/device-types/crypto/description.tex b/device-
> > types/crypto/description.tex index 2c00e50..0ba09df 100644
> > --- a/device-types/crypto/description.tex
> > +++ b/device-types/crypto/description.tex
> > @@ -336,6 +336,20 @@ \subsection{Device and driver
> > capabilities}\label{sec:Device Types / Crypto Devi  \hline
> > \end{tabularx}
> >
> > +\subsection{Device resource objects}\label{sec:Device Types / Crypto
> > +Device / Device resource objects}
> > +
> > +The crypto device has the following resource objects.
> > +
> > +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline type & Name &
> > +Description \\ \hline \hline
> > +0x0200 & \hyperref[par:Device Types / Crypto Device / Device
> > +Operation / IPsec Service Operation / Resource objects /
> > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-
> > SA]{VIRTIO_CRYPTO_RESOURCE_OB
> > +J_IPSEC_OUTBOUND_SA} & IPsec outbound SA resource object \\ \hline
> > +0x0201 & \hyperref[par:Device Types / Crypto Device / Device
> > +Operation / IPsec Service Operation / Resource objects /
> > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-
> > SA]{VIRTIO_CRYPTO_RESOURCE_OBJ
> > +_IPSEC_INBOUND_SA} & IPsec inbound SA resource object \\ \hline
> > +\end{tabularx}
> > +
> >  \subsection{Device Operation}\label{sec:Device Types / Crypto Device
> > / Device Operation}
> >
> >  The operation of a virtio crypto device is driven by requests placed
> > on the virtqueues.
> > @@ -2028,3 +2042,134 @@ \subsubsection{IPSEC Service
> > Operation}\label{sec:Device Types / Crypto Device /  \hline
> > \end{tabularx} \end{table}
> > +
> > +\paragraph{Resource objects}
> > +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> > +Service Operation / Resource objects}
> > +
> >
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA}\la
> b
> > el{par:D
> > +evice Types / Crypto Device / Device Operation / IPsec Service
> > +Operation / Resource objects /
> > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA}
> > +
> > +A driver can have outbound SAs between 0 and \field{outb_sa_limit},
> > +as specified by the capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For
> > +the IPsec outbound SA resource object
> > +\field{resource_obj_specific_data} is in the format \field{struct
> virtio_crypto_resource_obj_ipsec_sa}.
> > +
> > +\begin{lstlisting}
> > +struct in_addr {
> > +        le32 s_addr;
> > +};
> > +
> > +struct in6_addr {
> > +        union {
> > +                u8  S6_u8[16];
> > +                le32 S6_u32[4];
> > +                le64 S6_u64[2];
> > +        } S6_un;
> > +};
> > +
> Any reason for union? Can we just have s6_u8?
> (s6 in small).
I have copied from the RFC.  Will change it or can we add reference to the =
RFC
for these structures instead of defining here?
>=20
> > +struct virtio_crypto_ipsec_tunnel_param {
> > +        /* Tunnel type: IPv4 or IPv6 */
> > +        u8 type;
> > +        u8 reserved[3];
> > +        union {
> > +                /* IPv4 tunnel header parameters */
> > +                struct {
> > +                        /* IPv4 source address */
> > +                        struct in_addr src_ip;
> > +                        /* IPv4 destination address */
> > +                        struct in_addr dst_ip;
> > +                        /* IPv4 Differentiated Services Code Point */
> > +                        u8 dscp;
> > +                        /* IPv4 Don't Fragment bit */
> > +                        u8 df;
> > +                        /* IPv4 Time To Live */
> > +                        u8 ttl;
> Please add padding bytes to align to 32-bit.
Will do.
> > +                } ipv4;
> > +                /* IPv6 tunnel header parameters */
> > +                struct {
> > +                        /* IPv6 source address */
> > +                        struct in6_addr src_addr;
> > +                        /* IPv6 destination address */
> > +                        struct in6_addr dst_addr;
> > +                        /* IPv6 flow label */
> > +                        le32 flabel;
> > +                        /* IPv6 hop limit */
> > +                        u8 hlimit;
> > +                        /* IPv6 Differentiated Services Code Point */
> > +                        u8 dscp;
> This one too. Please check in both the series, vnet ipsec and this one.
Will do.
>=20
> > +                } ipv6;
> > +        };
> > +};
> > +
> > +struct virtio_crypto_resource_obj_ipsec_sa {
> > +        le32 spi;
> > +        le32 salt;
> > +        le64 options;
> > +        struct virtio_crypto_ipsec_tunnel_param param;
> > +        le64 esn;
> > +        le16 udp_sport;
> > +        le16 udp_dport;
> > +        le32 replay_win_sz;
> > +        le64 cipher_algo;
> > +        struct {
> > +            le16 length;
> > +            u8 data[];
> > +        } cipher_key;
> > +        le64 auth_algo;
> > +        struct {
> > +            le16 length;
> > +            u8 data[];
> > +        } auth_key;
> Two dynamic arrays in one is problematic.
> And below fields can never be referenced without learning the length of
> auth_key and cipher_key.
> Below are critical fields to access the whole rest of the object.
> So please move them at start.
Will do.
>=20
> Also can we have above two dynamic array as constant size array, instead =
of
> dynamic?
We would like to make it a single dynamic array. Have both lengths auth_key=
_len and
cipher_key_len at the end followed by data[] array. The first x(auth_key_le=
n) bytes represents
the auth_key and next y(cipher_key_len) bytes represents the cipher key.
Could you confirm if this approach is fine?
>=20
> > +        le32 obj_id;
> > +        u8 mode;
> > +        u8 direction;
> > +}
> > +\end{lstlisting}
> > +
> > +\field{spi} is the Security Parameter Index(SPI) used to uniquely
> > +identify the
> > IPsec SA.
> > +\field{salt} is the 32 bit salt value used in the cryptographic operat=
ions.
> > +
> > +\field{options} specifies the Options for configuring the IPsec SA,
> > +see \ref{table:Device Types / Crypto Device / Device Operation /
> > +IPsec Service
> > Operation / Device and driver capabilities /
> > VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}.
> > +
> > +\field{param} specifies the parameters for IPsec tunnel mode.
> > +\field{esn} is the starting sequence number.
> > +\field{udp_sport} is the source port for UDP encapsulation.
> > +\field{udp_dport} is the destination port for UDP encapsulation.
> > +\field{replay_win_sz} is the anti-replay window size to enable
> > +sequence replay attack handling, replay checking is disabled if the wi=
ndow
> size is 0.
> > +
> > +\field{cipher_algo} is the cipher algorithm identifier see
> > +\ref{sec:Device Types / Crypto Device / Supported crypto services  /
> > +CIPHER services} \field{cipher_key} specifies the cipher key and its l=
ength.
> > +\field{auth_algo} is the Authentication algorithm identifier
> > +\field{auth_key} specifies the authentication key data and its length.
> > +\field{obj_id} specifies the object id of the SA that can be used to
> > +retrieve driver-defined data associated with the IPsec SA.
> > +
> > +\field{mode} specifies the mode of the IPsec SA, see
> > +\ref{table:Device Types / Crypto Device / Device Operation / IPsec
> > +Service Operation / Device
> > and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}.
> > +
> > +\field{direction} specifies IPsec SA direction.
> > +
> > +\begin{table}[H]
> > +\caption{IPsec Direction}
> > +\label{table:Device Types / Crypto Device / Device Operation / IPsec
> > +Service Operation / Device and driver capabilities /
> > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA / IPsec Direction}
> > +\begin{tabularx}{\textwidth}{ |l|X|X| } \hline Type & Name &
> > +Description \\ \hline \hline
> > +0x0 & - & Reserved \\
> > +\hline
> > +0x1 & VIRTIO_CRYPTO_IPSEC_DIR_OUTBOUND & IPsec direction outbound
> > \\
> > +\hline
> > +0x2 & VIRTIO_CRYPTO_IPSEC_DIR_INBOUND & IPsec direction inbound \\
> > +\hline \end{tabularx} \end{table}
> > +
> >
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA}\labe
> l
> > {par:De
> > +vice Types / Crypto Device / Device Operation / IPsec Service
> > +Operation / Resource objects /
> > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA}
> > +
> > +A driver can have inbound SAs between 0 and \field{inb_sa_limit}, as
> > +specified by the capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the
> > +IPsec inbound SA resource object \field{resource_obj_specific_data}
> > +is in the format \field{struct virtio_crypto_resource_obj_ipsec_sa}.
> > --
> > 2.25.1

