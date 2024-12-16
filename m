Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB614161302
	for <virtio-comment@lists.linux.dev>; Mon, 16 Dec 2024 18:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734375342; cv=fail; b=Xz+kDiBQdbOtRGhUwO5Tb5nr5QvYasxr15zZjohNnZr7NS1gaAJmW/nahB0aAkcSjka+HxB5VDbkA8cjVdUnq0fnd4vlophYpHf0k9lfaTAOKgnGCfRjNXhPhf/Q4luKQAOUEJmOh+KLfDlPvWRzdps8NT6wsJt1KDud0eGpp9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734375342; c=relaxed/simple;
	bh=xBCKwOtsI8Bc8pyixALj3ZfOYwFbFGnMFtB0jfD0LwY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DvdgkuQybVDl+OL7MmT6y0yOYRkBFxSLzMmpWJWRJblyya0tudJS17jxbh1L6pHgOk5dFX+bImeafhB0CrB+ydwSB/eLDYRXR2+IF7sAA/Y5uJJrZjFyN+Vu0pZNjW2Db1n61llY0GXjskZ18WqHAWrWRfqdLXbMczLXEfw8Gb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bUro+RgM; arc=fail smtp.client-ip=40.107.95.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bUro+RgM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hsacm3Nfx/JWwwTeUWzgQYnmdkRzFzkmJN8BzBXksIZ5lOenR1tqLWPGFQCwEGDIlGV55Bwu9EPS8R/IV3nB3F82fQp38BspGDuZQiqlkeR7Ht8a+B2yqGJoU8cgfpt8rxpjycZ49//beuAvope2uAttYGJWbOdKWPa5kj+GC4sh89yaKgD3W7VN7AY118/F5daZus6WUVc8REB/Yyq00dy1XdfB5kedOulHbhZDQyW+kBK7qB5AuX2zPCiuiP8Qfz+xb8tOcK5jfza25ynhxZuB9aIQvDQl2S/W953+SzXQsgkUM2sE4HtUidHonYb8T/Shh5j+SfXK3aysjvHkGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBCKwOtsI8Bc8pyixALj3ZfOYwFbFGnMFtB0jfD0LwY=;
 b=pbKpTtJ+EbWflO1+cYSOV95gI3/22mgz7FhNkoqGdoAnJqWBO5Oi0lDB6R0ZxNRWWmcs0encgfkrWpcFB0hQBgcREz6uU0Yp1KEEtyDDeFiwuNDcawpLQfgZySFasV8hINgjkCtGldkHodmPZ6yCBoX0v2b4EBofYdOJ1EAS5Bei4KRJ6ORW0xYnlNVoqqhbz1bp8c/S+QxQEcpIacgPsXuf3uF3E/o0M6d8ppZ/lsFUpu2YUpRzzk+7xt97qq05Ti3hhrIUCSA7nx6AlUHA8omP8pBFmoVJz4p0JYga8Tu49tpoEmKvE5wxfglIHFwRjqZ4ypipv1P7wtwfEey3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBCKwOtsI8Bc8pyixALj3ZfOYwFbFGnMFtB0jfD0LwY=;
 b=bUro+RgMOROpoCZns73vF6h+uhhbmEmxghAuq2uGiWRMIZfUOqmj5C42Jbi7Q4JKL+ZxDxLs9CD+N7Cbjk+eOaJfWsXlwULdiaJ56o41WfPuGkGy1OLxWzBNw4TOAtya2AK0yT7teZf2lP6l2Dr1AVAo3bMERGZzskDsOLSulRHSTX7dTCCbJAlBcpxYqdv8Mcehv2Gi3U7xBESiJbOQZ/4UWMVf/y402yJCRheMDVzInMcsx/2YMOeEYuh0Dysgvh+VdXmfTmMxt8FmfeP/rYgFmICEJxu1m3vhO5Rw17LHCmjtMHzFwqEd+8+NrrZbMYyRJs6Pyi5Py+OAk/+8rw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 18:55:37 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 18:55:37 +0000
