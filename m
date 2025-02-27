Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A778270024
	for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649770; cv=fail; b=QFErm26udj8Spwew2RIL6PxK71oP4IbHRUchlGRKue7POORmJopvKWGpW4z9lQsTAj9ICcis3cmwlQJFLff1zkGxdgQNtBHrtzbWbaABwzukTA7DsOOs0bM5DIsztR4jcpbCQCbvNmbVFsr7jOzNZj+0VErLQ61hn1Xv1zsj7s8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649770; c=relaxed/simple;
	bh=jv2jy3hTkeVG7sgprqS3XILPEKri8MnTCPcTIoAe2ng=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=AG+/e6mk6q+blghO4bh4RFuAOqqwbGZILunD+NVQx5amQHn0G3LjfxAOfML26b6u+81MY9hlY18ZtwEVMaaw2yTnJ/dKQYj5/7NPe1SBbgSNrr80YEka57yRRX5rzj8GuR17A3/TFJudqs9zy03Q+SGwYFxqljNlxQ/XkvybBxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=ZPSuBpp0 reason="signature verification failed"; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="ZPSuBpp0"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R8Wfo3006030;
	Thu, 27 Feb 2025 01:49:19 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 452mmn85r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 01:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWA7j1soYVUyo0bSmLmZzzWKtii8kr8RgnykCM4ZFEoa6lyr3US9BwmQzkp/am/iqLxUppUcoUjh3BjOgdkey5Q5g7Qb/EBxZez9bpiZlf0a3FhVBogOJ/EETKk8q8NP9lDUsXO2PulqnY9Hy+U0RWL4TgK6edXX4CRUEWi1p6Fs0d067ssCoqnh92ZKYpX/AciXghfxEm31vadfHvieQKt6pbWyuQ0RnDFXhQjnBCFDqioLD1HrbcGQLEDn/fWsH1URiIoeSpvXaVc6/IJb0OOK65i3Rbw9zfCmfzoREpzMSZRzrMNy7z1IERmTormS5NAppkoaQqx0ohqL9Btgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rm9HsFGNUU4HMG80fi0BHjS3hGBMVyFfKwdHG4XQn/c=;
 b=F32mjJpCD4J1nduwjW1EQnEh3PWZTCXNqe0qjE22nP3lxdzLOmgKAeZfkgvPbyFVezuwwwaTghnL5gwA473eoQwzs/CnS65cdv1VXtdWzOVD5lgHzqTVbdjL4xpU1C7ya/rhvA+gEKu0U89umnu39ECW7iel94r8ZoVsyXES2uDbBetJbH9KzYSLZn6Pmkpigq3H3FyEqrTBeG5fG1njI1Khdn4foD8vlzod7Y6LtDbqx/wvwreXUJx81EZUaywTLKg0wHtWQNM1+ksk1mcG8ker6nRfQy73KIMR5T04pKwTYwUGCAfUt9jbTWde6/FCEcZfzWhMC/WPI3BA/GkmEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rm9HsFGNUU4HMG80fi0BHjS3hGBMVyFfKwdHG4XQn/c=;
 b=ZPSuBpp0xNQjO/GTJVRO8TS0nHn2Zkb23lzCCgd3hc/3ewJ3BXpL/M+H/AirPfEtcKIx+iA1v+rdR19c/H/TorxEB56+3GldcBePjHD0+8boIB2zRlHmLwnoRltPRkzFplE5eSONujm6kFCA8aQBvaJoWK5FMr6DIHzU+g1sNYg=
