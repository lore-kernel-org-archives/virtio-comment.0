Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE18E1925B5
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521653; cv=fail; b=qOqrD7TjEOvkS2BE5oVDoZ25ZQkoRvoELlX/aI/NXgsY/9jUqu8vsMs3+Coaw40QjjB/2Y7PkerVXbv6uKVbojsDhWN+YiQNdYX/N0xkBRouBqvBJj/1q6gEXdwy/Hu+7Rso7OrmY1pyfeANAP2vhQ+ssySEvzuwvB7jHswW0tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521653; c=relaxed/simple;
	bh=0lR58yOFqqIldxRIsk5pIBktgBF1jlGsp3CsHUfXitY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pRminzz8aifewOsLQswFdPRyOsOwG2Uja51jJj3biDIqvKZDa7GoBfK54J/DNjvEhBUolV5LRwSDfPlHBRxWml2I0djFnaie+191MyhGYeGzB21UfHBG3qcbqq7H2jdcUYGw2owiZDS4XzdTjGJwfr6nhov8lgkmaBLcPxkxWNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pnvp7v0P; arc=fail smtp.client-ip=40.107.236.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pnvp7v0P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8SwLVGKIQZwkBzXTxwI3/Ih+szEgD6zVcLRRb5OSVRLXqbtlqUvf46uFth8Ite+URSUrGXT24QyU3zNfaJul9dq4OtqBmpdbDu04rI8bmu24ObEI9pbGEGNgQ9/C5H5enLLCQ/gWdOV+TK5ISJIuWHrpdWtbicIvMQlbuw/gWpXY7yg3F0WBiIP27ioNOHXuYs1ULm40W2kjRf8vmI1lVx6z5iXdAWBpWXbeKEv5jwRA/7kKvAvDc2PdeZxysScXUdOl9fp/GYKDaquhRRmSI7NkYjImUdoX8fi0NPlIOVT2iYvShTiW/XhGXEwBcJcDKuNWb9pdD3Lcl/NEJzQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lR58yOFqqIldxRIsk5pIBktgBF1jlGsp3CsHUfXitY=;
 b=CdKBv+pAQ1DmwAIAQ6GMW+4iKDegILb10YPZV5NuM6MOd1g5UgBJyr8aqmAS/QC73MxaJyt2P0x7wSbIKhAOx14NN0MJkddLyWkt/nMiS7oL3+WLnT7Q8fsi8QaEEUYzIOe128gaoRXV3ihQiFBTcs1Vqbl/j+0KPQQIXt7atYkipr5nOBFgt1q4G2XGuhvgRkBxGB2xc5dLv+iLe2rndpmBAIDkfMr7iO6go08Kao3fJNdHH+in4RG/5HFidrTxu/MELVy2Y2CTK/NcV121dX7cHemNxZavrZkqev1D9dNwG7P6z8slfMYScGO/5FDmFYCsifXZs/7l0/63hpejtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lR58yOFqqIldxRIsk5pIBktgBF1jlGsp3CsHUfXitY=;
 b=pnvp7v0PsddPzIz5XqScHEsM2ySuZxpSySmYhBLyP5K2Ku9ml70A2vttnb921OnSw9IGoUy/PrI5eZkRPEb+nGS1amIxjnSsZhyE9O8wDzA3+wHlLkiNHsMA5ALV722mtczdkM2LU2pFtdR6dLn+OJMPBxlCohKjWf4lwN9vYA6krsV4VetfW+9wHfDlLPBGxRNrZR2t/N2YxoOsBmw7IoXC9H6XAcQfDt/g6iHitfh0nieZ5aqnlYhTwPassLv3oDvbTCetj1jXPkpnvqV8xMJ3lQ3EOLiM6WvW+VKoanalgy7MF4t5NYkzgSFbDYRVp/sN4k9GgJni1H5MJQUGaA==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by LV2PR12MB5821.namprd12.prod.outlook.com (2603:10b6:408:17a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 5 Sep
 2024 07:34:07 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 07:34:07 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	=?utf-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, David Stevens
	<stevensd@chromium.org>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA0LrAIAAAIWAgBcwMgCAAAT60IAGsmcAgAALPgCAAAWd4IAACFyAgAAAXACAARSqgIAAD3sAgAApZ4CAAAIfAIAAAfFAgAGafYCAAADDAIAAA8gAgAAAZZA=
Date: Thu, 5 Sep 2024 07:34:07 +0000
Message-ID:
 <IA0PR12MB8713A2224BCB175E083E3C9FDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <IA0PR12MB8713995E39DD585341C47520DC9C2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <ef72f0af-3a04-4a79-9f9d-c6dd7fb24d53@amd.com>
 <20240905031617-mutt-send-email-mst@kernel.org>
 <80b44d74-ebb1-4522-9009-09fe1ff9910d@amd.com>
In-Reply-To: <80b44d74-ebb1-4522-9009-09fe1ff9910d@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|LV2PR12MB5821:EE_
x-ms-office365-filtering-correlation-id: c697befe-5a54-477f-5899-08dccd7d2047
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R2dOVkEwWktMdlNuNFJUL2xzcUtOZ2tjcjRGTU5mR05TL293Uit1dVFZY09l?=
 =?utf-8?B?Q1RIdFR2NWJ3Y3RFVk5TZGQzQ29QeEtubEU0SGxYYU9Oc21EOFFoczlFYVNj?=
 =?utf-8?B?L01zbGgzSHhURUw5dkUwMmJ6Q3NwaFU5ZGtwVDJFSXd6TFgxSWRmYzU3S3Vy?=
 =?utf-8?B?NFFXd2d0QnN1ZGovWGwzSndBajhsajNraWpxR0NJS1FWVXRvdnU5YW12K3pF?=
 =?utf-8?B?QTdQelFFZm9seHFnUmVNeFJVZDZhQW1lWFF3YnhvRVNORkNMblJlbmxVYWwz?=
 =?utf-8?B?aHc4dzQwUDIwNmVxb1VXV28xN2pkeVZrdnRzVFZtZGkwNWxKaEFWTUZqS012?=
 =?utf-8?B?cEsrMUMzTXNleStpNDQ5NjJ0N0dCd3ppaE1iNWZ2dVNCMmExR2dpVnQ4V2xB?=
 =?utf-8?B?Y2p5OEZ3L0tkUDE2b0lGdk5mU250NXY4Y295c3FIUHQ4UjI4V0pwNHFvRW40?=
 =?utf-8?B?VkxWVmlUcU9iUmFGU1NOaGdhZFgwRU8vVVFJRTVSSitJTjBuNStVa3lvSE1O?=
 =?utf-8?B?a0ZKMzYxRDNNUHp6MC8ra2RrYjNwbWxLaDgxMUp6WDZvK3U5NllXMkRSOFZy?=
 =?utf-8?B?MGVHd0pwYVZCOGRITUVQa3VmakdNR05OT2s5bHNRbmhxU1hJRm1zVEZhUytZ?=
 =?utf-8?B?WHpjWSsrd3BsUFRFVS9aU1cwczZRWkVKWCtxZ3FzYXU1TXA0TGhUaFhZMmhO?=
 =?utf-8?B?c1JoS0c0M3o4SDZIaGdWUkYzclBwMk5rb29oU2pxdG9RY0NGbVBRSHhybEth?=
 =?utf-8?B?RTJaNytRT1hIWnRid2UyVTNPWVJZaFpiTVkwK3Qwbm8xQlgydGY3UXdkcCtE?=
 =?utf-8?B?QWdFZ0NHOEQ0amdIczh3V3pkWXhJOUVXQmh1NmVQWWM1WTZCUEVYdGNMUGVo?=
 =?utf-8?B?ZFdMS0xRdXR6dGgxWFpueEdxMFVPSDR4bmhYNEdOc1JuNlRiL2RqM05nZ1ZN?=
 =?utf-8?B?V0pZNDV2QjlJblpuRlVoUGVZTUhFREZ5SjhNZXlqMjlyUmsrVHZha3JJTWFJ?=
 =?utf-8?B?eGZEMDk4QkZFdU9wWnI5WEJ0ZDFRL00wYTZBWUN6YUl0OTJKcVNNWCtKSTFp?=
 =?utf-8?B?bFRjcXNFV0U3QVQ0dGVhWThtSmpDbEh4Vm03NWR2dXF4R1JKZjYwdzJmalY5?=
 =?utf-8?B?TG44RExoRnVHQm94V3V3b1NlU2V2a3cramZFWHlFOENIL1cxSjBIOEhmS0hJ?=
 =?utf-8?B?MnZnU2x0RG9GY2g2SzU0b01KdUlINW1xY1BlQVQwcFNzeEUzbGtjbDNWTDZB?=
 =?utf-8?B?K0JjUno5aVh1WEtpSmR6OGd4VzZ4VVFTdHNXNk5aMk5ZbWxINnNvOXBaZGJn?=
 =?utf-8?B?enNLd1ZSMWNiaXJZd1prcGlHSnRBMlB0MGN4Q0N1KzBEUmh6K1c4RnFncjV0?=
 =?utf-8?B?UUViem4wNUhKbHYycFd2WS9DeWM0VEFNOHZPaFdiblJMLzdlay9qVk1hWEhk?=
 =?utf-8?B?a2IvZk9yL294ZnRFc3lKOG45bGViUTRHZ3ZCYTgrOEFnTVJCWTJxNmVsR1ZR?=
 =?utf-8?B?RnBZUXRPMjY5ZkRKeGY4d0wxK1FweFpJd0Vwa0tLM1NCVEg0OEdwbU5ycXQ2?=
 =?utf-8?B?eFRYa2JYbkV1d2NjeWI3cVBubGcxeVQyZU83eVpUOEVNT0VPZU5teERSd01p?=
 =?utf-8?B?YmcySS95SWM2eU5DeS9IenVtRXNXZmdSWkNCamE1N3BrMU1YTWpxWm44QzZu?=
 =?utf-8?B?aEI1RU4ySDh3UVFKUHArR0svZmtLYXdMUEI0NDVFQmtIbTlQQzF5QjlKalJT?=
 =?utf-8?B?djNJU1dCcDUwQi9kdFJLVXlrZklDMnVZYUFYM1ZNb1hxZm9sdTA4TDNOYStW?=
 =?utf-8?B?QUNEdlpqK3hRN2h2dlc4Y1d1V0d1SHZMdWZ1WnFwNEczQTUrYkEwU1MrRVhM?=
 =?utf-8?B?NjUwTXpQd2pVOG51amxmRDlTdk9YMjkwN0RwM2dhWURERkE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUg3VW1yUzEvSzluRFFSb1F0cStLcmlHMXc2b21odEczTDVJZ01TcndveHMv?=
 =?utf-8?B?OENZRmlGa0FxM0VwcXdZcDhvS1Z1L0J6N1piM3YzVEpYUmNETDMwdWcvS1Np?=
 =?utf-8?B?Ny9Sc0lzeEhMZHozSm43ZkVWb0NFZzRXdFJ6cjhvSVI3VGRtQ2hVN2VOUzZQ?=
 =?utf-8?B?Skcxcll5RDRVMXdLU2RSb29hYlRmdnNkM09GUUNHOG9yNGhPMmJQUlVUcGhF?=
 =?utf-8?B?elh6ak1ySWZLYnc4UXpBcit4WFBmenY4eGZ5dFZpSHZsWGtZdHByMU9LeXI3?=
 =?utf-8?B?WXlDdS92YTVlaENvTllkakpsRGxPNUozOWorUFlDcHNkcmdTNnM4Uzh2c204?=
 =?utf-8?B?SUd2Q1NkZTNNaTY2OHYvMk5lREw0VG5TZDZ2TGtLZWFLbS9UMW0rZzlDYWRT?=
 =?utf-8?B?aDd5YUFFd2JVSmNLMzZPUFlJRFNHdENPRXhQM3FvdWl4ZE80MjFVOWR2ODJ6?=
 =?utf-8?B?ZU45L2oybk9Ld2FJcU9sKzZGMFBNMnZ1TUhGYUtabTBhU05na2ROZXN2Q3pz?=
 =?utf-8?B?blpTKzlNSU8rNnJLaVE0YzVNdnJYaG9WWHV3ZFZQbjBJemUxdjk0R2ZPSi8v?=
 =?utf-8?B?Mm1relpMNWJ4WHdOOEJZdmo3MjBLVHlBZXlmcmZabmYxYTcvaXB5QW9tM1U5?=
 =?utf-8?B?RC9nb1dnaHBiSmEwRDRrcnNhQ0xhMGMxMDF0bGxyTis2Vk5lNXQzOGhqRGM5?=
 =?utf-8?B?VzVIVER6V3JsZXBxU2lSV0J4WU5TRWk0aHpyZ2RXVDBqTlZGTldabGdmR2hE?=
 =?utf-8?B?K0hoRlZiZUJtUXkxK2lvSWdiblpabXhHN2NmMXdIalJRN3lpT2VzQzNrRVIw?=
 =?utf-8?B?bXdDc3RwSkpDN3YxZWN4Q0d3WERsQmswLzdIdDhMajhUeW9FcGZMaWx6ZmhV?=
 =?utf-8?B?dGN6NGU0U09QTmxkeEMyditISjZHTzdzclFsckkydWdYMjJ3N3NHNldoRC9q?=
 =?utf-8?B?WXRVZ3ZqMnBOUmhGU29QcDNucjhEUkpPTFF5VHo1WG1MMitDb3BsLzFYUm5x?=
 =?utf-8?B?MkNzeDFkNVkvMC95V1IxRnQ3L3JtZkc4Rkp6Y01lN3ZtRzQrUU9zZGtpWVdL?=
 =?utf-8?B?UUh4eGlOampRYVBaTWhsbkYzRHlmbzdLVUNGWnU1ejY5cmZmSXBRMFphMEJi?=
 =?utf-8?B?aFBpb1FVMzZhbVpqbm1qejRoYUNXbG9mMEJBUUIvcW1sSThURUVIdlQyVSs5?=
 =?utf-8?B?YU84VFdzTEU1UE9PY3d6aXlwN1pxTENTM2E2M3BKVVZ2amk0SzIrVlB0U3dJ?=
 =?utf-8?B?TWpaVWM5NEdyQmFmcXV2U0dwemV4b0cyMURtSHNYZFNmdFlVaHZxdmhJOG5p?=
 =?utf-8?B?TENCbVZqMys5RGJXZHVHSTlqOTArQTJjdzBLUUJUM3hlTDA5VnQ0MDVOcGhx?=
 =?utf-8?B?Q0lkZjV2VVlpWFQvai8zQ0tJSHA2ZXg0WTBKM3lWZUNJY0lDRzBXYVN3OEtO?=
 =?utf-8?B?SkNhcFFGcTdpZmxFTzlSbHRpTEQxTWtCQ3JpMkYzY0txQ05ScGsrUklvWVdV?=
 =?utf-8?B?OXY5ejhYQlBBSjBXWmNmc2JuZmliTlNEamlGb2dkTGJQTEw1QWdSM1FRNVB0?=
 =?utf-8?B?YUU2bW5NOFlYdVlMcDJKc3crT1BiSkVSWTB0NHZpLzBNNXhUZmVNZzJNSGts?=
 =?utf-8?B?ZjRHalpVb2wzNDM2VjlYcnFGNS95dUxxY3NmM3FaUko1SkJWclJoRktHaDFq?=
 =?utf-8?B?WnZUMHN3dnM5OUNXNlBlWFduY09INEVGaEZ6YVk1VUg4dXBzNnNaS01sVVp2?=
 =?utf-8?B?VWdzSkJ4Vm9rOGxUcUZUNnJXVzBieUZtRUdmSFVYWnJjYk5uTDBQczhiak5w?=
 =?utf-8?B?MlQvdUxiVkhBLzY4N1dTUEhlT21STTVreEtLU0RZRHFRUWtRTWYyK0VTWjky?=
 =?utf-8?B?L3lHOXluQXB2VFpjeFB3MFowdklhZkpabnJKTmUwTUtadDNya0s4c3ludWNZ?=
 =?utf-8?B?NElGQ01GNGNBeDFtSi9HaVFYaW5HZ09aOFlTWmUxMFp5aCtyb2pCYjFqb2lj?=
 =?utf-8?B?NDJCWlhPWHhVN2QwYlAvUVdaWE8yVm1oUXNjOGQ4Z0VrYWJNZ1ZpNDhJSjZi?=
 =?utf-8?B?dmxUeDJQc0c2U2NrV3NwbWJoRXNwY2VBRzlyN1JEL3YybFQ0RVV2Z2Ewdm5I?=
 =?utf-8?B?dW5EWFhyTUVLend1S2MraHJaUnBobTdWSjFocTBLQVJoTjh5enJVcmkrUS9S?=
 =?utf-8?Q?Kmsaj6Mryf9yVm5Dhl4SP4EDVZZVL8iIQekkdiQKQkgX?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c697befe-5a54-477f-5899-08dccd7d2047
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 07:34:07.5369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K0Dhhu/0VssLwloJrhyeNPntwuDwfOLliV+VksgikfEJviVAQYDmhsTnrdHBZxoqzn8IUE49+2OJL8V/i/icmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5821

DQoNCj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAYW1kLmNvbT4NCj4gU2VudDog
VGh1cnNkYXksIFNlcHRlbWJlciA1LCAyMDI0IDE6MDEgUE0NCj4gDQo+IE9uIDkvNS8yMDI0IDM6
MTcgUE0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiBPbiBUaHUsIFNlcCAwNSwgMjAy
NCBhdCAwMzoxNDo0NVBNICswODAwLCBaaHUgTGluZ3NoYW4gd3JvdGU6DQo+ID4+DQo+ID4+IE9u
IDkvNC8yMDI0IDI6NDYgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+PiBGcm9tOiBaaHUg
TGluZ3NoYW4gPGxpbmdzaGFuLnpodUBhbWQuY29tPg0KPiA+Pj4+IFNlbnQ6IFdlZG5lc2RheSwg
U2VwdGVtYmVyIDQsIDIwMjQgMTI6MDkgUE0NCj4gPj4+Pg0KPiA+Pj4+IE9uIDkvNC8yMDI0IDI6
MzEgUE0sIEphc29uIFdhbmcgd3JvdGU6DQo+ID4+Pj4+IE9uIFdlZCwgU2VwIDQsIDIwMjQgYXQg
MTI6MDPigK9QTSBNaWNoYWVsIFMuIFRzaXJraW4NCj4gPj4+Pj4gPG1zdEByZWRoYXQuY29tPg0K
PiA+Pj4+IHdyb3RlOg0KPiA+Pj4+Pj4gT24gV2VkLCBTZXAgMDQsIDIwMjQgYXQgMTE6MDc6MjVB
TSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToNCj4gPj4+Pj4+PiBPbiBUdWUsIFNlcCAzLCAyMDI0
IGF0IDY6MzfigK9QTSBNaWNoYWVsIFMuIFRzaXJraW4NCj4gPj4+Pj4+PiA8bXN0QHJlZGhhdC5j
b20+DQo+ID4+Pj4gd3JvdGU6DQo+ID4+Pj4+Pj4+IE9uIFR1ZSwgU2VwIDAzLCAyMDI0IGF0IDA2
OjM1OjU5QU0gLTA0MDAsIE1pY2hhZWwgUy4gVHNpcmtpbg0KPiB3cm90ZToNCj4gPj4+Pj4+Pj4+
Pj4gQnV0IEkgZG9uJ3QgbGlrZSBpdCB0aGF0IGxvb2tpbmcgYXQgdGhlIHJlZ2lzdGVycywgb25l
IGRvZXMNCj4gPj4+Pj4+Pj4+Pj4gbm90IGtub3cgdGhlIGRldmljZSBzdGF0ZS4gSGlkZGVuIHN0
YXRlIGlzIGJhZCBmb3INCj4gZGVidWdnYWJpbGl0eS4NCj4gPj4+Pj4+Pj4+Pj4gV2UgaGF2ZSA0
IHN0YXRlczoNCj4gPj4+Pj4+Pj4+Pj4gc3VzcGVuZGluZy0+c3VzcGVuZGVkLT5yZXN1bWluZy0+
cmVzdW1lZA0KPiA+Pj4+Pj4+Pj4+PiBzbyB3ZSBuZWVkIGEgcmVnaXN0ZXIgd2l0aCBhdCBsZWFz
dCAyIGJpdHMuDQo+ID4+Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+Pj4+IHdlIGNvdWxkIHN0ZWFsIDIg
Yml0cyBmcm9tIHN0YXR1cyBidXQgaXQgc2VlbXMgYSBiaXQgbXVjaC4NCj4gPj4+Pj4+Pj4+Pj4N
Cj4gPj4+Pj4+Pj4+PiBUaGlzIGlzIHdoeSBsZXR0aW5nIHRoZSBzdGF0dXMgdGVsbCB0aGUgc3Rh
dHVzIGFuZCBjb250cm9sDQo+ID4+Pj4+Pj4+Pj4gcmVnaXN0ZXIgdG8NCj4gPj4+PiBjb250cm9s
IHRoaW5nIGlzIGVsZWdhbnQuDQo+ID4+Pj4+Pj4+PiBObyBhcmd1bWVudCBoZXJlLg0KPiA+Pj4+
Pj4+PiBPciwgdG8gYmUgbW9yZSBwcmVjaXNlLCBvdXIgc3RhdHVzIGlzIGRyaXZlciBzdGF0dXMu
DQo+ID4+Pj4+Pj4gSXQgbG9va3MgbGlrZSB0aGUgZGV2aWNlIGFjdHVhbGx5IG90aGVyd2lzZSB0
aGVyZSdzIG5vIG5lZWQgZm9yDQo+ID4+Pj4+Pj4gcmUtcmVhZCBvciBwb2xsIGZvciB0aGluZ3Mg
bGlrZSByZXNldCBhbmQgb3RoZXJzLg0KPiA+Pj4+Pj4gVGhlIG5lZWQgaXMgdGhlcmUgZm9yIGNv
bXBsZXggZGV2aWNlIHN0YXRlIHRyYW5zaXRpb25zLCB3aGljaCBjYW4NCj4gPj4+Pj4+IG5vdCBy
ZWFzb25hYmx5IGJsb2NrIGEgcmVhZCByZXNwb25zZS4NCj4gPj4+Pj4+IEFub3RoZXIgc3RhbmRh
cmQgYXBwcm9hY2ggd2l0aCBQQ0kgaXMgdG8gc3BlY2lmeSB0aGUgdGltZQ0KPiA+Pj4+Pj4gdHJh
bnNpdGlvbnMgY2FuIHRha2UuIEkgY29uc2lkZXIgdGhhdCBsZXNzIGVsZWdhbnQgLSBpcyB0aGlz
IHdoYXQNCj4gPj4+Pj4+IHlvdSBhcmUgYWR2b2NhdGluZz8gVGhlIGFkdmFudGFnZSBpcyB0aGF0
IGRyaXZlciBkb2VzIG5vdCBsb2FkDQo+ID4+Pj4+PiB0aGUgcGNpIGJ1cyB3aXRoIGNvbnN0YW50
IHJlLXBvbGxpbmcuDQo+ID4+Pj4+PiBUaGUgZGlzYWR2YW50YWdlIGlzIHRoYXQgaXQgaXMgaGFy
ZCB0byBwaWNrIGEgdW5pdmVyc2FsIG51bWJlci4NCj4gPj4+Pj4+IEEgY29tYmluYXRpb24gb2Yg
dGhlc2UgYXBwcm9hY2hlcyBtaWdodCB3b3JrLCBlLmcuIGEgcmVjb21tZW5kZWQNCj4gPj4+Pj4+
IHRpbWVvdXQgdGhlbiBwb2xsLg0KPiA+Pj4+PiBXZSd2ZSBhbHJlYWR5IGhhZCBtc2xlZXAoKSBm
b3IgdnBfcmVzZXQoKSwgYW55aG93IHdlIGNhbiBpbmNyZWFzZQ0KPiA+Pj4+PiB0aGUgc2xlZXAg
dGltZSwgaWYgaXQgY2FuIG92ZXJsb2FkIHRoZSBwY2k6DQo+ID4+Pj4+DQo+ID4+Pj4+ICAgICAg
ICAgd2hpbGUgKHZwX21vZGVybl9nZXRfc3RhdHVzKG1kZXYpKQ0KPiA+Pj4+PiAgICAgICAgICAg
ICAgICAgbXNsZWVwKDEpOw0KPiA+Pj4+Pg0KPiA+Pj4+PiBXZSBjYW4gZG8gdGhlIHNhbWUgZm9y
IHN1c3BlbmRpbmcuDQo+ID4+Pj4+DQo+ID4+Pj4+IFRoZSBtYWluIGJsb2NrZXIgZm9yIHRpbWVv
dXQgaXMgdGhhdCBpdCBtYXkgYnJlYWsgbWlncmF0aW9uIGFuZA0KPiA+Pj4+PiBjb21wbGljYXRl
IHRoZSBoYXJkZW5pbmcuIEFub3RoZXIgcHJvcG9zYWwgaW4gdGhlIHBhc3QgaXMgdG8gaGF2ZQ0K
PiA+Pj4+PiBhIG5vdGlmaWNhdGlvbi4NCj4gPj4+Pj4NCj4gPj4+Pj4gQnV0IHdoYXQgSSBkb24n
dCB1bmRlcnN0YW5kIGhlcmUgaXMgdGhhdCBzdXNwZW5kL3Jlc3VtZSBzaG91bGQgYmUNCj4gPj4+
Pj4gbGlnaHRlciB0aGFuIHJlc2V0LiBJZiB3ZSBjYW4gYWZmb3JkIGEgcmVzZXQsIHNvIGRpZCB0
aGUNCj4gPj4+Pj4gc3VzcGVuZGluZy9yZXN1bWUuIElmIHdlIHdhbnQgdG8gaGF2ZSBzb21ldGhp
bmcgbmV3LCB0aGF0J3MgZmluZQ0KPiA+Pj4+PiBidXQgaXQgc2hvdWxkIGJlIG9ydGhvZ29uYWwg
dG8gYSBzcGVjaWZpYyBuZXcgc3RhdHVzIGJpdD8NCj4gPj4+PiBJIGFncmVlLCBpZiB3ZSB3YW50
IG5ldyBzdGF0dXMgaW5kaWNhdG9yLCB0aGVuIHRoZSBuZXcgaW5kaWNhdG9yDQo+ID4+Pj4gc2hv
dWxkIG5vdCBiZSBzcGVjaWZpYyB0byBTVVNQRU5ELg0KPiA+Pj4+DQo+ID4+PiBTb3VuZHMgZ29v
ZCB0byBtZSBhcyBsb25nIGFzIG5ldyBmdW5jdGlvbmFsaXR5IGRvZXMgbm90IGZvcmNlIHRoZQ0K
PiBkZXZpY2UgdG8gcmVhY3QgaW4gNTBuc2VjLg0KPiA+Pj4gSW4gdGhlIGN1cnJlbnQgc3RhdGUg
aXQgZm9yY2VzIHRoZSBkZXZpY2Ugc28gcGxlYXNlIHVwZ3JhZGUgdGhlIHByb3Bvc2FsDQo+IGFz
IE1pY2hhZWwgZ3VpZGVkLg0KPiA+PiBUcmFwIGFuZCBlbXVsYXRlIGlzIHZlcnkgb2Z0ZW4gaW4g
dmlydHVhbGl6YXRpb24sIG9mIGNvdXJzZSB0aGUgc29vbmVyIHRoZQ0KPiBiZXR0ZXIgZm9yIGVt
dWxhdGlvbi4NCj4gPj4gQnV0IHRoZXJlIGFyZSBubyA1MG5zZWMgYXNzdW1wdGlvbiBhbmQgbm8g
b25lIGNhbiBmb3JjZSB0aGUNCj4gPj4gaHlwZXJ2aXNvciB0byBmaW5pc2ggYW55IGVtdWxhdGlv
bnMgd2l0aGluIGEgY2VydGFpbiB0aW1lDQo+ID4gVGhlIHNwZWMgc2hvdWxkIG5vdCBhc3N1bWUg
ZGV2aWNlcyBhcmUgdmlydHVhbCwgdGhlcmUgYXJlIGJhcmVtZXRhbA0KPiA+IGRlcGxveW1lbnRz
IG9mIHZpcnRpby4gSW4gc3VjaCBzZXR1cHMsIHRoZXJlIGlzIG5vIG9uZSB0byB0cmFwIG9yDQo+
ID4gZW11bGF0ZTogZHJpdmVyIG11c3QgZG8gZXZlcnl0aGluZyBpdHNlbGYuDQo+IHN1cmUgdGhp
bmcsIEkgYW0gYWxzbyBjb25mdXNlZCB3aHkgVk1fRVhJVCAmIFZNX0VOVFJZIGFuZCBpcyBhIHBy
b2JsZW0NCj4gaGVyZS4uLg0KSG93IGRvZXMgcHJvcG9zZWQgVk1fRVhJVCBhbmQgVk1fRU5UUlkg
d29yayBmb3IgYmFzaWMgUENJIFBGIGh3IGRldmljZT8NCkhvdyBjYW4gb25lIGJ1aWxkIHN3IHdp
dGhvdXQgVk1fRVhJVCBhbmQgVk1fRU5UUlkgcmVzdHJpY3Rpb24gaWYgdGhleSB3YW50IHRvPw0K
QXBhcnQgZnJvbSBvdGhlciB0aW1pbmcgcmVzdHJpY3Rpb25zIGltcG9zZWQgdGhhdCBtYWtlcyB0
aGlzIHZlcnkgaGlnaCBjb21wbGV4aXR5IGRldmljZSBmb3IgcmFyZSBldmVudC4NClBsZWFzZSBs
aXN0IGRvd24gdGhlIGFzc3VtcHRpb25zIGFuZCBsaW1pdGF0aW9ucyBzbyB0aGF0IGl0IGJlY29t
ZXMgY2xlYXIgdGhlIHZhbHVlIG9mIHRoaXMgYml0Li4NCj4gPg0KPiA+DQo+ID4+PiBUaGFua3Mu
DQoNCg==
