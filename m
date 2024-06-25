Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED43143C5A
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 05:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719292030; cv=fail; b=Xv9LD7DcAisjOBEpFvU9iMok+0rL/EIs79fRgrCCZ60qcjW2DO7V62LdqI7TUS7qzYNxTh1UrLZ+7Mbus0mLyFvFRkjWnIivKHv/HWVe04INCycsLiDJJkznCIglKWlJ/3IEAfVFFstBgzfU9nMQfLOSpBrAIrFQSQ/m+I6ZNh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719292030; c=relaxed/simple;
	bh=qEmPSapr4uDhsAVx5nQFv0UzvvbluIUJJeGLHD5xIKA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a8YLBzmiZ+vYRPdIjW7YXML0Ds9z7K9Tgo8houDQhzWIBvK6pmNhKARQZOfPRBw+81ouzUVYlaep9thm6JY7IoJE/aGO3wOeW5kFLR2dsQnUayemVz9HOiyHLU8D6QkIbE/XEiX6y17an4gxXDPWFn2XrKDyAZp+jKCWDBWfI5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J+TamVEf; arc=fail smtp.client-ip=40.107.94.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J+TamVEf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaeGcjVnJgZs4czNg02CBqdl6v2RXWo2BofgprLCJkRlqk2N1k/PVWHIFqRdzffANUJsoI1xCyKyXP8DBe/cgyxUxx2vuFheZrLqEWfnG5gR1n2QeLi7AXAEeyLsV2I55ZGqeDa0gObgB6cMT+pLKiesd3Cstskg2wCBh5USFndGcr0+BTvL3EJlDeVedQtapYTA0CqYIQbGrl9hMJDpHP2hXGXNOORWD6hTMCOB/juom6F6mmKJ91VFOLnPtRF7Hx1h2dEPie9b7/dA0RWk9BkQkLnKCAD6ycjl3hUFZzBjl/eEDArYR78g+kod81NJcXkykujjDKsDuCacHuA6mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEmPSapr4uDhsAVx5nQFv0UzvvbluIUJJeGLHD5xIKA=;
 b=UCafcr67MWDNkGsSjk0zdvSFqAoLRHsw35GlCqfBKbR1vzSYw2VB7EX5DAaMu+0pk46Xd8Jty/PLqIzM7OQt/TEfY7ZzfC9DBcde+OjLZ0ra4jrLnqgkoaO1gFCWxwP/NfJfnZfD44IhJHNoCroSSEZ0NFTclRT56WRcIKA+kqLgSL8QRCGwYOXSA4Ga9VxmO2nGnatqbW/6olarD3rVbvTwAxn3z3PlVzXvD3LMN/4k41/Y36eq9M/KFpXM7t8u0D2rUmEQKd++d5OtIuIKZumHU9qdYOf9uYAJuQX88KZCdrAOvLnoixgkFGSKYuc5OgzUmMmmIySh3MmE3xuJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEmPSapr4uDhsAVx5nQFv0UzvvbluIUJJeGLHD5xIKA=;
 b=J+TamVEfXAciR7Hj3N3ubCAu2SupSxgUYo1fKlYlYTpvpeabxI4vBSv8RQ+epBFVCX6BlJUeRtJCOEqob4rffB2sy39QmM1tA3M/e4m01bKAHzSY6vCpoC9alYlPlzyxoJuBWpCSHXCYymldoL2GnAw3fmywp+wUeuFf7+qc5RSuzvGjWwJFhp3d0QGddeIRKAmfbwk2GytRjts/TpwO+d6u4UhiC88i4vR5H5+j0s0LPFyTT+jltmicJjFULVMwFczJX1DRfdkHjGjpeIMqTu2kHAA0DKRMlbWDcVt+UsWeNZuIpGnr8vRA1AOoo1IfxS4A7DQMqWrC7XeMS2GGVw==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SA1PR12MB7269.namprd12.prod.outlook.com (2603:10b6:806:2be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 05:07:05 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 05:07:05 +0000
From: Parav Pandit <parav@nvidia.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH RESEND 1/4] virtio-net: support transmit hash report
Thread-Topic: [PATCH RESEND 1/4] virtio-net: support transmit hash report
Thread-Index: AQHaxicH0QA68WaqpkmDvXO27MuHErHX7TuQ
Date: Tue, 25 Jun 2024 05:07:05 +0000
Message-ID:
 <PH0PR12MB54815E92763ECF9C4CEB21A8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
 <20240624-v1-4-topic-virtio-net-timestamping-v1-1-fa3c163e4aa9@pengutronix.de>
