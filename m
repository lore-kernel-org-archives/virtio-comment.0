Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8506D17C77
	for <virtio-comment@lists.linux.dev>; Fri,  6 Sep 2024 01:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725587614; cv=fail; b=d+o0JV88M79qMtuQp9h8OUlj1M47osmuJQvZGsAuO7ZlDylWKwywn3lho3GFmxV8jL2UxSKLKPTRQhVe9QkLxzeIPnLdRApl9OQPC8xPf18Y3Lk2Bw2RMEw/Gw96rCW426Pop89u5Bx8CZ6LkV8VO9kwqR6Biz3p9Ufuz4CEFXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725587614; c=relaxed/simple;
	bh=zGWxxMJCbj9EYxZjgYa+YJWmJKbFl0B7/2fIEXj3vPM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bkZ7vXI10CzOQZTkD+q8TaeBhsjH7EnsbJMzD++ITDqjQK1JtfOJ5fxhKUgnk794VCgWQDORFeFBpmk0ThUBqyeAl2DgeitoOydTMVF+R2/k/qX/dRnReXGFD4AAXTO8X51M934m1+I0snZL2LkZ8XlIQqKEjv/nr6ZlDv2rf+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uXxLg+Mz; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uXxLg+Mz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZtFOkWanXgfdbWek7Yf8yrTAPonqY8lIl90emGEunP8pHv1il2BMpGFlZcPLcPlBh5ipve+RtJEV1o7VvjprTw7NKvz40yMaBdPBHeWFFYELUvk95/dZImYD21FtQnMUNJbFVByQKgklyZ6+RKa1v1CCwt54PRtlf5J4hplTgs67FsKGD/xuyNv2xXu6CwAfebRhOtpjOFENzHLvYSojG2oMDz+Bgm5/w6dmJ1S1w9gumO8oAvj5DW1ZTvv6UHjD5eHXgyNv+HRCDNpFvPWQlF4icEX6LpQrHgCQ3B5DIepTMj4lLR7U4Ag6XT9lqyBE5Rpv6FKHqqbW35onpMQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGWxxMJCbj9EYxZjgYa+YJWmJKbFl0B7/2fIEXj3vPM=;
 b=Nru4DpIvzYagCxo3XziCLBvVPCgH23sxOSMAMpQCOPv3w5ucGyaLI46HqA7Hh+fDrIv3tGqumbnMi/yWKzSW/I+tfeLLjYTF9kYu3D0+4dCfRtnuSNPiTZC3xymA6kuJ/reX1She03l9GII4ZIEAVDPC2T4TVQFxkSFrrwp1bBrlrPit8lQ+QXGpeSlZFCNpqUudz2npZigXunNZy1ZJNstT27SHDUDwM/RFwYSebK+f/w6SX8J0oHtK5KmiYtTLq1fithEjhHY2hyuyl8gSFb1pQyztp5WT1AjlQ7bxIDYHEWOtuyn76fcTMgZFC5u/t9/WPvRGBc7uFWXjCg5h3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGWxxMJCbj9EYxZjgYa+YJWmJKbFl0B7/2fIEXj3vPM=;
 b=uXxLg+MzYkp74HrfPwpXFiaZ7daWcXe58sMT+qvgUrgLTulCE5vt2wrm0Xfd5IFRf8ydoJgemW+K87NFgEelPP2rwwvqcBktGPvt8ZTDFcCTMkrIq6GeSFH3o7C8tmhKaMLjtFvYR0LKyaQmlSvIkgwV5GHZDZjKFEny1PHNW6cT/i4XceOs13UxLET63vLbYX8s4b0MttHhK07OChSwv+QR4fnuoSBeP+q1gjR3qJNCsvswPC8jC3og1IRQyQi40y7tOPBpWZdalQbX8BZyu1IqeHFX7Gj1ZGLf8SUuTIKPXnKPGOUHmhU3ZhieYvIP/VyNXHRlz1BJrtFGZ6Fcgw==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by DM4PR12MB6277.namprd12.prod.outlook.com (2603:10b6:8:a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 01:53:22 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 01:53:22 +0000
From: Parav Pandit <parav@nvidia.com>
To: David Stevens <stevensd@chromium.org>, Zhu Lingshan <lingshan.zhu@amd.com>
CC: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?=
	<eperezma@redhat.com>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA0LrAIAAAIWAgBcwMgCAAAT60IAGsmcAgAALPgCAAAWd4IAACFyAgAAAXACAARSqgIAAD3sAgAApZ4CAAAIfAIAAAfFAgAGafYCAAABVMIAAA+OAgAABY6CAAA+ygIAAAvcAgAEf/JA=
Date: Fri, 6 Sep 2024 01:53:22 +0000
Message-ID:
 <IA0PR12MB871395FE293665B6B90C6513DC9E2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
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
 <IA0PR12MB8713065A3CE6752084FCC6AFDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <d42bd62a-5527-4468-9714-2555a52a361d@amd.com>
 <IA0PR12MB8713676643C6A258BAFA332BDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <6ba5f119-3613-49a4-b368-b8f745556723@amd.com>
 <CAD=HUj4Ac=5pgu6X5wqCLBpQGmBca1Qonnd1KM5An2ewDrDZ2Q@mail.gmail.com>
In-Reply-To:
 <CAD=HUj4Ac=5pgu6X5wqCLBpQGmBca1Qonnd1KM5An2ewDrDZ2Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|DM4PR12MB6277:EE_
x-ms-office365-filtering-correlation-id: 0e4d445a-d9a5-4f25-35b4-08dcce16b03a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eDRhTThaSFhwQmlVZkIxOGR5SXRFMmpSQlN1NFJoUmp4UHJHZy9BYzR4NlBm?=
 =?utf-8?B?WWhITFZZMzJEUTNzWmNpa1JnUy9WZjZiR3JyN1FZTnhxQWFyaTRENjQ5WUFk?=
 =?utf-8?B?WFVreHpWQWQ1L2wvVkpaSExXT1NqQTllRUQxcUkzWWR4YmlHYzNEOXFjckJp?=
 =?utf-8?B?cW5iZzk0WVlTRHZLbU0ycm9nbU9CVE90YSt0aFVQSjYyY09LaHhUMkhOL3BB?=
 =?utf-8?B?cmt1S3BmWVUvRDQvbGhBTEdlZGtSenljVUdJT2thVHdlSm93NWU5TGR3Ykgz?=
 =?utf-8?B?RExKemNBbU9zdUNOM0FxOUVhbkI0a21ScjdoMEhQSXJmUFcrRTAwSTFPRkt3?=
 =?utf-8?B?NlVkZk9KbGg0ekl5dEpJSmNNNjZFeUdVZUdHTjJxUGNOQkdRaDNwZWFSVW12?=
 =?utf-8?B?NmlDUkgwL09YZnY3UVU4eHRKRlZPeWRqV3p3SEw3YXBacUo2V2s0MldZUldB?=
 =?utf-8?B?cVNGcEY4V1E1SVg3OVJZdlZvYTc0VWNNVUM5a3gvUSt1TEIvSGVKcWM3aXZL?=
 =?utf-8?B?Z2hzQ3ZaaWpQZTgrcGwvV2V0bldpYTlhQ05zeHFoYTZlY1MxWU85ZUJKNjNH?=
 =?utf-8?B?ODRUa2h4ekxra2NsYy9rQ0xBK0ZnS2VvTk5xajhiUTZ2TW8rUmhPWGdFL3lK?=
 =?utf-8?B?Um5kQXJqZ2lZNHlhS0dCZ1BBVkFPeHZkUXIzMnhtNnZnNFFtS0QwVGgyNmNI?=
 =?utf-8?B?TkJPZlFnTG1RRTBiZlM5ZGNxaTI2eWQ0cktieE9ZM2pwNFVVZERGWnc0WDlF?=
 =?utf-8?B?K2dDUWN4TmJmczMvSlE3UHFOK1NOdy96Y2EyYlNSR3JYejJHZTE3TCtVbXRE?=
 =?utf-8?B?MXY3QjRZcjRZbmp5MDQ0ekVxandLNEVFcDhFZXRXdWl0c29iL2ZqTzA3cFpK?=
 =?utf-8?B?N2k4QjcwVlp5UkdQblVCaWtuWDExK3ljSnhqZ1JlYmJrN21hVHFhM1BDRCti?=
 =?utf-8?B?Vit3S2F1a1MzMVR2akYwM25OU2pzblN0Y1hvVktqTWIySmtDRnoxdUJhNUlx?=
 =?utf-8?B?YXdRSzNZVGM0OWNUbkoyRDBpdzBRYW1RditwYjY2cTk3RkM1YlZQL1U4ajNL?=
 =?utf-8?B?QWRYVWFaMFZpQnkwcGczTmoxcjZocG9heU1JWTh1TWoySVhpRWdaaFBSRzhk?=
 =?utf-8?B?UFBNMEZ0Tm1ySm40TE8zVGZVYjNWNk1YZ2FuMGZldkhCOGRXOG5NanVqMWI3?=
 =?utf-8?B?MFZwdFdXUlNoVEw2anJpTEJTOVpxWXFTMTlxdnFrdGVDVC82WkdiK0pOY0xq?=
 =?utf-8?B?WXdkVTJxaFBxc2x4bHhSNjRmdUUraW5ERGk1UWF5d1EzK014N080U1d5L2gr?=
 =?utf-8?B?OVFGV2YzRHFCczNXVjdzOEFSeW1xYVR0bDFRU1pPbGNsRTNxSlhqcnVpS3Ny?=
 =?utf-8?B?K0lZTEpNNEs3YS82QVJJdzdKQjNGbUVhV085elNzWXlwdkNaTllTMXJXSWZh?=
 =?utf-8?B?UGVOMEQ0cHl5WDF3MjU4UkR0NTNDMk0rMHAxZWlvbkRJL2M3Nm1zc1ZTR2FG?=
 =?utf-8?B?eHVGRW9EM1oxelRJVzkvWGh1OXlTNk9rS0ZkYTBCcmRYa1I1K2VxaGJ0cnU4?=
 =?utf-8?B?Qk8rd0lZcEVqd3J5U3ZZWm5rUjJ3YUtjVXg5REdKbXZMSmJTL0lZWFVYMU5z?=
 =?utf-8?B?cVFzSWdRVSt2cXIyWldSTkpvclR1d3RsMm5nQnJZYVNzdllSNHBSNVdJVmN4?=
 =?utf-8?B?UEJUU3h1VlN3Y3BrUno3MDdCc0J1dEZlbW9ZV09GaVhtSjJNaENPOTJWaXkv?=
 =?utf-8?B?eTVFalN4K2x6ZnE3U2YwMVpiMndUMGF2anBvbFZMc0o0aFdCWllINGZ4djVs?=
 =?utf-8?B?d1JzVmtaQkl3bnNETEtiZHgwWUhDbmkzb29HKzB4TmJ1VE41T29kVHRVL3Er?=
 =?utf-8?B?d3U5dTJGTVArMzAzanpJanJEcGJBemp6eitiWFFYZVE1Mnc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z2FES0JwY1lwMXFFYXhXbDNaWjNZMlJKMWw2Y0tTcWZYdU1ZWFlkZnptQlNJ?=
 =?utf-8?B?MGZnTUYzQjR0dWFPbHhONFZKcU1XUGsrQ2dock1JRUtnRHNQdHNDQmJLRkJX?=
 =?utf-8?B?UmY2dFVyNU0rL2w2VVVSMmtSSHNjVTNEeThtbWU4S0JEWWxQVlY2STVRdHht?=
 =?utf-8?B?blFHeDBWRGJSdXlqVEdCaDBablgxQmxXdk5CS2o4a21JTnRSM3d0LzRrUUht?=
 =?utf-8?B?bDhvTEE1L0JXVmpLZzFISWxhN3pqQzFCTGNndUhNQjJZNFMxZjVtWHhWR3pQ?=
 =?utf-8?B?c3B5UFk3a2lHaktUZm9SUXg0OE5yNWMwTVVVRkNYeEk5RUdiYnBtdmpHcXRk?=
 =?utf-8?B?a2FyNWEzcC9RL2p3dUwrakxjUTJ5NEczZFRxakk3eFVMRm9ZaDlyWjZSYnZM?=
 =?utf-8?B?cnByaER6MUF1Zm1saFdQaGFQeW9PM2JrOXVRK1gwNEcwc0xlek9YTWFyT0Iv?=
 =?utf-8?B?Q055elByYkJyVVBPR3Vaa1F4cTAxeWVRaUFQb1Rub01MZFVHc1RIQ2thdkRS?=
 =?utf-8?B?SE1iYXpDZlV6c3YyQlE2THdEV0JvN3VtRXoxVzhzcFh0RlY1TG5scStyMWNP?=
 =?utf-8?B?SFpyQ0F4VS9FK1I2RnUxSzkrU2NkZDJsM3FUc01uaXFWTnhyRi82YmtrYnhX?=
 =?utf-8?B?dW1ROEpranJIMGRzQUZLTk1FcUUyMFZhcDVza0hYc2VzUVlKSkpMU3pwcjBH?=
 =?utf-8?B?ajN5d2FJdlJ6YWRxUHR4UWozKzBJazlUMW1ndFRPeE9kQmNjcXpZZGFFL1lu?=
 =?utf-8?B?YWgxYlBBMmhVeFdZRUtabUt2OTVhYUZXQkdqVjJhcjZXa3Z4SndtdVczNWdT?=
 =?utf-8?B?ejdPbHcrQ0w5S2dRV1RIZG1iaElJbDkxMHJRdERyczY5d2Nxc1ZHdnQyK1JD?=
 =?utf-8?B?TWdnVnk3eUF4ZlhCNmZJQmdLV21WK1dLblpZQlZheDFsRSt4YURTNW9SaVdJ?=
 =?utf-8?B?RnJqMTdjbXN2eVhQOEJQZTc3cm9Jc1dSK2VxNlhleFAyL0xFRHplYjRvWVpz?=
 =?utf-8?B?WHZ0NUwrK1g2RmlpMUUyZ0VxSWtNL05BZkNieklFS3Q3bmdpMnFlSHpXMk9U?=
 =?utf-8?B?Ry8vdHpWdWJGdmFHMUdBZnA1YkNvWlMrTGZLdXhJVzFLbUxFR25xL2JmTmRE?=
 =?utf-8?B?RTFXZGRwQWtsR1N3NUp6NDdqaEJuMFV2V2VGTjUwWVhDQzZFN3dKUkRVVUpB?=
 =?utf-8?B?ZzBJSEZRM1NGc2ZoMWp1Q2tyQTNpQitOOEVRMjArSlQ0VHF6ZExlNTNid290?=
 =?utf-8?B?bmhhTUlQdmQ1dGYwRnNVWks3bFNJTkxyMUNUaEcyMVhBdUpFZlcxMHNYeE5q?=
 =?utf-8?B?OEEydUxicWNHWDRDdXQyNGdKakJnRE0vYXhCQ1ByNElqamJQMkFFbUIvUktl?=
 =?utf-8?B?bnZJazJYbTZxMkdVZjUwZlpnbXBTOU1pYXluQ3hVcFFBTFk3eUtsT1VKdytE?=
 =?utf-8?B?ODc1MzVqRDBtWUNnNWQ3UTU5VjllT1g0WUUxQTdBMHhBNDJ3ZnF5Y0JMNGxP?=
 =?utf-8?B?d3hNYSs4Q2dQSnhDa05hWm95UUl5TDNhSDQyRnZBRDNUZmJaa0VBN0FRaVNh?=
 =?utf-8?B?UnM1K3JqSGVjYmh3eGRvOTlmSER0YmlmdlROaHVqbVRrWGk2QlFHb1VBaGY1?=
 =?utf-8?B?MXg2RjhKNG9tU2VvcVQvZzZNS1p5VzBUc2c3Z0ZNdjQ5YzR4ekxhQ0VTdFJD?=
 =?utf-8?B?OGM1aW9qT3IxVkN5Z2xXKzI1YkZBNDZSR24rdWExLzhJTGxtZ3dnMStDLzRa?=
 =?utf-8?B?VDBEUHM0VHlyK3BlalBPL2RFM09xUFNiR1VVbWQxc0k1YnY4NDQzUzZKTFJG?=
 =?utf-8?B?aFpjREl3R1NIOVhTR3FLbWY3eitxUmdjaTdsSlkyYmllaXhud0IxdzBpVXVq?=
 =?utf-8?B?LzFEK3RnTG1La3JGNlFDN2NXYmVJck9RRlVWNGl3bmhYV2oxSnU3UEFFVmZz?=
 =?utf-8?B?ckNZR0lXWCtjbWNmZzBJcStZWW1MVm14UkY2eDRVaC9nUmlzb3kxK1crc0py?=
 =?utf-8?B?UlVNb3BaeHZJWFdUQ0pOMVZJT3FjVk1JWktDRFBab0QwSDBNSGFhU1RyQ0pE?=
 =?utf-8?B?cmtHWXdPSlZGTWVIb1RHemFtYmJLdFFGNWwveWEzL1d5VTZ4YmZWQklKaGxT?=
 =?utf-8?B?TmFaS05BKzU5dHNPQ1N0V05OVXNsSC9sUVUxMHBjdFREeEVtbGhkZjlJWklL?=
 =?utf-8?Q?yhksfu5itWlb5V6X4UktXdVSKzadSmAtI2xeJBtrGxDQ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4d445a-d9a5-4f25-35b4-08dcce16b03a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 01:53:22.0462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DJXVoFDY/TcYnz3scf+AfabgnIbZuPTmH8GUMA/OR+0/36vVGWExwY3ylRLTK5ZqNKsVfpnPu+lABNREIUeTyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277

DQoNCj4gRnJvbTogRGF2aWQgU3RldmVucyA8c3RldmVuc2RAY2hyb21pdW0ub3JnPg0KPiBTZW50
OiBUaHVyc2RheSwgU2VwdGVtYmVyIDUsIDIwMjQgMjoxMiBQTQ0KPiANCj4gT24gVGh1LCBTZXAg
NSwgMjAyNCBhdCA1OjMx4oCvUE0gWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAYW1kLmNvbT4N
Cj4gd3JvdGU6DQo+ID4gT24gOS81LzIwMjQgMzozNSBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0K
PiA+ID4NCj4gPiA+PiBGcm9tOiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBhbWQuY29tPg0K
PiA+ID4+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgNSwgMjAyNCAxOjAwIFBNDQo+ID4gPj4N
Cj4gPiA+PiBPbiA5LzUvMjAyNCAzOjE2IFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4gPj4+
PiBGcm9tOiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBhbWQuY29tPg0KPiA+ID4+Pj4gU2Vu
dDogVGh1cnNkYXksIFNlcHRlbWJlciA1LCAyMDI0IDEyOjQ1IFBNDQo+ID4gPj4+Pg0KPiA+ID4+
Pj4NCj4gPiA+Pj4+IE9uIDkvNC8yMDI0IDI6NDYgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4g
PiA+Pj4+Pj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAYW1kLmNvbT4NCj4gPiA+
Pj4+Pj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgNCwgMjAyNCAxMjowOSBQTQ0KPiA+ID4+
Pj4+Pg0KPiA+ID4+Pj4+PiBPbiA5LzQvMjAyNCAyOjMxIFBNLCBKYXNvbiBXYW5nIHdyb3RlOg0K
PiA+ID4+Pj4+Pj4gT24gV2VkLCBTZXAgNCwgMjAyNCBhdCAxMjowM+KAr1BNIE1pY2hhZWwgUy4g
VHNpcmtpbg0KPiA+ID4+Pj4+Pj4gPG1zdEByZWRoYXQuY29tPg0KPiA+ID4+Pj4+PiB3cm90ZToN
Cj4gPiA+Pj4+Pj4+PiBPbiBXZWQsIFNlcCAwNCwgMjAyNCBhdCAxMTowNzoyNUFNICswODAwLCBK
YXNvbiBXYW5nIHdyb3RlOg0KPiA+ID4+Pj4+Pj4+PiBPbiBUdWUsIFNlcCAzLCAyMDI0IGF0IDY6
MzfigK9QTSBNaWNoYWVsIFMuIFRzaXJraW4NCj4gPiA+Pj4+Pj4+Pj4gPG1zdEByZWRoYXQuY29t
Pg0KPiA+ID4+Pj4+PiB3cm90ZToNCj4gPiA+Pj4+Pj4+Pj4+IE9uIFR1ZSwgU2VwIDAzLCAyMDI0
IGF0IDA2OjM1OjU5QU0gLTA0MDAsIE1pY2hhZWwgUy4NCj4gPiA+Pj4+Pj4+Pj4+IFRzaXJraW4N
Cj4gPiA+PiB3cm90ZToNCj4gPiA+Pj4+Pj4+Pj4+Pj4+IEJ1dCBJIGRvbid0IGxpa2UgaXQgdGhh
dCBsb29raW5nIGF0IHRoZSByZWdpc3RlcnMsIG9uZQ0KPiA+ID4+Pj4+Pj4+Pj4+Pj4gZG9lcyBu
b3Qga25vdyB0aGUgZGV2aWNlIHN0YXRlLiBIaWRkZW4gc3RhdGUgaXMgYmFkIGZvcg0KPiA+ID4+
IGRlYnVnZ2FiaWxpdHkuDQo+ID4gPj4+Pj4+Pj4+Pj4+PiBXZSBoYXZlIDQgc3RhdGVzOg0KPiA+
ID4+Pj4+Pj4+Pj4+Pj4gc3VzcGVuZGluZy0+c3VzcGVuZGVkLT5yZXN1bWluZy0+cmVzdW1lZA0K
PiA+ID4+Pj4+Pj4+Pj4+Pj4gc28gd2UgbmVlZCBhIHJlZ2lzdGVyIHdpdGggYXQgbGVhc3QgMiBi
aXRzLg0KPiA+ID4+Pj4+Pj4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+Pj4+Pj4+IHdlIGNvdWxkIHN0ZWFs
IDIgYml0cyBmcm9tIHN0YXR1cyBidXQgaXQgc2VlbXMgYSBiaXQgbXVjaC4NCj4gPiA+Pj4+Pj4+
Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+Pj4+IFRoaXMgaXMgd2h5IGxldHRpbmcgdGhlIHN0YXR1cyB0
ZWxsIHRoZSBzdGF0dXMgYW5kDQo+ID4gPj4+Pj4+Pj4+Pj4+IGNvbnRyb2wgcmVnaXN0ZXIgdG8N
Cj4gPiA+Pj4+Pj4gY29udHJvbCB0aGluZyBpcyBlbGVnYW50Lg0KPiA+ID4+Pj4+Pj4+Pj4+IE5v
IGFyZ3VtZW50IGhlcmUuDQo+ID4gPj4+Pj4+Pj4+PiBPciwgdG8gYmUgbW9yZSBwcmVjaXNlLCBv
dXIgc3RhdHVzIGlzIGRyaXZlciBzdGF0dXMuDQo+ID4gPj4+Pj4+Pj4+IEl0IGxvb2tzIGxpa2Ug
dGhlIGRldmljZSBhY3R1YWxseSBvdGhlcndpc2UgdGhlcmUncyBubyBuZWVkDQo+ID4gPj4+Pj4+
Pj4+IGZvciByZS1yZWFkIG9yIHBvbGwgZm9yIHRoaW5ncyBsaWtlIHJlc2V0IGFuZCBvdGhlcnMu
DQo+ID4gPj4+Pj4+Pj4gVGhlIG5lZWQgaXMgdGhlcmUgZm9yIGNvbXBsZXggZGV2aWNlIHN0YXRl
IHRyYW5zaXRpb25zLCB3aGljaA0KPiA+ID4+Pj4+Pj4+IGNhbiBub3QgcmVhc29uYWJseSBibG9j
ayBhIHJlYWQgcmVzcG9uc2UuDQo+ID4gPj4+Pj4+Pj4gQW5vdGhlciBzdGFuZGFyZCBhcHByb2Fj
aCB3aXRoIFBDSSBpcyB0byBzcGVjaWZ5IHRoZSB0aW1lDQo+ID4gPj4+Pj4+Pj4gdHJhbnNpdGlv
bnMgY2FuIHRha2UuIEkgY29uc2lkZXIgdGhhdCBsZXNzIGVsZWdhbnQgLSBpcyB0aGlzDQo+ID4g
Pj4+Pj4+Pj4gd2hhdCB5b3UgYXJlIGFkdm9jYXRpbmc/IFRoZSBhZHZhbnRhZ2UgaXMgdGhhdCBk
cml2ZXIgZG9lcw0KPiA+ID4+Pj4+Pj4+IG5vdCBsb2FkIHRoZSBwY2kgYnVzIHdpdGggY29uc3Rh
bnQgcmUtcG9sbGluZy4NCj4gPiA+Pj4+Pj4+PiBUaGUgZGlzYWR2YW50YWdlIGlzIHRoYXQgaXQg
aXMgaGFyZCB0byBwaWNrIGEgdW5pdmVyc2FsIG51bWJlci4NCj4gPiA+Pj4+Pj4+PiBBIGNvbWJp
bmF0aW9uIG9mIHRoZXNlIGFwcHJvYWNoZXMgbWlnaHQgd29yaywgZS5nLiBhDQo+ID4gPj4+Pj4+
Pj4gcmVjb21tZW5kZWQgdGltZW91dCB0aGVuIHBvbGwuDQo+ID4gPj4+Pj4+PiBXZSd2ZSBhbHJl
YWR5IGhhZCBtc2xlZXAoKSBmb3IgdnBfcmVzZXQoKSwgYW55aG93IHdlIGNhbg0KPiA+ID4+Pj4+
Pj4gaW5jcmVhc2UgdGhlIHNsZWVwIHRpbWUsIGlmIGl0IGNhbiBvdmVybG9hZCB0aGUgcGNpOg0K
PiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+ICAgICAgICAgd2hpbGUgKHZwX21vZGVybl9nZXRfc3Rh
dHVzKG1kZXYpKQ0KPiA+ID4+Pj4+Pj4gICAgICAgICAgICAgICAgIG1zbGVlcCgxKTsNCj4gPiA+
Pj4+Pj4+DQo+ID4gPj4+Pj4+PiBXZSBjYW4gZG8gdGhlIHNhbWUgZm9yIHN1c3BlbmRpbmcuDQo+
ID4gPj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4gVGhlIG1haW4gYmxvY2tlciBmb3IgdGltZW91dCBpcyB0
aGF0IGl0IG1heSBicmVhayBtaWdyYXRpb24NCj4gPiA+Pj4+Pj4+IGFuZCBjb21wbGljYXRlIHRo
ZSBoYXJkZW5pbmcuIEFub3RoZXIgcHJvcG9zYWwgaW4gdGhlIHBhc3QgaXMNCj4gPiA+Pj4+Pj4+
IHRvIGhhdmUgYSBub3RpZmljYXRpb24uDQo+ID4gPj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4gQnV0IHdo
YXQgSSBkb24ndCB1bmRlcnN0YW5kIGhlcmUgaXMgdGhhdCBzdXNwZW5kL3Jlc3VtZSBzaG91bGQN
Cj4gPiA+Pj4+Pj4+IGJlIGxpZ2h0ZXIgdGhhbiByZXNldC4gSWYgd2UgY2FuIGFmZm9yZCBhIHJl
c2V0LCBzbyBkaWQgdGhlDQo+ID4gPj4+Pj4+PiBzdXNwZW5kaW5nL3Jlc3VtZS4gSWYgd2Ugd2Fu
dCB0byBoYXZlIHNvbWV0aGluZyBuZXcsIHRoYXQncw0KPiA+ID4+Pj4+Pj4gZmluZSBidXQgaXQg
c2hvdWxkIGJlIG9ydGhvZ29uYWwgdG8gYSBzcGVjaWZpYyBuZXcgc3RhdHVzIGJpdD8NCj4gPiA+
Pj4+Pj4gSSBhZ3JlZSwgaWYgd2Ugd2FudCBuZXcgc3RhdHVzIGluZGljYXRvciwgdGhlbiB0aGUg
bmV3DQo+ID4gPj4+Pj4+IGluZGljYXRvciBzaG91bGQgbm90IGJlIHNwZWNpZmljIHRvIFNVU1BF
TkQuDQo+ID4gPj4+Pj4+DQo+ID4gPj4+Pj4gU291bmRzIGdvb2QgdG8gbWUgYXMgbG9uZyBhcyBu
ZXcgZnVuY3Rpb25hbGl0eSBkb2VzIG5vdCBmb3JjZQ0KPiA+ID4+Pj4+IHRoZSBkZXZpY2UNCj4g
PiA+Pj4+IHRvIHJlYWN0IGluIDUwbnNlYy4NCj4gPiA+Pj4+PiBJbiB0aGUgY3VycmVudCBzdGF0
ZSBpdCBmb3JjZXMgdGhlIGRldmljZSBzbyBwbGVhc2UgdXBncmFkZSB0aGUNCj4gPiA+Pj4+PiBw
cm9wb3NhbCBhcw0KPiA+ID4+Pj4gTWljaGFlbCBndWlkZWQuDQo+ID4gPj4+PiBUcmFwIGFuZCBl
bXVsYXRlIGlzIHZlcnkgb2Z0ZW4gaW4gdmlydHVhbGl6YXRpb24sIG9mIGNvdXJzZSB0aGUNCj4g
PiA+Pj4+IHNvb25lciB0aGUgYmV0dGVyIGZvciBlbXVsYXRpb24uDQo+ID4gPj4+PiBCdXQgdGhl
cmUgYXJlIG5vIDUwbnNlYyBhc3N1bXB0aW9uIGFuZCBubyBvbmUgY2FuIGZvcmNlIHRoZQ0KPiA+
ID4+Pj4gaHlwZXJ2aXNvciB0byBmaW5pc2ggYW55IGVtdWxhdGlvbnMgd2l0aGluIGEgY2VydGFp
biB0aW1lDQo+ID4gPj4+Pj4gVGhhbmtzLg0KPiA+ID4+PiBZb3UgYXJlIGNvbXBsZXRlbHkgaWdu
b3JpbmcgdGhlIGNvbW1lbnRzLg0KPiA+ID4+PiBHb29kIGx1Y2suLg0KPiA+ID4+IFZNX0VYSVQg
YW5kIGEgVk1fRU5UUlkgd29yayBpbiBhIHBhaXIuDQo+ID4gPiBGb3IgaHcgcGNpIHBmIHdoZXJl
IHRoZXJlIGlzIG5vIHZpcnR1YWxpemF0aW9uIHVzZWQ/DQo+ID4gPiBIb3c/DQo+ID4geW91IGJy
aW5nIHRoZSBWTV9FWElUIHByb2JsZW0gdG8gbWUsIGlmIHdpdGhvdXQgdmlydHVhbGl6YXRpb24s
IHRoZXJlIGlzIG5vDQo+IFZNX0VYSVQuDQo+IA0KPiBUaGUgcHJvYmxlbSBQYXJhdiBpcyByYWlz
aW5nIGlzIHRoYXQgdGhlIHNpbmdsZSBiaXQgYXBwcm9hY2ggZWZmZWN0aXZlbHkNCj4gcmVxdWly
ZXMgdGhhdCB0aGUgZGV2aWNlIGhhbmRsZXMgdXBkYXRlcyB0byB0aGUgc3RhdHVzIGZpZWxkIHN5
bmNocm9ub3VzbHkuIEluDQo+IGEgdmlydHVhbGl6YXRpb24gY29udGV4dCB3aXRoIFZNX0VYSVQv
Vk1fRU5UUlksIHRoaXMgc3luY2hyb25vdXMgaGFuZGxpbmcNCj4gaXMgZWFzeS4gSG93ZXZlciwg
aXQncyBub3QgbmVjZXNzYXJpbHkgZWFzeSB3aXRoIGJhcmUgbWV0YWwuDQo+IA0KPiBFdmVuIGlu
IHRoZSB2aXJ0dWFsaXphdGlvbiBjb250ZXh0LCBpdCdzIGVudGlyZWx5IHBvc3NpYmxlIHRvIGlt
cGxlbWVudCBhDQo+IHZpcnR1YWxpemVkIGRldmljZSB3aGVyZSB0aGUgc3RhdHVzIGZpZWxkIGlz
IHBsYWluIG1lbW9yeSB0aGF0IGlzIHBlcmlvZGljYWxseQ0KPiBjaGVja2VkIGJ5IHRoZSBkZXZp
Y2UuIElmIHRoZSBkZXZpY2Ugb25seSBjaGVja3MgdGhlIHN0YXR1cyBmaWVsZCBvbmNlIHBlcg0K
PiBzZWNvbmQsIHRoZW4gaXQncyBwcmV0dHkgY2xlYXIgdGhhdCB0aGUgc2luZ2xlIHN1c3BlbmQg
Yml0IGFwcHJvYWNoIHdvbid0IHdvcmsNCj4gYXQgYWxsLiANClRoYW5rcyBhIGxvdCBEYXZpZC4g
WW91IGNhcHR1cmVkIHRoZSBzdW1tYXJ5IHByZWNpc2VseS4NCg0KPiBJIGRvbid0IGtub3cgd2h5
IHNvbWVvbmUgd291bGQgaW1wbGVtZW50IGEgZGV2aWNlIGxpa2UgdGhpcywgYnV0IGl0J3MNCj4g
bm90IHNvbWV0aGluZyB0aGF0IHRoZSB2aXJ0aW8gc3BlYyBzaG91bGQgcnVsZSBvdXQuDQo+IA0K
PiAtRGF2aWQNCg==