From: Parav Pandit <parav@nvidia.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH 1/2] virtio-net: Fix receive buffer size typo
Thread-Topic: [PATCH 1/2] virtio-net: Fix receive buffer size typo
Thread-Index: AQHbS7QzfULeVNWPokaqSwmIXE/BCLLpQGtg
Date: Mon, 16 Dec 2024 18:55:36 +0000
Message-ID:
 <CY8PR12MB7195093184CEEBD1817DEB83DC3B2@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <20241211-v1-4-topic-virtio-net-rx-timestamping-v1-0-bdd882e7b53f@pengutronix.de>
 <20241211-v1-4-topic-virtio-net-rx-timestamping-v1-1-bdd882e7b53f@pengutronix.de>
In-Reply-To:
 <20241211-v1-4-topic-virtio-net-rx-timestamping-v1-1-bdd882e7b53f@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|BL3PR12MB6545:EE_
x-ms-office365-filtering-correlation-id: 1e4faf15-4c1d-43e6-b929-08dd1e033a6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NDF4cXpuQVYwUlpKK1lkKzJqMXFOeE9KUldIbGxNV0dnbUp5Y2VhVUtRRWVn?=
 =?utf-8?B?OU1pNEpLNCtaR09WZk83dGlzMDUvT1RBdWdMc2lkOUJwVExsQURCMDM2aXUw?=
 =?utf-8?B?dHBxNUplMDVjaHZucFNwUjJ2NkdYeDJXV3FLUXRRck9iazNuMHZVVUg2QXo4?=
 =?utf-8?B?enhKL01zUFlMYWFKc0xHMWptcXEzME5qZFMyeFh6SDNuaEJ0d1hEMG9NQkJX?=
 =?utf-8?B?SnprcG4vM2FSN1dBOHNxWmo4RXAxRUZ0RUJNMVNjTWZRWjIwQUxCVVdZZHpI?=
 =?utf-8?B?T2hFVjRUNHV0UEhva1NMb0pKWTRTVVZ1c1kwUGxmN09aZU03WlhxT1pnQURs?=
 =?utf-8?B?TEdVSklFbSs1UFNCY0tab1dDeFdFVE9nQ2pSUFJtOTFxY29XZnI3YmtBQ1lZ?=
 =?utf-8?B?N2ZCYUpQSFE0T2J4cFNEQ2NRVGU4aVFXSTc2SVBrYURSNEdnRUNYdHBsaENZ?=
 =?utf-8?B?cXQrMTVoV1d0WGZwU3pNbVVpeW0zWnR3QkljeTVRZS9IOVdoQk5MZDJXeUZh?=
 =?utf-8?B?Y0hDM3p6UUlzbDQzSlJoM2NSdmFiazhBeUs4bXFabVJVOStQN3F4S0c0OWNx?=
 =?utf-8?B?eW81a3JjSGo4ZVlDaU55YmVoTk0vSmVrTGpKYTFaZ0JIZTVBOWVrSEUrV25G?=
 =?utf-8?B?NkFyMFhQTzAyVXhZc00zWU1IZHU5WGk5dFVCeGREaXZVQkh2QzRlOEdraHZh?=
 =?utf-8?B?N3RaTkhQTWtwUWg0dVBDRUpsZHEvU29FcWk4WjVsUTNiYm45c3ArRlhWRzNK?=
 =?utf-8?B?UTh3MXJjUVkxTkkrTFg5YWdiWkIvb2VtUkpIbm5SM1FJdUVBSFR2NDJSSjIw?=
 =?utf-8?B?d0VtbS9YVm42U2RzWVJOS0VmNU1WZW9MQnR3ek56RndGRkF5aHVjMHRFMjBv?=
 =?utf-8?B?cldXL0N4a3pIQk0zMFpJZ1dKalJMZ2lKbTd1Y0daWmF2blA0STFoc2d5WSsw?=
 =?utf-8?B?S2hVczJzcDRUS2xXZ1c3dkFMcHp5MGtaRGtBZUNiS0VUNDJtZVBKMkFFWXJx?=
 =?utf-8?B?ZHBFeXZGSVowdjhCOE1xVGpydUJFdzhDa0cwQmY0dTNZT1NQdlNnTnREN2dy?=
 =?utf-8?B?bmgwbm1sMW1GNkhXM0gxeGtpOE1CSGdjNDlsdXFIV1BmRkNaUnpVWlJVWTNO?=
 =?utf-8?B?S2NlY1RlWFpyL3E1eUZDSzVGSGRvcldDRmw5cE1JYmlKckdHbmdhWXlWcUJ1?=
 =?utf-8?B?TkN2OUoxQjZLZ1cwTzBmSmFrVHBTSWtDTGRVdXIybzRhMFYrZkE2bVREYTRt?=
 =?utf-8?B?aHJVRjJCcXovL1hDMzg5Y2g0OXcxT1huRXBYc1Y0ZGg1VWk5aEt4ZSsybUkr?=
 =?utf-8?B?MHdNY2ZOK1FFd1V3QkVhKzNCekRITzBBdnIweDRwdnptOC9HRHJMU2JjWFc1?=
 =?utf-8?B?QnFxTXV0T2hHNkZYcTd1dU53MTRiOTd3TEJxblZMcUFpYlFWbU41M2NVVEZu?=
 =?utf-8?B?dUhTdzFETG85UElnL1ZlYXh4MjFOWHdmVnY2dzBRNnFOcXB4VWFBblV6MDJV?=
 =?utf-8?B?N2RWdXBQNW5kNS85ckVadGFyUmR3Q056R1FhclpkcnZ2d0p5Q3dPRzJVUXJG?=
 =?utf-8?B?YVpFd2JLcUpjVy92Qi9WVU1LanNlRG1KTzFTY0dZbm5OcjMyeE1yNHJ0OFhz?=
 =?utf-8?B?Nm44dDBMWG9YbnIydWR2OUVkbmlQdkNiZHVlUmswdTdKZk5iMWdsZjYzUDJh?=
 =?utf-8?B?b2xBc1U3KzBYRXJZSG1KUlVtZWU4aHRvNWpudWlUSDhMVjFNbzcxMnJFdHpM?=
 =?utf-8?B?TkRRSGRSUTVkNi8wbGgzNlJNemRQcmhDR1pxZjF5Rzg1Y0JNSXROcWpRVkVy?=
 =?utf-8?B?VEdkTTEzTjI5c0pCb3lQS3JzMHFwUDhzdFNrT2xGbG52bk1Ib0JvQmNzbElr?=
 =?utf-8?B?bkMrRU1ZYmJlbTlsU3NmeHZDSVhrYURlUzg4MlJhVnVOV1J4SWZycFI5S1Zr?=
 =?utf-8?Q?sBGxZbo+D7iMb5CUoAqrOMfBbZrKQoZa?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dFJqbEhUNklHamx5UzlvMWRiMDdKT0JTTlg2SG1lRUx5UXF1K01Rd3EzZWlM?=
 =?utf-8?B?VHVyOVZjcXNRcmgwUVdiUEtESm9oWVJPWklVMEdSL3BqNDVub3MxWGdZVVFX?=
 =?utf-8?B?c3RWSlRoY3p3dzBlbUFVVjU5cjlNN1BVTFdoNHkxdDNHREFCOWgzdFFZQWl0?=
 =?utf-8?B?eGZYcTVMNmRBYjhCelBid2ZlSUpsdUR3TFdJbWNOaTBDekIwMFVtbnFhd0ZJ?=
 =?utf-8?B?Qm15TXFtdnk4UnlsUUt0aGJ0TzlHRllPMVhPWTdqdVNmRzFVa2V2UGptRmhF?=
 =?utf-8?B?ZjlQOUh2YXFxZkN4RkEwazF5ZlVPU2ZieTMybmdXY21EQkNuMDM4d1crOXNI?=
 =?utf-8?B?TDdwc3BDY1VyNUxvZlFrZmpUVG4vaDlRODN5UjJuSlJvZFAzMWtVS1RySVVh?=
 =?utf-8?B?YmVhSjVtdHdWRHVIeDFGeGJ5UlMvb0F1Q2laaVpJY3hlVDRkUEJuaUxYWk5F?=
 =?utf-8?B?RU9MbGY5YzNvSlh4RWMrdFh3RGkyZ2dCUTVFM2szU2VnK0tsem9rc21adEtW?=
 =?utf-8?B?QjM4RTVSUzVoQWt4QjFURG1KNGZVbVRLcHJKYXFGa0RwYk9kRkNOYjZ3UEVq?=
 =?utf-8?B?VlpQdjVYR09qRUJYaURzVENSWE8yZm9lblVZY3h2RXdBc0xtU3dnOUxsQzdo?=
 =?utf-8?B?Y2tjTkNteVF0UHdETWxuVGZSN0p6bjE0RFAvRW93dExpaHdGbndyTkVOZTRn?=
 =?utf-8?B?M1k5MDJTUjJvNE4wdi9YNmhXSEJFWDZiWmFVMEhMRUJITlo2T0dFL3BvVmxO?=
 =?utf-8?B?QWs4WUFHeHUxWmFGYnJSR0ZSSk16dStIU0toOWF3RlpGbTVhUlRuMWJPNitN?=
 =?utf-8?B?QnlPVnFqeEwzRW95ZGNpZkhTR1ZuYnNxVy9Wa3NSVTJZQlpCN1B6azgwdmF3?=
 =?utf-8?B?TDdDY1J4aE01NGFDSTdybERudTNpaGdSZ2hFeXFVcE9OUkM3WjB1MG5DdE9a?=
 =?utf-8?B?c3NFYkRCS1NmWkh6VU5PUWdhcHdVZHVuRW5BdG5FRmN4NURsdHl0UU55dUor?=
 =?utf-8?B?NTBaYkxIR3lvNnRqajd6dnZCQ0FHK1B1Z2dQVDYxUHF0U0QvNDNIcWlRRkxq?=
 =?utf-8?B?N05kSWdhV051NVZvdVQ3L0xzN2NOalNFRTFRZW5YMWlGdWVHSjNjYSsvUnN3?=
 =?utf-8?B?cTNBN0l0TXM1cmFZaWk3UGN3M1ZrMGVOZlVjZGRNajc1b3ZZa3U0WUlwZ0hj?=
 =?utf-8?B?WXFGbHowRExZeWwzRzc4WDFWNDZkQ1k0V2NWemRnUnVjK2VIUWNWRHBtVTRU?=
 =?utf-8?B?MVU3a3lmUkhRWThXdW0vL3NYVUFWMW1CT1hWcUJWTGpvMUxhYnBjTFM3SHZr?=
 =?utf-8?B?cXV1K2tTMHc0TDBMQW5CU0N4NGtqT215MnFZcXQrVGdTYm5saGxuWnZ3YnZW?=
 =?utf-8?B?R0NRMzR1R3QyUk9sMzA5K0FkS2dkUlREMWlXVDZ3bmtzYTVCR1I2R01OWW5s?=
 =?utf-8?B?QzBMUmtmVmRlTlNpYmViV3RkazdOSC9pQWwwYzFDc1NDWG45VTV3ZjN6dVh2?=
 =?utf-8?B?S1BqUC9pT1Z1QWNQZE12YlhYamcxcTJ4ZXUrQjNpYnJPWHJwRlFyOGh4ejAx?=
 =?utf-8?B?ZHkvSkQzVjA5Q1Z2SWxORThlcUdCWTRtL3hlZm9hSXBITW5pV2IvZ0ZBTVR2?=
 =?utf-8?B?WUNFalZZSWdLeHRFcVh0LzJWQUtUcXM1aVpYSkswUUNWT0FhVnVUbDhZeEw5?=
 =?utf-8?B?M3dBNFArUFBaS0NucWdVVlM2UHpLeFgxYTBHdGZHSmZvL0U2c083SjduMnpx?=
 =?utf-8?B?UktYZmdLZm9TaG9mOHM4aXpncVJHaVVKMEVyMUpybDV6b2NPNHBTelIrWmsv?=
 =?utf-8?B?cy9LSkJyMnQ1UFFHUUR0QTN0N1dlUzNiZ3J0NVFjVzJEU25wSlRVQS9zb2Jv?=
 =?utf-8?B?a3AzYWRDUVdLOTBGNnR5WWF5d0dTNUREMlpGNU16WnRSczV4akZocHhvSXdn?=
 =?utf-8?B?aE10U2dHNEZoc1AyRzdQN2JDYVJFSTJiTE12NkVYMm1WZkxaTGRsRTQwMTNq?=
 =?utf-8?B?YmtBWkFYbWV0cXFLWmN6K3BLNGpzM1FQMTBaUmNqVUoweG9xcDRpbkthRDUw?=
 =?utf-8?B?ejhqb1cySHd0WjMyYnRGZEx2YWpOQlJ1WFhxNzVMdEw2NEV5QXdlZDNHNWlD?=
 =?utf-8?Q?kCrI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4faf15-4c1d-43e6-b929-08dd1e033a6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 18:55:36.9785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bNEYXLi1MZopEOfaZPph2zA1n4DVwe/y6Y0f6/3TDNQLvyoTL6aAIlQrgoVxIl/OId5FK9EzsHfJNL5znwkhGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6545

