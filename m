Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE48142E76
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 05:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719293161; cv=fail; b=h1W6vE2+MlsF2MlTtEm6ZLHEJhIbGisjvU/w59Ll2jc9Nf5lFHa1p09e2Z7wm2k9iM+UXSY3CPLrO5n5aYWVkERWUD0qa83jXs5YiZU71rBkHcVWui/X48lnz+zKcreXPHdqZOLQkupkcIcyPUQa0wVaHsbMpxX7amYy2NPl7/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719293161; c=relaxed/simple;
	bh=XPtfcxBh4Q2SULW50FAbS0yC8G4Nd1Qg9SWqy15oiM0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f5Pzcs1WU0S/jKjX0qDGpe5mKE59J83tsrk8rmPWbjBO5VAolNY5ncbZ0oOMPMh/yvNlu/n/D2MCpM3aHsb6rbyvJWAjmckqAn76jSLWqUkEi6hBrUEe8qZVgxPdqDlowZjM3P8oZ6UiJaHzRRjvk0O37UwPwy+DoIQa+2HEFUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gjayFCls; arc=fail smtp.client-ip=40.107.93.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gjayFCls"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpgzFqsmkfGqvicm2nuQgKK0j02Ei80fBBcGcQpe3Rv610i8IUnC0xWUMGfwyPK792TCvHrNxGI3GLYQ8/cQPXqmBYhZ0+s1eNxJdgYnh1QV8wTMr0BH8SMf9rbunSFi5CpeoXt069xgh3Df3QBRioHeJfQ6g7KLC3qK/Dzp2Yd0aajzhWO0uinBB69uLtOww6HLmTivd53yUN7Ux9bwHSTznBt8N1IJkTf8WK6ZOj5qATCK4AUjJrZEMJpkxkkratqPLpmWe98usdU37CXRsGMk/h3bZmol1OpgaSlwPJAiNrWVoREskd4LuiE59U5rJalxz9mYHe02O2EDVqcgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPtfcxBh4Q2SULW50FAbS0yC8G4Nd1Qg9SWqy15oiM0=;
 b=C2n/DpbvSdDXfyx8dx/Q8A5a3fY3MQ9MzfOtFnJq3Lb7RgrAc8Hkh48MWhpZdeG2n9DBLRka9tsjfu26i+JuF1Xdl6hlDN4QpWpUtnV0M5xF0RJJKVSNuxRrBFNszqa010NJCm/IZBv8ZANnl4jgH1oZb4FggXSOz0kMSn8ZPdsHtQXNSzXcbMKYQLUwUYeEXYC8cPaY+mEG3W3YW9wV1Uk9ksp+9zCM2igTRYoyj5gmd83qt6yZUqJK5zIspQPYxWp1n/qfGYQ3pZwunZj8/rCPWQUAjOTcg33t5sP5UuTTN0FRjuAIApA/0FtIckq9I8zSTZq3HwL+VChQMvUcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPtfcxBh4Q2SULW50FAbS0yC8G4Nd1Qg9SWqy15oiM0=;
 b=gjayFClsytXEZeJOKo/ejvRiKQwKEkZIYQL5LVqMMRi6k3iNPvL2Kx65FViGOPt9v/Fv2Wk1DyvkGH0l++6G1SvvqoYAYMK2vG2BKgf7PdUlJQXq3BqjvRoxklucV7UD6eT0vkH1HrHGRlm0NIFb19dWiVwoy4dM+KMLnCI3tAUWHzUfXLV+D1ywtu+vGvc7O7TxKNeAPdSnivFVITgVjdWIx7ZXziuzBGONILvLAxZ0rmShmtJKRmIjTy2262K10egyDMbaYggVoZzjljs36WgPDHYzsB64B5u3BcI3VbW4YoKt7SHqYwlUU/nggefOhh0pOs1xkAJNLnGcrK/K/Q==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by MN6PR12MB8489.namprd12.prod.outlook.com (2603:10b6:208:474::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.31; Tue, 25 Jun
 2024 05:25:55 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 05:25:55 +0000
From: Parav Pandit <parav@nvidia.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH RESEND 3/4] virtio-net: support transmit ptp timestamps
Thread-Topic: [PATCH RESEND 3/4] virtio-net: support transmit ptp timestamps
Thread-Index: AQHaxicItyk+1Cl9ukCDf/Iqsi24JLHX8IaQ
Date: Tue, 25 Jun 2024 05:25:55 +0000
Message-ID:
 <PH0PR12MB5481F37A4C9B035F2E556F20DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
 <20240624-v1-4-topic-virtio-net-timestamping-v1-3-fa3c163e4aa9@pengutronix.de>
