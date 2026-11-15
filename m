Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794706943;
	b=4/naUnyg+RmmPsdu70jybgS3X4BXX/vmESfS9/nqPw3JHuE+jnFEm2i+E7+NW0isZdtp
	 w1Ar9lDJ2IM1kGzye+mqya1d3nTd0GgkWSHxppePXi5ZKqqwllNtwHcJuaOHl7qJKgpFu
	 sgIYrwoR5CzGgC93kNmu9uQ4ZHB+7AjK7whFQMl2hVKw6O9U4R+i+YUU+UfvmPuu0eZfK
	 Za9zPLHGxgldP/Pl9NGVhnfZEbPs2a0q0pmOQEqaGSaeyt3vIz86ei80a9AVSiEF3sepI
	 cwEFGxNksuOhoo4BB9rC5e6xdwgt2IXDHUUUZrZ6mckDrj7qJku+OXuxE71ksipHCsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794706943;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=J5nSDdgE1uJj8ykXZCXLgCT0Aa5pbN7LRI8WvqKxk/s=;
	b=Iylq6u6zNDjpMEvRtiMeu2lEwacrD9Ul994/T6fSfZaTL/InOpWBtUg8nDi6UqjJ5235
	 0eCrM/yvbpGcAo0FOl1LfUceaQ30aMO9fWpHdOclWe36gs8MzxI353/jlrhidr7Uz8RpZ
	 rGnvvGL+WUku13u/kSkJdSg2KIJjEwOEVU8hdldTWDhigCP7/wZyUppETBSaFxmkWOy96
	 B6P/gf0VnXgCCseU/WVQnwrCqgLTlfbCP2nFdn6H62HRIEGc626ioJEsxD2DrcXLkfIkC
	 +HDp+SNe6NhjeNgy2ENeM+zN02sYW39vTaA46nmhT/gOjl9zvSs/KZkGzbxy7Vjytrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rfZa3Mje;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.15
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ECE606A323
	for <virtio-comment@lists.linux.dev>; Sun, 15 Nov 2026 01:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6ECE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rfZa3Mje
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVRyuvI5U/aGu4iBTU8i+LOr1EkY/+1T1DvEB12imSCDmORPbZIEjTI9KNtbXWAfF3Lt5StX3GF+73eZrNLMQzgbZ60/2GpAS2JnhDR0a2yEyauWmoAHUJ1DNzeTiwNKDm1hN5C/No8r01fQ2IoBhpiJFTvKUBoYsZiiHLxb5G/Nds1TIPAafeD9gDELptrh1iDEW892W2fS5ClDFXMDr0xqbuQ4Jq71W5qYhYEXHrS1HXHuLP4cUhuAY7TNrN+SyGwu3ZRLcbJxKVW01NDTjavS1Ks2ZKtiQDtXvcWLn94m9qxZ6LPiO2OIGQapn+k2IIYhNbNgO8IJDvBqibfToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5nSDdgE1uJj8ykXZCXLgCT0Aa5pbN7LRI8WvqKxk/s=;
 b=JGwwGnKMJ8TdZdhwh+V5CSlBGdJXT0bkjr3PBpNcgBsXTK0D2KmUvlFPtumHkU+o24uQx5gxd+J+ayI62tgjUFs8e1cfvidLwBgTgLROSFfc0QUQxLhW8iyLG8UI/V9wfBgY6fF1UP9FxvqUfy9Mpu2AyqHs3ap0wtT5V8Efv+P9dX7p1TXWDPKNjTCDMWjNaknM0xcycLuplwbqBCMp+J4r776PsFaXhdDQrwmGE6s1qJPIPbwDn2QAN4CLLHjjVKmpa1zQmhde9cLU3v4BHfv3g3jY3yLcLyxN+LehhCjCmRb08zrGbBhjiWrmJGvcxeKIS5tuB6Luqjk9gebUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5nSDdgE1uJj8ykXZCXLgCT0Aa5pbN7LRI8WvqKxk/s=;
 b=rfZa3MjeR5mK+2r2C/xpuoW6rdRiKfG8FXXc0pkwo+Mzt0O5gTVY0FDg/NL00OO61iXasRwU5x7Eeagk4Rx/VRTtBFN8Is+xK2uF3jZk8MOXFK4fVVQvdERYPo/TPmwTbHOmL63Hv3A6xhrDh4LwhNASBisPcFaYdbjbfNOKPDtdRuHPg7Efy30gWl/nR5bt1B2vO6Sa9bmL9xYhY+ctwJXVST89/LgMq2cMhmmoWr5LAfnmmFZnBfml2IUn+mJiCmm6/3E1l+mWN+lQfAvrf3Az2uYbNQf1GHJIboQAHLL8frZ3Xa2BLx3MpocrtE1Hsr+BB4pqcoyhHNpuwmkejg==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by SN7PR12MB7812.namprd12.prod.outlook.com (2603:10b6:806:329::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 01:42:13 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 01:42:13 +0000
From: Parav Pandit <parav@nvidia.com>
To: =?utf-8?B?6Z+p5Li656S8KOS/ruWMlyk=?= <xiubei.hwl@alibaba-inc.com>,
	virtio-comment <virtio-comment@lists.linux.dev>
Subject: RE: [RFC PATCH v2] virtio: add VIRTIO_F_DEVICE_READY and
 device_ready_status register
Thread-Topic: [RFC PATCH v2] virtio: add VIRTIO_F_DEVICE_READY and
 device_ready_status register
Thread-Index: AQHdRp3Z7uTpDeuhMUiXKSRUtthuk7cutteQ
Date: Sun, 15 Nov 2026 01:42:13 +0000
Message-ID:
 <SJ0PR12MB68064712312D0465F6DE523DDC7D2@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <8e418e68-0981-47ea-a135-072296ecf914.xiubei.hwl@alibaba-inc.com>
In-Reply-To: <8e418e68-0981-47ea-a135-072296ecf914.xiubei.hwl@alibaba-inc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|SN7PR12MB7812:EE_
x-ms-office365-filtering-correlation-id: da69e24c-8400-4e1b-9283-08df42b9ac2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|10070799003|1800799024|38070700021|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261022115727099003|261022105027099003|261022075727099003|261021121427099003|261102124527099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 Wfu0EKq+wetFFqaAG6j4kuwVSV7g5K034+4kfPBELb6yeyhH8elto+TsryM8EHfCQSKccCDAj3XgQSJ5JAHm/JICu/igqbamUeCImUWxFT/hbNME11Vu7ce4Qz9otialZVCBn87ctA756Rhpn0pZ+jlc9HFX0awl/l7q9NjPe4RFo7torjpLWHirDXE8NkBXbALvQnBk5r9ItzY+dFMcGvVGYJ1uHElE2ICVQMLY6XVNxf+ejmIsuZ2xsqxloSRmAhbL7W3kcW0tmFQFuykZpdKhP2j70HU6eIINkqMMYqNPZZdrxFXmecYmpONH8eLJTDzZ5D87XjRAAchsmBm/A9FzSDZ9Tn8FnrZ1UOMXBKTUB4LwedRg7NgSu6/qUnyMLI2A1j9IXXT1IBg//u4ph+HzjFP18vaSGu9frtBiTUxUptf5XU/f69VhAGMqVJOYq4iV02ofy2cpmcGsaeNU0aaNA3yD4ZnzIejgOW+7qKPb+beTflnc3TSt5tWwbbqoNlj17Ic1HoAQoStZI+iEMtDZ3KynWut2TxCoxeDWt7ljVwxEWJO07BYttEgGvuZUXgxPZGXnt2Cs+Fxq2ztC7XZbbfi2xaY2lw8GpHCStn+Jqq0rIzacIOys7XXQR0/9j5/2Pm/8ynfMFh5S03jmYM59W9HF/QgmqU1NIyyG2KjRJeSPY0wypiaTEagpE1qr9M2satPwN7JMPKUG/9LhvnuMgm8pqeU7ZB5a+3mgZOk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(10070799003)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022115727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102124527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?elJJZlJWa0RaZklhek43aUpGOGc0bklGZkxMVy9nMzVJeDlIc3NMR1czWmZR?=
 =?utf-8?B?U0h2QlA5bEljZ2lsRGpqNmNiUHVwT1dMNzNuV2lzV3dqSnZ2SUxaQjhNN1RZ?=
 =?utf-8?B?aUpFdXlBVGxxaHNoYmFHdGwxeVJ3MVBPbldUN0preHBrS2MxQVhJK1E4WStn?=
 =?utf-8?B?TFZtc2daMU0yc1FOOWlMeWtIR3ZQUTc2NU9mNkJ2WG9mekI1MTVFYldJblNu?=
 =?utf-8?B?ZC90cXNyT2d0R2hocGlvb0d2L2ZoTi9HT2lCdVdSaWVvVWx4MENPWmRpeTI5?=
 =?utf-8?B?MWc3cmszY2dVYWJZelBtSk9vbjlvR0dQVDVHTUkvUEFuUXU4SzUzaTlLcmht?=
 =?utf-8?B?WkVZY2hPand6YUtlMlUzdTV1L1BVUmIrR1NIWU1haThzcWk4bkJQVGxlOHE3?=
 =?utf-8?B?dzB0a2pMVzAwNmlKaEU5TDFXcmxJM3NMR3BxNzlVeVZhOE5DTGRrVDZYejVw?=
 =?utf-8?B?OEZFMng2REticHJNUFpiSFBMSlI1ditJVWw2dTRlaFNEbHlaUC94UlFobWlx?=
 =?utf-8?B?N3prdEZzTktkaFdWSXpKdGlicTcwK3FSQmRjR2ZCWGY3K0pDK2hyaGNWMzNZ?=
 =?utf-8?B?OFM1MjA3c3lFbDVVNmt0RkNVUUNKMkRCSWFpSllmY042K3hxa0NMeUhwTElY?=
 =?utf-8?B?b1IwSmlmQ3lGcmFxR1FXR0s5VUFmRjlpaGQwdlk5ejMzRjY4emxGTno4c29D?=
 =?utf-8?B?b0xkYmV5a2kxd1VFWFE4clNzV1kxTUNJTEdsNWh3MWpTRTlLYjNjWWROaHNs?=
 =?utf-8?B?T0pPNUpPRVpPWlhWR0lNekRPbVY4L2NsYlc5dDVDSE84UTE0MWRRY3UxY1hU?=
 =?utf-8?B?NGZEcG1yaTNTYWVqTHQzQWhLWlU0aVZKM0t3U2w4UW0zc2hrTGVRbW9EcnY3?=
 =?utf-8?B?eHNUZHYwdDRUWDFHZHd4L0RNdys2WHdmYlVxQXNHTG5kK2xlblFSU0hGVUFh?=
 =?utf-8?B?SnZwbXVua0x0azE3dEdXTUM1N2dIaXpNUWN1Q2NDS3dXSkIrODI2cHRiMzZW?=
 =?utf-8?B?M2JiWFJFWStTNTVXNHYrbnloTTBOajh1ZGI1NmNzVWhMaE5tdkxLQ1FxK0JV?=
 =?utf-8?B?bmE1amR1dmZOajdsSVJTUWNIa1dHN3pYUWsxaTIwenJMdUVLN3cxVWR6Vm9H?=
 =?utf-8?B?WmdTVU1NWDdjM3VGWEJsM0Q3RFhRRHR4MWRtcUdkRENnOHpCL1pKdVRoYW1j?=
 =?utf-8?B?L1FBOU9BRzYrVkhkQWMrMCtxSWQ5eVA0ZGgxaW5KVTZzZGozRDgyY3VyZ2tS?=
 =?utf-8?B?SDlVMHh0UXJ5NVNaWVMvYzB3U0JvbmVoS3ZhWFB5RHVJdlVuMlVsejcwN3pk?=
 =?utf-8?B?YVJQUjgrK1RQT0o5eWRqK0VJb20zbTRCTHRjZGdzSjVZeVgrV3UrcktKWk5t?=
 =?utf-8?B?UmNrNGRaUGJ6YzAvTzJDeS9CTE9QT05OVGZ2MElQUjM0SHp2QlJ2THYvaGF3?=
 =?utf-8?B?WGZLN0ZzaVRGcHByOFdmN2FpellPb2F6RkhxRThHWG4xNjFmeDVUbnk2QXVz?=
 =?utf-8?B?SWtCTDF3QXhqRHhZakJOV3llSnVKSFVuSmdDY0ZQeGFaMGEyRDJ1bVZLRFpC?=
 =?utf-8?B?SjJjUEY2UzBxNnVFMlJ4eXV5RGxvNnlBSExYS3BTbGVrQmdtYXlacCs1Ynh5?=
 =?utf-8?B?eER3L0QrUXlTQkhCOTVkTVVvTGREVk1LV3dVRXlROUl2WnJXdnppeGxmdFJP?=
 =?utf-8?B?UHZpS1pQQVRyeDk4Yysxa25IS3ZuV2FBR0V3MExqblY5K2pMYUxVUTg2d2Rp?=
 =?utf-8?B?RzJaNVBjTjBxa0R0My9NMTFRM3U5Z2ozQ0V5YmtWVndURjhraEZmU3Bucy9H?=
 =?utf-8?B?ZzBMRW5pZ0ZiTElackZWak9VWXdSZnl2S3NkOVBReDFyYUNNUnZXMTM2R0Nx?=
 =?utf-8?B?OVIwV0xUcDAwenhXTW5EZ2lDMTFHaHV6WVZkQ3F6eTlPOWNtUStUS2pPWkN6?=
 =?utf-8?B?Z25CaWdrK1VpOWRYVnFhUmtmRG9Jcm9qWGlUNHpVcXpIUmE0U0U4K0pFRnRC?=
 =?utf-8?B?bUJET0NKTFQ5ZzFMc1JHaGI2Y3dVN0x4L05lbWtXb1pJTVZUckVzajdlRGh0?=
 =?utf-8?B?TmhpcG5XR2x1K1JpRS9nUkNWSGpkdm9vZXNWMDMxRjBnYTQ3V0UvNFVFUENo?=
 =?utf-8?B?TW14VGEra2ZrWFNXbW1ZVElEVTlhM1U0N2x6YUFYK0h1REkyRXN6Y1A3K2Rq?=
 =?utf-8?B?STR5aTlsNnZRcmxZOTBZTWY1aTd4Umc4cXB3YUtIMHAybXlmM1RtL2VwS3c4?=
 =?utf-8?B?Y1kxQ015d2J4cVE5MWhRNTYvSXdDQ0VZRGdVaUQxbmxOSzJMbjBSTWdNVll5?=
 =?utf-8?B?dVduVU4yRWtJdzEyZWdoMUFsVVEzZ2NBbDViaXFKTkwzdkxoSks5TStyeGdG?=
 =?utf-8?Q?gUuSggiq/Hfxj6NMYFOZjnVlPupl8BRntxf/9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da69e24c-8400-4e1b-9283-08df42b9ac2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2026 01:42:13.4918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pTr0yY8ytxHYHrkLVFQWXgFqdLMI9ZVNh7AK4XkHwvAWuC6zSSo0/G6F5Sau8MyqppHkTSmrs7BAQBCPNX2jjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7812

DQo+IEZyb206IOmfqeS4uuekvCjkv67ljJcpIDx4aXViZWkuaHdsQGFsaWJhYmEtaW5jLmNvbT4g
DQo+IFNlbnQ6IDE3IFNlcHRlbWJlciAyMDI2IDA1OjQyIFBNDQoNCg0KUGxlYXNlIHVzZSB0aGUg
dGV4dCBtb2RlIHRvIHBvc3QgcGF0Y2hlcyB0byBtYWlsaW5nIGxpc3QuIFVuYWJsZSB0byBwcm9j
ZXNzL3JlcGx5IHRvIHRoaXMgcGF0Y2ggYXNfaXMuDQoNCj4gYGBgdGV4dA0KcmVtb3ZlIHRoaXMg
dGFnLg0KDQpQaHlzaWNhbCB2aXJ0aW8gZGV2aWNlcyBjYW4gcmVxdWlyZSBhZGRpdGlvbmFsIHRp
bWUgYWZ0ZXIgRFJJVkVSX09LIHRvIGFybQ0KdmlydHF1ZXVlcywgaW5pdGlhbGlzZSBETUEgZW5n
aW5lcywgYW5kIHJvdXRlIGludGVycnVwdHMuwqAgVGhlIGV4aXN0aW5nDQppbnRlcmZhY2UgaGFz
IG5vIHdheSBmb3IgdGhlIGRldmljZSB0byByZXBvcnQgdGhhdCBjb21wbGV0aW9uLCBmb3JjaW5n
DQpkcml2ZXJzIHRvIHVzZSBlbXBpcmljYWwgZGVsYXlzLg0KQWRkIGRldmljZV9yZWFkeV9zdGF0
dXMgYW5kIGRldmljZV9yZWFkeV90aW1lb3V0IGFzIHJlYWQtb25seSB0cmFpbGluZw0KZmllbGRz
IG9mIHZpcnRpb19wY2lfY29tbW9uX2NmZy7CoCBBZnRlciBEUklWRVJfT0ssIGRyaXZlcnMgcG9s
bCB0aGUgc3RhdHVzDQp1bnRpbCB0aGUgZGV2aWNlIHJlcG9ydHMgUkVBRFkgb3IgSU5JVF9GQUlM
RUQuwqAgQSBwZXJzaXN0ZW50IHplcm8gYWZ0ZXIgdGhlDQp0aW1lb3V0IHByZXNlcnZlcyBjb21w
YXRpYmlsaXR5IHdpdGggb2xkZXIgUENJIGRldmljZXMgd2hvc2UgY29tbW9uDQpjb25maWd1cmF0
aW9uIHN0cnVjdHVyZSBlbmRzIGJlZm9yZSB0aGVzZSBmaWVsZHMuDQo+IENoYW5nZXMgaW4gdjI6
DQo+IC0gUmVtb3ZlIFZJUlRJT19GX0RFVklDRV9SRUFEWTsgcmVhZHkgc2lnbmFsbGluZyBtdXN0
IG5vdCBkZXBlbmQgb24gZmVhdHVyZQ0KPsKgIG5lZ290aWF0aW9uIHRoYXQgY29tcGxldGVzIHRv
byBsYXRlIGZvciB0aGlzIHVzZSBjYXNlLg0KVGhpcyBmZWF0dXJlIGJpdCBpcyBuZWVkZWQgdG8g
ZW5zdXJlIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuDQoNCjEuIFJlc2VuZCB0aGUgcGF0Y2ggd2l0
aCBcZmllbGR7cXVldWVcX3Jlc2V0fSB3cml0dGVuIGFzIFxmaWVsZHtxdWV1ZV9yZXNldH0uDQpU
aGUgZXh0cmEgJ1wnIGlzIHVubmVjZXNzYXJ5IGJlY2F1c2Ugb2YgdW5kZXJzY29yZSBwYWNrYWdl
IGluY2x1c2lvbi4NClBsZWFzZSBjaGFuZ2UgdGhhdCBhY3Jvc3MgYWxsIHN1Y2ggZmllbGRzIGlu
IHRoZSBwYXRjaC4NCg0KPiArIGl0cyBpbnRlcm5hbCBpbml0aWFsaXNhdGlvbiBzdWJzZXF1ZW50
IHRvIHRoZSBkcml2ZXIgc2V0dGluZyBEUklWRVJcX09LDQo+ICsgaW4gdGhlIFxmaWVsZHtkZXZp
Y2VcX3N0YXR1c30gZmllbGQsIGFuZCBpcyBwcmVwYXJlZCB0byBwcm9jZXNzDQpyZW1vdmUgdGhl
IHdvcmQgaW50ZXJuYWwuDQoNCmJldHRlciB0byByZXdvcmQgJ3ByZXBhcmVkIHRvIHByb2Nlc3Mn
IHRvICdyZWFkeSB0byBwcm9jZXNzJw0KDQo+ICsgYXZhaWxhYmxlIGJ1ZmZlcnMgYW5kIHByb2R1
Y2UgdXNlZCBidWZmZXJzIG9uIGFsbCBlbmFibGVkIHZpcnRxdWV1ZXMNCmVuYWJsZWQgdmlydHF1
ZXVlcw0KaXMgZW5vdWdoLg0KDQo+IFRoaXMgaXMgYW5hbG9nb3VzIHRvIHRoZSBOVk1lIFx0ZXh0
dHR7Q0MuRU59L1x0ZXh0dHR7Q1NUUy5SRFl9DQoraGFuZHNoYWtlLg0KRHJvcCB0aGlzIGxpbmUg
ZnJvbSB0aGUgc3BlY2lmaWNhdGlvbi4NCnZpcnRpbyBzcGVjIGNhbiBhZG9wdHMgYmVzdCBkZXNp
Z24gcHJhY3RpY2VzIGZyb20gb3RoZXIgc3BlYywgYnV0IGl0IGRvZXMgbm90IG5lZWQgYSByZWZl
cmVuY2UgdG8gaXQgaGVyZS4NCllvdSBjYW4gcHV0IGluIGNvbW1pdCBtZXNzYWdlIGlmIHlvdSB3
aXNoLCBidXQgbm90IG5lY2Vzc2FyeS4NCg0KPiArVGhlIHYxLjQgU1VTUEVORCBtZWNoYW5pc20g
DQpUaGUgc3BlYyBkb2VzIG5vdCBuZWVkIHRvIGF0dHJpYnV0ZSBleGFtcGxlIGZyb20gYSBzcGVj
aWZpYyB2ZXJzaW9uLg0KUGxlYXNlIHJlbW92ZSB0aGlzLg0KDQo+ICsgXGZpZWxke2RldmljZVxf
cmVhZHlcX3RpbWVvdXR9ICRcdGltZXMkIDEwXCxtcyBhcyB0aGUgdGltZW91dC4NCj4gK1xpdGVt
IE90aGVyd2lzZSwgdXNlICRcbWF4KDUwMFwsXHRleHR7bXN9LFwgTl97dnF9IFx0aW1lcyAxMDBc
LFx0ZXh0e21zfSkkLA0KPiArIHdoZXJlICROX3t2cX0kIGlzIHRoZSBudW1iZXIgb2YgZW5hYmxl
ZCB2aXJ0cXVldWVzLCBhcyBhDQo+ICsgcmVjb21tZW5kZWQgZGVmYXVsdDsgYSBoYXJkIHVwcGVy
IGJvdW5kIG9mIDMwXCxzIFNIT1VMRCBiZSBhcHBsaWVkLg0KSSBoYXZlIGhhcmQgdGltZSByZWFk
aW5nIHRoaXMuDQpCdXQgdGhpcyBpcyBhcmJpdHJhcnkgdmFsdWVzLg0KQmV0dGVyIG5vdCB0byBl
bmZvcmNlIHN1Y2ggcmFuZG9tIHZhbHVlcyBvbiBkZXZpY2UgaW1wbGVtZW50YXRpb25zLg0KDQpJ
IHRoaW5rIGRldmljZV9yZWFkeV90aW1lb3V0IG9mIFggbXNlYyBpcyBzdWZmaWNpZW50IHdpdGhv
dXQgbWFraW5nIGl0IGEgZnVuY3Rpb24gb2YNCm51bWJlciBvZiBxdWV1ZXMuIFRoaXMgY291bGQg
YmUgcmVsYXRpdmVseSBsYXJnZSB2YWx1ZS4gRHJpdmVyIHBvbGxpbmcgaXQgd2lsbCBkaXNjb3Zl
ciBlYXJseS4NCg0KSSBhbSBub3Qgc3VyZSB3aHkgeW91IHJlbW92ZWQgdGhlIEZfUkVBRFkgZmVh
dHVyZSBiaXQuIEl0IGlzIG5lZWRlZC4NCk90aGVyd2lzZSwgaW1hZ2luZSBsYXJnZSBudW1iZXIg
b2YgZXhpc3RpbmcgZGV2aWNlcyB3aGljaCBkb2VzIG5vdCBpbXBsZW1lbnQgdGhlIHJlZ2lzdGVy
LCBpbiBzdWNoIGNhc2UsIHRoZSBkcml2ZXIgZW5kIHVwIHBvbGxpbmcgYW5kIGFzc3VtaW5nIGZh
aWx1cmUgYW5kIGJvb3Rpbmcgc2xvd2x5Lg0KRmVhdHVyZSBiaXQgaXMgbXVzdCBpbmRpY2F0ZSB0
aGF0IGZpZWxkIGV4aXN0cyBpbiB0aGUgY29uZmlnIHNwYWNlLg0KDQpBbHNvIGEgZHJpdmVyIG5v
cm1hdGl2ZSBuZWVkZWQgdG8gaW5kaWNhdGUgdGhhdCwgDQoNCj4gK1RoZSBkcml2ZXIgTVVTVCBO
T1Qgc3VibWl0IEkvTyB0byBhbnkgdmlydHF1ZXVlIGJlZm9yZQ0KPiArb2JzZXJ2aW5nIFZJUlRJ
T1xfREVWXF9SRFlcX1JFQURZLg0KRHJpdmVyIE1VU1QgTk9UIHBvc3QgYW55IGJ1ZmZlcnMgdG8g
dGhlIHZpcnF1ZXVlIHByaW9yIHRvIGRldmljZSBiZWluZyByZWFkeS4NCmFuZCB0aGlzIHNob3Vs
ZCBiZSBpbiBjb21tb24gc2VjdGlvbiByZXF1aXJlbWVudCwgbm90IHNwZWNpZmljIHRvIFBDSS4N
Cg0KPiArKHVuaXRzIG9mIDEwXCxtcykgcmVmbGVjdGluZyB0aGUgbWF4aW11bSBleHBlY3RlZCBp
bml0aWFsaXNhdGlvbiB0aW1lLg0Kcy9pbml0aWFsaXNhdGlvbi9pbml0aWFsaXphdGlvbg0KDQo+
ICtUaGUgZGV2aWNlIE1VU1QgcHJlc2VudCBcZmllbGR7ZGV2aWNlXF9yZWFkeVxfc3RhdHVzfSA9
IDAgb24gcmVzZXQgYW5kDQo+ICthZnRlciByZXNldCB1bnRpbCBpbnRlcm5hbCBpbml0aWFsaXNh
dGlvbiBjb21wbGV0ZXMuIFRoZSBkZXZpY2UgTVVTVA0KPiArdGhlbiBzZXQgZXhhY3RseSBvbmUg
b2YgVklSVElPXF9ERVZcX1JEWVxfUkVBRFkgKGJpdH4wKSBvcg0KPiArVklSVElPXF9ERVZcX1JE
WVxfSU5JVFxfRkFJTEVEIChiaXR+MSkgd2l0aGluIGEgZmluaXRlIHRpbWUgYWZ0ZXINCj4gK0RS
SVZFUlxfT0sgaXMgd3JpdHRlbi4gQWxsIG90aGVyIGJpdHMgb2YgXGZpZWxke2RldmljZVxfcmVh
ZHlcX3N0YXR1c30NCj4gK01VU1QgYmUgcHJlc2VudGVkIGFzIDAuDQoNCkl0IGlzIGJldHRlciB0
byBub3QgdHJlYXQgdGhpcyBhcyBiaXQgZmllbGQuIEJldHRlciB0byBlbmNvZGUgdmFsdWVzLCBz
byB0aGF0IGl0IGNhbiBoYXZlIGVmZmljaWVudCB1c2Ugb2YgaXQuDQoNCj4gK0V4aXN0aW5nIGRl
dmljZXMgdGhhdCBwcmVkYXRlIHRoaXMgc3BlY2lmaWNhdGlvbiB3aWxsIHByZXNlbnQNCj4gK1xm
aWVsZHtkZXZpY2VcX3JlYWR5XF9zdGF0dXN9ID0gMCBhbmQgXGZpZWxke2RldmljZVxfcmVhZHlc
X3RpbWVvdXR9ID0gMA0KPiAraW5kZWZpbml0ZWx5IGJlY2F1c2UgdGhlIHN0cnVjdCB0YWlsIHdh
cyBwcmV2aW91c2x5IHJlc2VydmVkIGFuZCB6ZXJvZWQuDQpUaGlzIGlzIG5vdCB0cnVlLiBUaGUg
Y29uZmlnIHNwYWNlIHNpemUgaXRzZWxmIHdhcyBzbWFsbGVyIGJlZm9yZSBpbnRyb2R1Y3Rpb24g
b2YgdGhpcyByZWdpc3Rlci4gU28gcGxlYXNlIHVzZSB0aGUgRl9SRUFEWSBmZWF0dXJlIGJpdC4N
Cg==