DQo+IEZyb206IFN0ZWZmZW4gVHJ1bXRyYXIgPHMudHJ1bXRyYXJAcGVuZ3V0cm9uaXguZGU+DQo+
IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTEsIDIwMjQgMzozNSBQTQ0KPiANCj4gVGhlIGNv
bW1pdCAwMDgwNjgxNTM4NTM0MGRkNDExY2M2N2RmM2Y2ODM3OTM1YmI1ZTI2IGludHJvZHVjZWQg
YQ0KPiBzbGlnaHQgdHlwbyBpbiB0aGUgc3RydWN0IHZpcnRpb19uZXRfaGRyIHNpemUgY2FsY3Vs
YXRpb24gZGVwZW5kaW5nIG9uDQo+IFZJUlRJT19ORVRfRl9IQVNIX1JFUE9SVCBuZWdvdGlhdGlv
bi4NCj4gDQo+IFdpdGhvdXQgVklSVElPX05FVF9GX0hBU0hfUkVQT1JUIHRoZSBzdHJ1Y3QgaXMg
c21hbGxlciB0aGFuIHdpdGggdGhlDQo+IGZlYXR1cmUuIFRoaXMgbWl4IHVwIG9ubHkgb2NjdXJz
IGluIG9uZSBpbnN0YW5jZTsgc2l6ZXMgYXJlIGNvcnJlY3QgaW4gYWxsIG90aGVyDQo+IG9jY3Vy
ZW5jZXMuDQo+IA0KPiBGaXggdGhpcyB0eXBvLg0KPg0KUGxlYXNlIGFkZCBmaXhlcyB0YWcgbGlu
ZSBhczoNCg0KRml4ZXM6IDAwODA2ODE1Mzg1MyAoInZpcnRpby1uZXQ6IEZpeCByZWNlaXZlIGJ1
ZmZlciBzaXplIGNhbGN1bGF0aW9uIHRleHQiKQ0KIA0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmZmVu
IFRydW10cmFyIDxzLnRydW10cmFyQHBlbmd1dHJvbml4LmRlPg0KPiAtLS0NCj4gIGRldmljZS10
eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4IHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RldmljZS10
eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4IGIvZGV2aWNlLQ0KPiB0eXBlcy9uZXQvZGVzY3JpcHRp
b24udGV4DQo+IGluZGV4DQo+IDRlNGZmZGI2ZTA0ZTM0NmFmNDkxZWRmNjU4ODZmYTA5NmU1MDZh
YmMuLjA4NzM2YjY4MDRlYWZiMzAzYTVjZmIyZjINCj4gN2VjMjAwY2VjOGJkOTQyIDEwMDY0NA0K
PiAtLS0gYS9kZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleA0KPiArKysgYi9kZXZpY2Ut
dHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleA0KPiBAQCAtNzg5LDEwICs3ODksMTAgQEAgXHN1YnN1
YnNlY3Rpb257U2V0dGluZyBVcCBSZWNlaXZlDQo+IEJ1ZmZlcnN9XGxhYmVse3NlYzpEZXZpY2Ug
VHlwZXMgLyBOZXR3b3JrIERldmkgIHRoZSBJUHY2IGhlYWRlciwgcGx1cyA2NTUzNQ0KPiBieXRl
cyBvZiBtYXhpbXVtIElQdjYgcGF5bG9hZCBpbmNsdWRpbmcgYW55ICBleHRlbnNpb24gaGVhZGVy
KSwgb3RoZXJ3aXNlDQo+IDE1MTQgYnl0ZXMuDQo+ICBXaGVuIFZJUlRJT19ORVRfRl9IQVNIX1JF
UE9SVCBpcyBub3QgbmVnb3RpYXRlZCwgdGhlIHJlcXVpcmVkIHJlY2VpdmUNCj4gYnVmZmVyIC1z
aXplIGlzIGVpdGhlciA2NTYwMSBvciAxNTI2IGJ5dGVzIGFjY291bnRpbmcgZm9yIDIwIGJ5dGVz
IG9mDQo+ICtzaXplIGlzIGVpdGhlciA2NTYwMSBvciAxNTI2IGJ5dGVzIGFjY291bnRpbmcgZm9y
IDEyIGJ5dGVzIG9mDQo+ICBcZmllbGR7c3RydWN0IHZpcnRpb19uZXRfaGRyfSBmb2xsb3dlZCBi
eSByZWNlaXZlIHBhY2tldC4NCj4gIFdoZW4gVklSVElPX05FVF9GX0hBU0hfUkVQT1JUIGlzIG5l
Z290aWF0ZWQsIHRoZSByZXF1aXJlZCByZWNlaXZlDQo+IGJ1ZmZlciAtc2l6ZSBpcyBlaXRoZXIg
NjU2MDkgb3IgMTUzNCBieXRlcyBhY2NvdW50aW5nIGZvciAxMiBieXRlcyBvZg0KPiArc2l6ZSBp
cyBlaXRoZXIgNjU2MDkgb3IgMTUzNCBieXRlcyBhY2NvdW50aW5nIGZvciAyMCBieXRlcyBvZg0K
PiAgXGZpZWxke3N0cnVjdCB2aXJ0aW9fbmV0X2hkcn0gZm9sbG93ZWQgYnkgcmVjZWl2ZSBwYWNr
ZXQuDQo+IA0KPiAgXGRyaXZlcm5vcm1hdGl2ZXtccGFyYWdyYXBofXtTZXR0aW5nIFVwIFJlY2Vp
dmUgQnVmZmVyc317RGV2aWNlIFR5cGVzIC8NCj4gTmV0d29yayBEZXZpY2UgLyBEZXZpY2UgT3Bl
cmF0aW9uIC8gU2V0dGluZyBVcCBSZWNlaXZlIEJ1ZmZlcnN9DQo+IA0KPiAtLQ0KPiAyLjQ3LjAN
Cj4gDQpSZXZpZXdlZC1ieTogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KDQo=