Received: from DM4PR18MB4269.namprd18.prod.outlook.com (2603:10b6:5:394::18)
 by BY1PR18MB6063.namprd18.prod.outlook.com (2603:10b6:a03:4b4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 09:49:13 +0000
Received: from DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a]) by DM4PR18MB4269.namprd18.prod.outlook.com
 ([fe80::9796:166:30d:454a%5]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 09:49:13 +0000
From: Shiva Shankar Kommula <kshankar@marvell.com>
To: Jason Wang <jasowang@redhat.com>
CC: "pabeni@redhat.com" <pabeni@redhat.com>,
        "willemb@google.com"
	<willemb@google.com>,
        "parav@nvidia.com" <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Nithin
 Kumar Dabilpuram <ndabilpuram@marvell.com>,
        Jerin Jacob <jerinj@marvell.com>,
        Rahul Bhansali <rbhansali@marvell.com>
Subject: RE: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
Thread-Topic: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
Thread-Index: AQHbgn6ramcqJN/HSUCxE4NY9IHmd7NOJz3QgAFHaICAB1IyoIACYFEAgAHTDPA=
Date: Thu, 27 Feb 2025 09:49:13 +0000
Message-ID:
 <DM4PR18MB42695063456CE2F746EEDB0BDFCD2@DM4PR18MB4269.namprd18.prod.outlook.com>
References: <20250217172509.107212-1-kshankar@marvell.com>
 <CACGkMEubUH6YtZHK7sEjj6fvWZ5_k0rQ9H6U2Li4GP0Txi-yJA@mail.gmail.com>
 <CH0PR18MB426010C71F7B3681C14C6F95DFC52@CH0PR18MB4260.namprd18.prod.outlook.com>
 <CACGkMEvZ7YfQr262Qe_ocsjN_ULeqh_sHkJqeqAaOoqOy7OoVQ@mail.gmail.com>
 <DM4PR18MB42695701DC0DB5AB4FABE902DFC02@DM4PR18MB4269.namprd18.prod.outlook.com>
 <CACGkMEuUsQuQ5zNu=kqdTQ9-zWsNc3zdFYVre03fuNnE6tKjog@mail.gmail.com>
In-Reply-To:
 <CACGkMEuUsQuQ5zNu=kqdTQ9-zWsNc3zdFYVre03fuNnE6tKjog@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR18MB4269:EE_|BY1PR18MB6063:EE_
x-ms-office365-filtering-correlation-id: 06e5d6ca-8745-4ec9-1ddd-08dd5713fe34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NlRXV2p2b1hLazBtSWFKSHVkRWxwWGlRSnMvTzE4Zk14cFFZQ3FPaE1Qck82?=
 =?utf-8?B?UlUzNDE5Z2c3WkRQT2NVQnNrZm5hSVlUSWs3eDNtUFNzeTFXSDlMME9may9u?=
 =?utf-8?B?Y0swMzFDTy9EV3VWczBnbWFPUTlVaXBiWTRsdHVmRDlQMjBrL3I0OWNFVUow?=
 =?utf-8?B?RTIrRVhTRjg2Zmc2SnQ3dzZialR6UUdjTGNvcGsxYlNBb2ovcllvTlgyVFY0?=
 =?utf-8?B?MitNaVM3OGY5VWhKalJ5TXJwSjd5M0xnSklxWjRCc3h5TitmRkxFS1Jyek41?=
 =?utf-8?B?K1JBMDNZaFVuZTYvVmsrWWQ3RHp4T0lMNWhNSm5KSC90RVFLc3o0WmRhWkVl?=
 =?utf-8?B?dWIvZnlFdEt4dkdUTE84V3JXb2xKRmZYVndGZUkwRUNzWENMTmJOalZqYy8r?=
 =?utf-8?B?SFkyNnQ5Z3F2RkN5TjhLRjhpbUdCd1ZKVzJrSUE2aTA2anRUQnBiZEU2UVNa?=
 =?utf-8?B?cDJTVkVzTDE0UmM5QytxQnViZCtjRGdSd2MvSHg3cnR4dWNUUDJpWTdLdUNo?=
 =?utf-8?B?NjFJQUduakNMNnh4THBCRlRjckllUXMrNG5lcXVuOUZCQ0xqcUN2ZnBVTjRp?=
 =?utf-8?B?SkY0dmYwMmE4akMwdmF1MnVOUXpDMjcwbzNsaXNYaW14Ym1XRVZQZ1pIY1JQ?=
 =?utf-8?B?MlIwZDcwNHZTOXliVWJzVzNCUXkrK1NXWDlCRk5qMTJzd1RSUUNBUm1WNTVN?=
 =?utf-8?B?a2Z4YXBWSHhoK0pjcXAzWm4vM1BWWm8zVjl1WGh4SS8vSXNSYVRTUkJDb0RT?=
 =?utf-8?B?cTZxTEtvMjd5ekNnY1M5b2kxZ0YyMTM5KzJZN21yZUhYODVXUVc3Mm5Vem4x?=
 =?utf-8?B?OTR2ZkZkNTVIdHhEK2FLUWo0WTdXaTR3N2g5RXdoK1cyNE1IZ0FzdVA0ZE9S?=
 =?utf-8?B?Ry9uSUJvTXlyUkw1Vyt4dWJTdnl0b0FZVDA2R2hkVkVzZEthZS84Q2xkdnhv?=
 =?utf-8?B?Vzl5QitjRzR4Q3BwUG5sQ0RNdmJ4bi8xV1poSTZTaklEeVZ4KzFlSG1MaUtu?=
 =?utf-8?B?U2Vnb215Z3g3UHZKdHJiTUcvcHhYbkZCNkU1b0MzZGpHVktCY0M2a21KRFVk?=
 =?utf-8?B?eEUwaEQzazAxM2NvU0FxeDBpUDRKbmo1QjBhSW82dm10T2NXdkRpS0RYRnlv?=
 =?utf-8?B?ZnBDdEFFNGJtcGNiYW9uaVJMcDd0QzFKQjliMGZIQkdzYllvY3lieXNSMnVG?=
 =?utf-8?B?RG9Ga1A0NDUwV3JEd3JjVFozV3QwK3F0S25Ld1c0djM1VVhISk4yQUFnYjZE?=
 =?utf-8?B?SC9KeWkrUkxObjFHNmFCZklENVdmVzJMbTJvTVcxZnRWakkyYWZaclBpVk4x?=
 =?utf-8?B?QWJrNnJic0tITVl1WUV1cEhqZWpmQXhqeFBpSFd2N1ZtZ0hzNVJ4TUJDQjJl?=
 =?utf-8?B?VVdaN3NSWWE0bGM0K3VwOVE3MGdNdGdFdGQxMSt5SFJLRTI5N09ORldKNGhI?=
 =?utf-8?B?UXlJTzEranZxZlZwclp6aFdBMUtCWEtFL3lJR3ZrOE1SbEJkQ1dZRmhERkZC?=
 =?utf-8?B?RDdHa2VvcmlPZ0JkZ0tHdnJhd0dydGRnUTN5bzQ3QjRjc0JMMHJQa1ZmM3FX?=
 =?utf-8?B?ZEJaQXpJVEp2Z0I0aEJldlVYTVQ0enBSK1JkMVNzM3hmR05MK1FrRjBsZGpz?=
 =?utf-8?B?eWlmdWQvalpyT3ZZRldUb3BkQXNOc0tTM0lvRlBpS1UwMkt2cElHWmsyUlgv?=
 =?utf-8?B?QUduRDBIV1VzekNjSGFmR2xUSm9YTElsbmhzU0xqQUFwNWhYbERYU3pRZHly?=
 =?utf-8?B?d3MyVkFuVkp2UzZpVUM4QWQzdnQ4MU9zNG0rbmRTMk9yVlVlMHZSYjBTTkRv?=
 =?utf-8?B?YlNaUG4vUmJmOVV1bVlqd2tCK3BOMnYzYWxWbEV6RUVNMHhEVExKekZIbnht?=
 =?utf-8?Q?I4yvkTFatxEVL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4269.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGE0RzlWMnpjQXhGbzY0R3EvZmxoS1dSdDhrRUNSd0JseGVIbFZrRG94dkpi?=
 =?utf-8?B?NjFRWFUwK1BUOHhPNTA5TUo5aUFHSXhKZkI4REljbk9Wb29WUis0ako4V1Bn?=
 =?utf-8?B?cmoraXBUSU9SL2pybDlBVWhTZTZDT1lPUDhzd1U0ckw5QjdGeGtiajlWZFR3?=
 =?utf-8?B?VXN5dFVhUjRaSE1FNmpPU1Z5dUlWT0FvOFZ0Vzhpejdqam1qVVNlVGFGeWEz?=
 =?utf-8?B?SEk2NEo1MkY2bXg3T0d0Rmd2QVc4WW1SZWpWTjF6Kzd4emVRMS9yRWwvRFlM?=
 =?utf-8?B?amI2SDZEY284dUhKek9iTldrT2pyVnI2ZUFRREZBV1ZSYll2V1JMRXRIMm0v?=
 =?utf-8?B?alNwcXI2a1lKU25IY0M3aS9vcTNXY3VQdVlRUTdXOGROWHkwOXU2VG5WN2hi?=
 =?utf-8?B?dU5hTGxRdVRSRU81S3JIbGxGRXA0V25EVEJjOG9yVXJLRkxwNHFwVHVWcTho?=
 =?utf-8?B?c3lrWk9Ud3R1UTJWZWlkVGExTlNVTEpLbGNiRWlwdGNUckJxVi9heCtMQTYx?=
 =?utf-8?B?czhGNzI1ZzZVaGpPRWU5cWlSbHdOYWtxL0Z5WTExeDFXYjBCdkVUazBEWDg5?=
 =?utf-8?B?bXJMVmRncnZaZnI4U3dzYzl6dFkwZWxFQ2pINVp0M2Y5bmY5ZTZqL3pVaUtL?=
 =?utf-8?B?bnRSUWZpWXpteE5wWWR1QzFIbE9oOCtNdE9qR3Z3Rnh5c21MRXFNK2hyMnBG?=
 =?utf-8?B?RWxISTg1NjJ0L3Z3ZVVGODdpMmZOYUpYdUZGQmpRUGxOVG9VYXljOXdqaEgz?=
 =?utf-8?B?dy9QcTREUkgxOXU3WHgyRlMxS3BZWHVNV2cvSExzSzJQcFVvZkZxRktYbVda?=
 =?utf-8?B?K0p6alViVkxIelEyeC9LeWdyTEtZaHQ1M0hjbGdGNC85UnorelNXaDZ0eXIy?=
 =?utf-8?B?aDg3elV6MWpoTDRxbEpWdGV5Wmx0UjNhRlpkY3ozZUZvQkNDdW45ZzlPcmM1?=
 =?utf-8?B?N3lCbDY2NzNiNWNkT3FHaFN3b3RXaHlSZWZJQ2J6dEtGTmRFZXIyMHorQWRZ?=
 =?utf-8?B?TXJnZmc0b0NseXBiZGFsQ1o3a2RkT3BvZEVxOXFyVlhZSFlkODhjclcwbmxz?=
 =?utf-8?B?cUxKYUZxM05GY2RkQkpIeW5tZnZRVTdheDV2NlJDTDZwd1dCTlJ6L0pJYzZB?=
 =?utf-8?B?c1NzRFY3N0JXNzNQR05Xemx3M25ZMGlqL2dTZXVCdFdzVS8xUFBtbjFLcDl3?=
 =?utf-8?B?MHRMOEp6U0s0QlRJQ2xqK1dRanlRSXJja2tSRDlZbm1xWjRvRnZYcU5ReXlE?=
 =?utf-8?B?bWRwT1hqaXlMZnJrc2UxTjAwdkt5bGtDS05tOCtoTTAxNUhTT0pBVWkxWS8x?=
 =?utf-8?B?a0JKaFd3a3ZXRDJkS3U0c0VydG1nMEwrNmJOQ3JUT24xd012WUJkbk1NdmlI?=
 =?utf-8?B?WHc3czFPZ2FRSTRkK1NCU1A2MU1FRUhPb3lockVZZFpKZnR2ci9DS3pvc3A2?=
 =?utf-8?B?Yk9RWElqOWtnMUc0SWVKQWNJU05idjBadnVJRU9qZC9HRGJpOGlFVVNzU2FK?=
 =?utf-8?B?d0lvdmU3RVpWemRXUlJkdjM4bG1MOVBDdVFzLzNIZ3kvUS9VWmVyZDc3TEE4?=
 =?utf-8?B?SUFZSTM3VW1YVFNUVUQ2OExoT2NHUkJTVnVlUktObWw1UHFORk1ZS1BzSGla?=
 =?utf-8?B?R1FSRDB4UlVkOGEvcUdqTHlLN0FMNlZqSHVuMEtkTTFBVm5PZVVSZ2tBV2lQ?=
 =?utf-8?B?a2ZtcG94MTd1R3BDaDhNU05wUU1yeE4zcDNwUFhJNzNTa3VVVG5YbUtOM0JE?=
 =?utf-8?B?Yjg2SEVqMXB5c1hHODVCZ0wvbXV3NHlqNzV6clBKY2JyVjFtNFRWMWR4dXFw?=
 =?utf-8?B?VFcvZGl0SDJzdk83d1drL2dFUG5RRmFFaTJSRU9KKzB0aEpxVzNZdTZ3WmVG?=
 =?utf-8?B?MnhHbDV3QTlUY253bmRzZnRkaTJyMDh6R1JobTcxZVNHZWcyTDVka04xd2RR?=
 =?utf-8?B?Vy9rR04wa05SaU9tK0JxODZOa1lrMFpqb3d3ZE5pcnhyaCt3bWR1WVUwRlJm?=
 =?utf-8?B?SzlQUjBaZnpmQ3ZNNEJDa0taZUU5RnB3d1J6UEVpNThiNnRXQnJvWmhwMkQy?=
 =?utf-8?B?VXM0bDFDRGttbWM3eDNVcjdyL1QvOTNVNGh2WC9QTWNueUJjM21TcnRGeHZG?=
 =?utf-8?Q?xHc5TRiTorHHqrnHN3B5HQATJ?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4269.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e5d6ca-8745-4ec9-1ddd-08dd5713fe34
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 09:49:13.6748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bQDA68WcFkpfbaJEKRdC6YrgDn3yHpx/2UPsevT7kucSC9xRAfC3+7tNjJM0a7l/D8W9ZpcdZeVK6deLJZ+7yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR18MB6063
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JZxGrVKV c=1 sm=1 tr=0 ts=67c0351e cx=c_pps a=YTelpZo7+Gv92UPfPuytLw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=-AAbraWEqlQA:10
 a=RpNjiQI2AAAA:8 a=20KFwNOVAAAA:8 a=M5GUcnROAAAA:8 a=1XWaLZrsAAAA:8 a=Ikd4Dj_1AAAA:8 a=rcABUdLl73FETjkaL40A:9 a=QEXdDO2ut3YA:10 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: LeCMc0AEr2QIsqFOfR3P4lqLydn72C5f
X-Proofpoint-ORIG-GUID: LeCMc0AEr2QIsqFOfR3P4lqLydn72C5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_04,2025-02-27_01,2024-11-22_01



> -----Original Message-----
> From: Jason Wang <jasowang@redhat.com>
> Sent: Wednesday, February 26, 2025 11:26 AM
> To: Shiva Shankar Kommula <kshankar@marvell.com>
> Cc: pabeni@redhat.com; willemb@google.com; parav@nvidia.com; virtio-
> comment@lists.linux.dev; Nithin Kumar Dabilpuram
> <ndabilpuram@marvell.com>; Jerin Jacob <jerinj@marvell.com>; Rahul
> Bhansali <rbhansali@marvell.com>
> Subject: Re: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field =
to
> indicate outer network header offset
>=20
> On Tue, Feb 25, 2025 at 1:=E2=80=8A48 AM Shiva Shankar Kommula
> <kshankar@=E2=80=8Amarvell.=E2=80=8Acom> wrote: > > > -----Original Messa=
ge----- > > From:
> Jason Wang <jasowang@=E2=80=8Aredhat.=E2=80=8Acom> > > Sent: Thursday, Fe=
bruary 20, 2025
> 7:=E2=80=8A20 AM >=20
> On Tue, Feb 25, 2025 at 1:48=E2=80=AFAM Shiva Shankar Kommula
> <kshankar@marvell.com> wrote:
> >
> > > -----Original Message-----
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Thursday, February 20, 2025 7:20 AM
> > > To: Shiva Shankar Kommula <kshankar@marvell.com>
> > > Cc: pabeni@redhat.com; willemb@google.com; parav@nvidia.com; virtio-
> > > comment@lists.linux.dev; Nithin Kumar Dabilpuram
> > > <ndabilpuram@marvell.com>; Jerin Jacob <jerinj@marvell.com>; Rahul
> > > Bhansali <rbhansali@marvell.com>
> > > Subject: Re: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new
> > > field to indicate outer network header offset
> > >
> > > On Wed, Feb 19, 2025 at 2:=E2=80=8A40 PM Shiva Shankar Kommula <kshan=
kar@=E2=80=8A
> > > marvell.=E2=80=8Acom> wrote: > > > > > -----Original Message----- > >
> > > From: Jason Wang <jasowang@=E2=80=8Aredhat.=E2=80=8Acom> > > Sent: We=
dnesday,
> > > February 19, 2025 On Wed, Feb 19, 2025 at 2:40=E2=80=AFPM Shiva Shank=
ar
> > > Kommula <kshankar@marvell.com> wrote:
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > Sent: Wednesday, February 19, 2025 9:00 AM
> > > > > To: Shiva Shankar Kommula <kshankar@marvell.com>
> > > > > Cc: pabeni@redhat.com; willemb@google.com; parav@nvidia.com;
> > > > > virtio- comment@lists.linux.dev; Nithin Kumar Dabilpuram
> > > > > <ndabilpuram@marvell.com>; Jerin Jacob <jerinj@marvell.com>;
> > > > > Rahul Bhansali <rbhansali@marvell.com>
> > > > > Subject: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new
> > > > > field to indicate outer network header offset
> > > > >
> > > > > On Tue, Feb 18, 2025 at 1:=E2=80=8A25 AM Kommula Shiva Shankar
> > > > > <kshankar@ marvell.=E2=80=8Acom> wrote: > > This patch introduces=
 a new
> > > > > field in the virtio_net_header called out_nh_offset, along with
> > > > > a new net device feature, VIRTIO_NET_F_OUT_NET_HEADER.
> > > > > On Tue, Feb 18, 2025 at 1:25=E2=80=AFAM Kommula Shiva Shankar
> > > > > <kshankar@marvell.com> wrote:
> > > > > >
> > > > > > This patch introduces a new field in the virtio_net_header
> > > > > > called
> > > > > out_nh_offset, along with a new net device feature,
> > > > > VIRTIO_NET_F_OUT_NET_HEADER.
> > > > > >
> > > > > > Currently, drivers lack a dedicated field to signal the start
> > > > > > of the network header to the device when performing checksum
> > > > > > offload and
> > > > > segmentation offload. This requires reading packet, which
> > > > > significantly affects performance in datapath.
> > > > > > Additionally, some hardware implementations requrie knowledege
> > > > > > of the
> > > > > outer L3 offset (aka L2 length) for inline IPSec hardware acceler=
ation.
> > > > > >
> > > > > > To address this limitation, we propose splitting the
> > > > > > csum_offset field into
> > > > > two 8-bit fields named csum_offset and out_nh_offset.
> > > > > > The csum_offset indicates the offset value from the csum_start
> > > > > > and may not exceed 256B bits(2^8) for protocols that use a
> > > > > > 16-bit one's complement checksum
> > > > > >
> > > > > > Following table lists such protocols and their checksum offset
> > > > > > fields within their headers
> > > > > >
> > > > > > +-----+--------+
> > > > > > |Proto|csum_off|
> > > > > > +-----+--------+
> > > > > > | IPV4| 10B    |
> > > > > > | ICMP| 2B     |
> > > > > > | IGMP| 2B     |
> > > > > > |  TCP| 16B    |
> > > > > > |  UDP| 6B     |
> > > > > > +-----+--------+
> > > > > >
> > > > > > The out_nh_offset represents the start byte offset of the
> > > > > > outer network header from the beginning of the packet
> > > > > >
> > > > > > This issue was briefly discussed on the mailing list in a
> > > > > > different thread, which can be found here
> > > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kern
> > > > > > el.o
> > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.o
> > >> > > > > rg_a
> > > > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.
> > > > org_
> > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_
> > >> > > a  >> > > ll_DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2-
> > > > > 40DM4PR18MB4269.namprd18.pro
> > > > > >
> > > > >
> > >
> d.outlook.com_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3b
> > > > > CCyFq0M
> > > > > > EWPS2176D_oSryc7cD-
> > > > > 0TRPs&m=3DjajIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_
> > > > > > nHyksxDbHI3UT0OFedi-b&s=3DMR9AX0Md9PFbZjQM-
> > > > > bwJAmO13ZwETRZJCm9qFIYDy6E&e=3D
> > > > > >
> > > > > > v2 -> v3:
> > > > > >  - Rebase to virtio-1.4
> > > > > >  - Addressed pending review commnets related to wording.
> > > > > >
> > > > > > v2 -
> > > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kern
> > > > > > el.o
> > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.o
> > >> > > > > rg_a
> > > > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.
> > > > org_
> > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_
> > >> > > a  >> > > ll_20250128142152.3662988-2D1-2Dkshankar-
> > > > > 40marvell.com_&d=3DDwIFaQ&c=3DnKj
> > > > > >
> > >
> Wec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3bCCyFq0MEWPS2176D_oSryc7cD-
> > > > > 0TRPs&m=3Dja
> > > > > >
> > > jIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_nHyksxDbHI3UT0OFedi-
> > > > > b&s=3DjvYZB
> > > > > > QtOwWyydI5lFvCFz4hF94jDmU70nROTU44Ma0M&e=3D
> > > > > >
> > > > > > v1 -> v2:
> > > > > >  - explicitly state that the out_nh_offset can be set only
> > > > > > when a valid
> > > > > network header is present.
> > > > > >  - updated out_nh_offset usage in the RX direction.
> > > > > >  - minor word cleanup.
> > > > > >
> > > > > > v1 -
> > > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kern
> > > > > > el.o
> > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.o
> > >> > > > > rg_v
> > > > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.
> > > > org_
> > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.org_
> > >> > > v  >> > >
> > irtio-2Dcomment_20250114171636.3175670-2D1-2Dkshankar-
> > > > > 40marvell.com_&d
> > > > > >
> > > > >
> > >
> =3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3bCCyFq0MEWPS21
> 7
> > > > > 6D_oSryc7
> > > > > > cD-
> > > > >
> > >
> 0TRPs&m=3DjajIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_nHyksxDbHI3U
> T
> > > > > 0OF
> > > > > > edi-b&s=3DrzyoQrmZTznG5V9N03u7bpPbG1uQC0WPFmypJJKS9r8&e=3D
> > > > > >
> > > > > > Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> > > > > > ---
> > > > > >  device-types/net/description.tex | 37
> > > > > > ++++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 37 insertions(+)
> > > > > >
> > > > > > diff --git a/device-types/net/description.tex
> > > > > > b/device-types/net/description.tex
> > > > > > index b546cd7..2a4aa66 100644
> > > > > > --- a/device-types/net/description.tex
> > > > > > +++ b/device-types/net/description.tex
> > > > > > @@ -136,6 +136,10 @@ \subsection{Feature
> > > > > > bits}\label{sec:Device Types / Network Device / Feature bits
> > > > > >
> > > > > >  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device
> > > > > handles packets
> > > > > >    carried by a UDP tunnel with partial csum for the outer head=
er.
> > > > > > +
> > > > > > +\item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the
> > > > > > +start of \field{out_nh_offset}  value. Device gains advantage
> > > > > > +by not reading packet to calculate outer network  header
> > > > > > +offset
> > > > > >  \end{description}
> > > > > >
> > > > > >  \subsubsection{Feature bit requirements}\label{sec:Device
> > > > > > Types / Network Device / Feature bits / Feature bit
> > > > > > requirements} @@
> > > > > > -592,6
> > > > > +596,13 @@ \subsection{Device Operation}\label{sec:Device Types
> > > > > +/ Network
> > > > > Device / Device O
> > > > > >          le16 hdr_len;
> > > > > >          le16 gso_size;
> > > > > >          le16 csum_start;
> > > > > > +        union {
> > > > > > +                le16 csum_offset;
> > > > > > +                struct {        /* Only if VIRTIO_NET_F_OUT_NE=
T_HEADER
> > > > > negotiated */
> > > > > > +                        le8 csum_offset;
> > > > > > +                        le8 out_nh_offset;
> > > > >
> > > > > Need some explanation why reusing csum_offset is better than
> > > > > introducing new fields.
> > > > Our objective is to preserve the current size of the
> > > > virtio_net_hdr structure,
> > > to ensure compatibility with the existing header size.
> > > > (unlike other features such as hash reporting). Given that the
> > > > csum_offset represents an offset within the header and may not
> > > > exceed
> > > 2^8, we propose utilizing the existing space to accommodate this
> > > newly introduced field.
> > > >
> > > > Would it be more prudent to add a new field for this feature ? Do
> > > > you
> > > foresee any issues with this approach ?
> > >
> > > It might have some compatibility issue. For example in the current
> > > Linux implementation, csum_offset were 1:1 mapped to
> > > skb->csum_offset which is a u16.
> > >
> > > I haven't checked all the protocols (especially the tunnels) but if
> > > one day there's a protocol that uses a csum_offset >=3D 256, it would=
 be
> problematic.
> > >
> > I agree with the 1:1 mapping between csum_offset and skb-
> >checksum_offset.
> > Given that the virtio net header size is already a scarce resource for
> > adding new fields, additionally increasing it for every new feature mig=
ht
> impact performance in the data path.
>=20
> New fields were added when new features were added. It doesn't harm too
> much as long as it doesn't cost more than one cacheline.
>=20
> And addressing this "issue" seems to be orthogonal to the proposal here.
> Once we get a better way to place vnet header, network header will work t=
here
> as well.
>=20
> > Would it be fine to add a note stating that when the
> > VIRTIO_NET_F_OUT_NET_HEADER feature is negotiated, checksum_offset
> cannot exceed 2^8 offset ?
>=20
> So if one day there's a protocol that uses a cusm_offset >=3D 256 with the
> network header, we need to invent new fields which are kind of not elegan=
t.
>=20
> I think it would be cleaner if we just introduce a new field.
Thank you for your feedback. I will send version 4 with the updated changes=
.=20
>=20
> Thanks
>=20
> >
> > > Thanks
> > >
> > > > >
> > > > > > +                };
> > > > > > +        };
> > > > > >          le16 csum_offset;
> > > > >
> > > > > It seems like it needs to be removed.
> > > > ACK .
> > > > Inadvertently included in version 3. Will fix up and send version4
> > > > >
> > > > > >          le16 num_buffers;
> > > > > >          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REP=
ORT
> > > > > negotiated)
> > > > >
> > > > > Thanks
> > > >
> >

