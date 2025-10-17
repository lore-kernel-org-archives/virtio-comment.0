Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010032.outbound.protection.outlook.com [52.101.85.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D53E3321B7
	for <virtio-comment@lists.linux.dev>; Fri, 17 Oct 2025 11:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700474; cv=fail; b=c7Gz6+7KilQpFnDQD3q68g3VTQ24syj6o3DEaiv1K1yI/pxTHbhAuAmYsWGrvpWg8fnjwV/qt0MfCkgPMHXfcSl3pu49ETVntTgCyyWui+yjAoq+3ypn2htUjqOEpS1bgN9aNputEv+vr8jXwCjo8/gvBOwGsOSkNvWxNVoSFMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700474; c=relaxed/simple;
	bh=TrqvewzNVq1vo1UTkNx1WUz04EgM9ODbtmlRbgNLOIk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I5DxFuzLYG/rtw7Qw6WgA4I6sN+ftMOkdTaTIsI/PDcPsKLj9fK1U4+sf/dXvBLh8VwFOBU2Pqt8GRt1jpC3niFGkG+Sbe90894OPtCVue+8LIkVGz/vhddHbMAdnD+2Gkd6Vk3tEARAPO3Cxaineg+QoFEfZOlIw9WE3UDo+qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sbOGEvbc; arc=fail smtp.client-ip=52.101.85.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sbOGEvbc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcyCv42HMg0VAHYnhlIO5nBakY9CvlDhgKUcl81whHjQ40HseZaTgCZHzjtXLIHmxWCZYBujI0nJl4b/P5Aj4001CDwK6T2DRKvmLrjm/eUQq8OiQxT6mMs5Y1nZ0VAld/xD5YWRLTo5b8eE5S0/sLpt1hO1Odr8CQ1+HBhyxjhPUUT+vrrU6s7ZlOzppzSlWoULrw3mhhrSISG1mmrBPzp6Uhdz2fYZQL9e2rkWRQYuoMjqILF+kTcGw4Ga2t4hKnloWz8EscWROgpnWmFbDML0QqJPgbwTRT3QHzGOF6DoR5EY5FVICxembd7U83y1AA1CFxPt1Hxlt2W+yR9/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xk1kZsih/sjkV4XF4wXiHI/mcpa7BHM1IgYM7xYPqw=;
 b=eMWGWR3YpZUIEr+8cMiXSgqs5OA4t1UJc9U8yltHhCQjvN9BzmA6b4svPKYMMIM/nRvIyl1aIuSAO8U82A47gher6ZmfIOZ3o3voz9hiVHoB7DvM0sLGrtO73/+5dtzZnLaPXlWVjRjjPMm+WlXUXLoUAatSHvGM+JUilkUPfji27SrAUltFpDJudwdChqq2yPW2l3O6po5F1nle69qQUcPIqU3xgGdQ7FqVNJ3QL190ipao+KN/J397DxpKVOGMGYa168atcFC12y87jjjrXySDvKC4WvF2oL2vcWvnYFmzFUpfkBihYu/IMo+kLE+q3TyzLZhCfM4oIlG24g0lTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xk1kZsih/sjkV4XF4wXiHI/mcpa7BHM1IgYM7xYPqw=;
 b=sbOGEvbcaG91p8X1ht/J94PW2gLMLLQ7Ul2br726IPpK090rzi+W7UjdrANae2cv3OS3DW9vRZ2Q4WxGz04mMqe6xJ4ePMe9jeOU7N0qLnlZzKz2Q5XW//ChKqKLkN/Z8SO+FM85Rhv53yY7J/o8INeVwrl6sH6oJDrUlAS9txfPxFmVZEn2ohzUhbEF4kC7GtQH25UXqH/imAqLFnAJeCdtVZY0d639dCVjW5Ub4W6EYJEsHsqjN3cl39laQJF0fO7vshARICcmBTBELybucEjEROdworW2cwPZfDaFPw5+Md9Yzqye2o9cnjJfNY7D5Fkam9DZDId4w3nZf7AlaA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SN7PR12MB8101.namprd12.prod.outlook.com (2603:10b6:806:321::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Fri, 17 Oct
 2025 11:27:47 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 11:27:47 +0000
From: Parav Pandit <parav@nvidia.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ij@kernel.org>
CC: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index:
 AQHcDRMxc7D2+BxJGUa3jiZ0uZVtV7SqECZQgACnIACAALBIAIAAa1mAgAEnxVCAADbEAIAANhWAgAAbXICAAwZbwIAAFfmAgAAMFGCAABRiAIAAMbdwgABX7wCABWkngIAJRiFggAKBUgCAAHMSkIAA7x8AgAK7odA=
Date: Fri, 17 Oct 2025 11:27:46 +0000
Message-ID:
 <CY8PR12MB7195DEA3F51BDACD675BFC15DCF6A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB719518C4A8F3EE03690E44B1DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79845B9580C4D17590E8C2DEA3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB71959308B23EFE2A920D8B20DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79841A2F8A719FDAD35AB0D0A3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719590ED886A60EE7867E7E6DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79846714E156C1797667F6ABA3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
  <CY8PR12MB7195DF4B90E52B22D33964E0DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <d92b8614-6cf8-d704-01ab-b89094486f52@kernel.org>
 <PAXPR07MB798491A0140F43FFE17384D8A3E0A@PAXPR07MB7984.eurprd07.prod.outlook.com>
  <CY8PR12MB719595914FDED764977E6105DCEAA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <f0c03e3e-c1d0-73d7-c4dc-c95fc0248207@kernel.org>
  <PH8PR12MB720866C253E9C7361F88FC1EDCE8A@PH8PR12MB7208.namprd12.prod.outlook.com>
 <c9998c38-bb0f-8f2f-b5ec-74be20455985@kernel.org>
In-Reply-To: <c9998c38-bb0f-8f2f-b5ec-74be20455985@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SN7PR12MB8101:EE_
x-ms-office365-filtering-correlation-id: 1c23bec6-5781-41d9-e408-08de0d70328d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AYDRumX3eF9IjkPcUpBHRL4bAlm2CDeZ7I9VrFKISX56Hf0dFgYVE1hmZg?=
 =?iso-8859-1?Q?LtDdqxYkYcpTS13eA+tBxrU5CzyZY3O00hZHOrMp51CJKV5F71O8IAzbdE?=
 =?iso-8859-1?Q?mwikGCcqONEhgVKuqU+nZluV9JWjm9QtiNO8ftR5l1+kO7g3PfmC26/4qB?=
 =?iso-8859-1?Q?IN22JjIdMsT/U6QDJJ8WstDgt5Y0Wm1YrAEgbJwseehQJLDlO3X9rtvhCj?=
 =?iso-8859-1?Q?v+njKcC6WIjgCtr0gcLVgo0nXhTfpF/MOUwGGwNeX3MEcBKvCUGQBE8sXZ?=
 =?iso-8859-1?Q?HvHIBhg+FbhD2XPhDRZM78wKRLwOKXYCnhAXap0PV87G7y78lr+/wbyBW8?=
 =?iso-8859-1?Q?kxz3ubGBCQM4JDBLuqFvOxIzV7+VK31/zetFo8HLNxSOSmYZP1/vV7HB/A?=
 =?iso-8859-1?Q?8uZge9FAg5S/f4bMBcyxaBtOvBXJ63Rh9BJWtEmBeG+/PEljq0hmsbLBqq?=
 =?iso-8859-1?Q?sCXgjKQsUXNGhw5NFNSwKXfYnaPeDbMLI9n0xvhWp6fh3eqe4XTTkGag+m?=
 =?iso-8859-1?Q?LwyoyVD5tgrPot52cWPmeuQJWjcEjfXv87KTkxMWsn9cbFVS7ovGLqDXWU?=
 =?iso-8859-1?Q?U+Wiiv4Uf7y4cBPfudEEdoFbnIICIYwwU+E84JOUVIg1c6pH/qnN4GRP4T?=
 =?iso-8859-1?Q?DExup8ZRGXI8zU9tERWaWDu4ezvJ/m/Yg09bWgw0cjAzoY4Wbgx6gLfavV?=
 =?iso-8859-1?Q?oKovO1rhfT2tLkEKNuLQKhxjxFVypZjxNCF0VfO0bclk+TOyl2evhfgZbV?=
 =?iso-8859-1?Q?Hen4VZGL2xnAJhP81ry+EoUYULHnC0005SUVqeOUQpzXzksgt8QDDzRxAR?=
 =?iso-8859-1?Q?YRsCyRHSOshHyElzqqizAZLr46Sr04XedhvGxaep4GNK83uS0/F6iky8Gl?=
 =?iso-8859-1?Q?cX+ktZZOc0tU+CR0vdaG7bFnpRmOjmSEWkNoDOesZfXwENAKpXIBRHx2zv?=
 =?iso-8859-1?Q?GN6uFtWHfjUDmLAvQ9BUKSFne2MBLHaNUiBl0oVx6fwkizsEOESw92dqQw?=
 =?iso-8859-1?Q?p9GRCOdMRbdiNL8Rb1EzJ2rwVFxkGgXB182XM2YlIa8WIxUHwGRwil7SUD?=
 =?iso-8859-1?Q?cX1bteeVjWs2rI05A+UEU/16b5Tv5TLr0EjpDUzsYy5QUImLV2NR6+RHK2?=
 =?iso-8859-1?Q?+s7hQuinJdPf2cyNxS/4gJpYsnmpiGbWVKB+oBt9ZHaOEjlJyi8NjaA3Dj?=
 =?iso-8859-1?Q?AoqVinRNBkhIMSlGO1IQq/SKnJC5tx8vymzWNEPmejPgpdcYBSdkw6fjCS?=
 =?iso-8859-1?Q?E718/p9ILGq5IYrlEqG0oXsJF9Ma5p3O6gAVBSSasTup4ndw95yEkX5nYu?=
 =?iso-8859-1?Q?hp7S00hPuQ9JHdKCwrBHIc73TYZAeBlWGQZmzPxNO15iA+vY252Yo2c1Wt?=
 =?iso-8859-1?Q?ECiu7In87yTcep4yVcYd9Eq1u1s1tjZwEK1j1jXQG9hw5rCT30Tu67h2Su?=
 =?iso-8859-1?Q?Gc8mqRshI22QxbjpiE0qILhQ5Wj7p3eURNVCG/L4EsRAjNMqcWxM1peoC0?=
 =?iso-8859-1?Q?KgI6uiPmcr7/+jt5a239bGTL3qD+egG+C0V3HAYzVgx53MUc2sHA1nZE+f?=
 =?iso-8859-1?Q?8Ycq/tylDLFTe9SAM1g6O7geYziE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IkeOwSGUnzePy+HdLINudrwmDvmMr6GFqEHGBhlld48J+32Q5lHNawc/a5?=
 =?iso-8859-1?Q?yLPdRDU2joG5QBrPaBBUn++iqSRFwzkFP15r0DcR9zTmhY2Np8GjGoIYU1?=
 =?iso-8859-1?Q?JhKrTKUg+cKFXPJWuXmXqLZ6CKpDHYh1JgTJEUGdOQ6vOyS4Lrq3+Ty3jw?=
 =?iso-8859-1?Q?j6WhkuVyCrApncKKxHmabSUgdig+N3PxT9SuKaeetaNAl1yhypU9HQWuaH?=
 =?iso-8859-1?Q?v9zcmVrhQrVevM3OaXc68MQYDOG1Fu7Cw1zrIjl18D5SWHil3ZerHgg1/Y?=
 =?iso-8859-1?Q?6eh0lfAX2vpTiEk0pQBkDsbrhmY/aZuajYMODaHGnnVQfwj+ghRHWrbDc5?=
 =?iso-8859-1?Q?p2Jlo/2mawHifNeOKyZEpupVDJf9ckD+s0qtvGc7X8AQjbOjOoq08OlY/i?=
 =?iso-8859-1?Q?SXCnA4dBzgTo3FZVr5gC2Mtdk1rcM/v7RVfKD4qtYAyF3aGCDiGOt2R24o?=
 =?iso-8859-1?Q?NSDdL5X8QOViD1nBgw7aeQP7+jnxiy0nNPd1VQHs9HxBiY7hMHHYiK/Wdo?=
 =?iso-8859-1?Q?fsZLgprcO8VE9YrGTb9OGsQqlVoZBu3eU2tp8JoHcTypyKXFgWj2+ju8No?=
 =?iso-8859-1?Q?KuvdCTCG4tLbyiWbTBcpbwT0rMEVo+eaK69D75Mk3i/sPjbVafsk5gQWQc?=
 =?iso-8859-1?Q?ZIv5rnwQZ8+/hB08P3Suv9amyb3APsZzzdr1Do6N0ns03ZCvnjSmAIqVeA?=
 =?iso-8859-1?Q?506jMOM0dGSTYTgLfrGY3AoC/9ViZThcSfilD0gbG4H+sNO79YKOibhQFx?=
 =?iso-8859-1?Q?2GyOyvE79pfwnL+RVLHp1t0sNjX3eIw/RNiwPGeknldkuB+6tQ/7hsJEsz?=
 =?iso-8859-1?Q?NbbbXUKywGnLWL78CBqMZXKvG81AZopH2JxLjmb6mPgfN8BUCXy+jlLVXB?=
 =?iso-8859-1?Q?je//YyhLO19D96nrZ67ZwH39IS957CW1yrc/2JDtbIv74rJIbUEwnq0VdY?=
 =?iso-8859-1?Q?R5+Bpr30ey4ZogFdKy/N7z/YyjBoWMI9WitO28nL0S2dUSVKx1zTVJixDv?=
 =?iso-8859-1?Q?FGQUA4QQMqa22y6YlsE9HSTMaS4ml3F33jvc+8FraMFWbI0TN0kr2vZcyj?=
 =?iso-8859-1?Q?FpB0AF3e6rv5SoxlQCaIUiEHq74n8PQijAuD/kvdMDrjFPare3iJJbLeeC?=
 =?iso-8859-1?Q?TQaqFrGGQAjEYOod5oMDiXGeJAIR9YHWMbMf3bMnmI+gPWSicmD1Pca34f?=
 =?iso-8859-1?Q?IC+Mf9ZjbpPngCF4B0QlMsrcPtXYqOvbzOqb4NsojGuf5algkEhKnI0dc2?=
 =?iso-8859-1?Q?tnVm7P9uYyv8nDUx020TVJq2hjU2xE8AjfhhiVpgMJ53Rjr7pfGKjBBwGH?=
 =?iso-8859-1?Q?S53v1AN0mWKcDkjIJpnDHpVauK2C3qocyc6Nt/kKt7/+q2fJpiihl2sM+Q?=
 =?iso-8859-1?Q?+kZWCY0Udn4TaS2YgZhL5QbZnIMxDlD68OXDdEJ2Jv6DjvUgj3j2Emo0wQ?=
 =?iso-8859-1?Q?IO56Ha9Zv0GT5FmS5Z3D0kLUwB2BEcNi8mVuMv7FkK37AI2zkBXGS1Vcbu?=
 =?iso-8859-1?Q?6ZOk+FaUCIChsqTBLDuN/MaA1oyH1ESM3JFevfA6gFpVydnxqyOHezoqyc?=
 =?iso-8859-1?Q?NHR6UwUp0vyYuuVUBF5t8RXGn2PWPc4Kf3UNwB9sOdNRJGeuY7SdKvsBNH?=
 =?iso-8859-1?Q?DVwwAwniKHvwI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c23bec6-5781-41d9-e408-08de0d70328d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 11:27:46.8687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gHSKDEWfgb0SKg1hNRaMBGka/l45FlWTsj8owtjdjPBcQd321ZJjG/D9enCA7iegSzFUVVs5yrcWgHQcuOw28A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8101



> From: Ilpo J=E4rvinen <ij@kernel.org>
> Sent: 15 October 2025 11:13 PM
>=20
> On Wed, 15 Oct 2025, Parav Pandit wrote:
>=20
> >
> >
> > > From: Ilpo J=E4rvinen <ij@kernel.org>
> > > Sent: 15 October 2025 02:05 AM
> > >
> > > On Mon, 13 Oct 2025, Parav Pandit wrote:
> > > > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > > > Sent: 07 October 2025 02:12 PM
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Ilpo J=E4rvinen <ij@kernel.org>
> > > > > > Sent: Saturday, October 4, 2025 12:05 AM
> > > > > > To: Parav Pandit <parav@nvidia.com>
> > > > > > Cc: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > > > cohuck@redhat.com; mvaralar@redhat.com;
> jasowang@redhat.com;
> > > > > xuanzhuo@linux.alibaba.com;
> > > > > > eperezma@redhat.com; ncardwell@google.com; Koen De Schepper
> > > > > > (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > > > ingemar.s.johansson@ericsson.com;
> > > > > > mirja.kuehlewind@ericsson.com
> > > > > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > > > descriptions
> > > > > >
> > > > > >
> > > > > > CAUTION: This is an external email. Please be very careful
> > > > > > when clicking
> > > > > links or opening attachments. See the URL nok.it/ext for
> > > > > additional information.
> > > > > >
> > > > > >
> > > > > >
> > > > > > On Fri, 3 Oct 2025, Parav Pandit wrote:
> > > > > >
> > > > > > > > > > > You described,
> > > > > > > > > > >
> > > > > > > > > > >     If NIC is completely unaware of RFC3168 ECN
> > > > > > > > > > > (doesn't
> > > support
> > > > > > > > > > >     NETIF_F_TSO_ECN) or its TSO engine can be set to
> > > > > > > > > > > not touch
> > > > > CWR flag
> > > > > > > > > > >     despite supporting also NETIF_F_TSO_ECN, TSO
> > > > > > > > > > > could be safely
> > > > > used
> > > > > > > > > > >     with AccECN on such NIC. This should be
> > > > > > > > > > > evaluated per NIC
> > > basis
> > > > > > > > > > >     (not done in this patch series for any NICs).
> > > > > > > > > > >
> > > > > > > > > > > Based on above commit log, can we say that when
> > > > > > > > > > > existing GSO_ECN is not
> > > > > > > > > > negotiated, ACCECN can work as_is without the patch_2?
> > > > > > > > > > >
> > > > > > > > > > > [1] commit 023af5a72ab16 ("gso: AccECN support")
> > > > > > > > > >
> > > > > > > > > > Indeed, this patch description implies that NIC that
> > > > > > > > > > currently don't support TCP_ECN will naturally support
> ACCECN.
> > > > > > > > > > But an extra TSO_ACCECN flag will make this into an
> > > > > > > > > > explicit requirement, like our patch in the Linux.
> > > > > > > > > >
> > > > > > > > > If so, the 2nd patch should word saying, the device must
> > > > > > > > > not modify IP
> > > > > > > > congestion code point bits and TCP ACE bits.
> > > > > > > > > All packets in the segment offload must have same bits.
> > > > > > > > >
> > > > > > > > > Similarly on RX side for GRO, the device requirement to
> > > > > > > > > spell out that GRO
> > > > > > > > stream to break when two subsequent packets have different
> > > > > > > > bits
> > > etc.
> > > > > > > > >
> > > > > > > > > If you can help to understand why RX side should set
> > > > > > > > > this and how one may
> > > > > > > > plan to use it, it makes sense to define the GUEST bit.
> > > > > > > > > Presently it does not look useful for rx side (guest bit)=
.
> > > > > > > > >
> > > > > > > > > > Related to another email about existing driver, one
> > > > > > > > > > solution would be replace SKB_GSO_TCP_ECN with
> > > > > > > > > > SKB_GSO_TCP_ACCECN,
> > > > > like
> > > > > > > > > > in 4e4f7cefb130af6aba6a393b2d13930b49390df9.
> > > > > > > > > > This can avoid CWR corruption somewhere after GRO, and
> > > > > > > > > > we plan to submit related patches (old driver,
> > > > > > > > > > virtio-related) into net-next after this is approved in=
 virtio-
> spec.
> > > > > > > > >
> > > > > > > > > Commit 4e4f7cefb130a looks incorrect to me, or I must be
> > > > > > > > > missing
> > > > > > > > something.
> > > > > > > > > It looks incorrect to me is because:
> > > > > > > > > 1. SKB_GSO_TCP_ACCECN is set when cwr is set, regardless
> > > > > > > > > of tcp socket
> > > > > > > > following rfc3168 or accecn.
> > > > > > > > > I was hoping to set this flag only when its accecn.
> > > > > > > > >
> > > > > > > > > 2. Even though it is set, it is not read by anyone, so
> > > > > > > > > not sure why one would
> > > > > > > > set it.
> > > > > > > > >
> > > > > > > > > 3. It appears to me that it is TX side flag and rx GRO
> > > > > > > > > should not be setting it,
> > > > > > > > because there isn't rx side code to handle it yet.
> > > > > > > > > May be this is part of some multi series work?
> > > > > > > > >
> > > > > > > > > 4. The commit 4e4f7cefb130a claims to prevent field
> corruption.
> > > > > > > > > A corruption sounds like a bug. And if it is a bug, it
> > > > > > > > > the patch needs fixes tag,
> > > > > > > > but it does not have it.
> > > > > > > > > Probably no fixes tag, because no users, that is strange
> > > > > > > > > kernel code to
> > > > > me.
> > > > > > > >
> > > > > > > > Please let me elaborate more.
> > > > > > > >
> > > > > > > > Patch 023af5a72ab16 is in tcp_gso_segment(), so it
> > > > > > > > disaggregates packet on the TX side after TCP stack.
> > > > > > > > Before patch 023af5a72ab16, CWR flag from the 2nd packet
> > > > > > > > will be cleaned if TSO_ECN is set by RFC3168 ECN in
> > > > > > > > tcp_output.c New TSO_ACCECN will be set by AccECN protocol
> > > > > > > > in tcp_output.c, indicating that this packet does not want
> > > > > > > > CWR flag cleaning from the 2nd
> > > > > packet.
> > > > > > > >
> > > > > > > I understood the commit 023af5a72ab16 and commit looks good
> > > > > > > to
> > > me.
> > > > > > >
> > > > > > > > Patch 4e4f7cefb130a is in tcp_gro_receive(), so it
> > > > > > > > aggregates packets on the RX side before going to TCP stack=
.
> > > > > > > > And you can see before 4e4f7cefb130a patch, TSO_ECN flag
> > > > > > > > will be set if cwr is 1.
> > > > > > > SKB_GSO_TCP_ACCECN and SKB_GSO_TCP_ECN are mutually
> exclusive.
> > > > > > > So not sure how gro receive commit 4e4f7cefb130a replaces
> > > > > > > TCP_ECN with
> > > > > ACCECN.
> > > > > > >
> > > > > > > But regardless of that, you explain that rx side can set skb
> > > > > > > field based on how device has coalesced the packet, And tx
> > > > > > > side can use the
> > > > > same skb when using tcp/ip stack as router/forwarding unit.
> > > > > > > (instead of terminating/originating tcp connection from the
> socket).
> > > > > > >
> > > > > > > > This TSO_ECN flag implies that it's ok to segment this
> > > > > > > > aggregated packet and clean CWR from the 2nd packets by
> > > > > > > > latter
> > > operations.
> > > > > > > > But this is NOT ok for AccECN protocl, new TSO_ACCECN flag
> > > > > > > > explicitly tells latter operations that it's NOT ok to
> > > > > > > > clean CWR from the
> > > > > 2nd packets.
> > > > > > > >
> > > > > > > Right.
> > > > > > >
> > > > > > > > And the corruption in the commit message means the CWR
> > > > > > > > flag cannot keep the origianl value (i.e., been reset by la=
tter
> operations).
> > > > > > >
> > > > > > > If the code reset the value when it should not, it means it
> > > > > > > was bug and needs fixes tag.
> > > > > >
> > > > > > It was intentional for RFC 3168 ECN offloading to the reset the=
 value.
> > > > > > In the traditional sense it isn't "bug" because it was done
> intentionally.
> > > > > > "When it should not" too, should considered with the
> > > > > > background this
> > > > > offloading feature has (from era when AccECN didn't exists at all=
).
> > > > > But it's fine to end up disagreeing on this detail about Fixes
> > > > > tag, in any case that commit is immutable now so this discussion
> > > > > is pretty
> > > moot :-).
> > > > > >
> > > > > > > Anyway, I don't want to diverge on the discussion.
> > > > > > >
> > > > > > > Seems like setting SKB_GSO_TCP_ECN seems fine even on rx skb
> too.
> > > > > >
> > > > > > SKB_GSO_TCP_ECN will not replicate the same TCP header flags
> > > > > > in a
> > > > > forwarding scenario:
> > > > > >
> > > > > > Segment 1 CWR set
> > > > > > Segment 2 CWR set
> > > > > >
> > > > > > GRO rx and GSO tx with SKB_GSO_TCP_ECN, after forwarding
> > > > > > outputs these
> > > > > > segments:
> > > > > >
> > > > > > Segment 1 CWR set
> > > > > > Segment 2 CWR cleared
> > > > > >
> > > > > > Thus, the ACE field in Segment 2 no longer contains the same
> > > > > > value as it was
> > > > > sent with.
> > > > > >
> > > > > > As rx side, generally, does not know if the sender is using
> > > > > > AccECN or RFC
> > > > > > 3168 (or some entirely different semantics for these flags as
> > > > > > these TCP
> > > > > features are negotiated). I said "generally" because it would
> > > > > required connection tracking to know it which is expensive and
> > > > > has its
> > > own challenges.
> > > > > >
> > > > > >
> > > > > > If you, on the other hand, imply that SKB_GSO_TCP_ECN could
> > > > > > just become
> > > > > SKB_GSO_TCP_ACCECN just by declaring this corruption a "bug",
> > > > > that too is not possible.
> > > > > >
> > > > > > Or to be more precise, that would mean removing RFC 3168 ECN
> > > > > > offloading
> > > > > support from the tx side (where it may have some, albeit IMO
> > > > > quite limited [*], performance benefits). When we're TX'ing
> > > > > segment the kernel knows originate from RFC 3168 sender as
> > > > > indicated by SKB_GSO_TCP_ECN flag, it can safely perform the RFC
> > > > > 3168 offloading
> > > without fear of corruption.
> > > > > >
> > > > > >
> > > > > > [*] RFC 3168 CWR is only sent once per RTT so those segments
> > > > > > should not
> > > > > appear very frequently. What RFC 3168 offloading does is
> > > > > effectively allow CWR to be send within the same super-skb with
> > > > > non-CWR segments as the RFC 3168 offloading with
> SKB_GSO_TCP_ECN
> > > > > ensures CWR is only sent out in one segment. Without
> > > > > SKB_GSO_TCP_ECN, the sender would have to send CWR segment
> > > > > separately (this potentially comes with a minor performance cost)=
.
> > > > > >
> > > > > > > So you should just refine the wordings for patch 1 and 2 to
> > > > > > > match exactly what it means for virtio spec requiirements
> > > > > > > and description section.
> > > > >
> > > > > Thanks Ilpo for example above, and I just realized that the mail
> > > > > server miss- resend an old email on Sunday, sorry for spamming.
> > > > > And I hope above explanations related to the CWR flag are clear.
> > > > >
> > > > > One more thing I would like to raise is about the ECN flag
> > > > > mentioned in current virtio-spec.
> > > > > As SKB_GSO_TCP_ECN is not related to IP.ECN in RX path even
> > > > > before 4e4f7cefb130a patch, and neither in TX path before
> 023af5a72ab16.
> > > >
> > > > Can you please discuss with the netdev maintainer and clarify the
> > > > usage of
> > > SKB_GSO_TCP_ECN.
> > > > i.e.
> > > > a. does SKB_GSO_TCP_ECN apply to RX side? From the name of "GSO"
> > > > it
> > > does not seem so, but three drivers hns3, mlx5, virtio-net are using
> > > these on the RX.
> > > > If this applies to the RX also, can we please send comment update
> > > > patch to net-next to update, include/linux/skbuff.h
> > > >
> > > > Something like:
> > > >
> > > > --- a/include/linux/skbuff.h
> > > > +++ b/include/linux/skbuff.h
> > > > @@ -671,7 +671,9 @@ enum {
> > > >         /* This indicates the skb is from an untrusted source. */
> > > >         SKB_GSO_DODGY =3D 1 << 1,
> > > >
> > > > -       /* This indicates the tcp segment has CWR set. */
> > > > +       /* This indicates the first tcp segment has CWR set in GSO
> > > > + or GRO
> > > stream.
> > >
> > > Hi,
> > >
> > > It feels little odd to me to make such a change to a comment now if
> > > the whole point with AccECN is that SKB_GSO_TCP_ECN can no longer be
> > > safely used on the rx side.
> >
> > So SKB_GSO_TCP_ECN will be overloaded where if AccECN is negotiated,
> > GRO stream contains IP+TCP bits as per AccECN
>=20
> No, it's not overloaded (in the sense that SKB_GSO_TCP_ECN could be
> interpreted in more than one way). The SKB_GSO_TCP_ECN semantics still
> follow RFC 3168 ECN which results in wrong behavior (corruption of AccECN
> signal).
>=20
> > And without accECN negotiated, only the first segment will have ECN bit=
s?
> > If so, can the header comment be updated in such a way?
>=20
> If some change is wanted to this, maybe something along these lines:
>=20
>  * For Tx, this indicates the first TCP segment has CWR set and any
>  * subsequent segment in the same skb have CWR cleared.
>  *
>  * This cannot be used on Rx because it is not tracked whether the
>  * connection the segment belongs to uses RFC 3168 or Accurate ECN (using
>  * RFC 3168 ECN offloading for AccECN segment may result in corruption of
>  * AccECN signal). Thus, on Rx any CWR flagged segment must use
>  * SKB_GSO_TCP_ACCECN.
>=20
Sounds find to me.
I believe virtio-net, mlx5 and hns driver to follow the fix to not set this=
 on rx, once your commit goes through.
Right?

> --
>  i.