In-Reply-To:
 <20240624-v1-4-topic-virtio-net-timestamping-v1-1-fa3c163e4aa9@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB7269:EE_
x-ms-office365-filtering-correlation-id: 2d964ce2-d8bc-4876-708c-08dc94d4a807
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?TEhxMm82dWZ1YWhHZ3k0MGlxU2VEOXJ0ckxWMGppc0ZjRGdwdSs0Y1dDVmJO?=
 =?utf-8?B?NTNiTUdycVJGbUkrUU1oQUdaVnArbUZOWGc0bXpiY0p5MFIzTy9ady85SmIz?=
 =?utf-8?B?QzF4SVkwMCtwbDUva0NyeW03TkR1SkwrT3RjN2JCZjR4L3ZCQnErM2VjRkFq?=
 =?utf-8?B?UVNTajVUamJiZG02MTgrTWEwZlN6dEhpMTczMmgyM09Ya3hmWlB4WEZuK1Zs?=
 =?utf-8?B?L3lkK0dGRGhocW90ZlMzOE00bzBvVDhlUWpuS3B6Tk5CVEc4emFDOEJwMWRB?=
 =?utf-8?B?cVBUZkdaY1J4MWFLcEc4dm5UZk1NQTh4T1pqeHh5bjZlbGhpaFR4QjVkOG5r?=
 =?utf-8?B?RmVWRCtmdDltWDlSY2VFWWVobC96SGI5SlV1SmUyL1JvekFsTnFvWGMvQTJW?=
 =?utf-8?B?L1drc3VEeW5paHpGVVBIQlZiMXI0ZDBvenQ5UVVFNTZSM3RNQ0pzZEVsTENH?=
 =?utf-8?B?MUcwdW95ck4vNVNGSVk0c01KSVd6K2tLWmJrZzhrN2xnWVlDVE9JbU1DU0l6?=
 =?utf-8?B?N28ydXJrU1ZBdlBVOW1qeURVUHFNMXBXelZmcWRYVFRWYUVoQ3htTXFhaGRi?=
 =?utf-8?B?Skhrd0c4UnViLzZwcWR6a2pZMTI1UFAvSjEyS0kyRjE0bUdXVWdYcTMrMSta?=
 =?utf-8?B?aHE0UHNZak5nMVg4NWlzWld6QUt4UWVMR3hhaGd3QXBoZEhBVkgvNlFzV29O?=
 =?utf-8?B?UW9WaHFLZjNEOVV2bk9mb2wzdHgvWXdNN3RpU3NyeFIrajJlKzBUczRLVVBt?=
 =?utf-8?B?dENISFFFOXpLd20yVVlrOWdsRWdrL2tsSDRISGU4ZWN6SzNqdVhSYlY2TVVX?=
 =?utf-8?B?YkVjeGtRT2dqcy9BV1NGQ2MrQmhxWThvUnVrQW1qUTNobWU4TnAwM1NnYlVE?=
 =?utf-8?B?cjBJaEJPMThxNXhCWnQvb0FwdVhKcGRuQUZVeGc4WlhwWnh1YWV3czdYN25C?=
 =?utf-8?B?WmFZMXRhZGhxVU9OME9YWmlxRGVuUWRWMGxwZkdtVVBHdVBqdERBYVVGZ3FF?=
 =?utf-8?B?WmE1aUlZaW9PaGc4RmpWZDFDK2h4NS9EaVl3TlBNSHRKc2EwUUwzNksydk9y?=
 =?utf-8?B?UVFFbDI3V1V4UGVzSnBmcU1WNW8rcXFJNUdBa3h3QTlkZ0lXV09paFFuM2dU?=
 =?utf-8?B?SjhyNWxwN2dHVjl3MFlDY3J4UzR2WjFVVFFqVDJIM09vbTNQYmVhSGdqTmV0?=
 =?utf-8?B?YXF6bTJCcVdFa1hNOWw2aGZiNC91bHU3alZ2NW8vUjBSOWQ2OFIxVWhpYUM2?=
 =?utf-8?B?a0R4OEhuS1RmbUZtQTBoWWNCUUt1aDZLVVVGWlMrVldONnA2TUl0eG5LODBn?=
 =?utf-8?B?clBRSXE5RTh6Z05GUHdpTnlaNE50SFdWU0lVeE81MlQyMzRDb2JwUUsyWXpP?=
 =?utf-8?B?OXFzd3VsczlpSGp0VnRjMGdiSUpjUHRtR1JIZUViNmc5TmtTeFRzZ1RUcVFw?=
 =?utf-8?B?Y05JczZEalZ6djhQM1JYYzA1d2pBUWJxR09CcjZzWkRzNy9GSGlCWllGcmlD?=
 =?utf-8?B?Szl1UDhXNmJvQVNCMC9JRVFXT0tpMitlelNUNHdmODFTdXBKc2lMdE5WekxF?=
 =?utf-8?B?SWIvM3BFMTFyNW0wUkQ0Yit1TVhwNWJVbVFCdC9XTVhidkJMS0l1K2lSUjdI?=
 =?utf-8?B?WlA4cldWZlYyZndxbHBVSUZNVzNCWXZYQjBIc2xBSXdGWkExWHp6WXJ4Q3RE?=
 =?utf-8?B?OVBwT3pjN3ZIcVIxaHpLT0lWQk02OHZIclZmWklUd0ljVmtUa3p5andPSURM?=
 =?utf-8?B?Y01HRjQyZ0tXUmpUM3gvdlZYaDNmTTNnTXdyR3N6TjU2NHdUL2N6a3I5ZThp?=
 =?utf-8?Q?ZRQmQK8aDtGZLvkVRsKqAjk1dKZn7hc+/3Ifo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDNnV2t0VnZERFVxZmswLytKN3pvL3ZubUkrUXhMVno0am1VTGljRHpYUzlE?=
 =?utf-8?B?R0x6aTB2S3FNdldQemVGVkdpcWZIbGRKWEpRUWRJOEZITGlYOVVGY1F4dDVo?=
 =?utf-8?B?WXhJYWZvaHdSOWtjQzBoTGNzanFNODZZbzlNNlZtZ3k4blF5WkQ5YVRwWk5J?=
 =?utf-8?B?MmhUV09uenNaTFBvTEdySm5Ic2EzMGEzVlhhWXUvdWM4clpCSCtFZjBJS1o3?=
 =?utf-8?B?YTJFeFkyLzRibkVWVVVBV0lwUWM3UHRIb25oSGVWMFhmNjkvSXJpNU9mSGpo?=
 =?utf-8?B?VUtJTmVYOElzUlg3UFAyekR5UGwzRWhab3BGYWtwcHhyMS83N0FLTjRPQXF2?=
 =?utf-8?B?bFN4OVk5Z0J3Wkk5aW5XVXpBdWJzTjlCQ3ZHOEVoSFBncFhTZkRxei9td1Bp?=
 =?utf-8?B?UXFCenVjRmNoTXk5aFRKNlhaVyt2L3M1TWF4VitCNDRpcllLSEVoNGl6M0pj?=
 =?utf-8?B?TzN5RVVnQUcwR3pNZEhSM2hrK3V0My9XbXdNcHRRUldyV0NZelk1U0hmVWJN?=
 =?utf-8?B?a0J2Zkxpd0FlaStUQ055aTRna3pldWtqV2tFdTNFL2lhN1VhaUsyVkJ4cUE3?=
 =?utf-8?B?TFJtc0dVUG9GWERJbmNKNWgzQlpJOVJZVnhkQkQwKzdYM2lDNmsvZURPdnZk?=
 =?utf-8?B?TmJ0MlpSSzRlaHd4V1UyZk1lOXU1UlZFTmllRUhBNXBicGZiSTZPd0Q0QTF6?=
 =?utf-8?B?Si9jNDB6L21TNDFCNWJEWlVPeGVmb2NEWTlPUENRQlh1OXBmTlorQ1gzMEpO?=
 =?utf-8?B?K3FhRGVVa2NUR1BHUHlMbnVweSsrWkw1eVhSSmlYU3BPNWU2SHNYNUJwVFJv?=
 =?utf-8?B?R0FKSzdZb0NwbDVOeVVNNzFqZEdEYUhMSTJGMUJSVjM5SFY0T0FTb3hJWExD?=
 =?utf-8?B?aUpQKytUb0xBNSs1UjBoeU9XUDg5dFdOMzhTZHVadFpWWHIrdkJrUGpYWE55?=
 =?utf-8?B?eFN0WEFPVXoxMnBVNFBhMjAyTHVVWHpOWGlyZEtOdFhsS3VtcWw4VTlCWTZN?=
 =?utf-8?B?YW5BNWd6ekVpeDlHZmNFK3daSzVPSTlCbGcwMGtmRGpTRjJFcjN1K2xwVXRX?=
 =?utf-8?B?YjFaWnBzbnAvSDBKbUg4Yko2MnlVYXBjYWhZR1hmRW9zM0hqT055SUd2R2Fw?=
 =?utf-8?B?a3BOL2JsbGR6VDlmSzRHdDVDZW85L1liUUt5UHh4dEorc2JPeFo1MHNMeWxw?=
 =?utf-8?B?L25rdnRLQlpIVkN2R09hczhvVmdyUVZUWVMyUHBmWVBTL1FwL3oyUFVuMFNm?=
 =?utf-8?B?cy9rUEVtOCtlQ2htaERzbVZhQ0EyclJacWNLOVBuVXk4aVQ2aUF3a3NaWjJG?=
 =?utf-8?B?ZDYxV3l3Rks0MnBSRmNseVgxV284amFPYW4veHR2V3BXeFZTTG5OQUExc3pM?=
 =?utf-8?B?blhGNVlZRVcwdnBoaTNQd1NqamI1cFE0eFBXdFRndlpPVmVROFN0U1c4QlhT?=
 =?utf-8?B?WWhkSk1yaU44SzQxUlNaUXYySlRsZGR6Z0RMMHBTTFcvL0t6T25zTW5KQTkz?=
 =?utf-8?B?RjAxeUFGYjFMVjF6eWhnN3A1QkxkcUNPUWxKNC9lR2R4am5uWW0xSlpET2dW?=
 =?utf-8?B?eTJyWWJFUFhxS0k2ZlMzaUhJV1o4TWV1a0ZOeW54ZGt4SUNNUzdLUUY3Qm1n?=
 =?utf-8?B?MGRiVERDbWdZU2VHczFnSnJrNmlOQisyN3hJUDZSTUhvYXlYNGdEZnlVWlhM?=
 =?utf-8?B?MnJMcFJ2dGNuZnpoUFRWRGlZWmIxMS84VHV4QlVBNWNuMVB0TitMVmZHb1Rv?=
 =?utf-8?B?UU1JbmdNZjEzaVRLcWU0cHFCTG5wb2UxVVRVRU9PT1ZZTHVVNzBoblU4SGpB?=
 =?utf-8?B?dVg4a3MzcTNnRldPZmNSZnlaWEljRWhIUG9FL3ROeTE4RzNuL0pMUUhlUzZS?=
 =?utf-8?B?b0RSMkZvM1pldHQzTkticDMza0JhK1AzZGJXSHNhb0dTNm81Yll2dEV2Nzha?=
 =?utf-8?B?ZkZtdXl6QWUxQncrcmEyVk0yVGRjZlFCYmNpYzJxSTF5MFFXZW5XMjNITXlK?=
 =?utf-8?B?WWU1Y0VKUUF0WXFhT1ROcmVKOHpZODJNMnorTW80UGtkTlpZZUtWMjJnVENo?=
 =?utf-8?B?ZFpMUkpRYWFON21RQ0lGWE9JWklDcTNwZVg5OWR2emJqSUxzRUVrU3FPaE1J?=
 =?utf-8?B?MTJoRDhJYmE1S3Bpam0vSzBwL1NsWjFkVi9wL3grVm0yMkpkTFE1YTFtRG5J?=
 =?utf-8?Q?zEYARZpd+U2J2lxEYQF+X/Y=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d964ce2-d8bc-4876-708c-08dc94d4a807
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 05:07:05.2663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pIMtGubljOoPY61eZyqmPSDJaNrbojaRjsF5RQV467HTnea8/4EMtceVcuwGsjkxIqfXC8AT10RAcW2Cf150cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7269

