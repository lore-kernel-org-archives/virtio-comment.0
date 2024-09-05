Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF50126C1C
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725520596; cv=fail; b=mIkb728QQRatpiz7t3/CiPis7T00iT50orX9w9GKYQPVtdyx7r6fBEGwbX+kQyH5CQzwRIcOM0WidHMbZhAmfyeV2mRYW53GyfJUNsbZnuXKj7EX/IpXTkXzsm0QoSM+427QArG3cFvdv4msRc7irEofsDWgF2hISsQe6/+Rbws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725520596; c=relaxed/simple;
	bh=qXPAbUrWhJFIX1AtjQ76uf0CCzgVt+eusKiXnDbVe4s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KFfVsoYsZVPCN1hXZqwxloCu44UfVa8eF0cP7dlfBh17H/G24uG5zJXRqU+SJl+WS0qTIXsWg/GQsy7EDKh8UtpyB6CmjxoBjQ7zn1ZhCxJFDNY92X73bNFBMGpuVMfi19c26xWJPvsQtW80cBOer8+nk3T0PE1KyY16VJ+4SxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o0sbckrR; arc=fail smtp.client-ip=40.107.95.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o0sbckrR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gV7P2gU6WYnA2FbGFVB02O+IZT86DYNbDZa0xdBkLf2RALzix4t5LE332+O7t2nBRvQfbAtC0n2qfb1EbXqT5mHmgEhGRJ6r0yqCb/Uh0mrDbh+Mkd7Lcpq0BI/DirioybYXwF9h1bNiYHLIQcvNEVVl65jQgd4wwPth0HJJ/zJYf+twIUPtMNqhK7HTHig0rDL4ErAB5mpe8xsHoXzqP6G8CdzoDe9tUvpA2uPlXgo8rY45V+8spUYR2/YQvdbcJBHLy/+wmcGLrhELsl+7u39s+KILJJKncwbYteQWLoGO0R29FzRkt7XMOUCtE2l7Um1WWUmr+hMcmUV8tOdazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXPAbUrWhJFIX1AtjQ76uf0CCzgVt+eusKiXnDbVe4s=;
 b=q+Ll7+WhzkULHeBQiRKU/2/e5qy8rLJyHYZa/nh9JUL0lsGujMYBHQdduvPmTnto+B6n3VzmuHFkneShetX9Pd7xeK6rQd3PphpE2aj8GZe+efvabbWaWdK8fNuQJLnby0gJtfV6fVgwzgI8poX4Bh2AoKvZS/+/JU2CoUAKrJvChA3kLLxy0f/JH4nR8AAu5r04jHJ+Qg8H6WSRSlf8iKUB9Lg5uYAvnL+07RqsACY5EYJ9EvS9XaN+A0f8Dy+BCVR03LRFEqu5FH1UgeVTBJji5ejy6gIuPDNlzo0XKf7oBr+tItUYIEyoIP7o1bgH2Fxtkkul4InyY4kMel5SLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXPAbUrWhJFIX1AtjQ76uf0CCzgVt+eusKiXnDbVe4s=;
 b=o0sbckrRwXzPzOQqUpCFufp3hxTaQOTBox1Dz5S6a8YglF4YRO9rWE75wYfcWgmipwfKAk49Ai6tXNTTQn2wiW7t2zTHJSp5oYZy/lng2nfkUQcgt7C8DkniZPtah5AZKVs2pTMO4lzfDzW5fGQs28HhcfqavvfjuU+Wtm7MXo1bdF49/k2GNSHYJd3uW4Pg5VrfjWWzwiMpVNL53IGc6ldwxwuD+I8q5MlbVfte2n7CLCn8xE9lXdYQIOH6Ep7Slqoj39aVZwJmQrGWvkBVAwQOe1CypJZ6o3Gs7W2NyX05SlN7XjoTwdVEHB0w+Q2r0EeSPFJ+OjEOyMe3X2vFRQ==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by PH7PR12MB7161.namprd12.prod.outlook.com (2603:10b6:510:200::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 5 Sep
 2024 07:16:28 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 07:16:28 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
CC: "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?=
	<eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA0LrAIAAAIWAgBcwMgCAAAT60IAGsmcAgAALPgCAAAWd4IAACFyAgAAAXACAARSqgIAAD3sAgAApZ4CAAAIfAIAAAfFAgAGafYCAAABVMA==
Date: Thu, 5 Sep 2024 07:16:28 +0000
Message-ID:
 <IA0PR12MB8713065A3CE6752084FCC6AFDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
 <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <IA0PR12MB8713995E39DD585341C47520DC9C2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <ef72f0af-3a04-4a79-9f9d-c6dd7fb24d53@amd.com>
In-Reply-To: <ef72f0af-3a04-4a79-9f9d-c6dd7fb24d53@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|PH7PR12MB7161:EE_
x-ms-office365-filtering-correlation-id: a2735cd7-870d-4f2d-8bbd-08dccd7aa8df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VkFEYnpwSW5hMGNkZFRKOHFJakhrRStZaHJuV0FqMlBwdm5zVGhUT3greXQ0?=
 =?utf-8?B?TDVPSlhkK3hqVFpOSVRYT2QzRzJtYytuZFlESUkycmp0UXdtS0pGRTNTcVRx?=
 =?utf-8?B?QmhNajZTbzZXQytyMHJPakZqMXJMSDRFNG1RTjA3WFRkZ215bWpXZjMwb2FD?=
 =?utf-8?B?U0kxUCtoT3I2YXplY2FiRmkvb0dxclJMaXhkdDBobzE4Z0NPbGIrekFWTFI4?=
 =?utf-8?B?QllLUFFoNndGWEdCNTJuMVZYQysxOGY4bVNvTm1kV0dIa3lDejVwK05STzdk?=
 =?utf-8?B?akYycjVyZWJLV0s4ZmdlNldiVTFqSThveTBUS2svT3E5RHdlVVNsQi9aSFly?=
 =?utf-8?B?K3llYlMxUy9UQmc0WmhpK29zeWFkeGdScnN0dkMxcWlpMkI2YjlOb1J5VVlm?=
 =?utf-8?B?aE1hREVSaEN3VDlWeXcwWndFcjBvTTRCM2kxMkRQYnljY0MzaUd4ektCT1I1?=
 =?utf-8?B?K0xZS0ZNZmRRTDd4TllSZGJ1cEJ1SERtMnBQRFFNcDg1dmV6dkJpMWxiUmEw?=
 =?utf-8?B?YUxld3V4bXR0bC95UmxNKytNYWNnS2RZQXNJZEdrcnJ5U2xaRWRlNnppWG1S?=
 =?utf-8?B?WFZYbVFXMkFqVUtOY1YwOUZyeExNKzRNQkhyQll6MFpDRVNBLzZscGU4cW5J?=
 =?utf-8?B?TS8rTVNTeUQyUWphK1lwZDd3b0ptbHU3dm5JUjNxNDE5TUk3SndnajQ0ZFdt?=
 =?utf-8?B?UkRzTU1IK0FoeGRSc0V4WXYwMmFtRFdXVitjTkZyY25wSmFxSjZGUTdXTUpa?=
 =?utf-8?B?Q2lvZjBPLzhwVFI4cVFwelQxaDBsRHdSTE9VZ3RsdHFnWE5aWGJ0MmtDbkpK?=
 =?utf-8?B?VVhUeU1nQi9ORWtpUEVhVWNPZXpwV1FnenExTDBqWTk2ZVZuNm52YTFPTUZ4?=
 =?utf-8?B?czZxOHFVRFdHMHppODhBRlF4eDBXcnM1N0NrMzY1Y3daWHllakNMbFl6QWhj?=
 =?utf-8?B?SlRTMVJyc2J0ZTdlL2ZaRWZnUmFOZ3UzL0EwRTE2NW1ZNUs5cGN6TUpENjF1?=
 =?utf-8?B?WkxlVUY5OVk3RzREa2ZzenQrUGQraHVZWTNLZ3ZQOU1UREpkVTcxNzNxU3g3?=
 =?utf-8?B?SHZ0V2hVS290aTFWMTNySlpucC9SZGRlanNuY3pXMlg4RG4xRjVkb25VdUdD?=
 =?utf-8?B?UlRrL0xRREluYlV0bkNmVUdKQmRRU1FBdnhyeW1FendJd29rWVgrUjJrZ3dW?=
 =?utf-8?B?SXV0dytuanRqRU00VERlWkVnS3ZaelFLdXFYcnhuYThOT2d3ZXIzZWRVNk42?=
 =?utf-8?B?QzFNbXFFb0hJYUoyYVQxWDNwWkw5UHhCL1FQeW1tZklzbzgzQmJLclB1TzVk?=
 =?utf-8?B?SlVIQ1crWGxYaVQxeUpIdVI0S0pIbHBiNUo5K1hXZHVPVFdYZml5Z08xY0ho?=
 =?utf-8?B?ZDhLZmo5M3JsaU40K0tNdzJIVkhCK0ZkdlFFcTJXVHRJNGZhZ2lrSXlJb1BR?=
 =?utf-8?B?ZjlraFFhVlFGRHlndHNSSTVMR3FUb2tiZHE4ZzVldXdMYWRSdHlOdjU0VGN6?=
 =?utf-8?B?QUpRWU1JSnZORzB4VG1BaGRrc2drY1JiTFRBN2szVmlLR043NndIa1ljYTgv?=
 =?utf-8?B?OERxSXhMbjZpQjNVL2tRL2dnMVlnUklVT0R4K3VudkF3dm9JaGUrU1grK3NH?=
 =?utf-8?B?LzlOekREM0l0azg1cTVDVjh0Z0taMnBPVko1SklJR0tKUWlVVDdwNm91SVQ3?=
 =?utf-8?B?S3JFbGhoZkNnVUhGRjJYcFdUNnB3dnNURG8rR05JSVhjRThJSUYvZ3JDQlFs?=
 =?utf-8?B?a2E4RG5FS0tFY3pvRU9CbVg5dGNxQk5LMERnZjJSY0o0bWJzQXZUeWtTdUQ4?=
 =?utf-8?B?OGN6Y2ZnNXNzNHVSYy9TTFBmUm1nb1k3TDdsOXVDeEpKQmIrdFhHUEFnR2ZJ?=
 =?utf-8?B?YXFVWGZMcTlKbFg1ZWsySU0vbmtWcnpHSGN0bFBmWS9jdXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d2ZSSTFGWDNJUHNNV0NhWjMvaW9JTWhWcEFmcUxoMVkwT3g5S1pXS2N0eFBy?=
 =?utf-8?B?Wk05SGpUby9FZUpJOUpkZWVpS0s1OUkzYWlBaFI0eFR5VEJlUmFCMTRCc0lp?=
 =?utf-8?B?VmphSUpjWVcxdDhuWnJzZWpLZmcwaDFPcytsNnUyVEFrcUtRK05jKytRV25z?=
 =?utf-8?B?bU5HSGhyRlZ3M3RlczVZdklZSnB3RGZ0RnZTNlhJaVdob2JVQmVnRVBUVVZY?=
 =?utf-8?B?Mm1MZXBVMG9KL2FoTjhEU0V2cHBkdDc2Y1VPd0RBNUVDWm91ZDljZERubWpi?=
 =?utf-8?B?N0ZXeThwZzJHaFJDQkFtRm0xZWJlMU85VmdHZUMwZUtnVnFIVEVZbURxRVpp?=
 =?utf-8?B?V2lmSkRvNGNiZGdDSmJmSE55aGdyeGdnWE50T2U5eVRMdU1TVWJpS2djOEpM?=
 =?utf-8?B?UXB3a0U2MSt3S3c3SVBtb1VTWk93aTVZbzV4SlZEQkpZdkZBb0FGZlVRSTRs?=
 =?utf-8?B?K0tPOSt4N0tSVWpOTjhvejVRVGhzdmdha3NoOXdGUTNTekR0OUtpZ2UwSWhn?=
 =?utf-8?B?QUVvOWVxa25qNGV1Zk5oZ2RDT3JpR0VqaUZsRHRYd3BlTUFGMDFZbnJ4VlV5?=
 =?utf-8?B?TmdwTXVaa3RDamMyY1crbWpmR0R4VkN2NjBYRmZ0K2g2dVdMMVBqWVhxeHBw?=
 =?utf-8?B?SVFNZUdyWlRvL2tLblN2QWRaODBZbFpjZ3ZGZWxBR1pZWk1ta0I0WGIrT3FC?=
 =?utf-8?B?bGQzTHJlMlFvZS9XSGxkQnpKMm9jSlVWUXA5SGc3YmNMRFhEeHEvVUxpelAz?=
 =?utf-8?B?LzZrdVlFbGpGc1doYmZrZ213ZlhFQ2pITXNGOE9CV3hUVjZxdjg0VUVoQzA0?=
 =?utf-8?B?MTJNZmZrbW5LZHR6TDNWTnM4b0lYT0dFWTU4WGFuM1RzOWNDT0NaOGZpMis4?=
 =?utf-8?B?ZXYxUGlvbjhnRXhMVHZvQ2Rzb0M2alRzNkdtYVg3YW5xZ0xTdDVzQ0d3eTVZ?=
 =?utf-8?B?bFZSNDdTaWVZbmJNcG9lNVM3MWcralNoTC9HeDlQby8vaVlPK01EaTNNVHJE?=
 =?utf-8?B?K2JaaXpKTlpUQ2FFcEJKZXVuMkw5c0JtYTIrczJ0T1paWE9aTjBISitYYXRY?=
 =?utf-8?B?djFVOTUxbGZXN3AvSnBjR0pQZXBZbDlZd3QxK2NZZ2VYcFNMVGZ4U3UweDFC?=
 =?utf-8?B?ekpOOHNRZEltUUx6cFMra25veVM3UHRncGplNzZ2empRT2JYbElraFJLVUNy?=
 =?utf-8?B?dHpsYjJOTGNoa08wVEFVL1U5RDVoV1NlRE9wZDF0VXQxaDZKTmdNdWdEZUlF?=
 =?utf-8?B?SE84ZnhpaFhJVEdrZkQzbTZMRUpKbUVGcm5jaXdKWndmN3JVWDVuTWZJM2d0?=
 =?utf-8?B?dGlyQ1RmRm42b0xQMlNLZXdZQ0gzVGdHT0NXVzZVc3h2L2UrQmF1VDFSNGEx?=
 =?utf-8?B?S1J6Z1ZJQUIvT3pKWnAremcreUx2TFZsTkl2N0d2cTg3ZUozdG5jVGlzczh5?=
 =?utf-8?B?cEFnMENKTGRoNFljL0wzQ1lnbGVBQmRsb0xjNUZCU0REdWEzLzRSNDg0a0FV?=
 =?utf-8?B?SE9XdXdONE5HOEt6R1R1SDZ4N3V5M0VXQnpxeEtYQi8xMzB6NFZsU3Flazdv?=
 =?utf-8?B?RlVVaXovcmx2ZWVrQ016K1ZudWo3UEFRazRqUzFrcU45Y2pySVJHMFo3L3lC?=
 =?utf-8?B?bWIvY1lNTnN6WHVnR3pTVUhpTUJtM1FlVEg2NHBSMVBvTVlzN0ZWbUhyMDln?=
 =?utf-8?B?U1U0WWR5Q0FQd3ZLMzJxNTFWcDIxUFFMWVExNU1yZ2pkQ1Bib3JTaitDc0ta?=
 =?utf-8?B?ZVVQeFNWSmhVTWd5bkpxMWZSNFcrVVpnK1dxSWUxM3Qwdy9SQ3ZGWXliNjhL?=
 =?utf-8?B?ZmxLcUNwb2dYYzZvZGp4aTV3Q2dFMlhsTXJkTHZZWnBGMTIzaENjcDZ5TXJi?=
 =?utf-8?B?Q0lUN0FSUG1ZaGk2WkpJL3lqNFVFcUNmdktkZVJ5RVllQ21ZQ0ZJUEkyKzlw?=
 =?utf-8?B?OEV0am1tOHJTbUFxSE1iaHFmaENQZytybjc2aVpSa3lEV1RmUnBHdWFscXlr?=
 =?utf-8?B?aXJZT21Bcyt4cWkyNmZEMFlxeW1laDYzUVdMc2FIanNoUEJiMEp5RmtvUFdu?=
 =?utf-8?B?K2I1L1kycGREZnl5S2VPa0RZamI2N0lSanVPK08wVnR5NFB0a2dRZ2s3ajcy?=
 =?utf-8?B?TlI4S0V2WkVDRDd6ZVB1M3ZpTkthK2dQVmhiN0pCZE9pdHdJZ3I1SVY5bHFj?=
 =?utf-8?Q?QVMlXtsrOD0qyONtkysjU5LVeZg64X0/tqnU90mynJNI?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2735cd7-870d-4f2d-8bbd-08dccd7aa8df
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 07:16:28.2595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bEwp8fDbKxMJzJdsv+YyUXJ88jpduiklbjSWdymg9JAvMNPtVyRB4Fb86vsUUOGUcU0kWC0zV1bmUqw8GOyk9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7161

DQo+IEZyb206IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGFtZC5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBTZXB0ZW1iZXIgNSwgMjAyNCAxMjo0NSBQTQ0KPiANCj4gDQo+IE9uIDkvNC8yMDI0
IDI6NDYgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogWmh1IExpbmdzaGFuIDxs
aW5nc2hhbi56aHVAYW1kLmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgNCwg
MjAyNCAxMjowOSBQTQ0KPiA+Pg0KPiA+PiBPbiA5LzQvMjAyNCAyOjMxIFBNLCBKYXNvbiBXYW5n
IHdyb3RlOg0KPiA+Pj4gT24gV2VkLCBTZXAgNCwgMjAyNCBhdCAxMjowM+KAr1BNIE1pY2hhZWwg
Uy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4+IHdyb3RlOg0KPiA+Pj4+IE9uIFdlZCwg
U2VwIDA0LCAyMDI0IGF0IDExOjA3OjI1QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6DQo+ID4+
Pj4+IE9uIFR1ZSwgU2VwIDMsIDIwMjQgYXQgNjozN+KAr1BNIE1pY2hhZWwgUy4gVHNpcmtpbiA8
bXN0QHJlZGhhdC5jb20+DQo+ID4+IHdyb3RlOg0KPiA+Pj4+Pj4gT24gVHVlLCBTZXAgMDMsIDIw
MjQgYXQgMDY6MzU6NTlBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+Pj4+
Pj4+Pj4gQnV0IEkgZG9uJ3QgbGlrZSBpdCB0aGF0IGxvb2tpbmcgYXQgdGhlIHJlZ2lzdGVycywg
b25lIGRvZXMNCj4gPj4+Pj4+Pj4+IG5vdCBrbm93IHRoZSBkZXZpY2Ugc3RhdGUuIEhpZGRlbiBz
dGF0ZSBpcyBiYWQgZm9yIGRlYnVnZ2FiaWxpdHkuDQo+ID4+Pj4+Pj4+PiBXZSBoYXZlIDQgc3Rh
dGVzOg0KPiA+Pj4+Pj4+Pj4gc3VzcGVuZGluZy0+c3VzcGVuZGVkLT5yZXN1bWluZy0+cmVzdW1l
ZA0KPiA+Pj4+Pj4+Pj4gc28gd2UgbmVlZCBhIHJlZ2lzdGVyIHdpdGggYXQgbGVhc3QgMiBiaXRz
Lg0KPiA+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+IHdlIGNvdWxkIHN0ZWFsIDIgYml0cyBmcm9tIHN0
YXR1cyBidXQgaXQgc2VlbXMgYSBiaXQgbXVjaC4NCj4gPj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IFRo
aXMgaXMgd2h5IGxldHRpbmcgdGhlIHN0YXR1cyB0ZWxsIHRoZSBzdGF0dXMgYW5kIGNvbnRyb2wN
Cj4gPj4+Pj4+Pj4gcmVnaXN0ZXIgdG8NCj4gPj4gY29udHJvbCB0aGluZyBpcyBlbGVnYW50Lg0K
PiA+Pj4+Pj4+IE5vIGFyZ3VtZW50IGhlcmUuDQo+ID4+Pj4+PiBPciwgdG8gYmUgbW9yZSBwcmVj
aXNlLCBvdXIgc3RhdHVzIGlzIGRyaXZlciBzdGF0dXMuDQo+ID4+Pj4+IEl0IGxvb2tzIGxpa2Ug
dGhlIGRldmljZSBhY3R1YWxseSBvdGhlcndpc2UgdGhlcmUncyBubyBuZWVkIGZvcg0KPiA+Pj4+
PiByZS1yZWFkIG9yIHBvbGwgZm9yIHRoaW5ncyBsaWtlIHJlc2V0IGFuZCBvdGhlcnMuDQo+ID4+
Pj4gVGhlIG5lZWQgaXMgdGhlcmUgZm9yIGNvbXBsZXggZGV2aWNlIHN0YXRlIHRyYW5zaXRpb25z
LCB3aGljaCBjYW4NCj4gPj4+PiBub3QgcmVhc29uYWJseSBibG9jayBhIHJlYWQgcmVzcG9uc2Uu
DQo+ID4+Pj4gQW5vdGhlciBzdGFuZGFyZCBhcHByb2FjaCB3aXRoIFBDSSBpcyB0byBzcGVjaWZ5
IHRoZSB0aW1lDQo+ID4+Pj4gdHJhbnNpdGlvbnMgY2FuIHRha2UuIEkgY29uc2lkZXIgdGhhdCBs
ZXNzIGVsZWdhbnQgLSBpcyB0aGlzIHdoYXQNCj4gPj4+PiB5b3UgYXJlIGFkdm9jYXRpbmc/IFRo
ZSBhZHZhbnRhZ2UgaXMgdGhhdCBkcml2ZXIgZG9lcyBub3QgbG9hZCB0aGUNCj4gPj4+PiBwY2kg
YnVzIHdpdGggY29uc3RhbnQgcmUtcG9sbGluZy4NCj4gPj4+PiBUaGUgZGlzYWR2YW50YWdlIGlz
IHRoYXQgaXQgaXMgaGFyZCB0byBwaWNrIGEgdW5pdmVyc2FsIG51bWJlci4gIEENCj4gPj4+PiBj
b21iaW5hdGlvbiBvZiB0aGVzZSBhcHByb2FjaGVzIG1pZ2h0IHdvcmssIGUuZy4gYSByZWNvbW1l
bmRlZA0KPiA+Pj4+IHRpbWVvdXQgdGhlbiBwb2xsLg0KPiA+Pj4gV2UndmUgYWxyZWFkeSBoYWQg
bXNsZWVwKCkgZm9yIHZwX3Jlc2V0KCksIGFueWhvdyB3ZSBjYW4gaW5jcmVhc2UNCj4gPj4+IHRo
ZSBzbGVlcCB0aW1lLCBpZiBpdCBjYW4gb3ZlcmxvYWQgdGhlIHBjaToNCj4gPj4+DQo+ID4+PiAg
ICAgICAgIHdoaWxlICh2cF9tb2Rlcm5fZ2V0X3N0YXR1cyhtZGV2KSkNCj4gPj4+ICAgICAgICAg
ICAgICAgICBtc2xlZXAoMSk7DQo+ID4+Pg0KPiA+Pj4gV2UgY2FuIGRvIHRoZSBzYW1lIGZvciBz
dXNwZW5kaW5nLg0KPiA+Pj4NCj4gPj4+IFRoZSBtYWluIGJsb2NrZXIgZm9yIHRpbWVvdXQgaXMg
dGhhdCBpdCBtYXkgYnJlYWsgbWlncmF0aW9uIGFuZA0KPiA+Pj4gY29tcGxpY2F0ZSB0aGUgaGFy
ZGVuaW5nLiBBbm90aGVyIHByb3Bvc2FsIGluIHRoZSBwYXN0IGlzIHRvIGhhdmUgYQ0KPiA+Pj4g
bm90aWZpY2F0aW9uLg0KPiA+Pj4NCj4gPj4+IEJ1dCB3aGF0IEkgZG9uJ3QgdW5kZXJzdGFuZCBo
ZXJlIGlzIHRoYXQgc3VzcGVuZC9yZXN1bWUgc2hvdWxkIGJlDQo+ID4+PiBsaWdodGVyIHRoYW4g
cmVzZXQuIElmIHdlIGNhbiBhZmZvcmQgYSByZXNldCwgc28gZGlkIHRoZQ0KPiA+Pj4gc3VzcGVu
ZGluZy9yZXN1bWUuIElmIHdlIHdhbnQgdG8gaGF2ZSBzb21ldGhpbmcgbmV3LCB0aGF0J3MgZmlu
ZSBidXQNCj4gPj4+IGl0IHNob3VsZCBiZSBvcnRob2dvbmFsIHRvIGEgc3BlY2lmaWMgbmV3IHN0
YXR1cyBiaXQ/DQo+ID4+IEkgYWdyZWUsIGlmIHdlIHdhbnQgbmV3IHN0YXR1cyBpbmRpY2F0b3Is
IHRoZW4gdGhlIG5ldyBpbmRpY2F0b3INCj4gPj4gc2hvdWxkIG5vdCBiZSBzcGVjaWZpYyB0byBT
VVNQRU5ELg0KPiA+Pg0KPiA+IFNvdW5kcyBnb29kIHRvIG1lIGFzIGxvbmcgYXMgbmV3IGZ1bmN0
aW9uYWxpdHkgZG9lcyBub3QgZm9yY2UgdGhlIGRldmljZQ0KPiB0byByZWFjdCBpbiA1MG5zZWMu
DQo+ID4gSW4gdGhlIGN1cnJlbnQgc3RhdGUgaXQgZm9yY2VzIHRoZSBkZXZpY2Ugc28gcGxlYXNl
IHVwZ3JhZGUgdGhlIHByb3Bvc2FsIGFzDQo+IE1pY2hhZWwgZ3VpZGVkLg0KPiBUcmFwIGFuZCBl
bXVsYXRlIGlzIHZlcnkgb2Z0ZW4gaW4gdmlydHVhbGl6YXRpb24sIG9mIGNvdXJzZSB0aGUgc29v
bmVyIHRoZQ0KPiBiZXR0ZXIgZm9yIGVtdWxhdGlvbi4NCj4gQnV0IHRoZXJlIGFyZSBubyA1MG5z
ZWMgYXNzdW1wdGlvbiBhbmQgbm8gb25lIGNhbiBmb3JjZSB0aGUgaHlwZXJ2aXNvciB0bw0KPiBm
aW5pc2ggYW55IGVtdWxhdGlvbnMgd2l0aGluIGEgY2VydGFpbiB0aW1lDQo+ID4gVGhhbmtzLg0K
WW91IGFyZSBjb21wbGV0ZWx5IGlnbm9yaW5nIHRoZSBjb21tZW50cy4NCkdvb2QgbHVjay4uDQoN
Cg==
