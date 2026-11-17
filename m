Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794946311;
	b=ruMY619QZ0utUYbHaRFxn8Bwqd7/qrZ7E2VgZt2dAbatGjA09HETAcLC6JNMeT9+oYLH
	 bLV/w6412hWYGFUPmIAEaKbHT+OAow0xSSXqUK6Iw6/SnJmUloiqUzusmN4xPMvpKZmJy
	 QNy1xNoPS/JEwTQ4NRxujhVl7HPDKUz6lbpvf6x0egE4MIlTx+36JBygxQF1QkKf7U/MB
	 d0n+acOJFCAK61SBtTkS1wH4ltPE+rzKs8SEwiX8x3te0F+WkVgBlabkYMSXEV5MI10p3
	 OQibKXxuKjWrb8lsN/WP0r5mLM28bJgTUtYMRqs+7CN4E86GxKAEKoJUxCaSmQfXBSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946311;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
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
	bh=Uq1FMBgkfROmF/LFlXbpS4sVUG9+9Ls9PJ1aDn35Rio=;
	b=c0wW1gvELhgbJ9Snj9gHkKyaDks4L7o/0hnuWu9ui4Ig5cWQheaiolraxc4ItBxzyFec
	 XgjC6ZbOqL9B2DKUH5VlScc02PcQ6SGA8SkvVangVu0GIazFe8tswXcHbToWIn24YHCqI
	 wymbcKGf0sJh2WLQbBebQFcI6kty0xLUfkB+Cm3g0+zcigw5ZY/JzrWDBx4DYm3VDM2g0
	 LlcPBuhwC/dk6CBoDsKmyMtv2Isc2wKOgYezz6LX8mn2HzU8G9KIUKH6oowQJkGPi2YLE
	 0FxPmj3xyBRQtE0KhdwfwhxO2piSQVHN9ZVSHzEtVRJSyrWDzMuq1M6MqqDUF/R3Myw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QAhjHEOs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.59
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C19606A32F
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 20:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C19606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QAhjHEOs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcyo8FBkd3uXHhCgmxAMSEs9KgHIZ4VsSiTOJgNXgVw4g4CxIQJNkVSkzcE5fPXZ1j0Xa2jtxXlr3TP4kPM1YAGBcovcf0lnWeUqASDU8P0B0WKfP+dpM8IsC1dDfoVxwOMhejP9ptATPm+0B6s4yen/qMrJAe+YARK2AX4dXo4Si9lNRMMGNk6aD5HdJC5z4MijKoYEWlKph/PibS0ofG/4A5KjrzVSgOznqpNXU3Kei6+fV1xvqJrYrPe/Lo8hfwy+pMHzRF45u1cHs1wdOHJuikEFeo7c6MUNamxIVUv+Pf4vmVl8pcX5Iduz9sf3OqP4LJVsCD4qHAryw8KKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uq1FMBgkfROmF/LFlXbpS4sVUG9+9Ls9PJ1aDn35Rio=;
 b=TEMOCQ6ffGJeArWlLPAcBuiZPaBoCoifuLfTXHiBiQl9IGYTXqjC4p8FEJsIWafIn8vUGmzn4XiIx0cZ9U34DaNjI32oBHqaP18WeGRqhn1LA3Rwtiru5hWnvp/ollmVRngfi7Qxm+4rjWDpUy7RrmYT48rrCdxasff8Ei8Htrdj85eI+rZLoKgN2R8Ys/SCFL8KYElzTsiNpkMPeLeJqzmAdAxoGHx7ySL1FO2Q/+TxwIFrL4ZDS43BJR2gO4nB4tHRj+Sj3LkIFyxhE5obz5bnQq7k/1aafa7tpFiZbyodFqEQCAL+L2NgGBZ6mutOFvlUsto/JNxkUwo7CMWKdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq1FMBgkfROmF/LFlXbpS4sVUG9+9Ls9PJ1aDn35Rio=;
 b=QAhjHEOs+uK1VMBOUkGvlpEDcrVWnbgvZIq0EnsnpLZ5TiGTUgL6Fr0TlgOdF2nYVYDUbCB/Sq1P7Rdgrpx0oI5Qanclfd4vvxt7plVs/OLJvVNAMY5S48LJkvCD2wTrWR0hMRvQIuSufKZsSyEHHcDrtjh9CYED5Dz8jlG4VGLqsRO2ZLf/TcXeCknZXXaFJ6Bb5C1SMcUxtsibKGbzeWFdKz7e05WSqCkc7RJ+VpCWO+3vINZYAKkA5M73AcQX+OYMu8MJ3hbBQa0SunWXkGnMl6CMGiIdLbKGrYAv5b5A4yWcRYHsCbxfjdZb5PbmvGA5PXbjwPp09EE42XK3yA==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by PH7PR12MB6955.namprd12.prod.outlook.com (2603:10b6:510:1b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 20:11:47 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0615.012; Tue, 17 Nov 2026
 20:11:47 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matti Moell <matti.moell@oss.qualcomm.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Peter Hilber <peter.hilber@oss.qualcomm.com>, Cornelia Huck
	<cohuck@redhat.com>, Demi Marie Obenour <demiobenour@gmail.com>, Manos
 Pitsidianakis <manos.pitsidianakis@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: RE: [PATCH v2] content: Reserve ID 52 for QPSFI device
Thread-Topic: [PATCH v2] content: Reserve ID 52 for QPSFI device
Thread-Index:
 AQHdYYZ8aLR7Neu2k0aXypdMBau4wrcIYNKAgAAHHACAAJKLAIAAKoiAgAAEoYCAABWGgIAATaoAgAANYYCAABBHAIAAB92wgAACUwCAAABL4IAABWgAgAAEdNCAAAMpgIAAZ3UAgAB00wCAAACjgIAA//sAgARLZACAAyIqAIALA5UAgAADiICAFKy7AIAAAqoQgAAIvoCAABDFMA==
Date: Tue, 17 Nov 2026 20:11:46 +0000
Message-ID:
 <SJ0PR12MB68063E17616E9A0E2B1B95FDDC7B2@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
 <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
 <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
 <875wyo3557.fsf@redhat.com>
 <mkmnrjrkzjg6gdh4u3l6lib7ggovl7oiqwki76pkdboue2szdi@lhpg3ik33w7y>
 <4222d5ec-e44f-46a1-8a14-a2f3fb6d84d1@oss.qualcomm.com>
 <20261104094014-mutt-send-email-mst@kernel.org>
 <ce7dc70a-13d0-4c8b-9b0c-b46e9a0af54d@oss.qualcomm.com>
 <SJ0PR12MB6806CFA20D1EBF3DDD4AD8B0DC7B2@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <12e122bb-fd42-492b-b475-70569510cb24@oss.qualcomm.com>
In-Reply-To: <12e122bb-fd42-492b-b475-70569510cb24@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|PH7PR12MB6955:EE_
x-ms-office365-filtering-correlation-id: 5f70e766-7dfb-40e4-a685-08df44e701e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|11063799006|56012099006|4143699003|261026121527099003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 Tmnyg31u8bcBbzJW1GQsDLL78msX2FvilII9JLGiDEcheuizEtaHaG5Cq4kbo2Fc2mYnPtaDj7jGVsXwiJ3dQBeasWo1lDosFGRpWm57opEMhdGTzU/pwpXdg4Hv5IAvkpyehQ631GHYVxDU+J6IMbxOr4QVtCsDJMuLUQqWJmEQy0QlzeDEt92uqjTT7QEsNtyRIjwSFg8GJTMRzTOn0zkyzxQjqBNsB/otzzlZ9n32vf8kE33JP+dDJu/0oY48I2IokjmpnM6cZ+sI2W8KAjej5NT1fMTYp+rAA6pP4kbl6DfJvacG71GxbwK8yB+vlNVjnHgNHbJTvJmXanXzjnPv1vLs48qzSJwO2G3Gqbj6fyyyu0Z1omnbp7I2uFWg6UvlBKzKQYG7JqhHBQb9yAjtwRRRXqgNwmaZAaxaGFn+nTREFwcOkHkNxTqOk5vtQrDwAFNJtJj49n6bcBshrnLVADKe3pOl861fIDuKmNF4hUgQ3d5ITM4V0QwLoa6eFJ3WNBmkntvL/TvyqJF3UzKdHrzmYT8MdP249XKK7IU7lqxzKyKjRBaFVDrojtDfMzQzZqiEYXsgmXtT7Eq7g0nla4QeeBvQfRaHub7YNmjgXKyzj/1KSDTNRxlHLEN6DNe9zs4RPeTrXhIam92OPt7cExi0aUqKpIcipS/GJ6VR6GFeP7RDQ5jgPVLMPFuzhRN4wEiJUz8HLiIJmpIzj/0kRrOHSpnVn7TgOJlE5FE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TmplNi9JMElObDlYZHJSWXV5UlpVMlZWVFhVU1A1M2Y1a2NqeWFGczRhTWh1?=
 =?utf-8?B?L05WVmdudm9NN1hoRFBkaDFzaUZVUWg2Y2lORUF0SDBoWG05ekJLTUNjc1Ns?=
 =?utf-8?B?SkRNeThOaGVJUG1tUVltbk0wZ2k1Skc4NHBjcGpKUTZIVWJSbjE4bkU5K1RI?=
 =?utf-8?B?QUN2NE5QODNDcmN3QVRTVFN6TUNUSVpYNzVOV2JDMHBqaXpON0lLUDhURkh1?=
 =?utf-8?B?djUwdXNxTjFETldQY1J3N2RSZ0lNL0JwTFZSUC9lN3N2QW80UjNNWWhxOE45?=
 =?utf-8?B?QWFwRWM3UjNZbHJFbWNTb05OdnNoMDVZeWJjSHMxbW5ZZVAzTWxqR01oclN4?=
 =?utf-8?B?RUJkSXBRdHNHdTNyYVlrRWhqUlQ4WUEyS1FvVXB4ZkliaUU2TVp5R3hjVUpT?=
 =?utf-8?B?SlZDRFJTbm1Sc0ZwMWJMUmE1WHVYN0RUWVAxbmdlZWdhbDRnMDUxTU02bEVC?=
 =?utf-8?B?QnFpSlpaSXFIVFFSWUREM3E1QWQyZlNMdVJOS1NOZU0wU2JNTFhPbVhSbHA1?=
 =?utf-8?B?NmdDT2d4c1U0SVc1a2lKUlM4TlUzc3BGUEYxKzdRSThxWVBYSDA3K0lCYjhV?=
 =?utf-8?B?dWc0cEVQRUtwa2RMUzRYQ0l4a2dRaUk0NVhOazZoQUlHMXBFamRhRnlVUUNt?=
 =?utf-8?B?RDNZazUwSEZBUkxhODdvS3BWcjhWR2JETm4vdElEWFJJcUFad0hxWXpmcTJY?=
 =?utf-8?B?MDZjbmg1ZjJIY05wQ2x4UHJ4ZEExdm5mUnpPRElSWEVGMXdGcVlJbzlxR0dW?=
 =?utf-8?B?Q20yUDc0RHlaSU9LR2UreDdxNnlNTGtrVHJ2WmtPNmtVUnBFc2F4UnA5SDBi?=
 =?utf-8?B?dXMyeDVvRlI0bWRUN1JLd2c1MzBFVzVwdWpPSTgrV1ZDOVZhcGZGV2dZQkxB?=
 =?utf-8?B?Z1FNaSs0R3YzanlDaVZjYUtVdCtUZ1VabWU5NVFyd251bitLWkV6cUJUUnNQ?=
 =?utf-8?B?SHJuQ0tpamppVlZoT0RNSEZ3eTFpSVpOS3hBU1ZJOVYwc1VlL3NremFUZTdp?=
 =?utf-8?B?SnFhcWNnQXBQR0NnU0pXYWhJcVIzUkliZ3pRMlBVYW80bDRiM3BkendlRDlV?=
 =?utf-8?B?Zy9Pb1pXUEc1ZVhoSEdIUzF3MDNuSCsvcnJPdkwvb00zK25MbWVWM0huN0VH?=
 =?utf-8?B?Ui9jVDhwS3dSd1NEbXJwUWwyUHhldFFBS21SZ2gxMVp2ZjZTRFFhOVFGTVd4?=
 =?utf-8?B?N2F0ajRFUHZnNENCalF4MDY1SVBYcEdBdjBCNGgrWVZSUnZqRzZkUmRtb0lL?=
 =?utf-8?B?eDBrSGZjRlh5YStFektLQVVIdEtrWmtUS0FZTTUrV2hBUG4ycWdsYlFUMSsv?=
 =?utf-8?B?QnlWWDhPa2dkYVNnaUVnYVRCbVloMDRkRysvSFIxM2ROWTNQYmlXUTZlSUVo?=
 =?utf-8?B?T3YwaFB6U1FJWEVnNmJpTldxYkp5Z1lmbDl0ZmFYb2YzYkl6L2RtVTU4S25v?=
 =?utf-8?B?UXlnRTV5R28yYjREd2xHMm53aEY4YWx0OHpOWGd0TTJwTlZvNENsVm1HVjdT?=
 =?utf-8?B?Y25ObGg3OEVXZjYzeUZjTXRxT1Yzc3JiRlVreEFzai9lNHlIQ1ZUYWdzRlNL?=
 =?utf-8?B?eFR6b3BaRTVIR1VtWWk3aWdPb3lFYXV4dlg0RTJlb09iVk9VTkQ5MThUeDE1?=
 =?utf-8?B?enRmS1plR053ZDNTWTJFbEVOREF5RkhHbWJZMW1WN2twVUhJcHc1SWpROVh0?=
 =?utf-8?B?VGxPT2Fpd0Y0bVV6Wk4vbHB0aVNyYkRUYVlZVUw5WVhYOHdtOGg2U3ZBcTZj?=
 =?utf-8?B?TUR6cmN3VHcyL2x6eS9pSmErOGp2UnRDN01XU0Z1UmJOTXcxMDFkcG5wK3pt?=
 =?utf-8?B?ZWtJRzBiU08wb3gvWitIV0NkcHE1V1NVNVR3a1A2clJaVkVlUWJQQlhlMTdR?=
 =?utf-8?B?UHRpc2VEd1dBK3Q1WXk0b0t2SC9ueG9EcFJkTU1VQzF4NlNZanVzZkYxRHZK?=
 =?utf-8?B?QzRUcGNpQk5FS1JJTkp0MlVmNmV6V0h5a2VFc3c5clVNQ2lLbXRMMGphUm9m?=
 =?utf-8?B?bUVRT0FiZ0g3YU5Uc1RJL3d4ZW5SQnBoSXQwQk5WZWlQNlpraTRKSzF5d0pB?=
 =?utf-8?B?MWNycnBFeEtQaW4vQ3NZL0hzeksxRHg4UkdDSHZCTHZvdGprQ0c0cC9rTFN5?=
 =?utf-8?B?KzgwNUN4NUtTMkRDNG0vcTNVcDlFOXBFV2Q0dXg4Sk4yaVh4bmpSWEJmVU42?=
 =?utf-8?B?VUpHdWJpc09SUkt2SlgyUzVaaTdiUHJxbjVoTmdzQitLUnpOaWIyTTFyRXpY?=
 =?utf-8?B?NFJxbmZ1R0lpUXFLcHdLOFNiL1dWZWhiOWMrWk45K1Nkd3BxYnJDOFdSSTFt?=
 =?utf-8?Q?EPRwGVj63tePPwsO70?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f70e766-7dfb-40e4-a685-08df44e701e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 20:11:46.8756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lHAZk4Q8D28a2gnsGEfDexc9rWcL47n8ZWSBlEQGo1UfiuN8FzNS9nS/BCDKfS7RAPNwe6zue1BwhN8g2GQ/Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6955

DQo+IEZyb206IE1hdHRpIE1vZWxsIDxtYXR0aS5tb2VsbEBvc3MucXVhbGNvbW0uY29tPg0KPiBT
ZW50OiAxOCBOb3ZlbWJlciAyMDI2IDEyOjQxIEFNDQo+IA0KPiANCj4gT24gMTcvMTEvMjAyNiAx
OTo0MSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4+IEZyb206IE1hdHRpIE1vZWxsIDxt
YXR0aS5tb2VsbEBvc3MucXVhbGNvbW0uY29tPg0KPiA+PiBTZW50OiAxOCBOb3ZlbWJlciAyMDI2
IDEyOjAwIEFNDQo+ID4NCj4gPj4gT24gMDQvMTEvMjAyNiAxNTo0NiwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOg0KPiA+Pj4NCj4gPj4+IFVnaC4gTGV0J3Mga2VlcCBpdCBzaW1wbGUuIFJlc2Vy
dmUgSUQgNTIgYXMgdmVuZG9yIHNwZWNpZmljLCBxdWFsY29tDQo+ID4+PiBjYW4gZG8gd2hhdCBx
dWFsY29tIHdhbnRzIHdpdGggYSBxdWFsY29tIHN1YnN5c3RlbSB2ZW5kb3IgaWQsDQo+ID4+PiBv
ciBqdXN0IHlvdSBrbm93LCB1c2UgaXRzIG93biBkZXZpY2UvdmVuZG9yIElELg0KPiA+Pj4NCj4g
Pj4NCj4gPj4gSnVzdCBmb3IgY2xhcmlmaWNhdGlvbiwgc28geW91J2QgYmUgZmluZSB3aXRoIHJl
c2VydmluZyBJRCA1MiBhcw0KPiA+PiAiUXVhbGNvbW0gU3Vic3lzdGVtIj8NCj4gPj4NCj4gPiBm
b3IgbWUgYXQgbGVhc3QgaXQgaXMgYml0IGFic3VyZCB0byB0cmFuc3BvcnQgbm9uIHZpcnRpbyBt
ZXNzYWdlcyB1c2luZyB2aXJ0aW8gdHJhbnNwb3J0Lg0KPiA+IGl0IGRvZXMgbm90IG1ha2UgYW55
IHNlbnNlIGluIHZpcnRpbyBzcGVjaWZpY2F0aW9uLg0KPiANCj4gSSBkb24ndCBkaXNhZ3JlZS4g
QnV0IEkgYWxzbyBkb24ndCB3YW50IGFueXRoaW5nIHRvIHVzZSBhbiBJRCB0aGF0IGlzbid0DQo+
IGFjdHVhbGx5IHJlc2VydmVkIGFuZCBjcmVhdGUgbWFzc2l2ZS1oZWFkYWNoZXMgbGF0ZXIuDQoN
ClNpbmNlIGlkIGlzIG5vdCByZXNlcnZlZCBmb3Igbm9uLXZpcnRpbywgaXQgaGFzIG5vIGltcGFj
dCBvbiB2aXJ0aW8gYW55d2F5Lg0K