In-Reply-To:
 <20240624-v1-4-topic-virtio-net-timestamping-v1-3-fa3c163e4aa9@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN6PR12MB8489:EE_
x-ms-office365-filtering-correlation-id: 97e9b882-e40a-4cda-6ac9-08dc94d7497b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?V3A0bUVOcCsvT2JFMFlMSzhuSXk1ZEhnd01LaTNmbDVhWWZJUk1heFR2VFBt?=
 =?utf-8?B?cWllaXNLM0hRSGVITGtWZC83K3R1Y1R6OER0dzkxWGhNcmx5bU1MVGEyLzNp?=
 =?utf-8?B?QUNPRXQ4aEhiTWgrbzB1dUtHZytlWU5UeHRFam10S3JnSEZ3UVIxblJaaW90?=
 =?utf-8?B?K2MyZGZsY1JwMlhVRGEyMTdVNWpNcXZlNWRGaUppS3V3TFlZdDRNclY0Mi9V?=
 =?utf-8?B?R1JiR3F4cUNtdDV1d2pvTnFsaS91dHVwbzdCanpucC95WUhDUGQxa1FsdWpD?=
 =?utf-8?B?a3IvQm5Hb3FWZjd2dDk1OFVVYVk1SGp1b094TXF5SXExQlZEVlBqam40UWFU?=
 =?utf-8?B?MFhIMjFJd0J1STRwMk1SL3ozN2YrSUFRaUp6dHBISHpUc25ISjNyNDFOeVZJ?=
 =?utf-8?B?eGN4WTdiUmdPNG1GRXdnL1Vodk02NFl1ajk4ZzJBcDBzeHFGRnJNazVXRHFh?=
 =?utf-8?B?VWVZWFJmSkU4UUpnYlo1SVkwT0ttcW15aEIwSVg3d3FhV1VtcWliWS9DZnVL?=
 =?utf-8?B?bmltNnRSRUtjSGZFUGNjSG5HemxhR0MyVnVxZnpzUXljNWRJaGhUNzdWQ3ov?=
 =?utf-8?B?OG1iWlMrMnBQVnNUZTNBck9WU2g4Ukw5QTdYVjhDZjltRU0wMHgwZUNLMTl3?=
 =?utf-8?B?VDRMeWZ4UUVJVStjemJiU0cyTWtZTHBhZFRHdVBlQ2cvV293eDNxaVdqd0tu?=
 =?utf-8?B?UVVoK1IrTDQrTFF2QmozdEF5alBTaXl3MDlrdnFEUWFFRGN6OTNQRWVNNFVQ?=
 =?utf-8?B?UWVnbGxoZTV0VkxIOXFJMWc1RmJ2ck9wL0pyaDZzV2tzTGdJUWdiY1V0VFlz?=
 =?utf-8?B?Y0dnOUw1NUdnV3doUU9RaG1IWXhzTVh2OHdxS09FM0NvVlA5eGFvSTNtSG9Y?=
 =?utf-8?B?Rkp2WGZmRkZXNENzQWJQeHFjbmY2QXkrd0dmY1Q4VmJxTllhYmx5cm15Q3Z4?=
 =?utf-8?B?SXZTSjRJdGFxYnIxdTdUZW56cTFETTUyQzRxbFpuRHlrRzVIbHVmUEIxWlJE?=
 =?utf-8?B?Z2h4aGpPV0FibGFCVFJsaXpTaXVqanlHNnJpSmRGdE5LQ2lKZi82Znd2MFhs?=
 =?utf-8?B?YnZBSzNuRitzNTVvSFEvcWxBWVZQeTFXT3l6OTIySkRucGdvQVhockJOU0Vh?=
 =?utf-8?B?L0xQSVhWbXZVSzdQUldFVmduS0VTc081a1NyOTA5ZDgyQm42c01YVlRLNWFo?=
 =?utf-8?B?eC9mVUpwZUcwc05ZbnROTDNtSWpueU5oeUp2S1BFa2ptQXFzK01YcFU2eXNR?=
 =?utf-8?B?bHFVT2pJVUkwUFQwNEF2UCs1ZFM1UFJyZ3VYMUtXTDNCSWRHdXZER1VUU0xi?=
 =?utf-8?B?eU4xbmwrWG02R2JvcitFL0R4YzRNYnljdFZCZGwrTDIzV2x4MXBRSGpGWjVQ?=
 =?utf-8?B?WEcveXlXamZvb2FZcjJ4bFp6R2J6QkFKK25oRWU0aFU2L0drK1VrdG42QXJT?=
 =?utf-8?B?ZGlJQTVEY09GVEdCMkZ5cmppQzkzcEx2NE1wTzNYODZmZ3ZqZmFWVXcyU2ZB?=
 =?utf-8?B?WFArQzlhbE80UCs5dlVPMjN2RUg4SmliVGhpN053dnNNdEoySTRSTkpISTFU?=
 =?utf-8?B?RDRIbENQQkdERzlpNURUVTdtakV3MG9hcTZSYUQ0SXJhRHYzM3VYeHFobE1o?=
 =?utf-8?B?ZTVvNGpUWXJpbkNiRHdYZENOaGp1ZUk3NmxZVFdueUxFa2Y4TzVPZ2dTZW02?=
 =?utf-8?B?QkRyZHJQMzgxZjlTb2V0SjB1Sk4yRVZITWdBQzhqQ2Z6SFR4aW56NnhsTGhC?=
 =?utf-8?Q?aSdLQXpqg4uJ440xAtzttbiS8GN53Gt9/FmbVKF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aThnajZDSlRPakp1UjV5dDE4TWpIMmtwN0ZuSTg5bTIxekFEb2d3TmV3bG1i?=
 =?utf-8?B?VHkwK3lUdGFpVnZ2aEFZVTlGZmUzQmNGR0ZwVVAxWmR4NjBucGtGclBMdnkx?=
 =?utf-8?B?ZXcyZEhLbTlFdjZ1UXVjRDRIRy9iKzBDM1dWY3BDd3RRcmhZby94VFIveUlL?=
 =?utf-8?B?dEZYNVVCNjl5dUJKcm1oOFd3NnBsK1FrbW9TY1Bhc3hPd0lVWHdHc0hNZHF4?=
 =?utf-8?B?eUlMcEcwVzdZNUdiUERPSHMwU0FiMmlFQXA1K2QvdnlSVFpXYkJMMUIrN1BI?=
 =?utf-8?B?cms1YWk3OU42VWNzSGhmL1psNFg1aFZBakZEU3pLUGNXeXVKcHVtVVh2cnlK?=
 =?utf-8?B?Q29JU0hCZ1dnWVJVemZseGNXN3JZZU85SmUycUhNOXFLY2xyRnp1MkJLTDgy?=
 =?utf-8?B?VkJaSVZPQkRoSVZiZWdIUUQ5RDVYcHBCc2RHa1F5c2huVTFTVmgrZGM1aVo0?=
 =?utf-8?B?NDF2N09oUzdiTEN2MnIyUVBWcDBqR0hVdXk5OHhoNFVzQWNncnlhNGRXY1Fy?=
 =?utf-8?B?UHRuQWdrZ2gzdk1HR2REVUNDUytCNURjMS9WVTYzeHRhSUhIaVUrWWs5bGlE?=
 =?utf-8?B?NkR4KzZyYy9aNlBmcmxRaWJLWFZma1p0Ky9DR2JhTGFZV25vSFU1NFJQbmlQ?=
 =?utf-8?B?eExQWHJCajRMV2gyNWdxZ29NRncwajFtYlZITGU1eEtPWXJHMDNITWx0STNn?=
 =?utf-8?B?VFoyblZHV0kweWtqT1BjNTNURG9OQU5mZ0xVTUxlcjY0YW8xQXliWG44Tjl3?=
 =?utf-8?B?a3FKNUswdHoxL0o1NWFiZzdyaTl0QVhmQy9icmJnY1VuWFo5OHQrdVd5QkhU?=
 =?utf-8?B?OWVERmo5dFFlcVAveWIrYUl2dXpaaHNIOXRodDlLbitZNStSNm9GWjdKWnJy?=
 =?utf-8?B?RWZsZGV3eS9GRElNWGxhSFU5WTErWi84U3BjV0hrWUtCM3RMUGJ2Tko0RTRi?=
 =?utf-8?B?aGVuazlYbFNGUmM4Zi90RmJxdVZ4c3hVM0ZWdTR4Q1ZBaXhXYlBPcVB5UWNQ?=
 =?utf-8?B?dkZMZzQ0aWJOdklSSlR2Q01hR0lMRkFUc1F1QVBnanQ1ckFicWVjMlZ4SnA1?=
 =?utf-8?B?dldoS2s3TmxlRzgxMkVhWmNlaHZwTE9VMnExWjdBMzY1aktNbEZneVM5Mksx?=
 =?utf-8?B?K2o5WUNoWHZUVWZpVEhONWt2RThPMm04ZHNCdE5rTURkaXZWZDkzYjk5cDIy?=
 =?utf-8?B?Znd3ZXdUUUhxNnJSWmNNMlJLckVOakVDc2FHSFY4Z2d6bHNodGIwZU9sSTNO?=
 =?utf-8?B?cnJIbEJFL1Z2UndVbHk4YVljbmE4MnhPNktKL3p3R1Nqd2ZaVGJZVW9YNDRR?=
 =?utf-8?B?bmVJbDBhZFpzZ2lGOTBBUkJDUVR0dzlpZWxDbTJuZ21GUzV5U0VoMElOUXg0?=
 =?utf-8?B?WTJlRGxTZlNORmF1bVoyL21XTXBqK0xnbWpIc1pRT1M2elhrdWt3Q3JVMFRJ?=
 =?utf-8?B?L3M5bDZXN3YrUEowYkV1T3lxZENLU3lFMzRyVkpTdEI5V3pDUTVOZENSUEgz?=
 =?utf-8?B?MFoxQmJmc29NeGVLNUxzeHJvS0dMUmE2SXZSV3dPQVczeVd0V1hnUDFVaWJT?=
 =?utf-8?B?dk0rcnI4ZXlTVGNPdktmajUrcEpCVGFGNlhEam05dDVXZmdlcWg5ZFJQNzMy?=
 =?utf-8?B?MTNNQ29Vc205VzU3WEh1KzcvSStRakFBc095Ujg3Vm5oblM4dWp0WlFJQTNk?=
 =?utf-8?B?SVdweVpDMGk4YXU5Q29aQ1lpbTRvT3pyUTlZTVdqSG4wdjNaMFRnaU5CWGpB?=
 =?utf-8?B?KzV5RHJwRmhmUmx5Z2FxTmwxNXJpVU5BdFQ1aGgwMkhBUFVKQkpua2JTTXh0?=
 =?utf-8?B?K0VKTXNJbVRBQS9YTkFxSFJ6NzlCWUI0RjVBVk5adzloWnFCZmFMbnc3U0Iy?=
 =?utf-8?B?TnBxVmJUWU01RkVuZndFZWNrSDkxVlVSUU5sb2xGOGFaMVJwQnkzM3VoYURZ?=
 =?utf-8?B?ZjBUTStaaWU4Y2hicS9ObmQyd2pTbGFjSlBwMVhYWFU4cFY0NnN6WmNhZGVr?=
 =?utf-8?B?NnJPZkZnZ1YxMXp1LzNsSi9VUjIwZHRkWmlLblpVVHM2UXhKV2xPaFFkanhJ?=
 =?utf-8?B?NWx0V2NvQm1HMjVSTVNmQ3l1U1E1WTliQ3JZbG1HNi9DSzdOWEVpTzVpT21I?=
 =?utf-8?B?WjhWazZOaWVxWVZBU0RkREY0NGI1MnRRclRIV2F2MkJnSWMrQmNzU1VMT1Jj?=
 =?utf-8?Q?afB+E0Gj5TxTa6gFySpY0m4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e9b882-e40a-4cda-6ac9-08dc94d7497b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 05:25:55.1182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alXMytig3UMpCa/K+tqguOrIF9dK/NTbYe/zD5iArJHZ+MMWs8tkB6SgtI323oFXqu0qqyoEBwBVo/yavjvxVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8489