DQoNCj4gRnJvbTogU3RlZmZlbiBUcnVtdHJhciA8cy50cnVtdHJhckBwZW5ndXRyb25peC5kZT4N
Cj4gU2VudDogTW9uZGF5LCBKdW5lIDI0LCAyMDI0IDQ6MzkgUE0NCj4gDQo+IFZpcnRpby1uZXQg
c3VwcG9ydHMgc2hhcmluZyB0aGUgZmxvdyBoYXNoIGZyb20gZGV2aWNlIHRvIGRyaXZlciBvbiBy
eC4NCj4gRG8gdGhlIHNhbWUgaW4gdGhlIG90aGVyIGRpcmVjdGlvbiBmb3Igcm9idXN0IHJvdXRp
bmcgYW5kIHRlbGVtZXRyeS4NCj4gDQo+IEV4cGVyaW1lbnRhbCByZXN1bHRzIG1pcnJvciB3aGF0
IHRoZSB0aGVvcnkgc3VnZ2VzdHM6IHdoZXJlIElQdjYgRmxvd0xhYmVsDQo+IGlzIGluY2x1ZGVk
IGluIHBhdGggc2VsZWN0aW9uIChlLmcuLCBMQUcvRUNNUCksIGZsb3dsYWJlbCByb3RhdGlvbiBv
biBUQ1ANCj4gdGltZW91dCBhdm9pZHMgdGhlIHZhc3QgbWFqb3JpdHkgb2YgVENQIGRpc2Nvbm5l
Y3RzIHRoYXQgd291bGQgb3RoZXJ3aXNlDQo+IGhhdmUgb2NjdXJyZWQgZHVyaW5nIGxpbmsgZmFp
bHVyZXMgaW4gbG9uZy1oYXVsIGJhY2tib25lcywgd2hlbiBhbg0KPiBhbHRlcm5hdGl2ZSBwYXRo
IGlzIGF2YWlsYWJsZS4NCj4NCkNhbiB5b3UgcGxlYXNlIGV4cGxhaW4gaG93IGRvZXMgdGhpcyBy
ZWxhdGVkIHRvIHRoZSB2aXJ0aW8tbmV0IGRldmljZSBvbiB0cmFuc21pdCBwYXRoPw0KVGhlIHZh
bHVlIHByb3Bvc2VkIGhlcmUgaXMgb25seSBiZXR3ZWVuIHRoZSBkcml2ZXIgYW5kIGRldmljZS4g
SXQgd29udCBiZSBwYXJ0IG9mIHRoZSBwYWNrZXQuIERpZCBJIHVuZGVyc3RhbmQgcmlnaHQ/DQpJ
ZiBzbywgd2hpY2ggbGluayBkbyB5b3UgcmVmZXIgdG8gaW4gYWJvdmUgZGVzY3JpcHRpb24/IFZp
cnRpby1uZXQgZGV2aWNlIGxpbms/DQoNCiANCj4gUm90YXRpb24gY2FuIGJlIGFwcGxpZWQgdG8g
dmFyaW91cyBiYWQgY29ubmVjdGlvbiBzaWduYWxzLCBzdWNoIGFzIHRpbWVvdXRzDQo+IGFuZCBz
cHVyaW91cyByZXRyYW5zbWlzc2lvbnMuIEluIGFnZ3JlZ2F0ZSwgc3VjaCBmbG93IGxldmVsIHNp
Z25hbHMgY2FuIGhlbHANCj4gbG9jYXRlIG5ldHdvcmsgaXNzdWVzLg0KPg0KIA0KPiBTaWduZWQt
b2ZmLWJ5OiBTdGVmZmVuIFRydW10cmFyIDxzLnRydW10cmFyQHBlbmd1dHJvbml4LmRlPg0KPiAt
LS0NCj4gIGRldmljZS10eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4IHwgMzAgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RldmljZS10eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4IGIvZGV2
aWNlLQ0KPiB0eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4DQo+IGluZGV4IDYxY2NlMWYuLmViMmMw
OGUgMTAwNjQ0DQo+IC0tLSBhL2RldmljZS10eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4DQo+ICsr
KyBiL2RldmljZS10eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4DQo+IEBAIC04OCw2ICs4OCw4IEBA
IFxzdWJzZWN0aW9ue0ZlYXR1cmUgYml0c31cbGFiZWx7c2VjOkRldmljZSBUeXBlcyAvDQo+IE5l
dHdvcmsgRGV2aWNlIC8gRmVhdHVyZSBiaXRzICBcaXRlbVtWSVJUSU9fTkVUX0ZfQ1RSTF9NQUNf
QUREUigyMyldDQo+IFNldCBNQUMgYWRkcmVzcyB0aHJvdWdoIGNvbnRyb2wNCj4gICAgICBjaGFu
bmVsLg0KPiANCj4gK1xpdGVtW1ZJUlRJT19ORVRfRl9UWF9IQVNIKDQ5KV0gRHJpdmVyIHNlbmRz
IGhhc2ggcmVwb3J0DQo+ICsNCj4gIFxpdGVtW1ZJUlRJT19ORVRfRl9ERVZJQ0VfU1RBVFMoNTAp
XSBEZXZpY2UgY2FuIHByb3ZpZGUgZGV2aWNlLWxldmVsDQo+IHN0YXRpc3RpY3MNCj4gICAgICB0
byB0aGUgZHJpdmVyIHRocm91Z2ggdGhlIGNvbnRyb2wgdmlydHF1ZXVlLg0KPiANCj4gQEAgLTY0
MSw2ICs2NDMsMzQgQEAgXHN1YnN1YnNlY3Rpb257UGFja2V0DQo+IFRyYW5zbWlzc2lvbn1cbGFi
ZWx7c2VjOkRldmljZSBUeXBlcyAvIE5ldHdvcmsgRGV2aWNlIC8gRGUNCj4gDQo+ICBJZiBWSVJU
SU9fTkVUX0hEUl9GX05FRURTX0NTVU0gaXMgbm90IHNldCwgdGhlIGRldmljZSBNVVNUIE5PVCAg
cmVseQ0KPiBvbiB0aGUgcGFja2V0IGNoZWNrc3VtIGJlaW5nIGNvcnJlY3QuDQo+ICsNCj4gK1xw
YXJhZ3JhcGh7SGFzaCBjYWxjdWxhdGlvbiBmb3Igb3V0Z29pbmcgcGFja2V0c30gXGxhYmVse3Nl
YzpEZXZpY2UNCj4gK1R5cGVzIC8gTmV0d29yayBEZXZpY2UgLyBEZXZpY2UgT3BlcmF0aW9uIC8g
UGFja2V0IFRyYW5zbWlzc2lvbiAvIEhhc2gNCj4gK2NhbGN1bGF0aW9uIGZvciBvdXRnb2luZyBw
YWNrZXRzIH0NCj4gKw0KPiArSWYgdGhlIFZJUlRJT19ORVRfRl9UWF9IQVNIIHdhcyBuZWdvdGlh
dGVkIGFuZCB0aGUgcGFja2V0IGluY2x1ZGVzIGENCj4gK2hhc2gsIHRoZSBkcml2ZXIgdXNlcyB0
aGUgc3RydWN0dXJlIHZpcnRpb19uZXRfaGRyX2hhc2hfdHMgaW5zdGVhZCBvZg0KPiB2aXJ0aW9f
bmV0X2hkciBhbmQgaW5jcmVhc2VzIHRoZSBcZmllbGR7aGRyX2xlbn0gYWNjb3JkaW5nbHkuDQo+
ICsNCj4gK1xiZWdpbntsc3RsaXN0aW5nfQ0KPiArICBzdHJ1Y3QgdmlydGlvX25ldF9oZHJfaGFz
aF90cyB7DQo+ICsgICAgc3RydWN0IHsNCj4gKyAgICAgIHN0cnVjdCB2aXJ0aW9fbmV0X2hkciBo
ZHI7DQo+ICsgICAgICBfX2xlMzMgdmFsdWU7DQo+ICsgICAgICBfX2xlMTYgcmVwb3J0Ow0KPiAr
ICAgICAgX19sZTE2IGZsb3dfc3RhdGU7DQo+ICsgICAgfSBoYXNoOw0KPiArICAgIF9fdTMyIHJl
c2VydmVkOw0KPiArICB9Ow0KPiArXGVuZHtsc3RsaXN0aW5nfQ0KPiArDQo+ICtUaGUgZHJpdmVy
IGZpbGxzIFxmaWVsZHtoYXNoX3ZhbHVlfSB3aXRoIHRoZSB2YWx1ZSBvZiB0aGUgY2FsY3VsYXRl
ZCBoYXNoIGFuZA0KPiBcZmllbGR7aGFzaF9yZXBvcnR9IHdpdGggdGhlIHJlcG9ydCB0eXBlIG9m
IHRoZSBjYWxjdWxhdGVkIGhhc2guDQo+ICsNCkl0IHdvdWxkIGJlIGJldHRlciB0byB3cml0ZSBp
dCBhcyBcZmllbGR7aGFzaC52YWx1ZX0gYmVjYXVzZSB0aGVyZSBpcyBubyBoYXNoX3ZhbHVlIGZp
ZWxkLg0KDQpJbnN0ZWFkIG9mIGRlZmluaW5nIG5ldyBzdHJ1Y3R1cmUsIHByb3Bvc2VkIGZlYXR1
cmUgYml0IGNhbiByZXVzZSB0aGUgZXhpc3RpbmcgaGFzaF92YWx1ZSBhbmQgaGFzaF9yZXBvcnQg
ZmllbGRzLg0KSSBndWVzcyB0aGF04oCZcyB3aGF0IHlvdSBtZWFudCBpbiBhYm92ZT8NCg0KPiAr
UG9zc2libGUgdmFsdWVzIHRoYXQgdGhlIGRyaXZlciBzdXBwb3J0cyBpbiBcZmllbGR7aGFzaF9y
ZXBvcnR9IGFyZSBkZWZpbmVkDQo+IGJlbG93Lg0KPiArDQo+ICtcYmVnaW57bHN0bGlzdGluZ30N
Cj4gKyNkZWZpbmUgVklSVElPX05FVF9IQVNIX1JFUE9SVF9MNCAgICAgICAgICAgICAoMSA8PCAx
MCkNCj4gKyNkZWZpbmUgVklSVElPX05FVF9IQVNIX1JFUE9SVF9PVEhFUiAgICAgICAgICAoMSA8
PCAxMSkNCj4gK1xlbmR7bHN0bGlzdGluZ30NCj4gKw0KUGxlYXNlIGRlc2NyaWJlZCBfT1RIRVIg
dHlwZSBvZiBoYXNoLg0KDQo+ICBccGFyYWdyYXBoe1BhY2tldCBUcmFuc21pc3Npb24gSW50ZXJy
dXB0fVxsYWJlbHtzZWM6RGV2aWNlIFR5cGVzIC8gTmV0d29yaw0KPiBEZXZpY2UgLyBEZXZpY2Ug
T3BlcmF0aW9uIC8gUGFja2V0IFRyYW5zbWlzc2lvbiAvIFBhY2tldCBUcmFuc21pc3Npb24NCj4g
SW50ZXJydXB0fQ0KPiANCj4gIE9mdGVuIGEgZHJpdmVyIHdpbGwgc3VwcHJlc3MgdHJhbnNtaXNz
aW9uIHZpcnRxdWV1ZSBpbnRlcnJ1cHRzDQo+IA0KPiAtLQ0KPiAyLjQyLjANCj4gDQoNCg==