SGkgU3RlZmZlbiwNCg0KPiBGcm9tOiBTdGVmZmVuIFRydW10cmFyIDxzLnRydW10cmFyQHBlbmd1
dHJvbml4LmRlPg0KPiBTZW50OiBNb25kYXksIEp1bmUgMjQsIDIwMjQgNDozOSBQTQ0KPiBUbzog
dmlydGlvLWNvbW1lbnRAbGlzdHMubGludXguZGV2OyBrZXJuZWxAcGVuZ3V0cm9uaXguZGUNCj4g
Q2M6IFN0ZWZmZW4gVHJ1bXRyYXIgPHMudHJ1bXRyYXJAcGVuZ3V0cm9uaXguZGU+DQo+IFN1Ympl
Y3Q6IFtQQVRDSCBSRVNFTkQgMy80XSB2aXJ0aW8tbmV0OiBzdXBwb3J0IHRyYW5zbWl0IHB0cCB0
aW1lc3RhbXBzDQo+IA0KPiBBZGQgb3B0aW9uYWwgUFRQIGhhcmR3YXJlIHR4IHRpbWVzdGFtcCBv
ZmZsb2FkIGZvciB2aXJ0aW8tbmV0Lg0KPiANClZlcnkgZ29vZCBpbml0aWF0ZS4gVGhhbmtzIGZv
ciBicmluZ2luZyB0aW1lc3RhbXBpbmcgdG8gdmlydGlvLg0KDQo+IEFjY3VyYXRlIFJUVCBtZWFz
dXJlbWVudCByZXF1aXJlcyB0aW1lc3RhbXBzIGNsb3NlIHRvIHRoZSB3aXJlLg0KPiBJbnRyb2R1
Y2UgdmlydGlvIGZlYXR1cmUgVklSVElPX05FVF9GX1RYX1RTVEFNUCwgdGhlIHRyYW5zbWl0IGVx
dWl2YWxlbnQNCj4gdG8gVklSVElPX05FVF9GX1JYX1RTVEFNUC4NCj4gDQo+IFRoZSBkcml2ZXIg
c2V0cyBWSVJUSU9fTkVUX0hEUl9GX1RTVEFNUCB0byByZXF1ZXN0IGEgdGltZXN0YW1wDQo+IHJl
dHVybmVkIG9uIGNvbXBsZXRpb24uIElmIHRoZSBmZWF0dXJlIGlzIG5lZ290aWF0ZWQsIHRoZSBk
ZXZpY2UgZWl0aGVyIHBsYWNlcw0KPiB0aGUgdGltZXN0YW1wIG9yIGNsZWFycyB0aGUgZmVhdHVy
ZSBiaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmZmVuIFRydW10cmFyIDxzLnRydW10cmFy
QHBlbmd1dHJvbml4LmRlPg0KPiAtLS0NCj4gIGRldmljZS10eXBlcy9uZXQvZGVzY3JpcHRpb24u
dGV4IHwgMTkgKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9u
LnRleCBiL2RldmljZS0NCj4gdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleA0KPiBpbmRleCAwOWQ5
YzI4Li5jNDM4YjBiIDEwMDY0NA0KPiAtLS0gYS9kZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9u
LnRleA0KPiArKysgYi9kZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleA0KPiBAQCAtODgs
NiArODgsOCBAQCBcc3Vic2VjdGlvbntGZWF0dXJlIGJpdHN9XGxhYmVse3NlYzpEZXZpY2UgVHlw
ZXMgLw0KPiBOZXR3b3JrIERldmljZSAvIEZlYXR1cmUgYml0cyAgXGl0ZW1bVklSVElPX05FVF9G
X0NUUkxfTUFDX0FERFIoMjMpXQ0KPiBTZXQgTUFDIGFkZHJlc3MgdGhyb3VnaCBjb250cm9sDQo+
ICAgICAgY2hhbm5lbC4NCj4gDQo+ICtcaXRlbVtWSVJUSU9fTkVUX0ZfVFhfVFNUQU1QKDQ3KV0g
RGV2aWNlIHNlbmRzIFRBSSB0cmFuc21pdCB0aW1lDQo+ICsNClRoZSBmZWF0dXJlIGJpdCBpcyBu
b3QgaGVscGZ1bC4NClRoZSByZWFzb24gaXMsIHRoZSB1c2VyIG5lZWRzIHRvIGVuYWJsZSB0aW1l
c3RhbXAgbXVjaCBsYXRlciB1c2luZyBldGh0b29sIChMaW51eCkgU0lPQ1NIV1RTVEFNUC4NCkFu
ZCBpdCBpcyBkZXNpcmVkIHRvIG5vdCByZXNldCB0aGUgZnVsbCBkZXZpY2Ugd2hlbiBjaGFuZ2lu
ZyB0aGlzIGZlYXR1cmUuDQoNCkFuZCB3aGVuIHRoZSBmZWF0dXJlIGlzIG9mZmVyZWQsIGl0IGlz
IGFsc28gbm90IGRlc2lyZSB0byBhbHdheXMgcGVyZm9ybWluZyB0aW1lc3RhbXBpbmcgYXMgaXQg
aGFzIHRyYWRlLW9mZnMuDQoNClRoZXJlZm9yZSwgZW5hYmxlbWVudCBvZiB0aGlzIGZ1bmN0aW9u
YWxpdHkgc2hvdWxkIGJlIGRvbmUgdXNpbmcgY2FwYWJpbGl0aWVzIG9yIG90aGVyIG1lYW5zIGR5
bmFtaWNhbGx5Lg0KRHluYW1pYyBtZWFucyA9IHdpdGhvdXQgcmUtaW5pdGlhbGl6aW5nIHRoZSBk
ZXZpY2UgYW5kIGZlYXR1cmVzLg0KDQo+ICBcaXRlbVtWSVJUSU9fTkVUX0ZfUlhfVFNUQU1QKDQ4
KV0gRGV2aWNlIHNlbmRzIFRBSSByZWNlaXZlIHRpbWUNCj4gDQo+ICBcaXRlbVtWSVJUSU9fTkVU
X0ZfVFhfSEFTSCg0OSldIERyaXZlciBzZW5kcyBoYXNoIHJlcG9ydCBAQCAtNTMyLDYNCj4gKzUz
NCwxMiBAQCBcc3Vic3Vic2VjdGlvbntQYWNrZXQgVHJhbnNtaXNzaW9ufVxsYWJlbHtzZWM6RGV2
aWNlIFR5cGVzIC8NCj4gTmV0d29yayBEZXZpY2UgLyBEZSAgXGl0ZW0gVGhlIGhlYWRlciBhbmQg
cGFja2V0IGFyZSBhZGRlZCBhcyBvbmUgb3V0cHV0DQo+IGRlc2NyaXB0b3IgdG8gdGhlDQo+ICAg
IHRyYW5zbWl0cSwgYW5kIHRoZSBkZXZpY2UgaXMgbm90aWZpZWQgb2YgdGhlIG5ldyBlbnRyeQ0K
PiAgICAoc2VlIFxyZWZ7c2VjOkRldmljZSBUeXBlcyAvIE5ldHdvcmsgRGV2aWNlIC8gRGV2aWNl
DQo+IEluaXRpYWxpemF0aW9ufX5cbmFtZXJlZntzZWM6RGV2aWNlIFR5cGVzIC8gTmV0d29yayBE
ZXZpY2UgLyBEZXZpY2UNCj4gSW5pdGlhbGl6YXRpb259KS4NCj4gKw0KPiArXGl0ZW0gSWYgdGhl
IGRyaXZlciBuZWdvdGlhdGVkIHRoZSBWSVJUSU9fTkVUX0ZfVFhfVFNUQU1QIGFuZCBoYXJkd2Fy
ZQ0KPiArICB0aW1lc3RhbXBpbmcgaXMgc3VwcG9ydGVkIG9uIHRoZSBkZXZpY2UsIHRoZQ0KPiBW
SVJUSU9fTkVUX0hEUl9GX1RTVEFNUA0KPiArICBmbGFnIGlzIHNldC4gT25lIHdyaXRhYmxlIGlu
cHV0IGRlc2NyaXB0b3Igd2l0aCB0aGUgc2l6ZSBvZiBhDQo+ICt0aW1lc3RhbXAsDQo+ICsgIGku
ZS4gXGZpZWxke3RzdGFtcH0gaW4gdmlydGlvX25ldF9oZHJfaGFzaF90cywNCj4gKyAgaXMgYXBw
ZW5kZWQgdG8gdGhlIG91dHB1dCBkZXNjcmlwdG9yLg0KPiAgXGVuZHtlbnVtZXJhdGV9DQo+IA0K
VGhpcyBkb2VzIG5vdCB3b3JrIGFueSBlZmZlY3RpdmVseSBmb3IgZm9sbG93aW5nIHJlYXNvbnMu
DQoxLiBhIFRTIGlzIDhCLCBpdCBpcyBwb2ludGxlc3MgdG8gcGFzcyBhbm90aGVyIDE2QiBkZXNj
cmlwdG9yIGZvciA4QiBvZiBkYXRhLiBUaGlzIGlzIDIwMCUgb3ZlcmhlYWQuDQoyLiBhIFRTIHdy
aXRlIG9mIDhCIGFsc28gY3JlYXRlcyBhIGNhY2hlIGxpbmUgYm91bmRpbmcgZHVlIHRvIHBhcnRp
YWwgd3JpdGVzIGV2ZW4gaW4gbW9kZXJuIGNwdXMNCjMuIEFwYXJ0IGZyb20gdGhlIHNob3J0IHdy
aXRlLCBiZWNhdXNlIGl0IGlzIGEgZGVkaWNhdGVkIGFkZHJlc3MsIHRoZSBETUEgY2Fubm90IGJl
IG1lcmdlZCBieSB0aGUgZGV2aWNlIGZvciBpdCB3aXRoIHNvbWV0aGluZyBlbHNlLg0KDQpJbiBz
aG9ydCwgYSBkZWRpY2F0ZWQgZGVzY3JpcHRvciBmb3IgVFMgdGltZXN0YW1wIG9yIGluY2x1ZGlu
ZyB0aGlzIFRTIGluIHZuZXRfaGRyIGlzIG5vdCBnb29kIGlkZWEuDQoNCk1hbnkgb2YgdXMgYWxy
ZWFkeSBkaXNjdXNzIHRoZSBuZXcgZGVzY3JpcHRvciBmb3JtYXQgdGhhdCBzb2x2ZXMgbWFueSBv
ZiB0aGVzZSBpc3N1ZXMuDQppLmUuIHRvIGhhdmUgYSB0cmFuc21pdCBjb21wbGV0aW9uIHdoaWNo
IGNvbnRhaW5zIGFsbCBuZWVkZWQgZmllbGRzIGluY2x1ZGluZyBUUyB0aGF0IGFsc28gb3ZlcmNv
bWVzIGFib3ZlIDMgaXNzdWVzLg0KDQpXZSBjYXB0dXJlZCB0aGVzZSByZXF1aXJlbWVudHMgYXQg
WzFdLiBQbGVhc2UgcmVmZXIgdG8gMy41LjEgcG9pbnQgMy4NCkl0IHdvdWxkIGJlIGdvb2QgaWYg
eW91IGNhbiBleHRlbmQgdGhlIGRlc2NyaXB0b3JzIHRoaXMgd2F5IHRoYXQgY2FuIHdvcmsgZm9y
IGh3Lg0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdmlydGlvLWNvbW1lbnQvMjAyMzA4
MTgwNDM1NTcuNDk2OTY0LTctcGFyYXZAbnZpZGlhLmNvbS8NCg0KPiAgXGRyaXZlcm5vcm1hdGl2
ZXtccGFyYWdyYXBofXtQYWNrZXQgVHJhbnNtaXNzaW9ufXtEZXZpY2UgVHlwZXMgLyBOZXR3b3Jr
DQo+IERldmljZSAvIERldmljZSBPcGVyYXRpb24gLyBQYWNrZXQgVHJhbnNtaXNzaW9ufSBAQCAt
Njc1LDYgKzY4MywxNyBAQA0KPiBcc3Vic3Vic2VjdGlvbntQYWNrZXQgVHJhbnNtaXNzaW9ufVxs
YWJlbHtzZWM6RGV2aWNlIFR5cGVzIC8gTmV0d29yaw0KPiBEZXZpY2UgLyBEZQ0KPiAgI2RlZmlu
ZSBWSVJUSU9fTkVUX0hBU0hfUkVQT1JUX09USEVSICAgICAgICAgICgxIDw8IDExKQ0KPiAgXGVu
ZHtsc3RsaXN0aW5nfQ0KPiANCj4gK1xwYXJhZ3JhcGh7VGltZXN0YW1waW5nIGZvciBvdXRnb2lu
ZyBwYWNrZXRzfSBcbGFiZWx7c2VjOkRldmljZSBUeXBlcyAvDQo+ICtOZXR3b3JrIERldmljZSAv
IERldmljZSBPcGVyYXRpb24gLyBQYWNrZXQgVHJhbnNtaXNzaW9uIC8gVGltZXN0YW1waW5nDQo+
ICtmb3Igb3V0Z29pbmcgcGFja2V0c30NCj4gKw0KPiArSWYgdGhlIGZlYXR1cmUgVklSVElPX05F
VF9GX1RYX1RTVEFNUCBpcyBuZWdvdGlhdGVkLCB0aGUgZHJpdmVyIHNldHMNCj4gXGZpZWxke2hk
cl9sZW59IHRvIHRoZSB2aXJ0aW9fbmV0X2hkcl9oYXNoX3RzLg0KPiArDQo+ICtUaGUgZHJpdmVy
IHNldHMgVklSVElPX05FVF9IRFJfRl9TVEFNUCB0byByZXF1ZXN0IGEgdGltZXN0YW1wDQo+IHJl
dHVybmVkIG9uIGNvbXBsZXRpb24gaW4gXGZpZWxke3RzdGFtcH0uDQo+ICsNCj4gK1RoZSBkZXZp
Y2UgZ2V0cyB0aGUgc2Vjb25kLCB3cml0YWJsZSBkZXNjcmlwdG9yLCBnZW5lcmF0ZXMgYSB0aW1l
c3RhbXAgYW5kDQo+IHdyaXRlcyBpdCB0byB0aGUgXGZpZWxke3RzdGFtcH0uDQo+ICsNCj4gK0Zp
bmFsbHksIGFmdGVyIHRyYW5zbWl0dGluZyB0aGUgcGFja2V0LCB0aGUgZHJpdmVyIGdldHMgdGhl
IFxmaWVsZHt0c3RhbXB9IGZyb20NCj4gdGhlIHBhY2tldC4NCj4gKw0KPiAgXHBhcmFncmFwaHtQ
YWNrZXQgVHJhbnNtaXNzaW9uIEludGVycnVwdH1cbGFiZWx7c2VjOkRldmljZSBUeXBlcyAvIE5l
dHdvcmsNCj4gRGV2aWNlIC8gRGV2aWNlIE9wZXJhdGlvbiAvIFBhY2tldCBUcmFuc21pc3Npb24g
LyBQYWNrZXQgVHJhbnNtaXNzaW9uDQo+IEludGVycnVwdH0NCj4gDQo+ICBPZnRlbiBhIGRyaXZl
ciB3aWxsIHN1cHByZXNzIHRyYW5zbWlzc2lvbiB2aXJ0cXVldWUgaW50ZXJydXB0cw0KPiANCj4g
LS0NCj4gMi40Mi4wDQo+IA0KDQo=
